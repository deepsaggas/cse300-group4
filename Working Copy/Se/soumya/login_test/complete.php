<?php
require_once "common.php";

//capture code from auth
$code = $_GET["code"];

//construct POST object for access token fetch request
$postvals = array('grant_type' => 'authorization_code',
                  'client_id' => KEY,
                  'client_secret' => SECRET,
                  'code' => $code,
                  'redirect_uri' => 'http://equipme.com/Dashboard.php');//'http%3A%2F%2Fequipme.com%2FDashboard.php');

//get JSON access token object (with refresh_token parameter)
//$token = json_decode(run_curl(ACCESS_TOKEN_ENDPOINT, 'POST', $postvals));
$token = json_decode(run_curl($code, 'POST', $postvals));
echo "kuhkj".$token;

var_dump($token);

//set request headers for signed OAuth request
$headers = array("Accept: application/json");

//construct URI to fetch contact information for current user
//$contact_url = "https://www.google.com/m8/feeds/contacts/default/full?oauth_token=" . $token->access_token;

//fetch profile of current user
//$contacts = run_curl($contact_url, 'GET', $headers);

//var_dump($contacts);

echo "<h1>REFRESHING TOKEN</h1>";
var_dump(refreshToken($token->refresh_token));
?>
<!--<html>
<FORM action="https://accounts.google.com/o/oauth2/token" method="post">

<input type = "hidden" name = "code" value = "<?php echo $_GET["code"]; ?>">    

<input type = "hidden" name = "client_id" value = "733055834812.apps.googleusercontent.com">

<input type = "hidden" name = "client_secret" value = "OzxdpQ7hWSeLfGvQJmmREpu3">  

<input type = "hidden" name = "redirect_uri" value = "http%3A%2F%2Fequipme.com%2FDashboard.php">       

<input type = "hidden" name = "grant_type" value = "authorization_code">    

<INPUT type="submit" value="Send"> 

</FORM>
</html>-->