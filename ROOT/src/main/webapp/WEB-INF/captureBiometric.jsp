<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

<title>DCO DashBoard</title>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
   
    
    <style type="text/css">
    .label {
    	font-size: 18px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
<style type="text/css">

.menu ul {
	margin-left: 0.1rem;
}

.menu ul li {
	padding: 5px 5px 5px 5px;
	border-style: solid;
	border-width: 1px;
	border-color: #b6edff;
	
	background: #ecfaff;
	margin-bottom: 2px;
	margin-top: 2px;
}

.menu ul li:HOVER {
	background-color: #007095;
	color: white;
	border: 1px solid #005A77;
	
}

.menu ul li:HOVER a {
	color: white;
}

.menu ul li:HOVER a:HOVER {
	color: white;
}


.menu ul li i {
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

</head>
     <script language="javascript" type="text/javascript">  
      
    function doSubmit()  
    {  
    window.open("ApplyNew.jsp");  
    }  
    </script> 
  
<body>
  
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
	
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
				
					<h4>Application Updated Successfully , Capture Biometric to complete Application</h4>
					<s:a action="deoVerify.action" class="medium button">Done 
						<s:param name="applicationId" value="%{#session.CURRENT_APPLICATION.applicationId}"> </s:param>
					</s:a>
					<s:a action="printForm1JSP" class="medium button"> Print Report</s:a>
					
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




