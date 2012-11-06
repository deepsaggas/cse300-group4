<?php
require_once "common.php";

//construct Facebook auth URI
$auth_url = AUTHORIZATION_ENDPOINT
          . "?redirect_uri=" . CALLBACK_URL
          . "&client_id=" . KEY
          . "&scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email+https://www.google.com/calendar/feeds/"
          . "&response_type=code";

//forward user to Facebook auth page
header("Location: $auth_url");
?>