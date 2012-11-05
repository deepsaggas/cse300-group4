<?php
$form=$_GET['forms'];
$uname=$_GET['username'];
$con = mysql_connect('localhost', 'root', 'mcgrath');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4", $con);
$forms=explode(',',$form);
for($i=0;$i<count($forms)-1;$i++)
{
	$sql="Select u_id from faculty,authentication where F_id = u_id " .
		"and F_name='".$uname."'";
	$result = mysql_query($sql);
	if($row = mysql_fetch_array($result))
	{
		print_r($row);
		$upd="UPDATE fac_fills_form SET Deleted_Fac=1 " .
			"WHERE form_id=".$forms[$i]." and F_id=".$row['u_id'];
		//echo $upd;
		mysql_query($upd);
	}
	$sql="Select u_id from admin,authentication where a_id = u_id " .
		"and A_name='".$uname."'";
	$result = mysql_query($sql);	
	if($row = mysql_fetch_array($result))
	{			
		mysql_query("UPDATE admin_form_with SET Deleted_Ad=1 " .
			"WHERE form_id=".$forms[$i]." and a_id=".$row['u_id']);
	}	
}
mysql_close($con);
?>