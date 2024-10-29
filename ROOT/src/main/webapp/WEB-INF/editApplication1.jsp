<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

<title>Officer DashBoard</title>

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
				<div style="text-align: center;">
				 <div style="position:absolute; top:0px;z-index:200; ">
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
						
						<jsp:include page="editable1.jsp"></jsp:include>
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




