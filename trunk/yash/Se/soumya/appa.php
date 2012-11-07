<?php
$pg=$_GET['pg'];
$uname=$_GET['username'];
$con = mysql_connect('localhost', 'root', 'mcgrath');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$sql="Select item_name,max(A_timestamp),form_id,F_name from mainview2 where A_name='".$uname."' and form_status='Approved' and Deleted_Ad=0 GROUP BY form_id ORDER BY A_timestamp DESC";
$id=1;
$result = mysql_query($sql);
$show=1;
$va=intval($pg)*10;
while($row = mysql_fetch_array($result))
{
	if($show<=$va && $show>($va-10))
	{
		echo "<tr id='".$id.">";
		echo "<td><input type='checkbox' id='ch_".$id."'/></td>";
		echo "<td><span id=\"form_".$row['form_id']."\">".$row['form_id']."<span></td>";		
		echo "<td>".$row['item_name']."</a></td>";
		echo "<td>".$row['F_name']."</td>";
		echo "<td>".$row['max(A_timestamp)']."</td>";
		echo "<td><input type='button' value='View Form' onclick='(dispForm(".$row['form_id']."))'></input></td>";
		echo "</tr>";				
		$id=$id+1;
	}
	$show=$show+1;
}
mysql_close($con);
?>