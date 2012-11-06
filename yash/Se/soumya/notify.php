<?php

$uname=$_GET['username'];
$pg=$_GET['pg'];
$con = mysql_connect('localhost', 'root', '');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$sql="Select Text,form_id from notify where Read_n=0 and F_name='".$uname."'";
$id=1;
$result = mysql_query($sql);
$show=1;
$va=intval($pg)*10;
while($row = mysql_fetch_array($result))
{	
	if($show<=$va && $show>($va-10))
	{
		
		echo "<tr id='".$id."'>";
		echo "<td><input type='checkbox' id='ch_".$id."'/></td>";
		echo "<td><span id=\"form_".$row['form_id']."\">".$row['form_id']."<span></td>";		
		echo "<td>".$row['Text']."</td>";
		echo "<td><input type='button' value='View Form' onclick='(dispForm(".$row['form_id']."))'></input></td>";
		echo "</tr>";				
		$id=$id+1;
	}
	$show=$show+1;
}
mysql_close($con);
?>