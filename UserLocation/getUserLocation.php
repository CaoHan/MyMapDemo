<?php
/**
 * Created by PhpStorm.
 * User: caohan
 * Date: 16/7/5
 * Time: 13:37
 */

header("Content-type:text/html;charset=utf-8");
require_once "config.php";
//连接数据库
$connection = mysql_connect($DBHOST,$DBUSER,$DBPWD);
$db_selecct = mysql_select_db($DBNAME);
$user_name = $_GET['user_name'];
$str = "select * from userLoc where user_name='$user_name'";
$result = mysql_query($str,$connection);
@$rows = mysql_num_rows($result);
if ($rows) {
    $info = mysql_fetch_array($result);
    $returnArr = array("user_latitude" => $info['user_latitude'],"user_longitude" => $info['user_longitude']);
    echo json_encode($returnArr);    //输出json格式
}

mysql_close($connection);

?>