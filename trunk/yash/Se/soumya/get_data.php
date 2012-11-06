<?php

/*if(isset($_GET['code'])) {
    // try to get an access token
    $code = $_GET['code'];
    $url = 'https://accounts.google.com/o/oauth2/code';
    $params = array(
        "code" => $code,
        "client_id" => "733055834812.apps.googleusercontent.com",
        "client_secret" => "OzxdpQ7hWSeLfGvQJmmREpu3",
        "redirect_uri" => "http://equipme.com/Dashboard.php",
        "grant_type" => "authorization_code"
    );
 
    $request = new HttpRequest($url, HttpRequest::METH_POST);
    $request->setPostFields($params);
    $request->send();
    $responseObj = json_decode($request->getResponseBody());
    echo "Access token: " . $responseObj->access_token;
}*/ 

/*if(isset($_GET["code"])) {
$url = "https://accounts.google.com/o/oauth2/token";
$data = array(
	"code" => $_GET["code"], 
	"client_id" => "733055834812.apps.googleusercontent.com", 
	"client_secret" => "OzxdpQ7hWSeLfGvQJmmREpu3", 
	"redirect_uri" => "http://equipme.com/Dashboard.php", 
	"grant_type" => "authorization_code"
);
$query = http_build_query ($data);
$contextData = array ( 
				'method'  => 'POST /o/oauth2/token HTTP/1.1',
                'header'  => 'Host: accounts.google.com\r\n'.
                            'Content-Type: application/x-www-form-urlencoded',
                'content' => $query
				);
                //"method" => "POST",
                //"header" => "Connection: close\r\n".
                            //"Content-Length: ".strlen($query)."\r\n",
                //"content" => $query );
//$options = array('http' => array('method'  => 'POST','content' => http_build_query($data)));

//$context  = stream_context_create($options);
$context = stream_context_create (array ( "https" => $contextData ));
$result = file_get_contents($url, false, $context);
}*/
//var_dump($result);
?>
<html>
  <head>
  <script>
  	// First, parse the query string
var params = {}, queryString = location.hash.substring(1),
    regex = /([^&=]+)=([^&]*)/g, m;
while (m = regex.exec(queryString)) {
  params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
}

// And send the token over to the server
var req = new XMLHttpRequest();
// consider using POST so query isn't logged
req.open('GET', 'http://' + window.location.host + '/catchtoken.php?' + queryString, true);

req.onreadystatechange = function (e) {
  if (req.readyState == 4) {
     if(req.status == 200){
       window.location = params['state']
   }
  else if(req.status == 400) {
        alert('There was an error processing the token.')
    }
    else {
      alert('something else other than 200 was returned')
    }
  }
};
req.send(null);
  </script>
  </head>
  <body>
  <p>kjsdhfsdfsdf</p>
  </body>

</html>