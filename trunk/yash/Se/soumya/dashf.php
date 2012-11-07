<?php
$pg=$_GET['pg'];
$uname=$_GET['username'];
//$pg=1;
//$uname='Amarjeet Singh';
$con = mysql_connect('localhost', 'root', 'mcgrath');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$sql="Select item_name,max(A_timestamp),form_id,form_status from mainview2 where A_status=form_status and F_name='".$uname."' and Deleted_Fac=0  GROUP BY form_id ORDER BY A_timestamp DESC";
$id=1;
$result = mysql_query($sql);
$show=1;
$va=intval($pg)*10;
while($row = mysql_fetch_array($result))
{
	if($show<=$va && $show>($va-10))
	{
		echo "<tr id='".$id."'>";
		echo "<td><span id=\"form_".$row['form_id']."\">".$row['form_id']."<span></td>";		
		echo "<td>".$row['item_name']."</td>";
		echo "<td>".$row['form_status']."</td>";		
//		echo "<td id='Request' hidden='hidden'>".$row['F_name']."</td>";
		echo "<td>".$row['max(A_timestamp)']."</td>";
		echo "<td><input type='button' value='View Form' onclick='(dispForm(".$row['form_id']."))'></input></td>";
		echo "</tr>";				
		$id=$id+1;
	}
	$show=$show+1;
}
mysql_close($con);
?>