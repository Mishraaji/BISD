<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />
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
    	font-size: 14px;
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
    	$(function() {
    	$("#bdate").datepicker({});
    	});

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
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SID Status active/inactive</title>

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
				<td rowspan="2" width="25%" valign="top">

				<div class="row">
	<div class="twelve column sideBar">
		
	
				
					<s:if test="%{#session.USER_ROLE==4}">
						<div class="customHeader2">
		    				<i class="step fi-thumbnails size-28"></i><s:a action="Welcome2JSP" style="color:white !important;">SEAFARER MENU</s:a>
		   				 </div>
						 <ul style="list-style-type: none;">
						 	<s:a action="Apply.action"> 
						 		
						 		<li><i class="step fi-pencil size-21"></i>  Apply for SID </li>
						 	</s:a>
						 	<s:a action="renew.action" > 
						 		
						 		<li><i class="step fi-refresh size-21"></i> Renew SID </li>
						 	</s:a>
							<s:a action="makePayment.action" > 
						 		<li><i class="step fi-refresh size-21"></i> Make Payment </li>
						 	</s:a>
						 	<s:a action="takingAppointment" > 
						 		<li><i class="step fi-clock size-21"></i> Schedule Appointment</li>
						 	</s:a>
						 	<s:a action="cancelAppointment" > 
						 		<li><i class="step fi-x size-21"></i> Cancel Appointment</li>
						 	</s:a>
							<s:a action="printFormaction" target="_blank"> 
						 		<li><i class="step fi-x size-21"></i> Print Report</li>
						 	</s:a>
						 	<s:a action="printAck" > 
						 		<li><i class="step fi-print size-21"></i> Print Acknowledgement </li>
						 	</s:a>
						 	<s:a action="duplicate.action" > 
						 		
						 		<li><i class="step fi-foundation size-21"></i> Duplicate SID </li>
						 	</s:a>
						 	<!--<s:a action="sidStatus.action" > 
						 		<li><i class="step fi-check size-21"></i> SID Status </li>
						 	</s:a>
						 	--><s:a action="applicationStatus.action" > 
						 		<li><i class="step fi-graph-horizontal size-21"></i> Application Status </li>
						 	</s:a>
						 	
						 	
						 	<s:a action="statusJSP" > 
						 		<li><i class="step fi-graph-horizontal size-21"></i> SID Checker </li>
						 	</s:a>
						 	
						 	
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						 	
						 	
						 	<s:a href="HelpJSP" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 </ul>
				
					</s:if>
				
					<s:elseif test="%{#session.USER_ROLE==5}">
						<div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> DCO Menu
		   				 </div>
						 <ul style="list-style-type: none;" >
						 	<s:a action="getApplications.action" > 
								<s:param name="typeApp">newApp</s:param>
								<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Applications </li>
						 	</s:a>
						 	
						 	<s:a action="rejectedApplications.action" > 
								<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-refresh size-21"></i> Rejected Applications</li>
						 	</s:a>
						 	<s:a action="viewAppointments.action" > 
						 		<li><i class="step fi-clock size-21"></i> View Appointments</li>
						 	</s:a>
						 	<s:a action="viewPrintForms.action" > 
						 		<li><i class="step fi-print size-21"></i> Print Report</li>
						 	</s:a>
						 	<s:a action="verifiedApplications.action" >
								<s:param name="rePrint">newn</s:param> 
						 		<li><i class="step fi-check size-21"></i> Verified Applications</li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/DeoHelp.jsp" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
				
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==6}">
						<div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> VO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="getApplications.action" >
								<s:param name="typeApp">newApp</s:param>
								<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Applications </li>
						 	</s:a>
						 	
						 	<s:a action="rejectedApplications.action" > 
							<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-refresh size-21"></i> Rejected Applications</li>
						 	</s:a>
						 <%-- 	<s:a action="#" > 
						 		<li><i class="step fi-clock size-21"></i> View Appointments</li>
						 	</s:a> --%>
						 	<s:a action="viewPrintForms.action" >
						 		<li><i class="step fi-print size-21"></i> Print Report</li>
						 	</s:a>
						 	<s:a action="verifiedApplications.action" >
							<s:param name="rePrint">newn</s:param>  
						 		<li><i class="step fi-check size-21"></i> Verified Applications</li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
							 <s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/voHelp.jsp" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==7}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> IO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="getApplications.action" >
								<s:param name="typeApp">newApp</s:param> 
								<s:param name="rePrint">newn</s:param> 
						 		<li><i class="step fi-pencil size-21"></i> New Applications </li>
						 	</s:a>
						 	
						 	<s:a action="rejectedApplications.action" >
								<s:param name="rePrint">newn</s:param> 
						 		<li><i class="step fi-refresh size-21"></i> Rejected Applications</li>
						 	</s:a>
							<s:a action="checkDuplicateRecords.action" >  
						 		<li><i class="step fi-refresh size-21"></i> Check Duplicate Cards</li>
						 	</s:a>
							<s:a action="getReprintApplication.action" >
							<s:param name="rePrint">rePrint</s:param> 
						 		<li><i class="step fi-clock size-21"></i> Re-print Card</li>
						 	</s:a>

							<s:a action="manageApplications.action" >
								<s:param name="rePrint">reApprove</s:param>  
						 		<li><i class="step fi-clock size-21"></i> Manage Rejected Applications</li>
						 	</s:a>
							<!--<s:a action="#" > 
						 		<li><i class="step fi-clock size-21"></i> Update Biometric Information</li>
						 	</s:a>-->


						 	<%-- <s:a action="#" > 
						 		<li><i class="step fi-clock size-21"></i> View Appointments</li>
						 	</s:a> --%>
						 	<s:a action="duplicateSidApplication.action" > 
								<s:param name="typeApp">duplicateCardApp</s:param>
								<s:param name="rePrint">duplicatecard</s:param>
						 		<li><i class="step fi-pencil size-21"></i> Duplicate card Applications </li>
						 	</s:a>
						 	<s:a action="viewPrintForms.action" > 
						 		<li><i class="step fi-print size-21"></i> Print Report</li>
						 	</s:a>
						 	<s:a action="verifiedApplications.action" >
							<s:param name="rePrint">newn</s:param> 
						 		<li><i class="step fi-check size-21"></i> Verified Applications</li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/ioHelp.jsp" >  
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==8}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> PO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="cardForPrinting.action" >  
								<s:param name="typeApp">newApp</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Cards </li>
						 	</s:a>
						 	<!--<s:a action="#" > 
						 		<li><i class="step fi-pencil size-21"></i> Card Tracker </li>
						 	</s:a>-->
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/ioHelp.jsp" >  
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==9}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> DO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="cardForPrinting.action" >  
								<s:param name="typeApp">newApp</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Cards </li>
						 	</s:a>
						 
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						  	<!--<s:a action="#" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 --></ul>
					</s:elseif>
					
					<s:elseif test="%{#session.USER_ROLE==11}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i>Admin Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a href="home.jsp"> 
						 		<li><i class="step fi-home size-21"></i>Home</li>
						 	</s:a>
						 
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<s:a action="#" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 </ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==1}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i>Centre Admin Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a href="centerhome.jsp"> 
						 		<li><i class="step fi-home size-21"></i>Home</li>
						 	</s:a>
						 
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<s:a action="#" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 </ul>
					</s:elseif>
				
				 
			
			
				
	</div>
</div>
				
				</td>
				<td width="75%" valign="top">
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
<s:form action="sidChecker.action" method="post" 
	style="width:100%;text-align:left;" class="panel callout radius" theme="simple" id="bankDetail" name="bankDetail">

<table width="100%">

	
<tr>
	<td>
		SID No.
	</td>
	<td>
	 <s:textfield name="SIDNUMBER" id="SIDNumber" key="SIDNumber" size="20"/>
	</td>
	
</tr>	
	
<tr>
<td align="center" colspan="4">		
<input type="button" value="Submit" class="medium button" onclick="checkVal()"/></td>
</tr>


</table>
<s:token/></s:form>
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

