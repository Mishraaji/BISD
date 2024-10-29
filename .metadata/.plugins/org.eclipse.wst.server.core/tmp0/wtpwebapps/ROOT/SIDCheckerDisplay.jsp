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
					document.getElementById("bankDetail").submit();
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
<s:form action="/FinalSubmit.action" method="post" enctype="multipart/form-data" 
		style="width:100%;text-align:left; " validate="true" class="panel callout radius" theme="simple">
		
<table style="width: 90%; text-align: left; border: 1px solid #000;" align="center" >
	<tr>
		<th colspan="1">NAME</th>
		<td colspan="3"><s:property value="fname"/></td>
		
	</tr>

	 <tr>
	<th>NATIONALITY</th>
	<td><s:property value="nationality"/></td>
	<th>Gender</th>
	<td><s:property value="gender"/></td>
	</tr>
	
	<tr>
	<th>DATE OF BIRTH</th>
	<td><s:property value="dob"/></td>
	</tr>
	<tr>
	<th>PLACE OF BIRTH</th>
	<td colspan="3"><s:property value="placeOfBirth"/></td>
	</tr>
	
	<tr>
		<th>CDC NUMBER</th>
		<td><s:property value="CDCno"/></td>
		<th>SID NUMBER</th>
		<td><s:property value="sidno" /></td>
	</tr>
	
	<tr>
		<th>SID DATE OF ISSUE</th>
		<td><s:property value="doi"/></td>
		<th>SID DATE OF EXPIRY</th>
		<td>
		<s:property value="doe"/></td>
	</tr>
	
	<tr>
	<th>IDENTIFICATION MARK</th>
	<td colspan="3"><s:property value="identificationMark"/></td>
	</tr>
	
	<tr>
	<th>PLACE OF ISSUE</th>
	<td><s:property value="placeOfIssue"/></td>
		<th>SID STATUS </th>
		<td><s:property value="status"/></td>
		
	</tr> 
</table>

<s:token/></s:form>
<!-- <a href="#" onClick=" window.print(); return false">Print</a> -->
</td>
</tr>
</table>


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