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
<s:if test="%{#session.USER_ROLE==4}">
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
</s:if>
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
	<i class="step size-24"></i>  &nbsp;&nbsp; Personal Details Help
	</div>
						
						
						</br>
						<h4>Name of Cndidate:</h4>
						<p>Verify your complete name (first name, sirname)in the fields.
						</p>
						<h4>Fathers Name:</h4>
						<p>Verify your fathers name in this field.</p>
						<h4>Sex:</h4>
						<p>Check radio button as per your sex (male/female)</p>
						<h4>Date Of Birth:</h4>
						<p>Verify your date of birth in this field.</p>
						<h4>Nationality:</h4>
                        <p>Verify your nationality in this field.</p>
						<h4>Place Of Birth:</h4>
						<p>Verify your birthplace in this field.</p>
						<h4>Email:</h4>
						<p>Verify your valid email ID in this field if not correct then please fill the correct details.</p>
						<h4>Mobile:</h4>
						<p>Verify your valid working mobile number in this field if not correct then please fill the correct details.</p>
						<h4>Height:</h4>
						<p>Verify your height in centemeters in this field.</p>
						<h4>Identifications marks:</h4>
						<p>Verify your identification mark in this field. For example 'mole on the chin'</p>
						
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




