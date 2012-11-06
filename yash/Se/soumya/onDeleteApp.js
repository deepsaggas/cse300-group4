function remove() 
{
	var r = confirm("Are you sure ?");
	if (r == true) 
	{
		var allRows = document.getElementById('ApprovedTable').getElementsByTagName('tr');
		var root = allRows[0].parentNode;
		var allInp = root.getElementsByTagName('input');
		var allForm = root.getElementsByTagName('span');
		var str="";
		for(var i=allInp.length-1;i>=0;i--)
		{		
			if((allInp[i].getAttribute('type')=='checkbox')&&(allInp[i].checked))
			{
				l=allForm.length;
				l=allForm[i].getAttribute('id');
				k=l.split("_");				
				str=str+k[1]+',';
				root.removeChild(allInp[i].parentNode.parentNode);
			}
		}
		deleteForms(str);
	}
}

function deleteForms(str)
{
	//update fac_fills_form var Deleted_Fac
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
			addApprovedTable(1);
		}
	};
	xmlhttp.open("GET","del.php?forms="+str+"&username="+uname,true);
	xmlhttp.send();
}