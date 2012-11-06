<?php
define('KEY', '733055834812.apps.googleusercontent.com');
define('SECRET', 'OzxdpQ7hWSeLfGvQJmmREpu3');

define('CALLBACK_URL', 'http://equipme.com/login_test/complete.php');
define('AUTHORIZATION_ENDPOINT', 'https://accounts.google.com/o/oauth2/auth');
define('ACCESS_TOKEN_ENDPOINT', 'https://accounts.google.com/o/oauth2/token');

/***************************************************************************
 * Function: Run CURL
 * Description: Executes a CURL request
 * Parameters: url (string) - URL to make request to
 *             method (string) - HTTP transfer method
 *             headers - HTTP transfer headers
 *             postvals - post values
 **************************************************************************/
function run_curl($code, $method = 'GET', $postvals = null){
    $ch = curl_init('https://accounts.google.com/o/oauth2/token');
    
    //GET request: send headers and return data transfer
    if ($method == 'GET'){
        $options = array(
            CURLOPT_URL => 'https://accounts.google.com/o/oauth2/token',
            CURLOPT_RETURNTRANSFER => 1
        );
        curl_setopt_array($ch, $options);
    //POST / PUT request: send post object and return data transfer
    } else {
		$body= 'grant_type=authorization_code&';
		$body = $body.'client_id=733055834812.apps.googleusercontent.com&';
		$body = $body.'client_secret=OzxdpQ7hWSeLfGvQJmmREpu3&';
		$body = $body.'code=';
		$body = $body.$code;
		$body = $body.'&';
		$body = $body.'redirect_uri=http%3A%2F%2Fequipme.com%2FDashboard.php';
        $options = array(
            CURLOPT_URL => 'https://accounts.google.com/o/oauth2/token',
            CURLOPT_POST => 1,
            CURLOPT_POSTFIELDS => $postvals,
            CURLOPT_RETURNTRANSFER => 1
        );
        //curl_setopt_array($ch, $options);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt ($ch, CURLOPT_POSTFIELDS, $body);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
    }
    
    $response = curl_exec($ch);
    curl_close($ch);
    return $response;
}

/***************************************************************************
 * Function: Refresh Access Token
 * Description: Refreshes an expired access token
 * Parameters: key (string) - application consumer key
 *             secret (string) - application consumer secret
 *             refresh_token (string) - refresh_token parameter passed in
 *                to fetch access token request.
 **************************************************************************/
function refreshToken($refresh_token){
    //construct POST object required for refresh token fetch
    $postvals = array('grant_type' => 'refresh_token',
                      'client_id' => KEY,
                      'client_secret' => SECRET,
                      'refresh_token' => $refresh_token);
    
    //return JSON refreshed access token object
    return json_decode(run_curl(ACCESS_TOKEN_ENDPOINT, 'POST', $postvals));
}
?>
