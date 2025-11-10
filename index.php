<?php

require "config.php";
require "functions.php";
require "headers.php";

// Set JSON content type header once
set_json_header();

$method = $_SERVER["REQUEST_METHOD"];
$route = isset($_GET["route"]) ? $_GET["route"] : "";
$params = [];
$id = isset($_GET["id"]) ? $_GET["id"] : "";

$resp = [];


if ($route === "") {
    $resp["message"] = "Documentation";
    $resp["code"] = "Ok";
    $resp["endpoints"] = [
        "GET /api/wifi_access_points" => "Get all WiFi access points",
        "GET /api/wifi_access_points/{id}" => "Get single WiFi access point",
        "GET /api/wifi_access_points?search=keyword" => "Search WiFi access points",
        "POST /api/wifi_access_points" => "Create WiFi access point",
        "PUT /api/wifi_access_points/{id}" => "Update WiFi access point",
        "DELETE /api/wifi_access_points/{id}" => "Delete WiFi access point",
        "GET /api/communes" => "Get all communes",
        "GET /api/communes/{id}" => "Get single commune",
        "GET /api/communes?search=keyword" => "Search communes",
        "POST /api/communes" => "Create commune",
        "PUT /api/communes/{id}" => "Update commune",
        "DELETE /api/communes/{id}" => "Delete commune"
    ];
    echo_json($resp);
    die();
}

$idNameMapping = [
    "communes" => "commune_id",
    "wifi_access_points" => "wifi_id",
    "wifi_access_points_view" => "wifi_id"
];

// Validate route
if (!isset($idNameMapping[$route])) {
    $resp["message"] = "Invalid route: $route";
    $resp["code"] = "Bad Request";
    http_response_code(400);
    echo_json($resp);
    die();
}

if ($method === "GET") {
    $query = "SELECT * FROM $route ";

    if ($id !== "") {
        $query .= "WHERE " . $idNameMapping[$route] . "= :id";
        $params["id"] = $id;
    }

    $req = $conn->prepare($query);
    $req->execute($params);

    $hits = $req->rowCount();
    $data = $req->fetchAll(PDO::FETCH_ASSOC);
    if ($hits > 0) {
        $resp["hits"] = $hits;
        $resp["route"] = $route;
        $resp["data"] = $data;
    }
}

if ($method === "POST") {
    $query = "INSERT INTO $route ";
    $requestBody = json_decode(file_get_contents("php://input"));


    if (count((array)$requestBody) > 0) {
        $query .= "SET";
        foreach ($requestBody as $key => $value) {
            $query .= " $key = :$key,";
            $params[$key] = $value;
        }

        $query = rtrim($query, ",");

        try {
            $req = $conn->prepare($query);
            $req->execute($params);

            $lastInserted = $conn->lastInsertId();

            $query = "SELECT * FROM $route WHERE " . $idNameMapping[$route] . " = :id";


            $req = $conn->prepare($query);
            $req->execute(["id" => $lastInserted]);

            $hits = $req->rowCount();
            $data = $req->fetchAll(PDO::FETCH_ASSOC);

            if ($hits > 0) {
                $resp["hits"] = $hits;
                $resp["route"] = $route;
                $resp["data"] = $data;
            } else {
                $resp["message"] = "Entry not added";
                $resp["route"] = $route;
            }
        } catch (Exception $e) {
            printr($query);
            $resp["message"] = $e;
            $resp["route"] = $route;
            http_response_code(500);
            die;
        }
    } else {
        $resp["message"] = "No request body found";
        $resp["code"] = "Bad Request";
        http_response_code(400);
        echo_json($resp);
        die;
    }
}

if ($method === "PUT") {
    if ($id === "") {
        $resp["message"] = "No ID provided for update";
        $resp["code"] = "Bad Request";
        http_response_code(400);
        echo_json($resp);
        die;
    }

    $query = "UPDATE $route SET ";
    $requestBody = json_decode(file_get_contents("php://input"), true);

    foreach ($requestBody as $key => $value) {
        $query .= "$key = :$key,";
        $params[$key] = $value;
    }

    $query = rtrim($query, ",");
    $query .= " WHERE " . $idNameMapping[$route] . " = :id";
    $params["id"] = $id;

    $req = $conn->prepare($query);
    $req->execute($params);

    $query = "SELECT * FROM $route WHERE " . $idNameMapping[$route] . " = :id";
    $req = $conn->prepare($query);
    $req->execute(["id" => $id]);

    $hits = $req->rowCount();
    $data = $req->fetchAll(PDO::FETCH_ASSOC);
    if ($hits > 0) {
        $resp["hits"] = $hits;
        $resp["route"] = $route;
        $resp["data"] = $data;
    }
}

if ($method === "DELETE") {
    $query = "DELETE FROM $route WHERE " . $idNameMapping[$route] . " = :id";
    $params["id"] = $id;

    $req = $conn->prepare($query);
    $req->execute($params);

    $hits = $req->rowCount();
    if ($hits > 0) {
        $resp["hits"] = $hits;
        $resp["route"] = $route;
    }
}

// Handle unsupported methods
if (!in_array($method, ["GET", "POST", "PUT", "DELETE"])) {
    $resp["message"] = "Method not allowed";
    $resp["code"] = "Method Not Allowed";
    http_response_code(405);
    echo_json($resp);
    die();
}

echo_json($resp);
