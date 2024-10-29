<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="login.UserAccountBean"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Take Appointment</title>
</head>
<body>
<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
<!--
Include JQuery Core (Required for calendar plugin)
** This is our IE fix version which enables drag-and-drop to work correctly in IE. See README file in js/jquery-core folder. **
-->
<script type="text/javascript" src="/js/appointment/jquery-1.4.2-ie-fix.min.js"></script>

<!-- Include JQuery UI (Required for calendar plugin.) -->
<script type="text/javascript" src="/js/appointment/jquery-ui-1.8.1.custom.min.js"></script>

<script>
$(function() {
	$("#startDate").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true,
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'yy-mm-dd',
		beforeShowDay: $.datepicker.noWeekends,
		minDate: 0
	});
	$("#endDate").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true,
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'yy-mm-dd',
		beforeShowDay: $.datepicker.noWeekends,
		minDate: 0 
	});

	$("#startDate").datepicker('setDate', new Date());
	$("#endDate").datepicker('setDate', new Date());

	
	
});

	function addDefault()
	{
		if($("#startDate").val() > $("#endDate").val())
		{
			alert("Please select proper values for date");
		}
		else
		{
			if(($('#startHour :selected').text() != "12" && parseInt($('#startHour :selected').val()) >= parseInt($('#endHour :selected').val())) || (($('#startMeridiem :selected').text() == "PM" && $('#endMeridiem :selected').text() == "AM") && (parseInt($('#startHour :selected').val()) >= parseInt($('#endHour :selected').val()))))
			{
				alert("StartDate cannot be greater than EndDate...Please select proper values...Atlease 1hr difference should be there for timings");
			}
			else
			{
				if(($('#startMeridiem :selected').text() == "AM" && $('#endMeridiem :selected').text() == "AM") && (($('#startHour :selected').text() == "12" && $('#endHour :selected').text() == "12") || (parseInt($('#startHour :selected').val()) >= parseInt($('#endHour :selected').val()))))
				{
					alert("Please select proper values...");
				}
				else
				{
					var tnoOfApp=/^\d\d$/;
					 if(!(tnoOfApp.test(document.getElementById("noOfApp").value)))
					 {
						alert("Enter only numeric values only")
					 }
					 else
					 {
						document.getElementById("defaultForm").action="${pageContext.request.contextPath}/defaultSchedule";
						document.getElementById("defaultForm").submit();
					 }
				}
			}
		}
	}

</script>
</head>
<body style="background-color: #D6F3FF">
<s:if test="%{#session.USER_ROLE==1}">
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
</s:if>
<hr style="border-color:  #b9b9b9"/>
<div class="customHeader row">
	<i class="step fi-unlock size-48"></i>  &nbsp;&nbsp; Center Admin Appointment Scheduler 
	</div>
<br/><br/>
<center>
<s:if test="%{#session.ERROR_MESSAGE!=null}">
                                               <div data-alert class="alert-box warning radius" style="color: red;">
                                                       <s:property value="#session.ERROR_MESSAGE"/>
                                                        
                                               </div>
                                               <s:set value="ERROR_MESSAGE" var="session.ERROR_MESSAGE" scope="session"> </s:set>
                                       </s:if>

<br/><br/>
<s:if test="%{#session.USER_ROLE==1}">
<form id="defaultForm" name="defaultForm">
<table border="1px">
<tr><td>
<table cellpadding="15px;">
<tr>
<th colspan="3">Please select defualt time slots for your center<br/></th>
</tr>
<tr>
<td>Start Date : </td>
<td>Start Hour : </td>
<td>Start Minutes : </td>
<td>AM/PM</td>
</tr>
<tr>
<td><input type="text" id="startDate" name="startDate"></td>
<td><select id="startHour" name="startHour" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="12" SELECTED>12</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
							</select></td>
<td><select id="startMin" name="startMin" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="00" SELECTED>00</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
							</select></td>
							<td>
							<select id="startMeridiem" name = "startMeridiem" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="AM" SELECTED>AM</option>
								<option value="PM">PM</option>
							</select>				
						</td>
</tr>
<tr>
<tr>
<td>End Date : </td>
<td>End Hour : </td>
<td>End Minutes : </td>
<td>AM/PM</td>
</tr>
<td><input type="text" id="endDate" name="endDate"></td>
<td><select id="endHour" name="endHour" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="12" SELECTED>12</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
							</select>	</td>
<td><select id="endMin" name="endMin" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="00" SELECTED>00</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
							</select></td>
							<td>
							
							<select id="endMeridiem" name="endMeridiem" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="AM" SELECTED>AM</option>
								<option value="PM">PM</option>
							</select>				
						</td>
</tr>
<tr><td>No of appointment for slot :</td>
<td><input type="text" name="noOfApp" id="noOfApp"><s:fielderror fieldName="noOfApp"/></td>
</tr>
<tr>
<td colspan="4" align="center">
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
<input type="submit" value="Submit" onclick="addDefault()">
</s:if> 
</center>

</body>
</html>