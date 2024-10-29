<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BSID | Log in </title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    
    <style type="text/css">
    .label {
    	font-size: 20px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
    
    <style>
.steps span{
background-color: #008cba;
border-color: #007095;
color: white;
font-weight:bold;
cursor: default;
opacity: 0.7;
box-shadow: none;
padding: 5px 5px 5px 5px;
 border: 1px solid  #007095;
    border-radius: 3px;
}  

.myTable td {
	
	line-height: 0.9rem;
}

.label {
	line-height: 0.9rem !important;
}


.myTable input[type="text"], input[type="password"] {
	
font-size: 0.875rem;
margin: 0 0 0.5rem 0;
padding: 0.5rem;
height: 2rem;
}

form {
margin: 0 0 0 0;

}

</style>
    
    <script>
    function validateUser()
    {
		if(document.getElementById("username").value=="")
		{
			alert("Please enter valid emailid.");
			return false;
		}
		else
		{
			document.getElementById("forgotPassowrd").action="${pageContext.request.contextPath}/forgotPassword";
			document.getElementById("forgotPassowrd").submit();
			return true;
			
		}
     }
    </script>
</head>

<body onload="window.history.forward(1);">

<s:actionerror />


 <jsp:include page="header.jsp"></jsp:include>





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
<br/>
<div class="row">


<div class="small-12 columns">
<s:form method="post" id="forgotPassowrd" name="forgotPassowrd">
			<table align="center">		
			 <tr>
		    	<td colspan="2">
		    		<div class="customHeader2">
						<i class="step fi-unlock size-28"></i>  &nbsp;&nbsp;  Forgot Password
					</div>
					<div  style="text-align: left; color: #333333; line-height: 1rem; font-size: 14px; padding:5px;">
					<i class="step fi-info size-14" style="color: #008cba;"></i> use your registered EmaiID to reset password.
					
					</div>
				</td>
		   </tr>
		<tr>  <td>
		  <s:textfield name="username" id="username" key="UserID"  size="20" placeholder="UserID " required="true"/>
		   </td></tr> 
		   <tr>  		    <td align="center" colspan="2">
		    		    <img src="${pageContext.request.contextPath}/Captcha.jpg" border="0"></td>
		    		    </tr>
            <s:textfield label="Captcha" name="j_captcha_response" size="20" maxlength="10"/>
		   
		    
		   <tr>
		    	<td colspan="2" align="center">
		    		<button value="Reset" align="center" class="medium button" onclick="validateUser();">Reset</button>
		   		
		   			
		   		</td>
		   </tr>
		  
		  
		    </table>
		    
		</s:form>
</div>
</div>
<div class="row">
<div class="small-12 columns" style="text-align: center;">
	 <div class="bottomStrip">
		  © Copyright 2017 DGS
	</div>
</div>
</div>




 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
</body>
</html>