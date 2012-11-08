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
	
	$con = mysql_connect('localhost', 'root', '');
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
	header("Location: http://192.168.1.20:8084/Se/soumya/index.php?logout");
	}
	
?>

<!DOCTYPE html>
<!-- saved from url=(0050)http://www.formstack.com/forms/?1322982-EphiOiwsQw -->

<html lang="en" class=" fsjs fsflexbox fsno-touch fsgeolocation fsdraganddrop fsrgba fsbackgroundsize fsborderimage fsborderradius fsboxshadow fstextshadow fsopacity fscsscolumns fscssgradients fsfontface fsvideo fsaudio fslocalstorage fssessionstorage fsapplicationcache"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Equipment Purchase - Formstack</title>

            <link rel="icon" type="image/x-icon" href="http://www.formstack.com/forms/?1322982-EphiOiwsQw#"> 
        <link rel="shortcut icon" type="image/x-icon" href="http://www.formstack.com/forms/?1322982-EphiOiwsQw#">
    
    <!--[if IE]>
        <link rel="stylesheet" type="text/css" media="all" href="http://www.formstack.com/forms/css/3/ie.css" />
    <![endif]-->
        <!--[if IE 7]><link rel="stylesheet" type="text/css" media="all" href="http://www.formstack.com/forms/css/3/ie7.css" /><![endif]-->
    <!--[if IE 6]><link rel="stylesheet" type="text/css" media="all" href="http://www.formstack.com/forms/css/3/ie6fixes.css" /><![endif]-->
    
    <link rel="stylesheet" type="text/css" href="./Equipment Purchase - Formstack_files/reset.css">
    <link rel="stylesheet" type="text/css" href="./Equipment Purchase - Formstack_files/default.css">
    <link rel="stylesheet" type="text/css" href="./Equipment Purchase - Formstack_files/order.css">    
    
        <style type="text/css">
        
        </style>
    
    <style type="text/css"></style></head>
<body id="fsLocal" class="fsBody   ">

      
    
        
        


<noscript>&lt;h4 class="warningNoJS"&gt;&lt;strong&gt;ERROR:&lt;/strong&gt;JavaScript is not enabled. You must enable JavaScript in your browser to use this form&lt;/h4&gt;</noscript>


<form method="post" novalidate="" enctype="multipart/form-data" action="http://192.168.1.20:8084/Se/soumya/en.php?fac_id=<?php echo $flag; ?>" class="fsForm  fsSingleColumn fsMaxCol1" id="fsForm1322982">

    <input type="hidden" name="form" value="1322982">
    <input type="hidden" name="viewkey" value="EphiOiwsQw">
        <input type="hidden" name="password" value="">
    <input type="hidden" name="hidden_fields" id="hidden_fields1322982" value="">
    <input type="hidden" name="fspublicsession" id="session_id1322982" value="">
    <input type="hidden" name="incomplete" id="incomplete1322982" value="">
    <input type="hidden" name="incomplete_email" id="incomplete_email1322982" value="">
    <input type="hidden" name="referrer" id="referrer1322982" value="">
    <input type="hidden" name="referrer_type" id="referrer_type1322982" value="link">
    <input type="hidden" name="_submit" value="1">
    <input type="hidden" name="style_version" value="3">

    <input type="hidden" name="latitude" value="">
    <input type="hidden" name="longitude" value="">
    
        
    

<div role="alert" id="requiredFieldsError" style="display:none;">Please fill in a valid value for all required fields</div>
<div role="alert" id="resumeConfirm" style="display:none;">Are you sure you want to leave this form and resume later?</div>
<div role="alert" id="fileTypeAlert" style="display:none;">You must upload one of the following file types for the selected field:</div>
<div role="alert" id="embedError" style="display:none;">There was an error displaying the form. Please copy and paste the embed code again.</div>
<div role="alert" id="applyDiscountButton" style="display:none;">Apply Discount</div>
<div role="alert" id="dcmYouSaved" style="display:none;">You saved</div>
<div role="alert" id="dcmWithCode" style="display:none;">with code</div>
<div role="alert" id="submitButtonText" style="display:none;">Submit</div>
<div role="alert" id="submittingText" style="display:none;">Submitting</div>

<div class="fsPage" id="fsPage1322982-1">

        
                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col" id="fsSection17466504">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Equipment Purchase</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-2" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466132">
                
                                    <label id="label17466132" class="fsLabel fsRequiredLabel" for="field17466132">Category<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17466132" name="field17466132" size="1" required="" class="fsField fsRequired" aria-required="true">

        <option value="Rs 0 - Rs 50,000">Rs 0 - Rs 50,000</option>
        <option value="Rs 50,000 - Rs 1,50,000">Rs 50,000 - Rs 1,50,000</option>

</select>                
                                                                                        <div class="fsSupporting">
                                Category for the request based on total amount
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-3" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
                                                
                <div id="fsRow1322982-4" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466345">
                
                                    <label id="label17466345" class="fsLabel fsRequiredLabel" for="field17466345">Source of Funds<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17466345" name="field17466345" size="1" required="" class="fsField fsRequired" aria-required="true">

        <option value="Project Fund">Project Fund</option>
        <option value="Institute Fund">Institute Fund</option>
        <option value="PDA">PDA</option>

</select>                
                                                                                        <div class="fsSupporting">
                                Source of funds for the project
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-5" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical" id="fsCell17466399">
                
                                    <label id="label17466399" class="fsLabel fsRequiredLabel" for="field17466399">Project Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17466399" name="field17466399" size="50" required="" maxlength="50" value="" class="fsField fsRequired " aria-required="true">

                
                                                                                        <div class="fsSupporting">
                                Project from which the purchase is being funded
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-6" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466421">
                
                                    <label id="label17466421" class="fsLabel fsRequiredLabel" for="field17466421">Number of Items<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17466421" name="field17466421" size="1" required="" class="fsField fsRequired" aria-required="true">

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
                                                                                        <div class="fsSupporting">
                                Number of items to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col" id="fsSection17466474">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 1</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-8" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466424">
                
                                    <label id="label17466424" class="fsLabel fsRequiredLabel" for="field17466424">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17466424" name="field17466424" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-9" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466966">
                
                                    <label id="label17466966" class="fsLabel fsRequiredLabel" for="field17466966">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17466966" name="field17466966" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-10" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466425">
                
                                    <label id="label17466425" class="fsLabel fsRequiredLabel" for="field17466425">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17466425" name="field17466425" size="1" required="" class="fsField fsRequired" aria-required="true">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-11" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466844">
                
                                    <label id="label17466844" class="fsLabel fsRequiredLabel" for="field17466844">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17466844" name="field17466844" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true"></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-12" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466975">
                
                                    <label id="label17466975" class="fsLabel" for="field17466975">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17466975" name="field17466975" rows="5" cols="50" class="fsField  "></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17466980">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 2</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-14" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466992">
                
                                    <label id="label17466992" class="fsLabel fsRequiredLabel" for="field17466992">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17466992" name="field17466992" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-15" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466982">
                
                                    <label id="label17466982" class="fsLabel fsRequiredLabel" for="field17466982">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17466982" name="field17466982" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-16" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466983">
                
                                    <label id="label17466983" class="fsLabel fsRequiredLabel" for="field17466983">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17466983" name="field17466983" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-17" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466984">
                
                                    <label id="label17466984" class="fsLabel fsRequiredLabel" for="field17466984">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17466984" name="field17466984" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-18" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466985">
                
                                    <label id="label17466985" class="fsLabel" for="field17466985">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17466985" name="field17466985" rows="5" cols="50" class="fsField  " disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17466986">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 3</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-20" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466987">
                
                                    <label id="label17466987" class="fsLabel fsRequiredLabel" for="field17466987">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17466987" name="field17466987" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-21" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466988">
                
                                    <label id="label17466988" class="fsLabel fsRequiredLabel" for="field17466988">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17466988" name="field17466988" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-22" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466989">
                
                                    <label id="label17466989" class="fsLabel fsRequiredLabel" for="field17466989">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17466989" name="field17466989" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-23" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466990">
                
                                    <label id="label17466990" class="fsLabel fsRequiredLabel" for="field17466990">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17466990" name="field17466990" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-24" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17466991">
                
                                    <label id="label17466991" class="fsLabel" for="field17466991">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17466991" name="field17466991" rows="5" cols="50" class="fsField  " disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467057">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 4</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-26" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467058">
                
                                    <label id="label17467058" class="fsLabel fsRequiredLabel" for="field17467058">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467058" name="field17467058" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-27" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467059">
                
                                    <label id="label17467059" class="fsLabel fsRequiredLabel" for="field17467059">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467059" name="field17467059" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-28" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467060">
                
                                    <label id="label17467060" class="fsLabel fsRequiredLabel" for="field17467060">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467060" name="field17467060" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-29" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467061">
                
                                    <label id="label17467061" class="fsLabel fsRequiredLabel" for="field17467061">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467061" name="field17467061" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-30" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467062">
                
                                    <label id="label17467062" class="fsLabel" for="field17467062">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467062" name="field17467062" rows="5" cols="50" class="fsField  " disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467051">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 5</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-32" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467052">
                
                                    <label id="label17467052" class="fsLabel fsRequiredLabel" for="field17467052">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467052" name="field17467052" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-33" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467053">
                
                                    <label id="label17467053" class="fsLabel fsRequiredLabel" for="field17467053">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467053" name="field17467053" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-34" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467054">
                
                                    <label id="label17467054" class="fsLabel fsRequiredLabel" for="field17467054">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467054" name="field17467054" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-35" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467055">
                
                                    <label id="label17467055" class="fsLabel fsRequiredLabel" for="field17467055">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467055" name="field17467055" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-36" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467056">
                
                                    <label id="label17467056" class="fsLabel" for="field17467056">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467056" name="field17467056" rows="5" cols="50" class="fsField  " disabled=""></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467045">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 6</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-38" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467046">
                
                                    <label id="label17467046" class="fsLabel fsRequiredLabel" for="field17467046">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467046" name="field17467046" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="disabled">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-39" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467047">
                
                                    <label id="label17467047" class="fsLabel fsRequiredLabel" for="field17467047">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467047" name="field17467047" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="disabled">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-40" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467048">
                
                                    <label id="label17467048" class="fsLabel fsRequiredLabel" for="field17467048">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467048" name="field17467048" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-41" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467049">
                
                                    <label id="label17467049" class="fsLabel fsRequiredLabel" for="field17467049">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467049" name="field17467049" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-42" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467050">
                
                                    <label id="label17467050" class="fsLabel" for="field17467050">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467050" name="field17467050" rows="5" cols="50" class="fsField  " disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467016">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 7</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-44" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467017">
                
                                    <label id="label17467017" class="fsLabel fsRequiredLabel" for="field17467017">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467017" name="field17467017" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="disabled">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-45" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467018">
                
                                    <label id="label17467018" class="fsLabel fsRequiredLabel" for="field17467018">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467018" name="field17467018" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="disabled">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-46" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467019">
                
                                    <label id="label17467019" class="fsLabel fsRequiredLabel" for="field17467019">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467019" name="field17467019" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-47" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467020">
                
                                    <label id="label17467020" class="fsLabel fsRequiredLabel" for="field17467020">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467020" name="field17467020" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-48" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467021">
                
                                    <label id="label17467021" class="fsLabel" for="field17467021">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467021" name="field17467021" rows="5" cols="50" class="fsField  " disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467009">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 8</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-50" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467010">
                
                                    <label id="label17467010" class="fsLabel fsRequiredLabel" for="field17467010">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467010" name="field17467010" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="disabled">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-51" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467011">
                
                                    <label id="label17467011" class="fsLabel fsRequiredLabel" for="field17467011">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467011" name="field17467011" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="disabled">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-52" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467012">
                
                                    <label id="label17467012" class="fsLabel fsRequiredLabel" for="field17467012">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467012" name="field17467012" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-53" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467013">
                
                                    <label id="label17467013" class="fsLabel fsRequiredLabel" for="field17467013">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467013" name="field17467013" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-54" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467014">
                
                                    <label id="label17467014" class="fsLabel" for="field17467014">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467014" name="field17467014" rows="5" cols="50" class="fsField  " disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467002">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 9</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-56" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467003">
                
                                    <label id="label17467003" class="fsLabel fsRequiredLabel" for="field17467003">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467003" name="field17467003" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="disabled">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-57" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467004">
                
                                    <label id="label17467004" class="fsLabel fsRequiredLabel" for="field17467004">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467004" name="field17467004" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="disabled">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-58" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467005">
                
                                    <label id="label17467005" class="fsLabel fsRequiredLabel" for="field17467005">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467005" name="field17467005" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-59" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467006">
                
                                    <label id="label17467006" class="fsLabel fsRequiredLabel" for="field17467006">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467006" name="field17467006" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-60" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467007">
                
                                    <label id="label17467007" class="fsLabel" for="field17467007">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467007" name="field17467007" rows="5" cols="50" class="fsField  " disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467064">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Item Number 10</h2>
        
            <div class="fsSectionText"><p>﻿</p></div>
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-62" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467065">
                
                                    <label id="label17467065" class="fsLabel fsRequiredLabel" for="field17467065">Item Name<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <input type="text" id="field17467065" name="field17467065" size="50" required="" maxlength="100" value="" class="fsField fsRequired " aria-required="true" disabled="disabled">

                
                                                                                        <div class="fsSupporting">
                                Name of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-63" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467066">
                
                                    <label id="label17467066" class="fsLabel fsRequiredLabel" for="field17467066">Cost of 1 Unit<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17467066" name="field17467066" size="6" required="" value="" class="fsField fsFormatNumber fsNumberMin-1  fsNumberDecimals-0 fsRequired" min="1" aria-required="true" disabled="disabled">
    
                
                                                                                        <div class="fsSupporting">
                                Cost of a single unit of the item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-64" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467067">
                
                                    <label id="label17467067" class="fsLabel fsRequiredLabel" for="field17467067">Quantity<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467067" name="field17467067" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

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
                                                                                        <div class="fsSupporting">
                                Quantity to be purchased
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-65" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467068">
                
                                    <label id="label17467068" class="fsLabel fsRequiredLabel" for="field17467068">Item Description &amp; Specifications<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <textarea id="field17467068" name="field17467068" rows="5" cols="50" required="" class="fsField fsRequired " aria-required="true" disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                Technical specifications and details of item
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-66" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467069">
                
                                    <label id="label17467069" class="fsLabel" for="field17467069">List of Suppliers                                            </label>
                                
                                                   
                <textarea id="field17467069" name="field17467069" rows="5" cols="50" class="fsField  " disabled="disabled"></textarea>                
                                                                                        <div class="fsSupporting">
                                List of suggested suppliers
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col fsHidden" id="fsSection17467842">           

                                                    
                                                    
            <div class="fsSectionHeader">
            <h2 class="fsSectionHeading">Committee Members</h2>
        
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-68" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467871">
                
                                    <label id="label17467871" class="fsLabel fsRequiredLabel" for="field17467871">Committee Member 1<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467871" name="field17467871" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

				<?php 
							$db_host = 'localhost:3306';
							$db_username = 'root';
							$db_password = '';
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
							?>
						

</select>                
                                                                                        <div class="fsSupporting">
                                Name of the first Committee Member
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-69" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467876">
                
                                    <label id="label17467876" class="fsLabel fsRequiredLabel" for="field17467876">Committee Member 2<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467876" name="field17467876" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

        <?php 
							$db_host = 'localhost:3306';
							$db_username = 'root';
							$db_password = '';
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
							?>

</select>                
                                                                                        <div class="fsSupporting">
                                Name of the second Committee Member
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-70" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467877">
                
                                    <label id="label17467877" class="fsLabel fsRequiredLabel" for="field17467877">Committee Member 3<span class="fsRequiredMarker">*</span>                                            </label>
                                
                                                   
                <select id="field17467877" name="field17467877" size="1" required="" class="fsField fsRequired" aria-required="true" disabled="disabled">

        <?php 
							$db_host = 'localhost:3306';
							$db_username = 'root';
							$db_password = '';
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
							?>
</select>                
                                                                                        <div class="fsSupporting">
                                Name of the third Committee Member
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                                                
                </div>
                
                                                
                        
                                                    
                                                    
             
            
            <div class="fsSection fs1Col" id="fsSection17467379">           

                                                    
                                                    
            <div class="fsSectionHeader">
        
    </div>
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-72" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell  fsFirst fsLast fsLabelVertical " id="fsCell17467292">
                
                                    <label id="label17467292" class="fsLabel" for="field17467292">Item Specifications file                                            </label>
                                
                                                   
                        <input type="file" id="field17467292" name="field17467292" size="30" class="fsField fsUpload uploadTypes-jpg,jpeg,gif,png,bmp,pdf,doc,docx,xls,xlsx,txt,mp3,mp4,aac,wav,au,wmv,avi,mpg,mpeg,zip,rar ">
    <div class="showMobile">File uploads may not work on some mobile devices.</div>   
                    
                                                                                        <div class="fsSupporting">
                                Upload a single file containing product specifications and other details. Acceptable formats are :- jpg,jpeg,gif,png,bmp,pdf,doc,docx,xls,xlsx,txt,mp3,mp4,aac,wav,au,wmv,avi,mpg,mpeg,zip,rar
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-73" class="fsRow fsFieldRow fsLastRow fsHidden">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell fsReadOnly fsFirst fsLast fsLabelVertical fsHidden" id="fsCell17468040">
                
                                    <label id="label17468040" class="fsLabel" for="field17468040">Total Cost                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17468040" name="field17468040" size="5" value="" readonly="readonly" class="fsField fsFormatNumber fsNumberMin-50001 fsNumberMax-150000 fsNumberDecimals-0 " min="50001" max="150000" disabled="disabled">
    
                
                                                                                        <div class="fsSupporting">
                                Total Cost of purchase in Rupees
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
            
                
                        
                        
                                                    
                                                    
                        
                                                
                <div id="fsRow1322982-74" class="fsRow fsFieldRow fsLastRow">

                        
                                                    
                        
                        
                        
                                                                
            <div class="fsRowBody fsCell fsFieldCell fsReadOnly fsFirst fsLast fsLabelVertical fsValidationError" id="fsCell17468086">
                
                                    <label id="label17468086" class="fsLabel" for="field17468086">Total Cost                                            </label>
                                
                                                   
                
    
    <input type="number" id="field17468086" name="field17468086" size="5" value="" readonly="readonly" class="fsField fsFormatNumber fsNumberMin-1 fsNumberMax-50000 fsNumberDecimals-0 " min="1" max="50000">
    
                
                                                                                        <div class="fsSupporting">
                                Total Cost of purchase in Rupees
                            </div>
                                                                            
                
                
            </div>
            
                            
                </div>
                        
        
    

            
    </div>
    
        
</div>

        
<div id="fsSubmit1322982" class="fsSubmit fsPagination">

         
    <button type="button" id="fsPreviousButton1322982" class="fsPreviousButton" value="Previous Page" style="display:none; color:#000000;background-image:-moz-linear-gradient(center top, 808080, );-webkit-linear-gradient(center top, 808080, );padding:6px 45px;border:0px;font-weight:bold;border-radius:50px;-moz-border-radius:50px;-webkit-border-radius:50px;"><span class="fsFull">« Previous</span><span class="fsSlim">←</span></button> 
    <button type="button" id="fsNextButton1322982" class="fsNextButton" value="Next Page" style="display: none; color: rgb(0, 0, 0); padding: 6px 45px; border: 0px; font-weight: bold; border-top-left-radius: 50px; border-top-right-radius: 50px; border-bottom-right-radius: 50px; border-bottom-left-radius: 50px;"><span class="fsFull">Next »</span><span class="fsSlim">→</span></button>

            <input id="fsSubmitButton1322982" class="fsSubmitButton nice" style="color: rgb(0, 0, 0); padding: 6px 45px; border: 0px; font-weight: bold; border-top-left-radius: 50px; border-top-right-radius: 50px; border-bottom-right-radius: 50px; border-bottom-left-radius: 50px;" type="submit" value="Submit">   
        

        

        
    <div class="clear"></div>
    
</div>

            <script type="text/javascript" src="./Equipment Purchase - Formstack_files/jquery.min.js"></script>
            <link href="./Equipment Purchase - Formstack_files/jquery-ui.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./Equipment Purchase - Formstack_files/jquery-ui.min.js"></script>
    
    <script type="text/javascript" src="./Equipment Purchase - Formstack_files/scripts.js"></script>

    
    

    <script type="text/javascript">
        
        if(window.addEventListener) {
            window.addEventListener('load', loadFormstack, false);
        } else if(window.attachEvent) {
            window.attachEvent('onload', loadFormstack);
        } else {
            loadFormstack();
        }
        
        
        function loadFormstack() {
            var form1322982 = new Formstack.Form(1322982);
            
            
                        form1322982.checks.push({target: '17466399', action: 'Show', bool: 'AND', fields: ['17466345'],checks: [{field: '17466345', condition: '==', option: 'Project Fund'}]});
                        form1322982.checks.push({target: '17466980', action: 'Hide', bool: 'AND', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '1'}]});
                        form1322982.checks.push({target: '17466986', action: 'Hide', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '1'},{field: '17466421', condition: '==', option: '2'}]});
                        form1322982.checks.push({target: '17467057', action: 'Hide', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '1'},{field: '17466421', condition: '==', option: '2'},{field: '17466421', condition: '==', option: '3'}]});
                        form1322982.checks.push({target: '17467051', action: 'Hide', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '1'},{field: '17466421', condition: '==', option: '2'},{field: '17466421', condition: '==', option: '3'},{field: '17466421', condition: '==', option: '4'}]});
                        form1322982.checks.push({target: '17467045', action: 'Show', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '6'},{field: '17466421', condition: '==', option: '7'},{field: '17466421', condition: '==', option: '8'},{field: '17466421', condition: '==', option: '9'},{field: '17466421', condition: '==', option: '10'}]});
                        form1322982.checks.push({target: '17467016', action: 'Show', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '7'},{field: '17466421', condition: '==', option: '8'},{field: '17466421', condition: '==', option: '9'},{field: '17466421', condition: '==', option: '10'}]});
                        form1322982.checks.push({target: '17467009', action: 'Show', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '8'},{field: '17466421', condition: '==', option: '9'},{field: '17466421', condition: '==', option: '10'}]});
                        form1322982.checks.push({target: '17467002', action: 'Show', bool: 'OR', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '9'},{field: '17466421', condition: '==', option: '10'}]});
                        form1322982.checks.push({target: '17467064', action: 'Show', bool: 'AND', fields: ['17466421'],checks: [{field: '17466421', condition: '==', option: '10'}]});
                        form1322982.checks.push({target: '17467842', action: 'Show', bool: 'AND', fields: ['17466132'],checks: [{field: '17466132', condition: '==', option: 'Rs 50,000 - Rs 1,50,000'}]});
                        form1322982.checks.push({target: '17468040', action: 'Show', bool: 'AND', fields: ['17466132'],checks: [{field: '17466132', condition: '==', option: 'Rs 50,000 - Rs 1,50,000'}]});
                        form1322982.checks.push({target: '17468086', action: 'Show', bool: 'AND', fields: ['17466132'],checks: [{field: '17466132', condition: '==', option: 'Rs 0 - Rs 50,000'}]});
                        

            form1322982.logicFields = ['17466132','17466421','17466345'];
            
                        form1322982.calculations.push({target: '17468040', equation: '( [17467067] * [17467066] ) + ( [17467005] * [17467004] ) + ( [17467012] * [17467011] ) + ( [17467019] * [17467018] ) + ( [17467048] * [17467047] ) + ( [17466966] * [17466425] ) + ( [17466982] * [17466983] ) + ( [17466988] * [17466989] ) + ( [17467059] * [17467060] ) + ( [17467053] * [17467054] )', fields: ['17467067','17467066','17467005','17467004','17467012','17467011','17467019','17467018','17467048','17467047','17466966','17466425','17466982','17466983','17466988','17466989','17467059','17467060','17467053','17467054']});
                        form1322982.calculations.push({target: '17468086', equation: '( [17467067] * [17467066] ) + ( [17467005] * [17467004] ) + ( [17467012] * [17467011] ) + ( [17467019] * [17467018] ) + ( [17467048] * [17467047] ) + ( [17466966] * [17466425] ) + ( [17466982] * [17466983] ) + ( [17466988] * [17466989] ) + ( [17467059] * [17467060] ) + ( [17467053] * [17467054] )', fields: ['17467067','17467066','17467005','17467004','17467012','17467011','17467019','17467018','17467048','17467047','17466966','17466425','17466982','17466983','17466988','17466989','17467059','17467060','17467053','17467054']});
            
            form1322982.calcFields = ['17467067','17467066','17467005','17467004','17467012','17467011','17467019','17467018','17467048','17467047','17466966','17466425','17466982','17466983','17466988','17466989','17467059','17467060','17467053','17467054'];

            form1322982.init();

            
            
            window.form1322982 = form1322982;
        };
    </script>    
    
    <div style="clear:both"></div>

</form>

    <script type="text/javascript" src="./Equipment Purchase - Formstack_files/modernizr.js"></script>


    
    
    
    
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>
<?php /*}*/?>