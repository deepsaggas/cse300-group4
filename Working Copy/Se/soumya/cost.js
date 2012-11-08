function validate()
{	var quanti=0;
	var value=0;
	var total=0;
	var ulimit=0;
	var llimit=0;
	var num=0;
	
	if(document.getElementById("input_5").value==""){
		document.getElementById("label_5").innerHTML = 'This field is required';
		return false;
	}
	if(document.getElementById("input_71").value=="")	
		document.getElementById("input_71").innerHTML = 'This field is required';
	else if(document.getElementById("input_72").value=="Project Fund" && document.getElementById("input_72").value==""){
		document.getElementById("input_72").innerHTML = 'This field is required';
	}	
	if(document.getElementById("input_7").value==""){
		document.getElementById("input_7").innerHTML = 'This field is required';

	if(document.form_22643568634460.q5_category.value=="Rs 0 - Rs 50,000")
	{	llimit=0;
		ulimit=50000;
	}
	else
	{	llimit=50000;
		ulimit=150000;
	}
	if(document.form_22643568634460.q73_costOf73.value!="" && document.form_22643568634460.q58_quantity.value!="")
	{	quanti=parseInt(document.form_22643568634460.q58_quantity.value,10);
		value=parseInt(document.form_22643568634460.q73_costOf73.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q82_costOf.value!="" && document.form_22643568634460.q57_quantity57.value!="")
	{	quanti=parseInt(document.form_22643568634460.q57_quantity57.value,10);
		value=parseInt(document.form_22643568634460.q82_costOf.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q74_costOf74.value!="" && document.form_22643568634460.q22_quantity22.value!="")
	{	quanti=parseInt(document.form_22643568634460.q22_quantity22.value,10);
		value=parseInt(document.form_22643568634460.q74_costOf74.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q75_costOf75.value!="" && document.form_22643568634460.q59_quantity59.value!="")
	{	quanti=parseInt(document.form_22643568634460.q59_quantity59.value,10);
		value=parseInt(document.form_22643568634460.q75_costOf75.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q76_costOf76.value!="" && document.form_22643568634460.q56_quantity56.value!="")
	{	quanti=parseInt(document.form_22643568634460.q56_quantity56.value,10);
		value=parseInt(document.form_22643568634460.q76_costOf76.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q77_costOf77.value!="" && document.form_22643568634460.q60_quantity60.value!="")
	{	quanti=parseInt(document.form_22643568634460.q60_quantity60.value,10);
		value=parseInt(document.form_22643568634460.q77_costOf77.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q78_costOf78.value!="" && document.form_22643568634460.q61_quantity61.value!="")
	{	quanti=parseInt(document.form_22643568634460.q61_quantity61.value,10);
		value=parseInt(document.form_22643568634460.q78_costOf78.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q79_costOf79.value!="" && document.form_22643568634460.q55_quantity55.value!="")
	{	quanti=parseInt(document.form_22643568634460.q55_quantity55.value,10);
		value=parseInt(document.form_22643568634460.q79_costOf79.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q80_costOf80.value!="" && document.form_22643568634460.q54_quantity54.value!="")
	{	quanti=parseInt(document.form_22643568634460.q54_quantity54.value,10);
		value=parseInt(document.form_22643568634460.q80_costOf80.value,10);
		total+=value*quanti;
		num++;
	}
	if(document.form_22643568634460.q81_costOf81.value!="" && document.form_22643568634460.q53_quantity53.value!="")
	{	quanti=parseInt(document.form_22643568634460.q53_quantity53.value,10);
		value=parseInt(document.form_22643568634460.q81_costOf81.value,10);
		total+=value*quanti;
		num++;
	}
	var str1="Rs ";
	var str3=str1.concat(total);
	if(total>ulimit)
	{	document.getElementById("cost1").style.visibility = 'visible';
		document.form_22643568634460.cost_0.style.backgroundColor = "#FFCCCC";
		document.form_22643568634460.cost_0.value=str3;
		document.getElementById("input_4").style.visibility = 'hidden';
		return false;
	}
	else
	{	document.getElementById("cost1").style.visibility = 'hidden';
		document.form_22643568634460.cost_0.style.backgroundColor = "#FFFFFF";
		document.form_22643568634460.cost_0.value=str3;
		document.getElementById("input_4").style.visibility = 'visible';
	}
	if(total<=llimit && num == parseInt(document.form_22643568634460.q7_numberOf.value,10) && document.form_22643568634460.q5_category.value!="")
	{	document.getElementById("cat").style.visibility = 'visible';
		document.form_22643568634460.q5_category.style.backgroundColor = "#FFCCCC";
		document.getElementById("input_4").style.visibility = 'hidden';
	}
	else
	{	document.getElementById("cat").style.visibility = 'hidden';
		document.form_22643568634460.q5_category.style.backgroundColor = "#FFFFFF";
		document.getElementById("input_4").style.visibility = 'visible';
	}		
}
