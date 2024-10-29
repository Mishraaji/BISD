<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />

	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" media="screen" />
  	
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
 	<style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
    
    }
    

<style>

      .noPrint 
      {            
     			 display: none;     
      } 
            
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Sidstatus</title>
</head>
<body>


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
 <div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;" height="80%" >
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>

					<td width="75%" valign="top">
					<div class="customHeader2">
						<i class="step fi-graph-horizontal size-24"></i>  &nbsp;&nbsp;SID DETAILS
					</div>
				<br/><br/>
<s:form action="/suspendCard.action" method="post"
		style="width:100%;text-align:left; " validate="true" class="panel callout radius" theme="simple">
		
<table style="width: 90%; text-align: left; border: 1px solid #000;" align="center" >
	<tr>
		<th colspan="1">NAME</th>
		<td colspan="3"><s:property value="%{#session.firstname}"/></td>
		
	</tr>

	<tr>
	<th>NATIONALITY</th>
	<td><s:property value="%{#session.nationality}"/></td>
	<th>SEX</th>
	<td><s:property value="%{#session.gender}"/></td>
	</tr>
	
	<tr>
	<th>DATE OF BIRTH</th>
	<td><s:property value="%{#session.sid_dob}"/></td>
	</tr>
	<tr>
	<th>PLACE OF BIRTH</th>
	<td colspan="3"><s:property value="%{#session.pob}"/></td>
	</tr>
	
	<tr>
		<th>CDC NUMBER</th>
		<td><s:property value="%{#session.cdcno}"/></td>
		<th>SID NUMBER</th>
		<td><s:property value="%{#session.sidno}" /></td>
	</tr>
	
	<tr>
		<th>SID DATE OF ISSUE</th>
		<td><s:property value="%{#session.sid_doi}"/></td>
		<th>SID DATE OF EXPIRY</th>
		<td>
		<s:property value="%{#session.sid_doe}"/></td>
	</tr>
	
	<tr>
	<th>IDENTIFICATION MARK</th>
	<td colspan="3"><s:property value="%{#session.identification_mark}"/></td>
	</tr>
	
	<tr>
	<th>PLACE OF ISSUE</th>
	<td><s:property value="%{#session.poi}"/></td>
		<th>SID STATUS </th>
		<td><s:property value="%{#session.sid_status}"/></td>
		
	</tr>
	<tr>
	<td align="center" colspan="4">		
<s:submit type="button" value="Suspend" class="medium button"/></td>
</tr>
</table>

<s:token/>

</s:form>
<!-- <a href="#" onClick=" window.print(); return false">Print</a> -->
</td>
</tr>
</table>


</div>


</div>

<div class="row">

</div>
 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>
