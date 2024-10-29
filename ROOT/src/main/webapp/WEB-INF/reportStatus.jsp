<%@page import="java.io.PrintWriter"%>
<%@page import="action.ReportStatus"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Officer DashBoard</title>
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
</head>
<body>
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>

</div>
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
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
				<div class="customHeader2">Report Status</div>
								<div style="text-align: left;" align="left">
								<s:if test="%{#session.REPORT_STATUS!=null}">
								<div align="center"><h4><s:property value="%{#session.REPORT_STATUS.centreName}"/></h4></div>
								
								<table class="table table-hover" align="center" width="100%">
								 <thead>
								
								</thead>
								<tbody>
								<tr><th scope="row">Total Pending Prints :</th><td><s:property value="%{#session.REPORT_STATUS.totalPrintingRemaining}"/></td></tr>
								<tr><th scope="row">Total Pending Dispatch :</th><td><s:property value="%{#session.REPORT_STATUS.totalDispatchRemaining}"/></td></tr>
								<tr><th scope="row">Today's VO Approve :</th><td><s:property value="%{#session.REPORT_STATUS.todayVOApprove}"/></td></tr>
								
								
								
								
								<tr><th scope="row">Today's IO Approve:</th><td><s:property value="%{#session.REPORT_STATUS.todayIOApprove}"/></td></tr>
								<tr><th scope="row">Today's Prints :</th><td><s:property value="%{#session.REPORT_STATUS.todayPrint}"/></td></tr>
								<tr><th scope="row">Today's Dispatch :</th><td><s:property value="%{#session.REPORT_STATUS.todayDispatch}"/></td></tr>
								<tr><th colspan="2" scope="row">
								<table align="center" width="100%">
								<tr>
								
								<th colspan="3" align="center">Today's  Data Capture Status </th>
								</tr>
								<s:iterator value="#session.REPORT_STATUS.centerWiseTodayDataCapturedbyName" var="prop">
								<tr>
								<th colspan="2"><s:property value="#prop.key" />	</th>
								<td><s:property value="#prop.value" />	</td>
								</tr>
								</s:iterator>
								<tr>
								<th colspan="3">
								<hr>
								</th>
								
								</tr>
								<tr>
								
								<th colspan="2">Today's Total Data Captured :</th>
								<td><s:property value="%{#session.REPORT_STATUS.todayDataCaptured}"/></td>
								</tr>
								<tr>
								<th colspan="3">
								<hr>
								</th>
								
								</tr>
								<tr>
								<th colspan="2">IO SID Issued from today's Data Captured :</th>
								<td><s:property value="%{#session.REPORT_STATUS.todayDataCaptureIOApprove}"/></td>
								</tr>
								
								<tr>
								
								<th colspan="2">IO SID Reject from today's Data Captured :</th>
								<td><s:property value="%{#session.REPORT_STATUS.todayDataCaptureIOReject}"/></td>
								</tr>
								</table>
								</th>
								</tr>
								
								</tbody>
								</table>
										
										
								</s:if>		
								</div>
							</table>
					
					 <%
					 session.setAttribute("REPORT_STATUS",null); 
					 %>
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