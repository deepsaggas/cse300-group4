<?php
//print_r($_POST);
//print_r($_FILES);
// This function will run within each post array including multi-dimensional arrays
function ExtendedAddslash(&$params)
	{
	foreach ($params as &$var) 
	{
		// check if $var is an array. If yes, it will start another ExtendedAddslash() function to loop to each key inside.
		is_array($var) ? ExtendedAddslash($var) : $var=addslashes($var);
		unset($var);
	}
	}


// Initialize ExtendedAddslash() function for every $_POST variable
ExtendedAddslash($_POST);

$timezone = "Asia/Calcutta";
date_default_timezone_set($timezone);

$db_host = 'localhost:3306';
$db_username = 'root';
$db_password = '';
$db_name = 'group4';
$fac_id=$_GET['fac_id'];
$source_of_fund= $_POST['field17466345'];
if($fac_id!=0)
{
mysql_connect( $db_host, $db_username, $db_password) or die(mysql_error());
mysql_select_db($db_name);

$query="Select * from form";
$sqlsearch = mysql_query($query);
$resultcount = mysql_numrows($sqlsearch);

$category= $_POST['field17466132'];
$number_of_items= $_POST['field17466421'];
$status="Ongoing";

mysql_query("INSERT INTO form (form_id, form_status, source_funds) VALUES ($resultcount+1,'$status','$source_of_fund')") or die(mysql_error());

if(strcmp($source_of_fund,"Project Fund")==0)
{
	$project_Name= $_POST['field17466399'];
	mysql_query("INSERT INTO project VALUES ('$project_Name',$resultcount+1)") or die(mysql_error());
}

if(strcmp($category,"Rs 0 - Rs 50,000")!=0){
	$query="Select MAX(C_id) from fac_fills_form";
	$sqlsearch = mysql_query($query);
	$temp = mysql_fetch_row($sqlsearch);
	$time=date("Y-m-d H:i:s");
	mysql_query("INSERT INTO admin_form_with VALUES (4,$resultcount+1,'$status',NULL,'$time',1,0,'Approve initial request')") or die	(mysql_error());
	mysql_query("INSERT INTO fac_fills_form VALUES ($fac_id,$temp[0]+1,$resultcount+1,'$time',0)") or die	(mysql_error());
	$member1=$_POST['field17467871'];
	$member2=$_POST['field17467876'];
	$member3=$_POST['field17467877'];
	$result=mysql_query("Select F_id from faculty where F_name='$member1'") or die(mysql_error());
	$row=mysql_fetch_row($result);
	mysql_query("INSERT INTO member VALUES ($temp[0]+1,$row[0])") or die(mysql_error());
	$result=mysql_query("Select F_id from faculty where F_name='$member2'") or die(mysql_error());
	$row=mysql_fetch_row($result);
	mysql_query("INSERT INTO member VALUES ($temp[0]+1,$row[0])") or die(mysql_error());
	$result=mysql_query("Select F_id from faculty where F_name='$member3'") or die(mysql_error());
	$row=mysql_fetch_row($result);
	mysql_query("INSERT INTO member VALUES ($temp[0]+1,$row[0])") or die(mysql_error());
}
else
{	$time=date("Y-m-d H:i:s");
	if(strcmp($source_of_fund,"Project Fund")==0){
		mysql_query("INSERT INTO admin_form_with VALUES (2,$resultcount+1,'$status',NULL,'$time',1,0,'Approve initial request')") or die	(mysql_error());
	}
	else{
		mysql_query("INSERT INTO admin_form_with VALUES (4,$resultcount+1,'$status',NULL,'$time',1,0,'Approve initial request')") or die	(mysql_error());
	}
	mysql_query("INSERT INTO fac_fills_form VALUES (1,NULL,$resultcount+1,'$time',0)") or die	(mysql_error());
}

$item_name="";

for($i=1;$i<=$number_of_items;$i++)
{
	if($i==1)
	{	
		$item_no=1;
		$name= $_POST['field17466424'];
		$item_name=$name;
		$quantity= $_POST['field17466425'];
		$cost= $_POST['field17466966'];
		$description= $_POST['field17466844'];
		$suppliers=$_POST['field17466975'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==2){
		$item_no=2;
		$name= $_POST['field17466992'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17466983'];
		$cost= $_POST['field17466982'];
		$description= $_POST['field17466984'];
		$suppliers=$_POST['field17466985'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==3)
	{
		$item_no=3;
		$name= $_POST['field17466987'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17466989'];
		$cost= $_POST['field17466988'];
		$description= $_POST['field17466990'];
		$suppliers=$_POST['field1746698291'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==4){
		$item_no=4;
		$name= $_POST['field17467058'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17467060'];
		$cost= $_POST['field17467059'];
		$description= $_POST['field17467061'];
		$suppliers=$_POST['field17467062'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==5){
		$item_no=5;
		$name= $_POST['field17467052'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17467054'];
		$cost= $_POST['field17467053'];
		$description= $_POST['field17467055'];
		$suppliers=$_POST['field17467056'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==6){
		$item_no=6;
		$name= $_POST['field17467046'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17467048'];
		$cost= $_POST['field17467047'];
		$description= $_POST['field17467049'];
		$suppliers=$_POST['field17467050'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==7){
		$item_no=7;
		$name= $_POST['field17467017'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17467019'];
		$cost= $_POST['field17467018'];
		$description= $_POST['field17467020'];
		$suppliers=$_POST['field17467021'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==8){
		$item_no=8;
		$name= $_POST['field17467010'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17467012'];
		$cost= $_POST['field17467011'];
		$description= $_POST['field17467013'];
		$suppliers=$_POST['field17467014'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else if($i==9){
		$item_no=9;
		$name= $_POST['field17467003'];
		$item_name=$item_name.",".$name;
		$quantity= $_POST['field17467005'];
		$cost= $_POST['field17467004'];
		$description= $_POST['field17467006'];
		$suppliers=$_POST['field17467007'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
	else{
		$item_no=10;
		$name= $_POST['field17467065'];
		$item_name=$item_name.", ".$name;
		$quantity= $_POST['field17467067'];
		$cost= $_POST['field17467066'];
		$description= $_POST['field17467068'];
		$suppliers=$_POST['field17467069'];
		mysql_query("INSERT INTO item VALUES ($item_no, '$name', $cost,$quantity,'$description',$resultcount+1,'$suppliers',NULL)") or die(mysql_error());
	}
}

mysql_query("INSERT INTO form_club_item VALUES ($resultcount+1,'$item_name')") or die(mysql_error());

if($_FILES['file']) {
	$upload = true;
	
	if($upload) {
		move_uploaded_file($_FILES['file']['tmp_name'], true . $_FILES['file']['name']);
	}
}

header( 'Location: http://192.168.1.20:8084/Se/soumya/thankyou.html' ) ;
}
else
{
	header( 'Location: http://http://192.168.1.20:8084/Se/soumya/index.php?logout' ) ;
}
?>