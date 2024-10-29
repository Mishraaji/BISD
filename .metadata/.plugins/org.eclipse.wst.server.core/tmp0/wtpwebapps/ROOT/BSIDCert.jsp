<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
span {background-color: black; color: white} 
</style>
<style>

ul.a {list-style-type: square;}

</style>
<title>Welcome</title>

	<link rel="stylesheet" href="css/foundation.css" />
  	<link rel="stylesheet" href="css/custom.css" />
  	<link rel="stylesheet" href="css/foundation-icons/foundation-icons.css" />
  	<link href="css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.ebcaptcha.js"></script>
   
    
   

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
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


<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> -->
 
 <h3 align="center" class="heading">BSID Certificates</h3>

  <div class="row">      
  <table align="center">
  <tr><th><a href="Certificates/DSCert1.cer" download>CSCA Certificate</a><th></tr>
  <tr></tr>
  <tr><th><a href="Certificates/IndiaDGShippingCSCA1.pem" download>ROOT Certificate</a></th></tr>
  </table>
 </div>
 
 

 
 
				
			</tr>
		</table>
		<jsp:include page="footer.jsp"></jsp:include>			
	</div>
</div>



 	
     <script src="js/foundation.min.js"></script>
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



