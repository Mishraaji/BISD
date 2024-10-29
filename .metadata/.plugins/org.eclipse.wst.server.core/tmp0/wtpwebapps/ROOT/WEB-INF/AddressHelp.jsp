<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
span {background-color: black; color: white} 
</style>
<title>Welcome</title>

	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    
   

</head>
<body>

<div style="position:absolute; top:0px;">
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
<div class="row">
<s:if test="%{#session.USER_ROLE==4}">
 <jsp:include page="header.jsp"></jsp:include>
 </s:if>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		<s:if test="%{#session.USER_ROLE==4}">
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> 


				--><td width="75%" valign="top">
					
					   
					   <s:a action="Welcome2JSP">Overall Instructions for SID</s:a><br/><br/>
					   <!-- <div class="subHeader">Online SID Application </div> -->
						
						<div class="customHeader2">
	<i class="step size-24"></i>  &nbsp;&nbsp; Address Details Help
	</div>
						</br>
						<h4>House NO:</h4>
						<p>Fill in your house number in this field. For example "12/99A"
						</p>
						<h4>Street:</h4>
						<p>Fill your street name in this field. For example "Barfiwala road"</p>
						<h4>Village/Post office/Tehsil:</h4>
						<p>Enter your village name/post office/tehsil name in thsi field.</p>
						<h4>District:</h4>
						<p>Fill in your district name in this field.</p>
						<h4>State/Union Territories:</h4>
                        <p>Fill in your state name in this field from the drop down. for example 'Maharasthtra'</p>
						<h4>Pincode:</h4>
						<p>Fill in your 6 digits area pin code in this field. For example "431602"</p>
						<h4>Phone number with std code:</h4>
						<p>Fill in your working phone number with std code(without sapce) in this field. For example "02462252986"</p>
						<h4>Juridicial Police Station:</h4>
						<p>Fill in your area police station name in this field.</p>
						
						
						<!--<p align="justify">
							The concept of an universal Identification system for the seafarers was mooted in 1950s. Accordingly, International labour Organization (ILO) brought forward the ILO Convention C-108 on seafarers Identity Document. India has ratified this convention and issuing a Continuous Discharge Certificate cum Seafarers Identity Document to its seafarers in the form of a booklet.
						</p>
						<p align="justify">
						The world maritime community had felt the need for a more uniform and robust Identification system for the seafarers consequent to the discussions. The ILO had adopted another Convention C.185 on Biometric Seafarers Identity Document to be given to all seafarers. The new biometric SID has the provisions for the bar coding of the biometrics based identity of seafarers and a centralized data base maintained in the issuing country, which can be accessed globally through an interoperable & standard biometric template.
						</p>
						--></div>
				</td>
			</tr>
		</table>
			</s:if>	
	</div>
</div>



 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
	<script type="text/javascript">
   $(window).load(function() {
       $("#featured").orbit();
   });
</script>
</body>

</html>




