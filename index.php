<?php

require "config.php";
require "functions.php";


$method = $_SERVER["REQUEST_METHOD"];
$route = isset($_GET["route"]) ? $_GET["route"] : "";
$params = [];
$id = isset($_GET["id"]) ? $_GET["id"] : "";

$resp = [];


if ($route === "") {
    $resp["message"] = "Documentation";
    $resp["code"] = "Ok";
    echo_json($resp);
    die();
}

$idNameMapping = [
    "communes" => "commune_id",
    "wifi_access_points" => "wifi_id"
];

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



echo_json($resp);
