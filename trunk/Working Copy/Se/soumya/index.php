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
    <script src="kuchbhi.js" type="text/javascript"></script>
    <script src="NewRequest.js" type="text/javascript"></script>    
	<script src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="bannerRotate.js" type="text/javascript"></script>
	<script src="js/hideshow.js" type="text/javascript"></script>
	<script src="js/jquery.tablesorter.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
	<script src="createProfile.js"></script>
	<script type="text/javascript" src="../lib/jquery-1.8.2.min.js"></script>

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="../lib/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="../source/jquery.fancybox.js?v=2.1.3"></script>
	<link rel="stylesheet" type="text/css" href="../source/jquery.fancybox.css?v=2.1.2" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="../source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="../source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="../source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="../source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="../source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

	<script type="text/javascript">
		$(document).ready(function() {
	$(".various").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: true,
		width		: '70%',
		height		: '90%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
});
	</script>
	<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
	</style>
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
<script src='ChangeTab.js'></script>
<script src='chPageNo.js'></script>
<script src='appRej.js' type="text/javascript"></script>
<script src='onDeleteApp.js'></script>

<!--Dashboard head-->

</head>
<body onLoad="chTab()">
<!--<header><h1>Equip Me... Coming Soon</h1></header>-->
<?php //if(isset($personMarkup)): ?>
<?php //print $personMarkup ?>
<?php //endif ?>
<?php
if(isset($authUrl)) {
	//print "<a class='login' href='$authUrl'>Connect Me!</a>";
	//print "<a class='login' href='https://accounts.google.com/o/oauth2/auth?response_type=code&redirect_uri=http%3A%2F%2Fequipme.com%2Fexamples%2Fuserinfo%2Findex.php&client_id=733055834812.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+https%3A%2F%2Fwww.google.com%2Fcalendar%2Ffeeds%2F&access_type=offline&approval_prompt=force'>Connect Me!</a>";
	header('Location: http://localhost/Se/soumya/index.html');
} else { 
	
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
		$flag = 1;//Faculty
	}
	$sql="Select u_id from admin,authentication where a_id = u_id and u_name='".$email."'";
	$result = mysql_query($sql);	
	if($row = mysql_fetch_array($result))
	{			
		$flag = 2;//Admin
	}	
	
	mysql_close($con);
	
	//print "<a class='logout' href='?logout'>Logout</a>";
	//header('Location: http://equipme.com/Dashboard.php?session='.$_SESSION['token']); 
	if(isset($_GET['error']))
		header('Location: http://localhost/Se/soumya/index.php?logout');
	if($flag == 0)
	{
		header("Location: http://localhost/Se/soumya/index.php?logout");
	}
	?>

  <!--Dashboard.php--> 
  
  <a id='bug'>bugger</a>
  <a id='bug3'>qwertyuio</a>
	<header id="header">
		<hgroup>
			<h1 class="site_title" id='utype1'></h1>
			<h2 class="section_title" id="SectionTitle">Dashboard</h2><div class="btn_view_site"></div>
		</hgroup>
	</header> <!-- end of header bar -->
	
	<section id="secondary_bar">
		<div class="user">
			<p><a id="username"><?php echo $name; ?></a> (<a onClick="Change('Notifications')" href="#">Notifications</a>)</p>
			<!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs"><a href="index.php" id='utype'></a> 
			  <div class="breadcrumb_divider"></div> <a class="current" id='viewTab'>Dashboard</a></article>
		</div>
	</section><!-- end of secondary bar -->	
	<aside id="sidebar" class="column">
		<!--form class="quick_search">
			<input type="text" value="Quick Search" onFocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form-->
		<hr/>
		<h3>Navigator</h3>
		<ul class="toggle">
        <li class="icn_tags" onClick="Change('Dashboard')"><a href="#">DashBoard</a></li>
			
			
					<?php
if($flag==1)
{
			echo "<li class='icn_folder' onClick=\"Change('Notifications')\"><a href='#'>Notifications</a></li>";
			
}
?>
	
		  <!--<li class="icn_add_user"><a href="Request Tracker.html">Request Tracker</a></li>-->
	  </ul>
		<h3>Request Menu</h3>
		<ul class="toggle">
		<?php
if($flag==1)
{
	echo "<li class='icn_folder'><a class=\"various\" data-fancybox-type=\"iframe\" href=\"form.php\">New Request</a></li>";
	//<a class="various" data-fancybox-type="iframe" href="/demo/iframe.html">Iframe</a>
}
?>
			<li class="icn_folder" onClick="Change('Approved')"><a href="#">Approved</a></li>
			<li class="icn_photo" onClick="Change('Rejected')"><a href="#">Rejected</a></li>
			<li class="icn_audio" onClick="Change('Ongoing')"><a href="#">Ongoing</a></li>
	  </ul>
		<h3>ADMINISTRATION</h3>
		<ul class="toggle">
			<li class="icn_settings" onClick="Change('Profile')"><a href="#">Profile</a></li>
			<li class="icn_jump_back"><a href="/Se/soumya/index.php?logout">Logout</a></li>
		</ul>
		
		<footer>
			<hr />
		</footer>
	</aside><!-- end of sidebar -->
	
	<section id="main" class="column">
	  <h4 class="alert_info">Welcome to Equip-Me</h4>
		
		
		
	  <div class="clear"></div><!-- end of post new article --><!-- end of styles article -->
	  <div class="spacer"></div>
	</section>
  
  <!--Dashboard.php-->
  
  <?php }
  ?>


</body></html>