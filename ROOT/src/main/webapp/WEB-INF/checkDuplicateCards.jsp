<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Duplicate Cards</title>
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

</head>
     


<script>
function checkCard()
{
	if(document.getElementById("indosNo").value=="" || document.getElementById("indosNo").value== null)
	{
			alert("Please enter proper SID number.");
			return;
	}
	var r= confirm("Please confirm your SID number before submitting");

	if(r==true)
	{
		document.getElementById("formcards").action="${pageContext.request.contextPath}/viewDuplicates.action";
		document.getElementById("formcards").submit();
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
<s:if test="%{#session.USER_ROLE==7}">
 <jsp:include page="header.jsp"></jsp:include>
 </s:if>
</div>
<hr style="border-color:  #b9b9b9"/>
	<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
				<div class="row">
					<div class="twelve column sideBar">
	
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
						 		<s:a action="approveManageApplications.action" >
								<s:param name="rePrint">reApprove</s:param>  
						 		<li><i class="step fi-clock size-21"></i>Approve Manage Rejected Applications</li>
						 	</s:a>
						 	<s:a action="suspendSIDJSP"> 
						 		<li><i class="step fi-clock size-21"></i> Suspend SID Card</li>
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
						 	<s:a action="suspendSIDApp">
						 	<s:param name="dupApp">dupApp</s:param>
						 		<li><i class="step fi-clock size-21"></i> Suspended SID Applications</li>
						 	</s:a>
						 	
						 	<s:a action="viewPrintForms.action" > 
						 		<li><i class="step fi-print size-21"></i> Print Report</li>
						 	</s:a>
						 	<s:a action="verifiedApplications.action" >
							<s:param name="rePrint">newn</s:param> 
						 		<li><i class="step fi-check size-21"></i> Verified Applications</li>
						 	</s:a>
						 		<!-- Sidharth Bhawal -->
						 	<s:a action="applicationsHistory.action" >								
								<li><i class="fa fi-clock size-21"></i> Applications History</li>
							</s:a>
						 	<!-- Sidharth Bhawal -->
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
						</div>
					</div>

				</td>
				<td width="75%" valign="top">
<div class="customHeader2">
	<i class="step size-24"></i>  &nbsp;&nbsp; Check Duplicate Cards
	</div>
<center>

<form id="formcards" name="formcards" class="panel callout radius">
<table cellpadding="10px" width="75%">
<tr style="text-align: center;">
	<th>Insert SID Number</th>
	<td><input type="text" id="indosNo" name="indosNo"></td>
</tr>
</table>
</form>
<input type="submit" value="Submit" class="button" onclick="checkCard()">
<s:if test="#session.PROBABLE_DUPLICATES != null"> 
<div>
<table>
<tr>
<th>SID NO</th>
<th>First Name</th>
<th>Last Name</th>
<th>Date of birth</th>
<th>Place of birth</th>
<th>Gender</th>
<th>Indos No</th>
<th>Application ID</th>
<th>Date of expiry</th>
</tr>

<s:iterator value="#session.PROBABLE_DUPLICATES" status="stat" var="card">
<tr>
<td>
	<s:property value="#card.sIDNo"/>
</td>
<td>
	<s:property value="#card.firstName"/>
</td>
<td>
	<s:property value="#card.lastName"/>
</td>
<td>
	<s:property value="#card.dob"/>
</td>
<td>
	<s:property value="#card.placeOfBirth"/>
</td>
<td>
	<s:property value="#card.gender"/>
</td>
<td>
	<s:property value="#card.indosNo"/>
</td>
<td>
	<s:property value="#card.applicationId"/>
</td>
<td>
	<s:property value="#card.dateOfExpiry"/>
</td>
</tr>
</s:iterator>

</table>
</div>
</s:if>
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