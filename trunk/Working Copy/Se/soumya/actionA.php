<?php
$pg=$_GET['pg'];
//$uname=$_GET['username'];	

$uname = "Ashish Sureka";
$formid =$_GET['form_id'];

echo "$pg";
echo $formid;

$con = mysql_connect('localhost', 'root', 'pass');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$sql="Select item_name,A_timestamp,A_reason,form_id,F_name from mainview2 where A_name='".$uname."' and form_status='Ongoing' and Deleted_Ad=0 ORDER BY A_timestamp DESC";
$id=1;
$result = mysql_query($sql);
$show=1;

/*
while($row = mysql_fetch_array($result))
{	
	
		$sql1="Select A_reason,A_name from mainview2 where F_name='".$row['F_name']."' and form_id='".$row['form_id']."' and A_present='1' ORDER BY A_timestamp DESC";
		$result1=mysql_query($sql1);
		$row1 = mysql_fetch_array($result1);
		echo "<tr id='".$id."'>";
		echo "<td><input type='checkbox' id='ch_".$id."'/></td>";
		echo "<td><span id=\"form_".$row['form_id']."\">".$row['form_id']."<span></td>";		
		echo "<td>".$row['item_name']."</td>";
		echo "<td>".$row['F_name']."</td>";		
		echo "<td>".$row1['A_name']."</td>";
		echo "<td>".$row['A_timestamp']."</td>";
		echo "</tr>";				
		$id=$id+1;
	
	$show=$show+1;
}
*/

$adminId = mysql_query("SELECT a_id from mainview2 where form_id= '".$formid."' and A_present = 1");
$row1 = mysql_fetch_array($adminId);
echo "$row1[a_id]";
mysql_query("UPDATE admin_form_with SET A_status='Rejected' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' ");

mysql_query("UPDATE form SET form_status='Rejected' where form_id = '".$formid."' " );

mysql_query("UPDATE admin_form_with SET A_reason='$pg' where form_id = '".$formid."' and a_id ='".$row1['a_id']."'");


mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' ");

$adminName = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ("Form rejected by '".$adminName."'",'".$formid."',0);");


mysql_close($con);
?>


