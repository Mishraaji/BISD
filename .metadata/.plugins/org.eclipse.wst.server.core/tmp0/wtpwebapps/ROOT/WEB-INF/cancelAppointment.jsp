<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cancel Appointment</title>
<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" href="/css/appointment/defaultStyle.css" />
<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
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
table thead tr th, table thead tr td, table tfoot tr th, table tfoot tr td {
padding: 0.5rem 0.625rem 0.625rem;
font-size: 0.875rem;
font-weight: bold;
color: white !important;
text-align: center;
}

</style>

<script>
function confirmC()
{
	var r= confirm("Are you sure you want to cancel your scheduled appointment");

	if(r==true)
	{
		document.getElementById("formCancel").action="confirmCancelAppointment.action";
		document.getElementById("formCancel").submit();
	}
	else
	{
		//do nothing
	}
}
</script>

</head>
<body>
<div class="row">
<div style="position:absolute; top:0px;">
					<s:if test="%{#session.ERROR_MESSAGE!=null}">
						<div data-alert class="alert-box warning radius" >
							<s:property value="#session.ERROR_MESSAGE" />
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
<s:if test="%{#session.USER_ROLE==4}">
 <jsp:include page="header.jsp"></jsp:include>
 </s:if>
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
	<i class="step fi-x size-24"></i>  &nbsp;&nbsp; Cancel your appointment
	</div>
<center>
<s:if test="%{#session.ERROR_MESSAGE!=null}">
                                               <div data-alert class="alert-box warning radius"">
                                                       <s:property value="#session.ERROR_MESSAGE"/>
                                                        
                                               </div>
                                              <s:set value="ERROR_MESSAGE" var="session.ERROR_MESSAGE" scope="session"> </s:set>
</s:if>
<s:else>
<form id="formCancel" name="formCancel" class="panel callout radius">
<table cellpadding="10px" width="75%">
<tr style="background-color: #008cba;text-align: center;color: white !important;">
	<th style="color: white;">Time</th>
	<th style="color: white;">Date</th>
</tr>
<tr style="background-color: #b6edff;text-align: center;;">
	<td><s:property value="timeForApp"/></td>
	<td><s:property value="dateForApp"/></td>
</tr>
<tr>
<td align="center" colspan="2" >NOTE: Only 3 time cancellation of appointment is allowed,after that again you have to go through the payment procedure.</td>
</tr>
</table>
<br/><br/>
</form>
<input type="submit" value="Submit" class="button" onclick="confirmC()">
</s:else>
</center>
</td>
			</tr>
		</table>
				
	</div>
</div>
<div class="bottomStrip"></div>
 <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
</body>    
    
</html>