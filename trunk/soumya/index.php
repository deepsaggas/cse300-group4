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
  echo $_SESSION['token'];
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
  $img = filter_var($user['picture'], FILTER_VALIDATE_URL);
  $name = $user['name'];
  $personMarkup = "$email<div><img src='$img?sz=500'></div>$name<br/>";

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
		<title>Equip Me</title>
		<meta name="viewport" content="user-scalable=false" />
		<meta name="viewport" content = "width = device-width, initial-scale = 0.70, minimum-scale = 0.70, maximum-scale = 0.70" />
    <link rel="stylesheet" href="themes/newblack/style.css" />
    <link rel="stylesheet" href="http://www.mykindofphone.com/wp-content/themes/newblack/colorbox.css" />
    <link rel="stylesheet" href="css/zocial.css"/>
    <link rel="stylesheet" type="text/css" href="http://www.mykindofphone.com/wp-content/themes/newblack/dd.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="http://www.mykindofphone.com/wp-content/themes/newblack/js/jquery.dd.js" type="text/javascript"></script>
    <script src="http://www.mykindofphone.com/wp-content/themes/newblack/js/jquery.colorbox-min.js"></script>
    <script type="text/javascript" src="//windowsphone.ugc.bazaarvoice.com/static/7088-en_gb/bvapi.js"></script>
    <script type="text/javascript">
      $BV.configure("global", {
      submissionContainerUrl: "http://www.mykindofphone.com/submit-a-review"
      });
    </script>

    <script type="text/javascript">
var loadingPosts = false;
var replacingPosts;

$('document').ready(function(){

  $('#loadMorePosts').click(function(e) {
    if (!loadingPosts)
    {
      loadingPosts = true;
      $(this).html('Loading...');
      $('#loader').fadeIn('fast');
      replacingPosts = $('.morePosts').length > 1 ? true : false;
      query = $(this).attr('rel') ? $(this).attr('rel') : null;

      if (replacingPosts)
      {
        $('#content').css('height', $('#content').height() + 'px');
        $('.morePosts:last').fadeOut('slow', function(){
          $(this).remove();
          getMorePosts(query);
        });
      }
      else
      {
        getMorePosts(query);
      }
    }
    e.preventDefault();
  });
});

function getMorePosts(query)
{
  $.ajax({
    url: 'http://www.mykindofphone.com/ajax-post-loader',
    data: 'start='+parseInt($('#morePostsStart').html())+(query ? '&'+query : ''),
    success: function(data) {
      if (!replacingPosts)
      {
        $('#content').animate({
          height: $('#content').height() + 640 + 'px'
        }, 300, function() {
          insertPosts(data);
        });
      }
      else
      {
        insertPosts(data);
      }
      $('#loader').fadeOut('fast');
      $('#loadMorePosts').html('Load More Posts');
    }
  });
}

function insertPosts(data)
{
  $(data).hide().insertBefore('#morePostsStart').fadeIn('slow', function() {
    $('#content').css('height', 'auto');
    $('#morePostsStart').html(parseInt($('#morePostsStart').html()) + $(data).children().length);
    attachAnimations('#'+$(data).attr('id')+' .blockpost');
    loadingPosts = false;
  });
}
</script>    <script type="text/javascript">
      $('document').ready(function(){
        $('.block').live({
          'mouseenter': function(){
            var top = ($(this).hasClass('rlp')) ? '275' : '170';
            $(this).addClass('viewing').children('.wrap').stop().animate({'top':top}, 300);
          },
          'mouseleave': function(){
            var top = ($(this).hasClass('rlp')) ? '66' : '0';
            $(this).removeClass('viewing').children('.wrap').stop().animate({'top':top}, 300);
          }
        });

        $('.pretty_date').each(function(index, element){
          $(element).html(prettyDate($(element).html()));
        });

        attachAnimations('.blockpost');
      });

      function attachAnimations(selector)
      {
        $(selector).each(function(i) {
          setOffAnimation($(this), i);
        });
      }

      function setOffAnimation(block, count)
      {
        setTimeout(function() {
          setInterval(function() {
            if (block.hasClass('viewing')) return;
            var top = ($(block).hasClass('rlp')) ? '275' : '170';
            $(block).children('.wrap').stop().animate({'top':top}, 1000);
            setTimeout(function() {
              if (block.hasClass('viewing')) return;
              var top = ($(block).hasClass('rlp')) ? '66' : '0';
              $(block).children('.wrap').stop().animate({'top':top}, 1000);
            }, 5000);
          }, 15000);
        }, 5000*(count%4));
      }

      function prettyDate(date_str){
        var time_formats = [
          [120, 'a minute ago', 'a minute from now'],
          [3600, 'minutes', 60],
          [7200, 'an hour ago', 'an hour from now'],
          [86400, 'hours', 3600],
          [172800, 'a day ago', 'a day from now'],
          [604800, 'days', 86400],
          [1209600, 'a week ago', 'a week from now'],
          [2419200, 'weeks', 604800],
          [4838400, 'a month ago', 'a month from now'],
          [29030400, 'months', 2419200],
          [58060800, 'a year ago', 'a year from now'],
          [2903040000, 'years', 29030400]
        ];

        var seconds = (new Date - new Date(date_str)) / 1000;
        var token = 'ago', list_choice = 1;
        if (seconds < 0) {
          seconds = Math.abs(seconds);
          token = 'from now';
          list_choice = 2;
        }
        var i = 0, format;
        while (format = time_formats[i++]){
          if (seconds < format[0]) {
            if (typeof format[2] == 'string'){
              return format[list_choice];
            }
            else{
              return Math.floor(seconds / format[2]) + ' ' + format[1] + ' ' + token;
            }
          }
        }
      }

    </script>
    <script type="text/javascript">
      window.___gcfg = {lang: 'en-GB'};

      (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/plusone.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
      })();
    </script>

<!--    <link rel='stylesheet' id='myStyleSheets-css'  href='http://www.mykindofphone.com/wp-content/plugins/uservoice-idea-list-widget/uv_styles.css?ver=3.3.2' type='text/css' media='all' />-->
<script type='text/javascript'>
/* <![CDATA[ */
var SHRSB_Globals = {"src":"http:\/\/www.mykindofphone.com\/wp-content\/uploads\/shareaholic\/spritegen","perfoption":"1","twitter_template":"%24%7Btitle%7D+-+%24%7Bshort_link%7D+via+%40Shareaholic","locale":"0","shortener":"tinyurl","shortener_key":"","pubGaSocial":"0","pubGaKey":""};
/* ]]> */
</script>
<script type='text/javascript' src='http://www.mykindofphone.com/wp-content/uploads/shareaholic/spritegen/jquery.shareaholic-publishers-sb.min.js?ver=5.0.0.4'></script>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://www.mykindofphone.com/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://www.mykindofphone.com/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress 3.3.2" />

<!-- platinum seo pack 1.3.7 -->
<meta name="robots" content="index,follow,noodp,noydir" />
<meta name="description" content="Welcome to the official blog of Windows Phone UK. Find all the information on latest news, apps, games & technology right here along with customer reviews." />
<meta name="keywords" content="apps,education" />
<link rel="canonical" href="http://www.mykindofphone.com/" />
<!-- /platinum one seo pack -->


<!-- Start SHR Open Graph Tags -->

	<!-- Shareaholic Notice: There is no featured image set -->

<!-- END SHR Open Graph Tags -->

<link type="text/css" rel="stylesheet" href="http://www.mykindofphone.com/wp-content/plugins/simple-pull-quote/css/simple-pull-quote.css" />

</head>
<body>
<header><h1>Equip Me... Coming Soon</h1></header>
<?php if(isset($personMarkup)): ?>
<?php print $personMarkup ?>
<?php endif ?>
<?php
  if(isset($authUrl)) {
    //print "<a class='login' href='$authUrl'>Connect Me!</a>";
	//print "<a class='login' href='https://accounts.google.com/o/oauth2/auth?response_type=code&redirect_uri=http%3A%2F%2Fequipme.com%2Fexamples%2Fuserinfo%2Findex.php&client_id=733055834812.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+https%3A%2F%2Fwww.google.com%2Fcalendar%2Ffeeds%2F&access_type=offline&approval_prompt=force'>Connect Me!</a>";
	header('Location: http://equipme.com/index.html');
  } else {
   print "<a class='logout' href='?logout'>Logout</a>";
  }
?>
</body></html>