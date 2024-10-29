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
   
    <script>
   function checkVal()
		{
			
				if($("#SIDNumber").val() == null || $("#SIDNumber").val() == "")
				{
					alert("Please enter value for sid number.");
				}
				else
				{
					document.getElementById("bankDetail").action="${pageContext.request.contextPath}/viewsidChecker";
					document.getElementById("bankDetail").submit();
					return true;
				}

				
		}
   </script>

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
		
		<div class="customHeader2" style="text-align: left;">
&nbsp;&nbsp;<i class="step fi-clock size-24"></i>  SID Checker
</div>

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
<br/><br/><br/>
<s:form method="post" 
	style="width:100%;text-align:left;" class="panel callout radius" theme="simple" id="bankDetail" name="bankDetail">

<table width="100%">

	<tr><td colspan="2" align="center">
	<b>Gives the current status of SID card.</b>
	</td></tr>
<tr>
	<td align="right">
		SID No.
	</td>
	<td align="left">
	 <s:textfield name="SIDNUMBER" id="SIDNumber" key="SIDNumber" size="20"/>
	</td>
	
</tr>	
	
<tr>
<td align="center" colspan="4">		
<input type="button" value="Submit" class="medium button" onclick="checkVal()"/></td>
</tr>


</table>
</s:form>
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



