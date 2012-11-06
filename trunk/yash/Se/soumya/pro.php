<?php
$uname=$_GET['username'];
$con = mysql_connect('localhost', 'root', '');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$sql1="Select count(*) as count1 from mainview2 where F_name='".$uname."' && form_status='Approved' && A_status='Approved' ";
$result = mysql_query($sql1);
while($row = mysql_fetch_array($result))
{
	echo "<br>Total Approved forms = $row[count1]<br><br>";
}
$sql2="Select count(*) as count2 from mainview2 where F_name='".$uname."' && form_status='Ongoing' && A_status='Ongoing'";
$result = mysql_query($sql2);
while($row = mysql_fetch_array($result))
{
	echo " Total ongoing forms &nbsp&nbsp= $row[count2] <br><br>";
}
$sql3="Select count(*) as count3 from mainview2 where F_name='".$uname."' && form_status='Rejected' && A_status='Rejected' ";
$result = mysql_query($sql3);
while($row = mysql_fetch_array($result))
{
	echo " Total Rejected Forms = $row[count3] <br>";
}
mysql_close($con);
?>
