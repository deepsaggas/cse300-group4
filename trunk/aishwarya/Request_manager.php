<?php

$con = mysql_connect('localhost:3307', 'root', '1234');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("group4", $con);
   $query="SELECT form_id, A_status, A_timestamp, Description from mainview where F_name='Ashish Sureka' ORDER BY A_timestamp ASC LIMIT 0,6";
   $result=mysql_query($query);
   /*
   	<tr> 
   					
    				
    				<td>OnGoing</td> 
    				<td>16th April 2012</td> 
    				
				</tr> 
				
   */
while(($row = mysql_fetch_array($result))!=null)
{	
	echo"<tr>";
	
	echo  "<td><input type=\"checkbox\"></td>" ;
	
	echo "<td>" . $row['form_id'] . "</td>" ;
	echo "<td>" . $row['Description'] . "</td>";
	echo "<td>" . $row['A_status'] . "</td>";
	echo "<td>" . $row['A_timestamp'] . "</td>";
	echo "<td><input type='image' src='images/icn_edit.png' title='Edit'><input type='image' src='images/icn_trash.png' title='Trash'></td>";
	echo"</tr>";
}	
     mysql_close($con);
	?>