<?php
$uname=$_GET['username'];
$con = mysql_connect('localhost', 'root', 'mcgrath');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);

$count=0;

$sql1="Select count(*) as count1 from formstatus where F_name='".$uname."' && form_status='Approved' ";
$result = mysql_query($sql1);
$row = mysql_fetch_array($result);
echo "<br> Total Approved forms = $row[count1]<br><br>";

$count=$count+$row['count1'];

$sql2="Select count(*) as count2 from formstatus where F_name='".$uname."' && form_status='Ongoing' ";
$result = mysql_query($sql2);
$row = mysql_fetch_array($result);
echo " Total ongoing forms &nbsp&nbsp= $row[count2] <br><br>";

$count=$count+$row['count2'];

$sql3="Select count(*) as count3 from formstatus where F_name='".$uname."' && form_status='Rejected' ";
$result = mysql_query($sql3);
$row = mysql_fetch_array($result);
echo " Total Rejected Forms = $row[count3] <br><br>";

$count=$count+$row['count3'];
echo " Total Requests &nbsp&nbsp= $count <br><br>";

mysql_close($con);
?>
