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
						<i class="step fi-graph-horizontal size-24"></i>  &nbsp;&nbsp;
						<s:if test="%{#session.APPLICATION_STATUS=='APPLIED'}">
							Application Status
						</s:if>
						<s:else>
							SID Status
						</s:else>
						
					</div>
				
									
									<s:if test="%{#session.APPLICATION_STATUS=='APPLIED'}">
										<div class="panel callout radius message" style="text-align: center;">
											<br/>
											<span> You have already submitted an application for SID card .You can track your application by clicking
													Application status. </span><br/><br/>
												<s:a action="applicationStatus.action" > 
											 		<input type="button" class="secondary button" value=" Application Status " >
											 	</s:a>
										</div>
									</s:if>
									
									<s:else>
									
									<s:if test="%{#session.SID_CARD==NULL}">
										<div class="panel callout radius message" style="text-align: center;">
											<br/>
											<span style="color:red;">No SID Card issued for you . </span><br/><br/>
												<s:a action="Apply.action" > 
													<input type="button" class="secondary button" value=" Apply for SID " >
												</s:a>
										</div>
									</s:if>
							
									<s:if test="%{#session.SID_CARD.SIDStatus=='invalid'}">
										<div class="panel callout radius message" >
										<br/>
										
										
											Your SID has been <span style="color:red;">  expired </span> on 
											<s:property value="%{#session.SID_CARD.dateOfExpiry}"/>.<br/>
											Card Details are as follows : <br/>
											<br/>
											SID No : <s:property value="%{#session.SID_CARD.SIDNo}"/> <br/>
											SID Status : <span style="color:green;"> valid </span> .<br/><br/>
											Date of Issue : <s:property value="%{#session.SID_CARD.dateOfIssue}"/> <br/>
											Date of Expiry : <s:property value="%{#session.SID_CARD.dateOfExpiry}"/>
											<br/>
											<br/>
											You can apply for Renewal of SID card. <br/><br/>
											 <s:a action="renew.action" title="Renew SID"> 
											 <div class="center" style="text-align: center;">
											 		<input type="button" class=" button" value="Renew SID " >
											 </div>
											 </s:a>
										<br/>
										<br/>
										</div>
										
									</s:if>	
									<s:elseif test="%{#session.SID_CARD.SIDStatus=='valid'}">
										<div class="panel callout radius message">
											<br/>
											<s:if test="%{#session.CARD_STATUS=='ISSUED'}">
												You have been already issued SID card . 
											</s:if>
											<s:if test="%{#session.CARD_STATUS=='CAN_APPLY_FOR_RENEW'}">
												You have been already issued SID card .  
											</s:if>
											<!-- Nitin  Duplicate SID start--> 
											<s:if test="%{#session.CARD_STATUS=='CAN'T_APPLY_FOR_DUPLICATE'}">
												You have been already apply for Duplicate SID card .  
											</s:if>
											
											Your Previous Card Details are as follows : 
											<br/>
											<br/>
											
													SID No : <s:property value="%{#session.SID_CARD.SIDNo}"/> <br/>
													SID Status : <span style="color:green;"> valid </span> .<br/><br/>
													Date of Issue : <s:property value="%{#session.SID_CARD.dateOfIssue}"/> <br/>
													Date of Expiry : <s:property value="%{#session.SID_CARD.dateOfExpiry}"/>
											
										
											<br/>
											<br/>
											<!-- Nitin  Duplicate SID (end) --> 
											<s:if test="%{#session.CARD_STATUS=='CAN_APPLY_FOR_RENEW'}">
												You can apply for Renewal of SID card. <br/><br/>
											 <s:a action="renew.action" title="Renew SID"> 
											 	<div class="center" style="text-align: center;">
											 		<input type="button" class=" button" value="Renew SID " >
											 	</div>
											 		
											 </s:a>
											</s:if>
										</div>
									</s:elseif>
									
									</s:else>
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