<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="login.UserAccountBean"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@page import="java.util.ArrayList"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Schedule Appointment</title>
</head>

<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" href="/css/appointment/defaultStyle.css" />
<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
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
<script language="javascript" type="text/javascript">
        function printDiv(divID) {
        	
        	$('#buttons').hide();
        	$('#header').hide();
        	$('#headerLine').hide();
        	$('#message').hide();
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
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
table thead tr th, table thead tr td, table tfoot tr th, table tfoot tr td {
padding: 0.5rem 0.625rem 0.625rem;
font-size: 0.875rem;
font-weight: bold;
color: white !important;
text-align: center;
}

</style>
</head>
<body>
<s:if test="%{#session.USER_ROLE==4}">
 <div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
</s:if>
<hr style="border-color:  #b9b9b9"/>
<div class="row">
	<div class="twelve column">
		<s:if test="%{#session.USER_ROLE==4}">
		<table style="width: 100%;">
			<tr>
				<td rowspan="2" width="25%" valign="top">
				<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
				<td width="75%" valign="top">
<div class="customHeader2" style="text-align: left;">
&nbsp;&nbsp;<i class="step fi-clock size-24"></i> Acknowledgement
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

<div id="ackDiv" name="ackDiv">
<br/>
<div style="border: 1px;border-color: black;">
<div class="customHeader3" style="text-align: left;"></div><br/>
Seafarer Details
<table cellpadding="8px;" align="center">
<tr>
<th>Name</th>
<th>Application No</th>
</tr>
<tr>
<td>
<s:property value="details[4] "/><s:property value=" details[5]"/><s:property value=" details[6]"/>
</td>
<td>
<s:property value="details[3]"/>
</td>
</table>
</div>
<hr style="border-color:  #b9b9b9"/>
<div class="customHeader3" style="text-align: left;"></div><br/>
Appointment Details

<div style="border: 1px;border-color: black;">
<table cellpadding="8px;" align="center">
<tr>
<!-- <s:if test="%{#session.slotId=='17' || #session.slotId=='68' || #session.slotId=='69' || #session.slotId=='70' || #session.slotId=='71' || #session.slotId=='72' || #session.slotId=='73' || #session.slotId=='74' || #session.slotId=='75'}">
<th>Appointment Date</th><th>Appointment Time</th>
</s:if>
<s:else>
<th>Note:</th><th> This appointment is close until further order.</th>
</s:else>-->
<th>Appointment Date</th><th>Appointment Time</th><th>Appointment place</th>
</tr>
<tr><td><s:property value="details[0]"/></td><td><s:property value="details[1]"/></td><td><s:property value="details[2]"/></td></tr>
</table>
</div>
<hr style="border-color:  #b9b9b9"/>
<div class="customHeader3" style="text-align: left;"></div><br/>
Payment Details

<div style="border: 1px;border-color: black;">
<table cellpadding="8px;" align="center">
<tr><th>Payment Transaction No:</th><td><s:property value="details[7]"/></td></tr>
</table>
</div><hr style="border-color:  #b9b9b9"/>
<div class="customHeader3" style="text-align: left;"></div><br/>
</div>
<center><input type="button" value="Print" onclick="javascript:printDiv('ackDiv')"></center>

</td>
</tr>
</table>
</s:if>
</div>
</div>
</body>
</html>
