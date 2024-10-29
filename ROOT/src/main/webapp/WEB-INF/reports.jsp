<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reports</title>
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
<script>
$(function() {
	$("#startDate").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true,
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'yy-mm-dd',
		beforeShowDay: $.datepicker.noWeekends
	});
	$("#endDate").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true,
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'yy-mm-dd',
		beforeShowDay: $.datepicker.noWeekends
	});

	$("#startDate").datepicker('setDate', new Date());
	$("#endDate").datepicker('setDate', new Date());

	
	
});

function getReport()
{
	if($("#startDate").val() == "" || $("#startDate").val() == null || $("#endDate").val() == "" || $("#endDate").val()==null)
	{
		alert("Please select proper values for date");
		return;
	}
	
	if($("#startDate").val() > $("#endDate").val())
	{
		alert("Startdate is greater than enddate. Please select proper values for date.");
		return;
	}
	else
	{
	document.getElementById("reportForm").action="${pageContext.request.contextPath}/getReport";
	document.getElementById("reportForm").submit();
	}
}


</script>
<style type="text/css">
    .label {
    	font-size: 18px;
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
</head>
<body>
<s:if test="%{#session.USER_ROLE==11}">
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
<hr style="border-color:  #b9b9b9"/>
<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
				<div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> Get Report
		   				 </div>
						 <ul style="list-style-type: none;">
						 	<s:a action="reportsJSP" name="SIDIssuence" id="SIDIssuence"> 
						 		
						 		<li>  SID issuance</li>
						 	</s:a>
						 	<s:a action="appointmentReportsJSP" name="Appointment" id="Appointment"> 
						 		
						 		<li> Appointment</li>
						 	</s:a>
						 	<s:a action="verifiedAppReportsJSP" name="verifiedApp" id="verifiedApp"> 
						 		<li> Centerwise verified application</li>
						 	</s:a>
						 	<s:a action="SIDExpiryReportsJSP" name="SIDExpiry" id="SIDExpiry"> 
						 		<li> SID expiry report</li>
						 	</s:a>
						 	<s:a action="duplicateSIDReportsJSP" name="DuplicateSID" id="DuplicateSID"> 
						 		<li> Duplicate SID reports </li>
						 	</s:a>
						 </ul>
				
				</td>
				<td width="75%" valign="top">
<div class="customHeader2">
	 &nbsp;&nbsp; Issued SID Report
	</div>
<center>
<form name="reportForm" id ="reportForm">
From Date : <input type="text" name="startDate" id="startDate"/> To Date : <input type="text" name="endDate" id="endDate"/>
</form>
<br/><br/>
<input type="button" value ="Submit" onclick="getReport()">
</center>
</td>
			</tr>
		</table>
				
	</div>
</div>
</s:if>
<div class="bottomStrip"></div>
 <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
</body>    
    
</html>