

function request()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			text=xmlhttp.responseText;
			if((text).length!=0)
				{
				document.getElementById("aish").innerHTML=text;
				document.getElementById("aish1").innerHTML=text;
				
				}
				
		}
	};
	xmlhttp.open("GET","Request_manager.php" ,true);
	xmlhttp.send();
}