<?php
$pg=$_GET['pg'];
$formid =$_GET['form_id'];
echo "$pg";
echo $formid;
$con = mysql_connect('localhost', 'root', '');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$id=1;
$result = mysql_query($sql);
$show=1;



$adminId = mysql_query("SELECT a_id from mainview2 where form_id= '".$formid."' and A_present = 1");
$row1 = mysql_fetch_array($adminId);
echo "$row1[a_id]";
mysql_query("UPDATE admin_form_with SET A_status='Rejected' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' ");

mysql_query("UPDATE form SET form_status='Rejected' where form_id = '".$formid."' " );

mysql_query("UPDATE admin_form_with SET A_reason='$pg' where form_id = '".$formid."' and a_id ='".$row1['a_id']."'");


mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' ");

$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");

$row3 = mysql_fetch_array($row2);

$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form rejected by  ".$adminName; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

mysql_close($con);
?>


