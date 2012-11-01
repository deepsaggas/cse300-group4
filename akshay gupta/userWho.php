<?php
$uname=$_GET['username'];
$con = mysql_connect('localhost', 'root', 'rocky');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4", $con);

$sql="Select u_id from faculty,authentication where F_id = u_id and F_name='".$uname."'";
$result = mysql_query($sql);
if($row = mysql_fetch_array($result))
{
	echo "Faculty";
}
$sql="Select u_id from admin,authentication where a_id = u_id and A_name='".$uname."'";
$result = mysql_query($sql);	
if($row = mysql_fetch_array($result))
{			
	echo "Admin";
}	

mysql_close($con);
?>