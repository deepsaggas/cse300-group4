function baseProfile()
{
	var xmlhttp;
	var uname=document.getElementById("username").innerHTML;
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
			document.getElementById("reqCount").innerHTML=xmlhttp.responseText ;	
		}
	};
	xmlhttp.open("GET","pro.php?username="+uname ,true)
	xmlhttp.send();
}

function mainProfile(str)
{
	var xmlhttp;
	var uname=document.getElementById("username").innerHTML;
	if(str!='Admin')
		baseProfile();
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
			document.getElementById("mainPro").innerHTML=xmlhttp.responseText ;	
		}
	};
	xmlhttp.open("GET","profile1.php?username="+uname ,true)
	xmlhttp.send();
}