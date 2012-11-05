function Change(str)
{
	document.title = str+": Equip ME";
	var utype=document.getElementById("utype").innerHTML;
	document.getElementById("SectionTitle").innerHTML=str;
	document.getElementById("viewTab").innerHTML=str;
	if(str=='Profile')
	{
		temp="<h4 class='alert_info'>"+str+"</h4>"+		
		"<div class='module_content'>"+
		"<div class='clear' id='mainPro'>"+ 
		"</div><br>"+
		"<header><h3>Statistics:-</h3>"+		
		"</header>"+
		"<div class='clear' id='reqCount'>"+ 
		"</div>"+
		"</div>";
		document.getElementById('main').innerHTML=temp;
		mainProfile('utype');
	}
	else
	{
		temp="<h4 class='alert_info'>"+str+" Requests</h4>" +
		"<article class='module width_3_quarter'>" +
		"<table >	" +
		"<tr>	" +
		"<td><input type='submit' name='DeleteRecords' value='Delete' onClick='remove()'/>" +
		"</td>" +
		"<td>" +
		"<input type='button' id='nextpageno' name='page' value='<' onClick='chPageNo(-1)'> " +
		"<span id='pageNo'>1</span> " +
		"<input type='button' id='prevpageno' name='page' value='>' onClick='chPageNo('1')'></td>" +
		"</tr>" +
		"</table>" +
		"<div class='tab_container'>" +
		"<table class='tablesorter' cellspacing='0'>" +
		"<thead id='tableHead'>" +
		"</thead>"+
		"<tbody id='ApprovedTable'>"+            
		"</tbody>"+
		"</table>"+
		"</div>"+
		"</article>"+
		"<div class='clear'></div>"+
		"<div class='spacer'></div>" +      
		"</section>";

		document.getElementById("main").innerHTML=temp;
		var tHead="";
		if(utype=='Faculty')
		{
			if(str=='Approved')
			{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+          
				"<th>Updated On</th>"+
				"<th></th>"+
				"</tr>";
			}
			else if(str=='Rejected')
			{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+          
				"<th>Rejected By</th>"+
				"<th>Reason</th>"+
				"<th>Updated On</th>"+
				"<th></th>"+

				"</tr>";
			}
			else if(str=='Ongoing')
			{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+          
				"<th>Pending With</th>"+
				"<th>Updated On</th>"+
				"<th></th>"+

				"</tr>";
			}
			else if(str=='Dashboard')
			{
				tHead= "<tr>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+  
				"<th>Status</th>"+
				"<th>Updated On</th>"+
				"<th></th>"+
				"</tr>";
			}
			else if(str=='Notifications')
				{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Message</th>"+
				"<th></th>"+
				"</tr>";
				}
		}
		else
		{
			if(str=='Approved')
			{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+  
				"<th>Request By</th>"+        
				"<th>Updated On</th>"+
				"<th></th>"+

				"</tr>";
			}
			else if(str=='Rejected')
			{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+ 
				"<th>Request By</th>"+
				"<th>Reason</th>"+
				"<th>Rejected By</th>"+			
				"<th>Updated On</th>"+
				"<th></th>"+

				"</tr>";
			}
			else if(str=='Ongoing')
			{
				tHead= "<tr>"+
				"<th></th>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+  
				"<th>Request By</th>"+
				"<th>Pending With</th>"+
				"<th>Updated On</th>"+
				"<th></th>"+

				"</tr>";
			}
			else if(str=='Dashboard')
			{
				tHead= "<tr>"+
				"<th>Form Id</th>"+
				"<th>Items</th>"+  
				"<th>Request By</th>"+
				"<th>Updated On</th>"+
				"<th>Task</th>"+
				"<th>Approve/Reject</th>"+
				"<th></th>"+
				"</tr>";
			}
		}
		document.getElementById("tableHead").innerHTML=tHead;
		addApprovedTable(1);
		document.getElementById("bug").innerHTML="yuvi";
	}


}

function chTab(str)
{
	var uname=document.getElementById("username").innerHTML;
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
		var text=xmlhttp.responseText;

		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			setUtype(text);
			Change('Dashboard');
		}
	};
	xmlhttp.open("GET","userWho.php?username="+uname,true);
	xmlhttp.send();
}

function setUtype(text)
{
	if(text=='Faculty')
	{
		document.getElementById("utype1").innerHTML='FACULTY';
		document.getElementById("utype").innerHTML=text;
	}
	else
	{
		document.getElementById("utype1").innerHTML='ADMIN';
		document.getElementById("utype").innerHTML=text;	
	}

}