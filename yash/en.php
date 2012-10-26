<?php
//print_r($_POST);
//print_r($_FILES);
// This function will run within each post array including multi-dimensional arrays
function ExtendedAddslash(&$params)
{
	foreach ($params as &$var) {
		// check if $var is an array. If yes, it will start another ExtendedAddslash() function to loop to each key inside.
		is_array($var) ? ExtendedAddslash($var) : $var=addslashes($var);
		unset($var);
	}
}


// Initialize ExtendedAddslash() function for every $_POST variable
ExtendedAddslash($_POST);


$db_host = 'localhost:3306';
$db_username = 'root';
$db_password = '';
$db_name = 'group4';

mysql_connect( $db_host, $db_username, $db_password) or die(mysql_error());
mysql_select_db($db_name);

$query="Select * from form";
$sqlsearch = mysql_query($query);
$resultcount = mysql_numrows($sqlsearch);

$category= $_POST['q5_category'];
$purchase= $_POST['q9_purchaseExpected'];
$purchase_before=$purchase['day']."-".$purchase['month']."-".$purchase['year'];
$source_of_fund= $_POST['q71_sourceOf'];
$number_of_items= $_POST['q7_numberOf'];
$status="Ongoing";
$file_desc=$_POST['q93_descriptionOf']; 

mysql_query("INSERT INTO form (form_id, form_status, source_funds,specifications,file_desc)VALUES ($resultcount+1,'$status', '$source_of_fund',NULL,'$file_desc')") or die(mysql_error());

if(strcmp($source_of_fund,"Project Fund")==0)
{
	$project_Name= $_POST['q72_projectName'];
	mysql_query("INSERT INTO project VALUES ('$project_Name',$resultcount+1)") or die(mysql_error());
}

if(strcmp($category,"Rs 0 - Rs 50,000")!=0)
{	$query="Select * from committee";
	$sqlsearch = mysql_query($query);
	$temp = mysql_numrows($sqlsearch);
	mysql_query("INSERT INTO committee VALUES ($temp+1,$resultcount+1)") or die(mysql_error());
	$member1=$_POST['q12_member1'];
	$member2=$_POST['q11_member2'];
	$member3=$_POST['q10_member3'];
	$result=mysql_query("Select F_id from faculty where F_name='$member1'") or die(mysql_error());
	$row=mysql_fetch_row($result);
	mysql_query("INSERT INTO member VALUES ($temp+1,$row[0])") or die(mysql_error());
	$result=mysql_query("Select F_id from faculty where F_name='$member2'") or die(mysql_error());
	$row=mysql_fetch_row($result);
	mysql_query("INSERT INTO member VALUES ($temp+1,$row[0])") or die(mysql_error());
	$result=mysql_query("Select F_id from faculty where F_name='$member3'") or die(mysql_error());
	$row=mysql_fetch_row($result);
	mysql_query("INSERT INTO member VALUES ($temp+1,$row[0])") or die(mysql_error());
	$timezone = "Asia/Calcutta";
	date_default_timezone_set($timezone);
	$time=date("Y-m-d H:i:s");
	mysql_query("INSERT INTO admin_form_with VALUES (3,$resultcount+1,'$status',NULL,'$time',1)") or die	(mysql_error());
	mysql_query("INSERT INTO fac_fills_form VALUES ($row[0],$temp+1,$resultcount+1,'$time',0)") or die	(mysql_error());
}
else
{	$time=date("Y-m-d H:i:s");
	mysql_query("INSERT INTO admin_form_with VALUES (1,$resultcount+1,'$status',NULL,'$time',1)") or die	(mysql_error());
	mysql_query("INSERT INTO fac_fills_form VALUES (1,NULL,$resultcount+1,'$time',0)") or die	(mysql_error());
}
$item_name="";

for($i=1;$i<=$number_of_items;$i++)
{
	if($i==1)
	{	
		$item_no=1;
		$name= $_POST['q20_itemName20'];
		$item_name=$name;
		$quantity= $_POST['q58_quantity'];
		$cost= $_POST['q73_costOf73'];
		$description= $_POST['q70_itemDescription70'];
		$suppliers=$_POST['q91_listOf'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==2){
		$item_no=2;
		$name= $_POST['q27_itemName27'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q57_quantity57'];
		$cost= $_POST['q82_costOf'];
		$description= $_POST['q69_itemDescription69'];
		$suppliers=$_POST['q90_listOf90'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==3)
	{
		$item_no=3;
		$name= $_POST['q31_itemName31'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q22_quantity22'];
		$cost= $_POST['q74_costOf74'];
		$description= $_POST['q68_itemDescription68'];
		$suppliers=$_POST['q89_listOf89'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==4){
		$item_no=4;
		$name= $_POST['q30_itemName30'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q59_quantity59'];
		$cost= $_POST['q75_costOf75'];
		$description= $_POST['q66_itemDescription66'];
		$suppliers=$_POST['q88_listOf88'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==5){
		$item_no=5;
		$name= $_POST['q29_itemName'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q56_quantity56'];
		$cost= $_POST['q76_costOf76'];
		$description= $_POST['q67_itemDescription67'];
		$suppliers=$_POST['q87_listOf87'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==6){
		$item_no=6;
		$name= $_POST['q28_itemName28'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q60_quantity60'];
		$cost= $_POST['q77_costOf77'];
		$description= $_POST['q65_itemDescription65'];
		$suppliers=$_POST['q86_listOf86'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==7){
		$item_no=7;
		$name= $_POST['q26_itemName26'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q61_quantity61'];
		$cost= $_POST['q78_costOf78'];
		$description= $_POST['q64_itemDescription64'];
		$suppliers=$_POST['q85_listOf85'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==8){
		$item_no=8;
		$name= $_POST['q43_itemName43'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q55_quantity55'];
		$cost= $_POST['q79_costOf79'];
		$description= $_POST['q63_itemDescription63'];
		$suppliers=$_POST['q84_listOf84'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else if($i==9){
		$item_no=9;
		$name= $_POST['q42_itemName42'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q54_quantity54'];
		$cost= $_POST['q80_costOf80'];
		$description= $_POST['q19_itemDescription19'];
		$suppliers=$_POST['q83_listOf83'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
	else{
		$item_no=10;
		$name= $_POST['q41_itemName41'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['q53_quantity53'];
		$cost= $_POST['q81_costOf81'];
		$description= $_POST['q62_itemDescription62'];
		$suppliers=$_POST['q25_listOf25'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers')") or die(mysql_error());
	}
}

mysql_query("INSERT INTO form_club_item VALUES ($resultcount+1,'$item_name')") or die(mysql_error());
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="HandheldFriendly" content="true" />
<title>Thank You</title>
<style>
body {
	font-size: 12px;
	font-family: Verdana;
}
</style>
</head>
<body>
	<p></p>
	<div style="text-align: center;">
		<h1>Thank You!</h1>
		Your submission has been received.
	</div>
</body>
</html>