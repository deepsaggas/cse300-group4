inc=0;
function chPageNo(str)
{
	num=parseInt(document.getElementById("pageNo").innerHTML);
	inc=parseInt(str);
	pg=num+inc;
	if(!(num==1 && inc==-1))
	{
		addApprovedTable(pg);
	}
}
function addApprovedTable(pg)
{
	var xmlhttp;
	var uname=document.getElementById("username").innerHTML;
	var utype=document.getElementById("utype").innerHTML;
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
				document.getElementById("ApprovedTable").innerHTML=text;
				l=document.getElementById("pageNo");
				l.innerHTML=parseInt(l.innerHTML)+inc;
			}
		}
	};
	if(utype=='Faculty')
	{
		if(document.getElementById("viewTab").innerHTML=='Approved')
			xmlhttp.open("GET","appf.php?pg="+pg+"&username="+uname,true);
		else if(document.getElementById("viewTab").innerHTML=='Rejected')
			xmlhttp.open("GET","rejf.php?pg="+pg+"&username="+uname,true);
		else if(document.getElementById("viewTab").innerHTML=='Ongoing')
			xmlhttp.open("GET","ongf.php?pg="+pg+"&username="+uname,true);
	}
	else if(utype=='Admin')
		{
		if(document.getElementById("viewTab").innerHTML=='Approved')
			xmlhttp.open("GET","appa.php?pg="+pg+"&username="+uname,true);
		else if(document.getElementById("viewTab").innerHTML=='Rejected')
			xmlhttp.open("GET","reja.php?pg="+pg+"&username="+uname,true);
		else if(document.getElementById("viewTab").innerHTML=='Ongoing')
			xmlhttp.open("GET","onga.php?pg="+pg+"&username="+uname,true);
		}
	xmlhttp.send();
}