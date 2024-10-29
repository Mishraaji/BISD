<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

<title>Dispatch</title>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
   <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
   
  
<body onload="printDiv('addressP')">
  
<script type="text/javascript">

$( document ).ready(function() {
		
	
		
	
		
		
		jQuery.validator.setDefaults({
		  debug: true,
		  success: "valid" ,
		  submitHandler: function(form) {
    	form.submit();
 	 }
		});
		var form = $( "#dispatch" );
		form.validate({
        
    
    	rules: {
    		docketNo: "required"	
    	
  		  			
    	},
        messages: {
        	docketNo: "Please enter docket number."
        	
    }});
});


function printDiv(divID) {
	
	$('#buttons').hide();
	$('#header').hide();
	$('#headerLine').hide();
	$('#message').hide();
	$('title').hide();
	
    //Get the HTML of div
    var divElements = document.getElementById(divID).innerHTML;
    //Get the HTML of whole page
    var oldPage = document.body.innerHTML;
    
    
        //Reset the page's HTML with div's HTML only
    document.body.innerHTML = 
      "<html><head><title></title></head><body><br/><br/><br/><br/>" + 
      divElements + "</body>";
     
    //Print Page
    window.print();
	window.close();
    //Restore orignal HTML
   // $('#buttons').show();
	//$('#header').show();
	//$('#headerLine').show();
    //document.body.innerHTML = oldPage;

  
}


</script>  
  


<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				
				<td width="75%" valign="top">
				
					
						<s:set value="opetation" var="opetation" scope="session"></s:set>
						
						<p class="lead" >
						<div class="row" id="addressP">
								<div class="col-sm-4 col-md-4 col-lg-4" ><br><br><br><br><br><br>
								<s:if test="%{#session.CCCODES==4}">
								<strong>From : -</strong><br>
								Mercantile Marine Department<br>
								IWAI Bhawan, 3rd Floor, A-13<br>
								Sector-01, Noida - 201301<br>
								Tel No: 022-22697972<br>
								</s:if>
								<!-- ------------------------------------ -->
								<s:if test="%{#session.CCCODES==1}">
								<strong>From : -</strong><br>
								Government Shipping Office<br>
								Nau Bhavan, 10 R.K. Marg<br>
								Mumbai-400 001<br>
								Tel No: 022-22697971-72<br>
								Fax No: 022-22693053<br>
								</s:if>
								<!-- ------------------------------------ -->
								<s:if test="%{#session.CCCODE==2}">
								<strong>From : -</strong><br>
								Government Shipping Office<br>
							    'Marine House'(1st Floor)<br>
								Napier Rd,Hastings<br>
								Kolkata-700022<br>
								Tel No: 2223-0517/0527<br>
								Fax No: 223-0108<br>
								</s:if>
								<!-- ------------------------------------ -->
								<s:if test="%{#session.CCCODE==3}">
								<strong>From : -</strong><br>
								Government Shipping Office<br>
								3rd Floor, Anchorgate Building<br>
								Rajai Salai,Chennai-600 001<br>
								Tel No: 044-25255552<br>
								</s:if>
								</div>
								<!-- ------------------------------------ -->
						<div class="col-sm-1 col-md-1 col-lg-1" >
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						|<br>
						
						</div>
						
								<div class="col-sm-7 col-md-7 col-lg-7" >
							<strong>	To,</strong><br>
							<strong>	<s:property value="%{#session.CARD.lastName}"/> <s:property value="%{#session.CARD.firstName}"/> 
								<s:property value="%{#session.CARD.midleName}"/> </strong><br>
								House No: <s:property value="%{#session.ADDRESS.houseNo}"/> ,<br>
								Street  : <s:property value="%{#session.ADDRESS.street}"/> ,<br>
								Village : <s:property value="%{#session.ADDRESS.village}"/> ,<br>
								District: <s:property value="%{#session.ADDRESS.district}"/> ,<br>
								State   : <s:property value="%{#session.ADDRESS.state}"/> ,<br>
								Pincode : <s:property value="%{#session.ADDRESS.pinCode}"/>,<br>
								Tel     : <s:property value="%{#session.ADDRESS.phoneNo}"/> ,<br>
							    Email   : <s:property value="%{#session.ADDRESS.email}"/><br>
								</div>					
						</div>
								<br/>
								<br/>
						
						
						<s:hidden name="applicationId" value="%{#session.CARD.applicationId}"></s:hidden>
						
						
					
						
				</td>
			</tr>
		</table>
				
	</div>
</div>


<script src="/js/foundation.min.js"></script>
<script>
      	$(document).foundation();
</script>
	
</body>

</html>




