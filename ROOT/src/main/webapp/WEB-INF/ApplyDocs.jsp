<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
  	<link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" media="screen" />
  	
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    
    <style type="text/css">
    .label {
    	font-size: 18px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
<sx:head />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Declaration</title>

<s:head/>

<script type="text/javascript">
$( document ).ready(function() {
		
	
		
		
		jQuery.validator.addMethod("exactlength", function(value, element, param) {
		 return this.optional(element) || value.length == param;
		}, jQuery.validator.format("Please enter exactly {0} characters."));
		
		jQuery.validator.setDefaults({
		  debug: true,
		  success: "valid" ,
		  submitHandler: function(form) {
    	form.submit();
 	 }
		});
		var form = $( "#declaration" );
		form.validate({
        
    
    	rules: {
    		
    		
    		verified : "required"
    		
    	
  		  			
    	},
        messages: {
        	verified : "You must accept the declaration"
        	
    }});
});
</script>
</head>
 <script language="javascript" type="text/javascript">  
      
    function doSubmit()  
    {  
    window.open("SeafarerDashBoard.jsp");  
    }  
    </script> 
<body>
<s:actionerror />



<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
<s:a action="Welcome2JSP"><div class="secondary tiny button">  Home</div></s:a><s:a action="logout.action" ><div class="secondary tiny button" style="float:right">Logout</div></s:a>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">

<div class="small12 columns" style="text-align: center;">
<div style="position:absolute; top:0px; width:100%;">
					<s:if test="%{#session.ERROR_MESSAGE!=null}">
						<div data-alert class="alert-box warning radius" >
							<s:property value="#session.ERROR_MESSAGE"/>
							 <a href="#" class="close">&times;</a>
						</div>
						<s:set value="session.ERROR_MESSAGE" scope="session" var="ERROR_MESSAGE"> </s:set>
					</s:if>
					
					<s:if test="%{#session.SUCCESS_MESSAGE!=null}">
						<div  data-alert class="alert-box info radius">
							<s:property value="#session.SUCCESS_MESSAGE"/>
							 <a href="#" class="close">&times;</a>
						</div>
						<s:set value="session.SUCCESS_MESSAGE" scope="session" var="SUCCESS_MESSAGE"> </s:set>
					</s:if>
			
</div>
<div class="customHeader1" >
	<a href=# class=" tinny disabled button">INDOS and CDC Details  </a> 
	<a href=# class=" tinny disabled button"> Personal Details </a>
	<a href=# class=" tinny disabled button"> Dispatch Address </a>
	<a href=# class=" tinny disabled button"> Other Details </a>
	<a href=# class=" tinny  button">Declaration</a> 
</div>
<s:form action="/ApplyNewSubmit.action" method="post" enctype="multipart/form-data" name="declaration" id="declaration"
		style="width:100%;text-align:left; " validate="true" class="panel callout radius" theme="simple">
		
		

<!--<s:label for="MEDCER" value="MEDICAL CERTIFICATE:"/>
   <s:file name="attachment" required="true"/>

		

<s:label for="PAASOPORT" value="PAASOPORT:"/>
   <s:file name="attachment" required="true"/>
 </span>
	
			 

<s:label for="INDOS" value="INDOS:"/>
   <s:file name="attachment" required="true"/>
</span>
		
			 

<s:label for="10THCERT" value="10TH CERTIFICATE:"/>
   <s:file name="attachment" required="true"/>

		
			 

<s:label for="SEAFAREREXPERIENCE" value="SEA SERVICE EXPERIENCE:"/>
   <s:file name="attachment" required="true" />
style="width:100%;"
		 

<s:label for="PROFESSIONALEXPERIENCE" value="PROFESSIONAL EXPERIENCE:"/>
   <s:file name="attachment" required="true"/>

-->
<table width="100%">
	<%-- <tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">  15. Attachments
	
			</div>
		</td>

	</tr>	

	<tr>
		<td>Passport</td>
		<td colspan="3"><s:file  name="passportDoc" label="Passport"> </s:file></td>
		
	</tr>
	<tr>
		<td>CDC Certificate</td>
		<td colspan="3"><s:file  name="inDos" label="INDOS Certificate"> </s:file></td>
		
	</tr>
	<tr>
		<td>Letter of indent from employer</td>
		<td colspan="3"><s:file  name="srviceExp" label="Experiance Certificate"> </s:file> </td>
		
		
	</tr> --%>
	<tr>
		<td colspan="4">
			<div style="color :#008cba; font-size:18px; text-align:center;">   Declaration /  घोषणा
	
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			
	
			
			<p align="justify">
					१. मैं एटदद्वारा यह घोषणा करता हूँ कि इस आवेदन के सभी विवरण मेरी जानकारी और विश्वास मे सही और पूर्ण है तथा इसमे कुछ भी छुपाया / विरूपित नही किया गया है|
			
			</p>
			
			<p align="justify">1. I hereby declare that all the statements made in this application are true and complete to the best of my knowledge and belief and nothing
			has been concealed/distorted. 
			</p><p align="justify">२. मैं यह अभिपुली देता है और घोषणा करता हू कि मुझे इसके पहले समुद्रकर्मी पहचान प्रलेख (एस आइ डी ) जारी नही किया गया है और मैने भारत के किसी अन्य . शिपिंग मास्टर को एस आइ डी हेतु आवेदन प्रस्तुत नही किया है|
			</p>
			<p align="justify">
			2.  I also affirm and declare that I have not previously been issued with a Seafarer's Identity Document (SID) and I have not submitted an 
			application for SID to any other Shipping Master in India.</p>
			<p align="justify">३. मैं यह जनता हू की यदि किसी समय, मैं किसी महत्वपूर्ण जानकारी को छुपाते / विरूपित करते पाया गया तथा शिपिंग मास्टर के पास यह विश्वास करने का कारण हो की मैने असत्य या ग़लत जानकारी देकर एस आइ डी प्राप्त किया है, तो मेरा एस आइ डी यथसंशोधित वाणिज्य पोत परिवहन (बायोमेट्रिक समुद्रकर्मी पहचान आलेख) नियम, २०१४ के अंतर्गत प्रावधानो के अनुसार रद्द / निलंबित कर दिया जाएगा|
			</p>
			<p align="justify">
			3. I am aware that, if at any time, I am found to have concealed/distorted any material information and the Shipping Master has reason to believe 
			that I have obtained the SID by presenting false or erroneous information, my SID will be cancelled/suspended forthwith as per the provision of
			Merchant Shipping (Seafarer's Identity Document) Rules, 2016, as amended.</p>
			
			
					
		</td>
	</tr>
	
	<tr>
		<td colspan="4">
		<s:checkbox name="verified"></s:checkbox>
							 I agree to the declaration above.
		</td>
	</tr>
	
	<tr>
<td align="center" colspan="4">
<!-- Modified by Sidharth Bhawal(18-06-2019) -->		
<s:a action="OtherDetailBack"><input type="button" value=" Back " class="medium secondary button"/></s:a>
<!-- Modified by Sidharth Bhawal(18-06-2019) -->
<s:submit method="execute" value="Submit" theme="simple"  class="medium button"/>
<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a></td>
</tr>
</table>
<%-- <s:file  name="mediCer" label="Medical Certificate"> </s:file>

<s:file  name="sscCer" label="SSC Certificate"> </s:file>
<s:file  name="inDos" label="INDOS Certificate"> </s:file>
<s:file  name="srviceExp" label="Experiance Certificate"> </s:file>
<s:file  name="proExp" label="Professional Experiance Certificate"> </s:file> --%>
<!-- 
<input type="file" name="mediCer" />	</br>
<input type="file" name="passportDoc" /></br>	</br>
<input type="file" name="sscCer" /></br>	</br>
<input type="file" name="inDos" /></br>	</br>
<input type="file" name="srviceExp" /></br>	</br>
<input type="file" name="proExp" /></br>	</br>
 -->

<s:token/></s:form>
	<hr style="border-color:  #b9b9b9"/>

</div>


</div>

<div class="row">

</div>
 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>






