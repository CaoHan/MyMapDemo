<?php
/**
 * Created by PhpStorm.
 * User: caohan
 * Date: 16/7/5
 * Time: 13:38
 */

header("Content-type:text/html;charset=utf-8");
require_once "config.php";
//连接数据库
$connection = mysql_connect($DBHOST,$DBUSER,$DBPWD);
$db_selecct = mysql_select_db($DBNAME);
$user_name = $_GET['user_name'];
$user_latitude = $_GET['user_latitude'];
$user_longitude = $_GET['user_longitude'];

$str = "update userLoc set user_latitude='$user_latitude',user_longitude='$user_longitude' WHERE
user_name = '$user_name'";

$result = mysql_query($str,$connection);

mysql_close($connection);

?>