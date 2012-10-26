<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php 
 // Connects to your Database 
 mysql_connect("localhost", "root", "aksrajvanshi") or die(mysql_error()); 
 mysql_select_db("equipme") or die(mysql_error()); 
 $data = mysql_query("set @var=0,@adminno=0")
 or die(mysql_error()); 
  // $data = mysql_query("select @var:=F_id from mainview2 INNERJOIN admin_form_fills on mainnview2.form_id=admin_form_fills.form_id AND F_name='facultyname'")
  //or die(mysql_error()); 
 $data = mysql_query("SELECT @adminno:=a_id from mainview2 where form_id=formno")
 or die(mysql_error());
 $data = mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id=formno")
 or die(mysql_error());
 $timezone = "Asia/Calcutta";
 date_default_timezone_set($timezone);
 $time=date("Y-m-d H:i:s"); 
 $data = mysql_query("insert into admin_form_with values(@adminno+1,@var,'Ongoing','NULL',$time,1,0)")
 or die(mysql_error()); 
 Print "<table border cellpadding=3>"; 
 while($info = mysql_fetch_array( $data )) 
 { 
 Print "<tr>"; 
 Print "<th>ID number:</th> <td>".$info['a_id'] . "</td> "; 
 Print "<th>Remarks:</th> <td>".$info['A_status'] . " </td></tr>"; 
 } 
 Print "</table>"; 
 ?> 
<body>
</body>
</html>