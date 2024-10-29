<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
 <div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>
<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td rowspan="2" width="25%" valign="top">
				<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
				<td width="75%" valign="top">
<div class="customHeader2" style="text-align: left;">
&nbsp;&nbsp;<i class="step fi-clock size-24"></i> FIR Details
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
<s:form method="post" validate="true" id="firApprove"  name="firApprove" action="/approveReplaceSID">
		<table align="center">
		<%-- <tr>
			<td><s:textfield label="FIR No" name="firNo" readonly="true" value="%{#session.DUPLICATEAPPCARD.applicationId}" /></td>
			</tr>
 --%>			<%-- <tr>
			
			<td>
			<s:textfield label="Dated" name="firDate" id="date" readonly="true" value="%{#session.DUPLICATEAPPCARD.firDate}"/>
			</td>
		</tr>
		 --%>
		<tr>
			<td colspan="2"> <s:textfield id="txtbox" label="Replace Reason" name="replace_reason" readonly="true" style="width: 100%;height: 50px; size : 40px" value="%{#session.CURRENT_APPLICATION.replace_reason}"/></td>
		</tr>
		<tr>	
         			<td colspan="4" align="center"><s:a action="takeDocument.action" name="replaceUpload" id="replaceUpload" style="text-align: center;">View CDC</s:a>
				</tr>
		</td>
	<tr>		<td colspan="4" align="center"><s:a action="takeDocument.action" name="replaceDoc" id="replaceDoc" style="text-align: center;">View SID</s:a>
				
		</td>
		</tr>
		<%-- <tr>
			
			<td><s:textfield label="District" name="firDistrict" readonly="true" value="%{#session.DUPLICATEAPPCARD.firDistrict}"/></td>
			</tr> --%>
			<tr>
			<%-- <td>
			
				<s:textfield label="State" name="replace_reason" id="replace_reason" readonly="true" value="%{#session.REPLACEDETAILS.replace_reason}"></s:textfield>
			</td> --%>
		</tr>
		<%-- <tr>		<td colspan="4" align="Left"><s:a action="takeProof.action" name="firUpload" id="firUpload" style="text-align: center;">Download SID </s:a>
				<td colspan="4" align="right"><s:a action="takeProof.action" name="firUpload" id="firUpload" style="text-align: center;">Download Document</s:a>
		</td>
		</tr> --%>
		<tr>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
				<tr>
		<td colspan="4" align="center">
		<%-- <s:submit method="execute" value="Approve" theme="simple" class="medium button"/> --%>
		</td>
		</tr>
		</table>
				<s:token/></s:form>		
					
				</td>
			</tr>
		</table>
		
</div>
</div>
</body>
</html>