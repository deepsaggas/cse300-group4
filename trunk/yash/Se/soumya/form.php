<?php
require_once '/src/Google_Client.php';
require_once '/src/contrib/Google_Oauth2Service.php';
session_start();

$client = new Google_Client();
$client->setApplicationName("Google UserInfo PHP Starter Application");
// Visit https://code.google.com/apis/console?api=plus to generate your
// oauth2_client_id, oauth2_client_secret, and to register your oauth2_redirect_uri.
// $client->setClientId('insert_your_oauth2_client_id');
// $client->setClientSecret('insert_your_oauth2_client_secret');
// $client->setRedirectUri('insert_your_redirect_uri');
// $client->setDeveloperKey('insert_your_developer_key');
$oauth2 = new Google_Oauth2Service($client);

if (isset($_GET['code'])) {
	$client->authenticate($_GET['code']);
	$_SESSION['token'] = $client->getAccessToken();
	$redirect = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];
	header('Location: ' . filter_var($redirect, FILTER_SANITIZE_URL));
	return;
}
if(isset($_GET['error']))
		header('Location: http://localhost/Se/soumya/index.php?logout');
if (isset($_SESSION['token'])) {
	$client->setAccessToken($_SESSION['token']);
}

if ($client->getAccessToken()) {
	$user = $oauth2->userinfo->get();
	
	// These fields are currently filtered through the PHP sanitize filters.
	// See http://www.php.net/manual/en/filter.filters.sanitize.php
	$email = filter_var($user['email'], FILTER_SANITIZE_EMAIL);
	//$img = filter_var($user['picture'], FILTER_VALIDATE_URL);
	$name = $user['name'];
	//$personMarkup = "$email<div><img src='$img?sz=500'></div>$name<br/>";
	$personMarkup = "$email<br/>$name<br/>";
	
	// The access token may have been updated lazily.
	$_SESSION['token'] = $client->getAccessToken();
	echo $name;
		//checking admin or faculty
	
	$flag = 0;
	
	$con = mysql_connect('localhost', 'root', 'mcgrath');
	if (!$con)
	{
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db("group4", $con);
	
	$sql="Select u_id from faculty,authentication where F_id = u_id and u_name='".$email."'";
	$result = mysql_query($sql);
	if($row = mysql_fetch_array($result))
	{
		$flag = $row['u_id'];//Faculty
	}
	$sql="Select u_id from admin,authentication where a_id = u_id and u_name='".$email."'";
	$result = mysql_query($sql);	
	if($row = mysql_fetch_array($result))
	{			
		$flag = 0;//Admin
	}	
	
	mysql_close($con);
	
	//print "<a class='logout' href='?logout'>Logout</a>";
	//header('Location: http://equipme.com/Dashboard.php?session='.$_SESSION['token']); 
	if($flag == 0)
	{
	header("Location: http://localhost/Se/soumya/index.php?logout");
	}

	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="HandheldFriendly" content="true" />
<title>Form</title>
<link href="g=formCss.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.form-label {
	width: 180px !important;
}

.form-label-left {
	width: 180px !important;
}

.form-line {
	padding-top: 12px;
	padding-bottom: 12px;
}

.form-label-right {
	width: 180px !important;
}

body,html {
	margin: 0;
	padding: 0;
	background: false;
}

.form-all {
	margin: 0px auto;
	padding-top: 0px;
	width: 690px;
	color: #555 !important;
	font-family: 'Verdana';
	font-size: 12px;
}

.form-radio-item label,.form-checkbox-item label,.form-grading-label,.form-header
	{
	color: #555555;
}
</style>

<link type="text/css" rel="stylesheet"
	href="form-submit-button-light_rounded.css?" />
<script src="g=jotform.js"
	type="text/javascript"></script>
<script src="cost.js" type="text/javascript"></script>
<script type="text/javascript">
   JotForm.setConditions([{"action":{"field":"15","visibility":"Show"},"link":"Any","terms":[{"field":"5","operator":"equals","value":"Rs 50,000 - Rs 1.5 lakh"}],"type":"field"},{"action":{"field":"12","visibility":"Show"},"link":"Any","terms":[{"field":"5","operator":"equals","value":"Rs 50,000 - Rs 1.5 lakh"}],"type":"field"},{"action":{"field":"11","visibility":"Show"},"link":"Any","terms":[{"field":"5","operator":"equals","value":"Rs 50,000 - Rs 1.5 lakh"}],"type":"field"},{"action":{"field":"10","visibility":"Show"},"link":"Any","terms":[{"field":"5","operator":"equals","value":"Rs 50,000 - Rs 1.5 lakh"}],"type":"field"},{"action":{"field":"72","visibility":"Show"},"link":"Any","terms":[{"field":"71","operator":"equals","value":"Project Fund"}],"type":"field"},{"action":{"field":"45","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"41","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"81","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"53","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"62","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"25","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"83","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"19","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"80","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"54","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"42","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"46","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"44","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"}],"type":"field"},{"action":{"field":"27","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"}],"type":"field"},{"action":{"field":"57","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"}],"type":"field"},{"action":{"field":"82","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"}],"type":"field"},{"action":{"field":"69","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"}],"type":"field"},{"action":{"field":"90","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"}],"type":"field"},{"action":{"field":"49","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"43","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"79","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"55","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"63","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"84","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"89","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"}],"type":"field"},{"action":{"field":"68","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"}],"type":"field"},{"action":{"field":"74","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"}],"type":"field"},{"action":{"field":"22","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"}],"type":"field"},{"action":{"field":"31","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"}],"type":"field"},{"action":{"field":"47","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"}],"type":"field"},{"action":{"field":"48","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"}],"type":"field"},{"action":{"field":"30","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"}],"type":"field"},{"action":{"field":"59","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"}],"type":"field"},{"action":{"field":"75","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"}],"type":"field"},{"action":{"field":"66","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"}],"type":"field"},{"action":{"field":"88","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"}],"type":"field"},{"action":{"field":"52","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"29","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"56","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"76","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"67","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"87","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"87","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"}],"type":"field"},{"action":{"field":"51","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"},{"field":"7","operator":"equals","value":"5"}],"type":"field"},{"action":{"field":"28","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"},{"field":"7","operator":"equals","value":"5"}],"type":"field"},{"action":{"field":"60","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"},{"field":"7","operator":"equals","value":"5"}],"type":"field"},{"action":{"field":"77","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"},{"field":"7","operator":"equals","value":"5"}],"type":"field"},{"action":{"field":"65","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"},{"field":"7","operator":"equals","value":"5"}],"type":"field"},{"action":{"field":"86","visibility":"Hide"},"link":"Any","terms":[{"field":"7","operator":"equals","value":"1"},{"field":"7","operator":"equals","value":"2"},{"field":"7","operator":"equals","value":"3"},{"field":"7","operator":"equals","value":"4"},{"field":"7","operator":"equals","value":"5"}],"type":"field"},{"action":{"field":"50","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"7"},{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"26","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"7"},{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"61","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"7"},{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"78","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"7"},{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"64","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"7"},{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"85","visibility":"Hide"},"link":"All","terms":[{"field":"7","operator":"notEquals","value":"7"},{"field":"7","operator":"notEquals","value":"8"},{"field":"7","operator":"notEquals","value":"9"},{"field":"7","operator":"notEquals","value":"10"}],"type":"field"},{"action":{"field":"93","visibility":"Show"},"link":"Any","terms":[{"field":"8","operator":"isFilled","value":false}],"type":"field"}]);
   JotForm.init(function(){
      JotForm.description('input_5', 'Category for the request based on total amount');
      JotForm.setCalendar("9");
      JotForm.description('input_9', 'Date by which the requested item is required');
      JotForm.description('input_71', 'Source of funds for the project');
      JotForm.description('input_72', 'Project from which the purchase is being funded');
      JotForm.description('input_7', 'Number of items to be purchased');
      $('input_20').hint('e.g :- Laptop');
      JotForm.description('input_20', 'Name of the item');
      JotForm.description('input_58', 'Quantity to be purchased');
      $('input_73').hint('e.g :- 10000');
      JotForm.description('input_73', 'Cost of a single unit of the item');
      $('input_70').hint('Write here');
      JotForm.description('input_70', 'Technical specifications and details of item');
      $('input_91').hint('Write here');
      JotForm.description('input_91', 'List of suggested suppliers');
      $('input_27').hint('e.g :- Laptop');
      JotForm.description('input_27', 'Name of the Item');
      JotForm.description('input_57', 'Quantity of the item');
      $('input_82').hint('e.g :- 10000');
      JotForm.description('input_82', 'Cost of single unit of the Item');
      $('input_69').hint('Write here');
      JotForm.description('input_69', 'Technical Specifications and Details of Item');
      $('input_90').hint('Write here');
      JotForm.description('input_90', 'List of suggested suppliers');
      $('input_31').hint('e.g :- Laptop');
      JotForm.description('input_31', 'Name of the Item');
      JotForm.description('input_22', 'Quantity to be purchased');
      $('input_74').hint('e.g :- 10000');
      JotForm.description('input_74', 'Cost of single unit of the Item');
      $('input_68').hint('Write here');
      JotForm.description('input_68', 'Technical Specifications and Details of Item');
      $('input_89').hint('Write here');
      JotForm.description('input_89', 'List of suggested suppliers');
      $('input_30').hint('e.g :- Laptop');
      JotForm.description('input_30', 'Name of the Item');
      JotForm.description('input_59', 'Quantity to be purchased');
      $('input_75').hint('e.g :- 10000');
      JotForm.description('input_75', 'Cost of single unit of the Item');
      $('input_66').hint('Write here');
      JotForm.description('input_66', 'Technical Specifications and Details of Item');
      $('input_88').hint('Write here');
      JotForm.description('input_88', 'List of suggested suppliers');
      $('input_29').hint('e.g :- Laptop');
      JotForm.description('input_29', 'Name of the Item');
      JotForm.description('input_56', 'Quantity to be purchased');
      $('input_76').hint('e.g :- 10000');
      JotForm.description('input_76', 'Cost of single unit of the Item');
      $('input_67').hint('Write here');
      JotForm.description('input_67', 'Technical Specifications and Details of Item');
      $('input_87').hint('Write here');
      JotForm.description('input_87', 'List of suggested suppliers');
      $('input_28').hint('e.g :- Laptop');
      JotForm.description('input_28', 'Name of the Item');
      JotForm.description('input_60', 'Quantity to be purchased');
      $('input_77').hint('e.g :- 10000');
      JotForm.description('input_77', 'Cost of single unit of the Item');
      $('input_65').hint('Write here');
      JotForm.description('input_65', 'Technical Specifications and Details of Item');
      $('input_86').hint('Write here');
      JotForm.description('input_86', 'List of suggested suppliers');
      $('input_26').hint('e.g :- Laptop');
      JotForm.description('input_26', 'Name of the Item');
      JotForm.description('input_61', 'Quantity to be purchased');
      $('input_78').hint('e.g :- 10000');
      JotForm.description('input_78', 'Cost of single unit of the Item');
      $('input_64').hint('Write here');
      JotForm.description('input_64', 'Technical Specifications and Details of Item');
      $('input_85').hint('Write here');
      JotForm.description('input_85', 'List of suggested suppliers');
      $('input_43').hint('e.g :- Laptop');
      JotForm.description('input_43', 'Name of the Item');
      JotForm.description('input_55', 'Quantity to be purchased');
      $('input_79').hint('e.g :- 10000');
      JotForm.description('input_79', 'Cost of single unit of the Item');
      $('input_63').hint('Write here');
      JotForm.description('input_63', 'Technical Specifications and Details of Item');
      $('input_84').hint('Write here');
      JotForm.description('input_84', 'List of suggested suppliers');
      $('input_42').hint('e.g :- Laptop');
      JotForm.description('input_42', 'Name of the Item');
      JotForm.description('input_54', 'Quantity to be purchased');
      $('input_80').hint('e.g :- 10000');
      JotForm.description('input_80', 'Cost of single unit of the Item');
      $('input_19').hint('Write here');
      JotForm.description('input_19', 'Technical Specifications and Details of Item');
      $('input_83').hint('Write here');
      JotForm.description('input_83', 'List of suggested suppliers');
      $('input_41').hint('e.g :- Laptop');
      JotForm.description('input_41', 'Name of the Item');
      JotForm.description('input_53', 'Quantity to be purchased');
      $('input_81').hint('e.g :- 10000 ');
      JotForm.description('input_81', 'Cost of single unit of the Item');
      $('input_62').hint('Write here');
      JotForm.description('input_62', 'Technical Specifications and Details of Item');
      $('input_25').hint('Write here');
      JotForm.description('input_25', 'List of suggested suppliers');
      JotForm.description('input_12', 'Name of first Committee Member');
      JotForm.description('input_11', 'Name of second Committee Member');
      JotForm.description('input_10', 'Name of third Committee Member');
      JotForm.description('input_8', 'Upload a single file containing product specifications and other details. Acceptable formats are :- pdf,docx,txt,jpeg,zip');
      JotForm.description('input_93', 'Details of the uploaded file');
      JotForm.alterTexts({"alphabetic":"This field can only contain letters","alphanumeric":"This field can only contain letters and numbers.","confirmClearForm":"Are you sure you want to clear the form","confirmEmail":"E-mail does not match","email":"Enter a valid e-mail address","incompleteFields":"There are incomplete required fields.","lessThan":"Your score should be less than","numeric":"This field can only contain numeric values","pleaseWait":"Please wait...","required":"This field is required.","uploadExtensions":"You can only upload following files:","uploadFilesize":"File size cannot be bigger than:"});
   });
</script>
</head>
<body>
	<form class="jotform-form" action="http://localhost/Se/soumya/en.php?fac_id=<?php echo $flag; ?>" 	method="post" name="form_22643568634460" id="22643568634460" enctype="multipart/form-data" accept-charset="utf-8" onclick="return(validate());" >
		<div class="form-all">
			<ul class="form-section">
				<li id="cid_1" class="form-input-wide">
					<div class="form-header-group">
						<h1 id="header_1" class="form-header">Equipment Purchase</h1>
					</div>
				</li>
				<li class="form-line" id="id_5"><label class="form-label-left"
					id="label_5" for="input_5"> Category<span class="form-required">*</span>
				</label>
					<div id="cid_5" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_5" name="q5_category">
							<option></option>
							<option value="Rs 0 - Rs 50,000">Rs 0 - Rs 50,000</option>
							<option value="Rs 50,000 - Rs 1.5 lakh">Rs 50,000 - Rs 1.5 lakh</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_9"><label class="form-label-left"
					id="label_9" for="input_9"> Purchase Expected Before </label>
					<div id="cid_9" class="form-input">
						<span class="form-sub-label-container"><input class="form-textbox"
							id="day_9" name="q9_purchaseExpected[day]" type="text" size="2"
							maxlength="2" /><span class="date-separate">&nbsp;/</span>
							<label class="form-sub-label" for="day_9" id="sublabel_day"> Day
						</label> </span><span class="form-sub-label-container"><input
							class="form-textbox" id="month_9"
							name="q9_purchaseExpected[month]" type="text" size="2"
							maxlength="2" /><span class="date-separate">&nbsp;/</span>
							<label class="form-sub-label" for="month_9" id="sublabel_month">
								Month </label> </span><span class="form-sub-label-container"><input
							class="form-textbox" id="year_9" name="q9_purchaseExpected[year]"
							type="text" size="4" maxlength="4" /> <label
							class="form-sub-label" for="year_9" id="sublabel_year"> Year </label>
						</span><span class="form-sub-label-container"><img
							alt="Pick a Date" id="input_9_pick"
							src="calendar.png" align="absmiddle" />
							<label class="form-sub-label" for="input_9_pick">
								&nbsp;&nbsp;&nbsp; </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_71"><label class="form-label-left"
					id="label_71" for="input_71"> Source of Funds<span
						class="form-required">*</span>
				</label>
					<div id="cid_71" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_71" name="q71_sourceOf">
							<option></option>
							<option value="Project Fund">Project Fund</option>
							<option value="Institute Fund">Institute Fund</option>
							<option value="PDA">PDA</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_72"><label class="form-label-left"
					id="label_72" for="input_72"> Project Name<span
						class="form-required">*</span>
				</label>
					<div id="cid_72" class="form-input">
						<input type="text" class="form-textbox validate[required]"
							id="input_72" name="q72_projectName" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_7"><label class="form-label-left"
					id="label_7" for="input_7"> Number of Items<span
						class="form-required">*</span>
				</label>
					<div id="cid_7" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_7" name="q7_numberOf">
							<option></option>
							<option selected="selected" value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li id="cid_21" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_21" class="form-header">Item Number 1</h3>
					</div>
				</li>
				<li class="form-line" id="id_20"><label class="form-label-left"
					id="label_20" for="input_20"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_20" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_20" name="q20_itemName20" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_58"><label class="form-label-left"
					id="label_58" for="input_58"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_58" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_58" name="q58_quantity">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_73"><label class="form-label-left"
					id="label_73" for="input_73"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_73" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_73"
							name="q73_costOf73" size="s20" maxlength="6" /> <label
							class="form-sub-label" for="input_73" > Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_70"><label class="form-label-left"
					id="label_70" for="input_70"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_70" class="form-input">
						<textarea id="input_70" class="form-textarea validate[required]"
							name="q70_itemDescription70" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_91"><label class="form-label-left"
					id="label_91" for="input_91"> List of Suppliers </label>
					<div id="cid_91" class="form-input">
						<textarea id="input_91" class="form-textarea" name="q91_listOf"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_44" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_44" class="form-header">Item Number 2</h3>
					</div>
				</li>
				<li class="form-line" id="id_27"><label class="form-label-left"
					id="label_27" for="input_27"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_27" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_27" name="q27_itemName27" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_57"><label class="form-label-left"
					id="label_57" for="input_57"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_57" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_57" name="q57_quantity57">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_82"><label class="form-label-left"
					id="label_82" for="input_82"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_82" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_82"
							name="q82_costOf" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_82"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_69"><label class="form-label-left"
					id="label_69" for="input_69"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_69" class="form-input">
						<textarea id="input_69" class="form-textarea validate[required]"
							name="q69_itemDescription69" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_90"><label class="form-label-left"
					id="label_90" for="input_90"> List of Suppliers </label>
					<div id="cid_90" class="form-input">
						<textarea id="input_90" class="form-textarea" name="q90_listOf90"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_47" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_47" class="form-header">Item Number 3</h3>
					</div>
				</li>
				<li class="form-line" id="id_31"><label class="form-label-left"
					id="label_31" for="input_31"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_31" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_31" name="q31_itemName31" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_22"><label class="form-label-left"
					id="label_22" for="input_22"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_22" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_22" name="q22_quantity22">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_74"><label class="form-label-left"
					id="label_74" for="input_74"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_74" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_74"
							name="q74_costOf74" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_74"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_68"><label class="form-label-left"
					id="label_68" for="input_68"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_68" class="form-input">
						<textarea id="input_68" class="form-textarea validate[required]"
							name="q68_itemDescription68" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_89"><label class="form-label-left"
					id="label_89" for="input_89"> List of Suppliers </label>
					<div id="cid_89" class="form-input">
						<textarea id="input_89" class="form-textarea" name="q89_listOf89"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_48" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_48" class="form-header">Item Number 4</h3>
					</div>
				</li>
				<li class="form-line" id="id_30"><label class="form-label-left"
					id="label_30" for="input_30"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_30" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_30" name="q30_itemName30" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_59"><label class="form-label-left"
					id="label_59" for="input_59"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_59" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_59" name="q59_quantity59">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_75"><label class="form-label-left"
					id="label_75" for="input_75"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_75" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_75"
							name="q75_costOf75" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_75"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_66"><label class="form-label-left"
					id="label_66" for="input_66"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_66" class="form-input">
						<textarea id="input_66" class="form-textarea validate[required]"
							name="q66_itemDescription66" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_88"><label class="form-label-left"
					id="label_88" for="input_88"> List of Suppliers </label>
					<div id="cid_88" class="form-input">
						<textarea id="input_88" class="form-textarea" name="q88_listOf88"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_52" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_52" class="form-header">Item Number 5</h3>
					</div>
				</li>
				<li class="form-line" id="id_29"><label class="form-label-left"
					id="label_29" for="input_29"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_29" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_29" name="q29_itemName" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_56"><label class="form-label-left"
					id="label_56" for="input_56"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_56" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_56" name="q56_quantity56">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_76"><label class="form-label-left"
					id="label_76" for="input_76"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_76" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_76"
							name="q76_costOf76" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_76"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_67"><label class="form-label-left"
					id="label_67" for="input_67"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_67" class="form-input">
						<textarea id="input_67" class="form-textarea validate[required]"
							name="q67_itemDescription67" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_87"><label class="form-label-left"
					id="label_87" for="input_87"> List of Suppliers </label>
					<div id="cid_87" class="form-input">
						<textarea id="input_87" class="form-textarea" name="q87_listOf87"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_51" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_51" class="form-header">Item Number 6</h3>
					</div>
				</li>
				<li class="form-line" id="id_28"><label class="form-label-left"
					id="label_28" for="input_28"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_28" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_28" name="q28_itemName28" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_60"><label class="form-label-left"
					id="label_60" for="input_60"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_60" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_60" name="q60_quantity60">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_77"><label class="form-label-left"
					id="label_77" for="input_77"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_77" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_77"
							name="q77_costOf77" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_77"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_65"><label class="form-label-left"
					id="label_65" for="input_65"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_65" class="form-input">
						<textarea id="input_65" class="form-textarea validate[required]"
							name="q65_itemDescription65" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_86"><label class="form-label-left"
					id="label_86" for="input_86"> List of Suppliers </label>
					<div id="cid_86" class="form-input">
						<textarea id="input_86" class="form-textarea" name="q86_listOf86"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_50" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_50" class="form-header">Item Number 7</h3>
					</div>
				</li>
				<li class="form-line" id="id_26"><label class="form-label-left"
					id="label_26" for="input_26"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_26" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_26" name="q26_itemName26" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_61"><label class="form-label-left"
					id="label_61" for="input_61"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_61" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_61" name="q61_quantity61">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_78"><label class="form-label-left"
					id="label_78" for="input_78"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_78" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_78"
							name="q78_costOf78" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_78"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_64"><label class="form-label-left"
					id="label_64" for="input_64"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_64" class="form-input">
						<textarea id="input_64" class="form-textarea validate[required]"
							name="q64_itemDescription64" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_85"><label class="form-label-left"
					id="label_85" for="input_85"> List of Suppliers </label>
					<div id="cid_85" class="form-input">
						<textarea id="input_85" class="form-textarea" name="q85_listOf85"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_49" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_49" class="form-header">Item Number 8</h3>
					</div>
				</li>
				<li class="form-line" id="id_43"><label class="form-label-left"
					id="label_43" for="input_43"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_43" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_43" name="q43_itemName43" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_55"><label class="form-label-left"
					id="label_55" for="input_55"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_55" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_55" name="q55_quantity55">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_79"><label class="form-label-left"
					id="label_79" for="input_79"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_79" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_79"
							name="q79_costOf79" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_79"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_63"><label class="form-label-left"
					id="label_63" for="input_63"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_63" class="form-input">
						<textarea id="input_63" class="form-textarea validate[required]"
							name="q63_itemDescription63" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_84"><label class="form-label-left"
					id="label_84" for="input_84"> List of Suppliers </label>
					<div id="cid_84" class="form-input">
						<textarea id="input_84" class="form-textarea" name="q84_listOf84"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_46" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_46" class="form-header">Item Number 9</h3>
					</div>
				</li>
				<li class="form-line" id="id_42"><label class="form-label-left"
					id="label_42" for="input_42"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_42" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_42" name="q42_itemName42" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_54"><label class="form-label-left"
					id="label_54" for="input_54"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_54" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_54" name="q54_quantity54">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_80"><label class="form-label-left"
					id="label_80" for="input_80"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_80" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_80"
							name="q80_costOf80" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_80"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_19"><label class="form-label-left"
					id="label_19" for="input_19"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_19" class="form-input">
						<textarea id="input_19" class="form-textarea validate[required]"
							name="q19_itemDescription" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_83"><label class="form-label-left"
					id="label_83" for="input_83"> List of Suppliers </label>
					<div id="cid_83" class="form-input">
						<textarea id="input_83" class="form-textarea" name="q83_listOf83"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_45" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_45" class="form-header">Item Number 10</h3>
					</div>
				</li>
				<li class="form-line" id="id_41"><label class="form-label-left"
					id="label_41" for="input_41"> Item Name<span class="form-required">*</span>
				</label>
					<div id="cid_41" class="form-input">
						<input type="text"
							class="form-textbox validate[required]"
							id="input_41" name="q41_itemName41" size="20" maxlength="255" />
					</div>
				</li>
				<li class="form-line" id="id_53"><label class="form-label-left"
					id="label_53" for="input_53"> Quantity<span class="form-required">*</span>
				</label>
					<div id="cid_53" class="form-input">
						<select class="form-dropdown validate[required]"
							style="width: 150px" id="input_53" name="q53_quantity53">
							<option></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</li>
				<li class="form-line" id="id_81"><label class="form-label-left"
					id="label_81" for="input_81"> Cost of 1 Unit<span
						class="form-required">*</span>
				</label>
					<div id="cid_81" class="form-input">
						<span class="form-sub-label-container"><input type="text"
							class="form-textbox validate[required, Numeric]" id="input_81"
							name="q81_costOf81" size="20" maxlength="6" /> <label
							class="form-sub-label" for="input_81"> Rs. </label> </span>
					</div>
				</li>
				<li class="form-line" id="id_62"><label class="form-label-left"
					id="label_62" for="input_62"> Item Description & Specifications<span
						class="form-required">*</span>
				</label>
					<div id="cid_62" class="form-input">
						<textarea id="input_62" class="form-textarea validate[required]"
							name="q62_itemDescription62" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_25"><label class="form-label-left"
					id="label_25" for="input_25"> List of Suppliers </label>
					<div id="cid_25" class="form-input">
						<textarea id="input_25" class="form-textarea" name="q25_listOf25"
							cols="40" rows="6"></textarea>
					</div>
				</li>
				<li id="cid_15" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_15" class="form-header">Committee Members</h3>
					</div>
				</li>
				<li class="form-line" id="id_12"><label class="form-label-left"
					id="label_12" for="input_12"> Member 1<span class="form-required">*</span>
				</label>
					<div id="cid_12" class="form-input">
						<?php 
							echo "<select class=\"form-dropdown validate[required]\" style=\"width:150px\" id=\"input_12\" name=\"q12_member1\">";
							$db_host = 'localhost:3306';
							$db_username = 'root';
							$db_password = 'mcgrath';
							$db_name = 'group4';
							mysql_connect( $db_host, $db_username, $db_password) or die(mysql_error());
							mysql_select_db($db_name);
							$query="Select count(*) from faculty";
							$sqlsearch = mysql_query($query);
							$row=mysql_fetch_row($sqlsearch);
							$query="Select F_name from faculty";
							$sqlsearch = mysql_query($query);
							echo "<option> </option>";
							for($i=1;$i<=$row[0];$i++){
								$row1=mysql_fetch_row($sqlsearch);
								echo "<option value=\"".$row1[0]."\">".$row1[0]."</option>";
							}
							echo "</select>";
							echo "</div>";
							echo "</li>";
							echo "<li class=\"form-line\" id=\"id_11\">";
							echo "<label class=\"form-label-left\" id=\"label_11\" for=\"input_11\">";
							echo "    Member 2<span class=\"form-required\">*</span>";
							echo "</label>";
							echo "<div id=\"cid_11\" class=\"form-input\">";
							echo "<select class=\"form-dropdown validate[required]\" style=\"width:150px\" id=\"input_11\" name=\"q11_member2\">";
							$query="Select F_name from faculty";
							$sqlsearch = mysql_query($query);
							echo "<option> </option>";
							for($i=1;$i<=$row[0];$i++){
								$row1=mysql_fetch_row($sqlsearch);
								echo "<option value=\"".$row1[0]."\">".$row1[0]."</option>";
							}
							echo "</select>";
							echo "</div>";
							echo "</li>";
							echo "<li class=\"form-line\" id=\"id_10\">";
							echo "<label class=\"form-label-left\" id=\"label_10\" for=\"input_10\">";
							echo "    Member 3<span class=\"form-required\">*</span>";
							echo "</label>";
							echo "<div id=\"cid_10\" class=\"form-input\">";
							echo "<select class=\"form-dropdown validate[required]\" style=\"width:150px\" id=\"input_10\" name=\"q10_member3\">";
							$query="Select F_name from faculty";
							$sqlsearch = mysql_query($query);
							echo "<option> </option>";
							for($i=1;$i<=$row[0];$i++){
								$row1=mysql_fetch_row($sqlsearch);
								echo "<option value=\"".$row1[0]."\">".$row1[0]."</option>";
							}
							?>
						</select>
					</div>
				</li>
				<li id="cid_92" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_92" class="form-header">Final Steps...</h3>
					</div>
				</li>
				<li class="form-line" id="id_8"><label class="form-label-left"
					id="label_8" for="input_8"> Item Specifications File </label>
					<div id="cid_8" class="form-input">
						<input class="form-upload" type="file" id="input_8"
							name="q8_itemSpecifications" file-accept="pdf,  docx, txt, jpeg"
							file-maxsize="5120" />
					</div>
				</li>
				<li class="form-line" id="id_93"><label class="form-label-left"
					id="label_93" for="input_93"> Description of File<span
						class="form-required">*</span>
				</label>
					<div id="cid_93" class="form-input">
						<textarea id="input_93" class="form-textarea validate[required]"
							name="q93_descriptionOf" cols="40" rows="6"></textarea>
					</div>
				</li>
				<li class="form-line" id="id_94">
					<div id="cid_94" class="form-input-wide">
						<div style="text-align: left" class="form-buttons-wrapper">
							<button id="input_reset_94" type="reset"
								class="form-submit-reset form-submit-button-light_rounded">
								Clear Form</button>
							&nbsp;
							<button id="input_print_94" style="margin-left: 25px;"
								class="form-submit-print form-submit-button-light_rounded"
								type="button">
								<img src="printer.png"
									align="absmiddle" /> Print Form
							</button>
						</div>
					</div>
				</li>
				<li id="cid_95" class="form-input-wide">
					<div class="form-header-group">
						<h3 id="header_95" class="form-header">Click below to Submit</h3>
					</div>
				</li>
				<li class="form-line" id="id_4">
					<div id="cid_4" class="form-input-wide">
						<div style="text-align: left" class="form-buttons-wrapper">
							<span id="cost_1" style="visibility: visible;">Total Cost</span>
							<input type="text" name="cost_0" value="Rs 0" readonly="readonly" style="visibility: visible;"><br></span>
							<span id="cost1" style="visibility: hidden; color: Red;">Total Cost exceeds Category Upperlimit</span>
							<button id="input_4"  type="submit" class="form-submit-button form-submit-button-light_rounded">Submit</button>
							<span id="cat" style="visibility: hidden; color: Red;">Choose the correct category<br></span>	
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</body>
</html>
<?php }?>
