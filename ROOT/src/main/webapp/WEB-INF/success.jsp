<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BSID</title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
    <script src="/js/vendor/modernizr.js"></script>
</head>
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
					<div class="customHeader2">
						<i class="step fi-check size-24"></i>  &nbsp;&nbsp;Success
					</div>
					<div class="panel callout radius message" style="text-align: center;">
					<br/><br/>
						<h5><s:property value="#session.SUCCESS_MESSAGE"/></h5>
					</div>
					  
				</td>
			</tr>
		</table>
				
	</div>

</div>







<script src="/js/vendor/jquery.js"></script>
 <script src="/js/foundation.min.js"></script>
 <script>
      	$(document).foundation();
 </script>
</body>
</html>