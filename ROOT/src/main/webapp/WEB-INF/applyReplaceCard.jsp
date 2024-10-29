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

<style type="text/css">
	.message {
		font-size: 18px !important; 
		line-height: 25px !important;
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
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
					<div class="customHeader2">
						<i class="step fi-graph-horizontal size-24"></i>  &nbsp;&nbsp;REPLACE SID
					</div>
				<s:if test="%{#session.SUCCESS_MESSAGE!=null}">
							<s:property value="#session.SUCCESS_MESSAGE"/>
					</s:if>
<s:form action="/replaceApplication.action" method="post" enctype="multipart/form-data">						
<table align="center">
						
	<tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">   Replace Details : 
	
			</div>
		</td>

	</tr>	
		
			<tr>
			<td>
			
				<s:select label="REPLACE REASON" name="replaceReason" id="state" required="true"  style="width:300px;" list="{'CORRECTION IN NAME','CORRECTION IN PLACE OF BIRTH','CORRECTION IN IDENTIFICATION CHARACTERISTICS','CORRECTION IN PHOTO','CORRECTION IN SIGNATURE','IF MULTIPLE CORRECTION THEN MENTION IN ATACCHED PDF'}">
					</s:select>
			</td>
		</tr>
		<tr>		<td><s:file name="replaceUpload" label="Upload DOCUMENTS" id="replaceUpload" style="text-align: center;" class="secondary button" > </s:file>
				
		</td></tr>
		<tr><td colspan="4" align="center">(Please upload pdf which must have i)CDC, ii)SID Card, iii)Reasons for multiple changes.Max. Size 900kb)</td></tr>
		<tr>
		<td colspan="4" align="center">
		<s:submit method="execute" value="Submit" theme="simple" class="medium button"/>
		</td>
		</tr>
		</table>
				<s:token/></s:form>		
					
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