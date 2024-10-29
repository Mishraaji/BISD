<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change Password</title>
<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" href="/css/appointment/defaultStyle.css" />
<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
<!--
Include JQuery Core (Required for calendar plugin)
** This is our IE fix version which enables drag-and-drop to work correctly in IE. See README file in js/jquery-core folder. **
-->
<script type="text/javascript" src="/js/appointment/jquery-1.4.2-ie-fix.min.js"></script>

<!-- Include JQuery UI (Required for calendar plugin.) -->
<script type="text/javascript" src="/js/appointment/jquery-ui-1.8.1.custom.min.js"></script>
<script type="text/javascript" src="/js/appointment/pages.js"></script>
<style type="text/css">
    .label {
    	font-size: 18px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
<style type="text/css">

.sideBar ul {
	margin-left: 0.1rem;
}

.sideBar ul li {
	padding: 5px 5px 5px 5px;
	border-style: solid;
	border-width: 1px;
	border-color: #b6edff;
	
	background: #ecfaff;
	margin-bottom: 2px;
	margin-top: 2px;
}

.sideBar ul li:HOVER {
	background-color: #007095;
	color: white;
	border: 1px solid #005A77;
	
}

.sideBar ul li:HOVER a {
	color: white;
}

.sideBar ul li:HOVER a:HOVER {
	color: white;
}


.sideBar ul li i {
	background-color: #008cba;
color: white;
font-size: 20px !important;
padding: 2px 2px 2px 2px;
text-align: center;
width: 20px;
padding-left: 5px;
padding-right: 5px;
border-radius:2px;
}

.reverse  {
	background-color: #007095;
	color: white;
}
</style>
<script>
function validatePassword()
{
	var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
	if(document.getElementById("currentPassword").value.trim()==null || document.getElementById("currentPassword").value.trim()=="")
	{
		alert("Please enter value for current password.");
		
	}
	else if(document.getElementById("newPassword").value.trim()==null || document.getElementById("newPassword").value.trim()=="")
	{
		alert("Please enter value for new password.");
		
	}
	else if(document.getElementById("rePassword").value.trim()==null || document.getElementById("rePassword").value.trim()=="")
	{
		alert("Please enter value for re-entered password.");
		
	}
	else
		if(document.getElementById("rePassword").value.trim()!=document.getElementById("newPassword").value.trim())
		{
			alert("Password you re-entered did not match.");
			
		}
		else
			if(!(regularExpression.test(document.getElementById("rePassword").value.trim())||regularExpression.test(document.getElementById("newPassword").value.trim())))
			{
				alert("Please your password should contain one number,one special character,one character.Minimun 8 characters.")
			}
			else
				{
				document.getElementById("changePassowrd").action="${pageContext.request.contextPath}/changePassword";
				document.getElementById("changePassowrd").submit();
				return true;
				}
}
</script>
</head>
<body>
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
<div class="row">

<div class="small12 columns" style="text-align: center;">
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
</div>
</div>
<hr style="border-color:  #b9b9b9"/>
<div class="row">
	<div class="twelve column">
		<div class="customHeader2">
	 &nbsp;&nbsp; Change Password
	</div>
<s:form method="post" validate="true" id="changePassowrd" name="changePassowrd">

		<table style="width: 100%;" align="center">
			<tr><th>Current Password</th><td><input type="password" id="currentPassword" name="currentPassword"></td></tr>
			<tr><th>New Password</th><td><input type="password" name="newPassword" id="newPassword"></td></tr>
			<tr><th>Re-enter Password</th><td><input type="password" name="rePassword" id="rePassword"></td></tr>
			<tr><td colspan="2" align="center">
		    		<button value="changePassword" align="center" class="medium button" onclick="validatePassword()">Change Password</button>
		   		
		   			
		   		</td></tr>
		</table>
<s:token/></s:form>
</div>
 <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
</body>
</html>