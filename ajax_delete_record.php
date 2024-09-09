<?php
include("session.php");
$tablekey = $_GET['tablekey'];
$tablename = $_GET['tablename'];
$keyvalue = $_GET['keyvalue'];


if ($keyvalue > 0) {
	$sql = "delete from $tablename where $tablekey = '$keyvalue'";
	//die;
	mysqli_query($conn, $sql);
}
?>
