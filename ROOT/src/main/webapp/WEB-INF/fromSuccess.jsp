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
    
    
<script type="text/javascript">
	function viewForm(url)
	{
		var width=800;
		var height=800;
		var leftPosition, topPosition;
	    //Allow for borders.
	    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
	    //Allow for title and status bars.
	    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
	    //Open the window.
		 window.open(url,'cardPreview',"status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
				    + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
				    + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
		
	}
	
	
	
</script>

</head>
<body>
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
 <div class="secondary tiny button"> <s:a action="Welcome2JSP"> Home </s:a>  </div>
 <hr style="border-color:  #b9b9b9"/>



 <div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
				<td width="75%" valign="top">
					<div class="customHeader2" >
						<i class="step fi-check size-24"></i>  &nbsp;&nbsp;Success
					</div>
					<div class="panel callout radius message" style="text-align: left;">
					<br/><br/>
						<h5>Congratulations !! <br/> <br/>Your application for SID card has been submitted successfully .
						
						<br/>
						<br/>Application No : <s:property value="%{#session.applicationId}"/>  <br/>
						</h5>
						<br/>
						<input type="button" class="button" onclick="viewForm('printForm.jsp')"  value="Print Application"/>
						<br/>
						<br/>
						
						
						<h5>	Now, You need to schedule appointment for documents verification.  </h5><br/> 
						<br/>
						<s:a action="takingAppointment"> 
						 	<input type="button" class="secondary medium button" value="Schedule Appointment">	
						</s:a>
						
						
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