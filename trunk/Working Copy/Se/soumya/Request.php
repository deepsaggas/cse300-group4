<?php		

$form_id=$_GET['form_id'];

$db_host = 'localhost:3306';
$db_username = 'root';
$db_password = 'mcgrath';
$db_name = 'group4';

mysql_connect( $db_host, $db_username, $db_password) or die(mysql_error());
mysql_select_db($db_name);

$query="Select source_funds,specifications,specs_description,purchase_before from form where form_id=$form_id";
$sqlsearch = mysql_query($query);
$result1 = mysql_fetch_row($sqlsearch);

$query="Select F_id ,C_id, Timestamp from fac_fills_form where form_id=$form_id";
$sqlsearch = mysql_query($query);
$result2 = mysql_fetch_row($sqlsearch);

$query="Select F_name from faculty where F_id=$result2[0]";
$sqlsearch = mysql_query($query);
$result5 = mysql_fetch_row($sqlsearch);

$query="Select COUNT(*) from item where form_id=$form_id";
$sqlsearch = mysql_query($query);
$result7 = mysql_fetch_row($sqlsearch);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="HandheldFriendly" content="true" />
<title>Equipment Purchase</title>
<style>
body {
	font-size: 16px;
	font-family: Verdana;
}
</style>
</head>
<body>
	<p></p>
		<b>Request by</b>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<?php echo $result5[0]?>
	<br>
	<?php 
if(is_null($result2[1])==false)
{
	echo "<b>Committee Members &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </b>";
	$query="Select F_id from member where c_id=$result2[1]";
	$sqlsearch = mysql_query($query);
	for($i=1;$i<=3;$i++){
		$result3 = mysql_fetch_row($sqlsearch);
		$query="Select F_name from faculty where F_id=$result3[0]";
		$sql = mysql_query($query);
		$temp = mysql_fetch_row($sql);
		echo $temp[0];
		if($i!=3)
			echo " , ";
		else echo "<br>";
	}	
}
?>
	<!--  display the changed record from database -->
	<b>Purchase Expected Before</b> &nbsp&nbsp
	<?php echo $result1[3]?>
	<br> <b>Source of Funds</b>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<?php echo $result1[0]?>
	<?php 
if(strcmp($result1[0],"Project Fund")==0){
	$query="Select p_name
		from project where form_id=$form_id"; $sqlsearch = mysql_query($query);
		$result4 = mysql_fetch_row($sqlsearch);
		echo "<br><b> Name of Project</b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp".$result4[0];
}
?>
	<br> <b>Number of Items</b>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<?php echo $result7[0]?>
	<br>
	<br>
	<br> 
	<?php 
$query="Select * from item where form_id=$form_id";
$sqlsearch = mysql_query($query);
$totalcost=0;
for($i=1;$i<=$result7[0];$i++){
	$result6 = mysql_fetch_row($sqlsearch);
	echo "<b>Item ".$i."</b>";
	echo "<br><br>";
	echo "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Name : ".$result6[1]."<br>";
	echo "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Cost : Rs ".$result6[2]." per unit<br>";
	echo "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Quantity : ".$result6[3]."<br>";
	echo "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Description : ".$result6[4]."<br>";
	$totalcost+=$result6[2]*$result6[3];
	if(strcmp($result6[6],"")!=0)
		echo "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp List of Suppliers : ".$result6[6]."<br><br>";
}
echo "<br><br><b>Total Cost = Rs ".$totalcost."</b>";
?>
	<br>
	<br>
</body>
</html>
