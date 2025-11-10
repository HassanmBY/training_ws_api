<?php

function echo_json($arg)
{
    echo json_encode($arg);
}


function printr($arg)
{
    echo "<pre>";
    print_r($arg);
    echo "</pre>";
}
