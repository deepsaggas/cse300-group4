<?php
$uname=$_GET['username'];
$con = mysql_connect('localhost', 'root', '');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4",$con);
$sql="Select F_name as n,url from profile,faculty where F_name='".$uname."' && F_id=profile_id union Select A_name as n,url from profile,admin where A_name='".$uname."' && a_id=profile_id";
$result = mysql_query($sql);
while($row = mysql_fetch_array($result))
{	
		echo "<h1> $row[n] </h1>";		
		echo "<a class=\"various\" href=\"images_1/$row[n].jpg\"><img src='images_1/$row[n].jpg'></img></a>" ; 		
		echo "<p>&nbsp</p>";
		echo "<p>Indraprastha Institute of Information Technology Delhi (IIIT-D)</p>";
		$url=$row['url'];
		echo "<span> <em>Website</em> : <a href='$url'>$url</span>";
}

mysql_close($con);
?>
