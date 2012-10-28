<?php
/*
 * Copyright 2011 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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

if (isset($_SESSION['token'])) {
 $client->setAccessToken($_SESSION['token']);
}

if (isset($_REQUEST['logout'])) {
  unset($_SESSION['token']);
  $client->revokeToken();
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
} else {
  $authUrl = $client->createAuthUrl();
}
?>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<!--Dashboard.php head-->

<title>Dashboard: Equip ME</title>
	
	<link rel="stylesheet" href="css/layout.css" type="text/css" media="screen" />
	<!--[if lt IE 9]>
	<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
	<script src="js/hideshow.js" type="text/javascript"></script>
	<script src="js/jquery.tablesorter.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
    <script src="http://max.jotfor.ms/min/g=feedback2" type="text/javascript">
	new JotformFeedback({
	formId:'22643568634460',
	base:'http://jotform.me/',
	windowTitle:'Equipment Purchase',
	background:'#FFA500',
	fontColor:'#FFFFFF',
	type:1,
	height:550,
	width:800
	});
	</script>
	<script type="text/javascript">
	$(document).ready(function() 
    	{ 
      	  $(".tablesorter").tablesorter(); 
   	 } 
	);
	$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
    </script>
    <script type="text/javascript">
    $(function(){
        $('.column').equalHeight();
    });
</script>

</head>
<body>
<!--<header><h1>Equip Me... Coming Soon</h1></header>-->
<?php //if(isset($personMarkup)): ?>
<?php //print $personMarkup ?>
<?php //endif ?>
<?php
  if(isset($authUrl)) {
    //print "<a class='login' href='$authUrl'>Connect Me!</a>";
	//print "<a class='login' href='https://accounts.google.com/o/oauth2/auth?response_type=code&redirect_uri=http%3A%2F%2Fequipme.com%2Fexamples%2Fuserinfo%2Findex.php&client_id=733055834812.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+https%3A%2F%2Fwww.google.com%2Fcalendar%2Ffeeds%2F&access_type=offline&approval_prompt=force'>Connect Me!</a>";
	header('Location: http://equipme.com/index.html');
  } else {
   //print "<a class='logout' href='?logout'>Logout</a>";
   //header('Location: http://equipme.com/Dashboard.php?session='.$_SESSION['token']); ?>

  <!--Dashboard.php--> 
  <header id="header">
		<hgroup>
			<h1 class="site_title">FACULTY</h1>
			<h2 class="section_title">Dashboard</h2><div class="btn_view_site"></div>
		</hgroup>
	</header> <!-- end of header bar -->
	
	<section id="secondary_bar">
		<div class="user">
			<p><?php echo $name?> (<a href="#">3 Notifications</a>)</p>
			<!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs"><a href="index.html">Faculty</a> 
			  <div class="breadcrumb_divider"></div> <a class="current">Dashboard</a></article>
		</div>
	</section><!-- end of secondary bar -->
	
	<aside id="sidebar" class="column">
		<form class="quick_search">
			<input type="text" value="Quick Search" onFocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr/>
		<h3>Content</h3>
		<ul class="toggle">
        <li class="icn_tags"><a href="Dashboard.html">DashBoard</a></li>
			<li class="icn_new_article"><!--<a id="overlay" href="equip_purchase.htm">New Request</a>--><a class="lightbox-22643568634460" style="cursor:pointer;color:#666;">New Request</a></li>
			<li class="icn_edit_article"><a href="Archive.html">Request Archive</a></li>
			
			<li class="icn_tags"><a href="Notifications.html">Notifications</a></li>
		</ul>
		<h3>Tools</h3>
		<ul class="toggle">
			<li class="icn_add_user"><a href="Request Tracker.html">Request Tracker</a></li>
			
		</ul>
		<h3>Request status</h3>
		<ul class="toggle">
			<li class="icn_folder"><a href="Approved.html">Approved</a></li>
			<li class="icn_photo"><a href="#">Rejected</a></li>
			<li class="icn_audio"><a href="#">OnGoing</a></li>
			<li class="icn_video"><a href="#">Drafts</a></li>
		</ul>
		<h3>AdminISTRATION</h3>
		<ul class="toggle">
			<li class="icn_settings"><a href="Profile.html">Profile</a></li>
			<li class="icn_jump_back"><a href="/index.php?logout">Logout</a></li>
		</ul>
		
		<footer>
			<hr />
		</footer>
	</aside><!-- end of sidebar -->
	
	<section id="main" class="column">
	  <h4 class="alert_info">Welcome to Equip-Me</h4>
		
		<article class="module width_full">
			<header>
		  <h3>Request Tracker</h3></header>
			<div class="module_content">
				
			    <iframe src="http://www.google.com/calendar/embed?src=iiitd.ac.in_kqg028ahavmmem7ol6sqi4jgkc%40group.calendar.google.com&ctz=Asia/Calcutta" style="border: 0" width="700" height="240" frameborder="0" scrolling="no"></iframe>
				
				<div class="clear"></div>
			</div>
		</article><!-- end of stats article -->
		
		<article class="module width_3_quarter">
		<header>
		<h3 class="tabs_involved">Request Manager</h3>
		<ul class="tabs">
   			<li><a href="#tab1">Status</a></li>
    		<li><a href="#tab2">  Date</a></li>
		</ul>
		</header>

		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th></th> 
    				<th>Entry Name</th> 
    				<th></th> 
    				<th>Created On</th> 
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Seagate 500 Gb Hard Disk</td> 
    				<td>Approved</td> 
    				<td>7th April 2012</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>HP Mini Series , 1 GB Ram, 1.7 GHz Atom Processor</td> 
    				<td>Rejected</td> 
    				<td>9th April 2012</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>HP Laser Desk Printer</td> 
    				<td>OnGoing</td> 
    				<td>16th April 2012</td> 
   				 	<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr>
                 <tr> 
   					<td><input type="checkbox"></td> 
    				<td>Sony Mini Series Laptop</td> 
    				<td>Pending</td> 
    				<td>17th April 2012</td> 
   				 	<td><a href="Ongoing - Director.html"><input type="image" src="images/icn_alert_success.png" title="Approve"></a><input type="image" src="images/icn_alert_error.png" title="Reject"></td> 
				</tr>
				
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->
			
			<div id="tab2" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th></th> 
    				<th>Entry Name</th> 
    				<th>Category</th> 
    				<th> Created On</th> 
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>HP Laser Desk Printer</td> 
    				<td>OnGoing</td> 
    				<td>16th April 2012</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Seagate 500 Gb Hard Disk</td> 
    				<td>Approved</td> 
    				<td>7th April 2011</td> 
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Dell XPS, 2GB Ram, i7 3rd Generation</td> 
    				<td>Approved</td> 
    				<td>6th April 2011</td> 
   				 	<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				 <tr> 
   					<td><input type="checkbox"></td> 
    				<td>Sony Mini Series Laptop/td> 
    				<td>Pending</td> 
    				<td>17th April 2012</td> 
   				 	<td><a href="Ongoing - Director.html"><input type="image" src="images/icn_alert_success.png" title="Approve"></a><input type="image" src="images/icn_alert_error.png" title="Reject"></td> 
				</tr>
			</tbody> 
			</table>

			</div><!-- end of #tab2 -->
			
		</div><!-- end of .tab_container -->
        
		
		</article><!-- end of content manager article --><!-- end of messages article -->
		
	  <div class="clear"></div><!-- end of post new article --><!-- end of styles article -->
	  <div class="spacer"></div>
	</section>
  
  <?php }
?>


</body></html>