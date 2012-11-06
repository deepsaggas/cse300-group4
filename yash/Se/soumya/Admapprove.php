<?php	
$formid =$_GET['form_id'];
$con = mysql_connect('localhost', 'root', '');
if (!$con)
{
	die('Could not connect: ' . mysql_error());
	}
	mysql_select_db("group4",$con);
	
	

$adminId = mysql_query("SELECT a_id from mainview2 where form_id= '".$formid."' and A_present=1");
$row1 = mysql_fetch_array($adminId);

$aid = $row1['a_id'];

$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

$adminWork = mysql_query("SELECT A_work from mainview2 where form_id= '".$formid."' and A_present=1");
$row2 = mysql_fetch_array($adminWork);
$AdminTask = $row2['A_work'];

$src = mysql_query("SELECT source_funds from mainview2 where form_id= '".$formid."' and A_present=1");
$row4 = mysql_fetch_array($src);
$funds = $row4['source_funds'];

$sdf = mysql_query("SELECT sum(Cost*Quantity) as c1 from item where form_id= '".$formid."'");
$row5 = mysql_fetch_array($sdf);
$totalCost = $row5['c1'];


echo $formid;
echo $aid;
echo $adminName;
echo $AdminTask;
echo $funds;
echo $totalCost;
if($totalCost<=50000 && $funds =="Project Fund")

{

if($aid==2 && $AdminTask =='Approve initial request')
{
echo "Bye";


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."'  and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] +1;
echo "$newAdmin";


$newTask = "Check Budget";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName." The work done was ".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}




if($aid==3 && $AdminTask =='Check Budget')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -1;
echo "$newAdmin";


$newTask = "Procure Equipment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}


if($aid==2 && $AdminTask =='Procure Equipment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] +3;
echo "$newAdmin";


$newTask = "Sanction Payment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}





if($aid==5 && $AdminTask =='Sanction Payment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -2;
echo "$newAdmin";


$newTask = "Prepare Cheque";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}




if($aid==3 && $AdminTask =='Prepare Cheque')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -1;
echo "$newAdmin";


$newTask = "Make Payment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}



if($aid==2 && $AdminTask =='Make Payment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");




$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by All,Process  is Over "; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

mysql_query("UPDATE form SET form_status= 'Approved' where form_id= '".$formid."'");


}



}



/////////////////////////////////////////////////////2nd BPM




if($totalCost>=50000 && $funds =="Project Fund")

{

if($aid==4 && $AdminTask =='Approve initial request')
{
echo "Bye";


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."'  and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -2;
echo "$newAdmin";


$newTask = "Approve initial request";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}










if($aid==2 && $AdminTask =='Approve initial request')
{
echo "Bye";


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."'  and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] +1;
echo "$newAdmin";


$newTask = "Check Budget";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}




if($aid==3 && $AdminTask =='Check Budget')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -1;
echo "$newAdmin";


$newTask = "Procure Equipment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}


if($aid==2 && $AdminTask =='Procure Equipment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] +3;
echo "$newAdmin";


$newTask = "Sanction Payment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}





if($aid==5 && $AdminTask =='Sanction Payment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -2;
echo "$newAdmin";


$newTask = "Prepare Cheque";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}




if($aid==3 && $AdminTask =='Prepare Cheque')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -1;
echo "$newAdmin";


$newTask = "Make Payment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}



if($aid==2 && $AdminTask =='Make Payment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");




$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by All,Process  is Over "; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

mysql_query("UPDATE form SET form_status= 'Approved' where form_id= '".$formid."'");


}



}









//////////////////////////////////////////////////////////////3rd bpm







else
{

if($aid==4 && $AdminTask =='Approve initial request')
{
echo "Bye";


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."'  and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -2;
echo "$newAdmin";


$newTask = "Approve initial request";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}










if($aid==2 && $AdminTask =='Approve initial request')
{
echo "Bye";


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."'  and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] +1;
echo "$newAdmin";


$newTask = "Check Budget";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}




if($aid==3 && $AdminTask =='Check Budget')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -1;
echo "$newAdmin";


$newTask = "Procure Equipment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}


if($aid==2 && $AdminTask =='Procure Equipment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] +1;
echo "$newAdmin";


$newTask = "Prepare Cheque";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}









if($aid==3 && $AdminTask =='Prepare Cheque')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."' ");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");


$newAdmin = $row1['a_id'] -1;
echo "$newAdmin";


$newTask = "Make Payment";
mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad,A_work) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 ,'".$newTask."')");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName."The work done was".$AdminTask; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

}



if($aid==2 && $AdminTask =='Make Payment')
{


mysql_query("UPDATE admin_form_with SET A_status='Approved' where form_id = '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_present= 0 where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");

mysql_query("UPDATE admin_form_with SET A_timestamp= current_timestamp where form_id= '".$formid."' and a_id ='".$row1['a_id']."' and A_work ='".$AdminTask ."'");




$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");
$row3 = mysql_fetch_array($row2);
$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by All,Process  is Over "; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");

mysql_query("UPDATE form SET form_status= 'Approved' where form_id= '".$formid."'");


}



}















/*
if($row1['a_id']<=4)

{
echo "great";


$newAdmin = $row1['a_id'] +1;
echo "$newAdmin";




mysql_query("INSERT INTO admin_form_with (a_id,form_id,A_status,A_reason,A_timestamp,A_present,Deleted_Ad) values  ('".$newAdmin."','".$formid."','Ongoing',NULL,current_timestamp,1,0 )");


$row2 = mysql_query("SELECT A_name from mainview2 where a_id= '".$row1['a_id']."' ");

$row3 = mysql_fetch_array($row2);

$adminName = $row3['A_name'];

echo  "$adminName";

$Text = "Form Approved by  ".$adminName; 

mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('".$Text."','".$formid."',0)");


}

else
{
mysql_query("UPDATE form SET form_status= 'Approved' where form_id= '".$formid."'");



mysql_query("INSERT INTO notifications (Text,form_id,Read_n) values ('Form approved by all' ,'".$formid."',0) " );


}
*/
mysql_close($con);
?>


