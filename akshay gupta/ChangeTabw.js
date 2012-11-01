function Change(str)
{
	document.title = str+": Equip ME";
	var utype=document.getElementById("utype").innerHTML;
	
	temp="<article class='module width_3_quarter'>" +
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
			"</tr>";
			}
	}
	document.getElementById("tableHead").innerHTML=tHead;
	addApprovedTable(1);

}
