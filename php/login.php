<?php 
require_once 'config.php';


session_start();
$user = $_POST['usuario'];
$pass = md5($_POST['password']);
$queryLogin = "SELECT user, pass, estatus, cedula_empleado FROM user WHERE user='".$user."' AND pass='".$pass."' AND estatus='1'";


$res = mysql_query($queryLogin,$conexion);
$num_row = mysql_num_rows($res);
$row=mysql_fetch_assoc($res);

if( $num_row == 1 ) {
	echo 'true';
	$_SESSION['user'] = $row['user'];
	$_SESSION['pass'] = $row['pass'];
	$_SESSION['estatus'] = $row['estatus'];
	$_SESSION['cedula'] = $row['cedula_empleado'];
	}
else {
	echo 'false';
	
}


?>