function reject(form_id) {  
var r = confirm("Reject the form ?");

var pg ;
 if(r==true){

pg=prompt("Please enter the reason of rejection","Funds not Sufficient");
	 location.reload(true);
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
    document.getElementById("bug").innerHTML=xmlhttp.responseText;
	

    }
  }



			xmlhttp.open("GET","Admreject.php?pg="+pg+"&form_id="+form_id,true);



xmlhttp.send();

	
 }
}



function rej(form_id) {  

var r = confirm("Accept the form ?");
 if(r==true){
     

 var xmlhttp; 
	 location.reload(true);


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
    document.getElementById("bug1").innerHTML=text;
    }
  }
xmlhttp.open("GET","Admapprove.php?form_id="+form_id,true);

xmlhttp.send();

	
 }
}