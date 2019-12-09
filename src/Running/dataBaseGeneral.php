<?php

function resError($msg)
{
    return json_encode(["errorBC" => 1, "msg" => $msg]);
}

function runDml($dml)
{
    global $connection;
    try {
        $result = $connection->getConexion()->query($dml);
        return $result;
    } catch (mysqli_sql_exception $ex) {
        return false;
    }
}


function getData($sql)
{
    global $connection;
    try {
        $result = $connection->getConexion()->query($sql);
        if ($result != null && $result->num_rows > 0) {
            return $result;
        }
    } catch (mysqli_sql_exception $ex) {
        return false;
    }
}

function getJson($sql)
{
    try {
        $result = getData($sql);
        $json = [];
        if ($result != null) {
            if ($result->num_rows >= 1) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $json[] = $row;
                }
                return json_encode($json);
            }
        }
        return json_encode(["noData" => 1]);
    } catch (mysqli_sql_exception $th) {
        return resError('');
    }
}
