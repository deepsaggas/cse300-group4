<?php

session_start();
if (isset($_SESSION['username']))
{
$uname=$_SESSION['username'];
//$sql="select * from table1 where ....";
//mysql_query($sql); not imp

?>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8"/>
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

	<header id="header">
		<hgroup>
			<h1 class="site_title">FACULTY</h1>
			<h2 class="section_title">Dashboard</h2><div class="btn_view_site"></div>
		</hgroup>
	</header> <!-- end of header bar -->
	
	<section id="secondary_bar">
		<div class="user">
			<p><?php echo $uname; ?><!--<a href="#">3 Notifications</a>)</p>-->
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
			<li class="icn_jump_back"><a href="Login.html">Logout</a></li>
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
		<h3 class="tabs_involved" id = Request Manager>Request Manager</h3>
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
   					<td><input type="checkbox" id="hello"></td> 
					
					<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				
				<tr> 
   					<td><input type="checkbox"></td>  
    				<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
  				 	<td><input type="image" src="images/icn_edit.png" title="Edit"><input type="image" src="images/icn_trash.png" title="Trash"></td> 
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
				
			</tbody> 
			</table>

			</div><!-- end of #tab2 -->
			
		</div><!-- end of .tab_container -->
        
		
		</article><!-- end of content manager article --><!-- end of messages article -->
		
	  <div class="clear"></div><!-- end of post new article --><!-- end of styles article -->
	  <div class="spacer"></div>
	</section>


</body>

</html>
<?php
}
else
{
header("LOCATION:login.html");
}
?>