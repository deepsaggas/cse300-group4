// JavaScript Document
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
				document.getElementById("akshay").innerHTML=text;	
				}
				
		}
	};
	xmlhttp.open("GET","index.php" ,true);
	xmlhttp.send();
}