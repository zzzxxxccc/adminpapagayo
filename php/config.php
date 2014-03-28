<?php 
$host="localhost";
$username="root";
$password="alberto.1990";
$database="adminp";
$conexion = mysql_connect($host,$username,$password) or die(mysql_error());

if (!$conexion) {
    echo "Unable to connect to DB: " . mysql_error();
    exit;
}

if (!mysql_select_db($database)) {
    echo "Unable to select mydbname: " . mysql_error();
    exit;
}

?>