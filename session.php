<?php
session_start();
include("config.php");


if(isset($_SESSION['Sno']))
{
    if($_SESSION['Sno']=='')
    header("Location: index.php");
}
else
header("Location: index.php");



?>