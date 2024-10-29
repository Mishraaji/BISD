<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    
     <s:head />
</head>

<body onload="window.history.forward(1);">
<script type="text/javascript">


$(document).ready(function() {
	 $("input[type='text']").bind('copy paste cut',function(e) { 
	 	e.preventDefault(); //disable cut,copy,paste
	 });
	});

	    $(function(){
	        $('#login').ebcaptcha();
	    });

    </script>
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

<div class="small-12 columns" style="text-align: center;">
<s:label>Sorry, The page you are looking for is under construction....</s:label>
</div>
</div>
</body>
</html>