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
<s:if test="%{#session.USER_ROLE==4}">
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>
</s:if>
 <hr style="border-color:  #b9b9b9"/>

<s:if test="%{#session.USER_ROLE==null}">


<%
    response.sendRedirect("AdminHome.action");
%>


 
</s:if>
<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
					<div class="customHeader2">
						<i class="step fi-graph-horizontal size-24"></i>  &nbsp;&nbsp;Application Status
					</div>
				<br/><br/>
							
									<s:if test="%{#session.APPLICATION_STATUS==0}">
										<div class="panel callout radius">Application not found , <s:a action="Apply.action"> Click here </s:a> to apply for SID Card. </div>
									</s:if>	
									<s:if test="%{#session.APPLICATION_STATUS==1 && #session.APPOINTMENT_STATUS==8}">
										<div class="panel callout radius message">Your Online Application for SID Card has been Successfully Submitted , 
										<s:a action="takingAppointment"> Click here </s:a> to Schedule Appointment
											for document verification.   </div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==1 && #session.APPOINTMENT_STATUS==9}">
										<div class="panel callout radius message">You have successfully submitted online application for SID card.  <br/>
										<!-- <s:if test="%{#session.slotId=='17' || #session.slotId=='68' || #session.slotId=='69' || #session.slotId=='70' || #session.slotId=='71' || #session.slotId=='72' || #session.slotId=='73' || #session.slotId=='74' || #session.slotId=='75'}">
										
										Your appointment details for document verification are as follows : <br/><br/>
											Date : <s:property value="%{#session.APPOINTMENT.timeStamp}"/> <br/>
											Time Slot : <s:property value="%{#session.APPOINTMENT.startTime}"/> to  
														<s:property value="%{#session.APPOINTMENT.endTime}"/> <br/>
											Shipping Master Office : <s:property value="%{#session.APPOINTMENT.centreAddress}"/>  <br/><br/><br/>
											
											Note : In case, you are unable to make it on scheduled date , you can cancel and <s:a action="takingAppointment" title="Shcedule Appointment">reschedule</s:a>
											 the appointment
											  </s:if>
											 <s:else>
									        Note: This appointment is close until further order.
									      </s:else>  -->
									      
									      
									      Your appointment details for document verification are as follows : <br/><br/>
											Date : <s:property value="%{#session.APPOINTMENT.timeStamp}"/> <br/>
											Time Slot : <s:property value="%{#session.APPOINTMENT.startTime}"/> to  
														<s:property value="%{#session.APPOINTMENT.endTime}"/> <br/>
											Shipping Master Office : <s:property value="%{#session.APPOINTMENT.centreAddress}"/>  <br/><br/><br/>
											
											Note : In case, you are unable to make it on scheduled date , you can cancel and <s:a action="takingAppointment" title="Shcedule Appointment">reschedule</s:a>
											 the appointment
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==2}">
										<div class="panel callout radius message">
											Your application and documents have been submitted successfully .<br/> your application is under next level of 
											verification by DG Shipping authorities . <br/> You will be notified as the SID will be generated for you.
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==3}">
										<div class="panel callout radius message">
											Your application and documents have been verified successfully .<br>
											Please visit Scheduled Appointment Center on scheduled date for data capturing<br>
											with original CDC and original Passport.
											
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==4 && #session.APPOINTMENT_STATUS==8}">
										<div class="panel callout radius message">
											Your application has been halt at document verification stage . If you are ready with the proper documents
											as mentioned on form . You can <s:a action="takingAppointment" title="Shcedule Appointment">reschedule</s:a>
											 the appointment for document verification .
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==17 && #session.APPOINTMENT_STATUS==8}">
										<div class="panel callout radius message">
										Your application has been rejected at document verification stage due to following reasons : <br/>
										<font size="3" color="red"> <s:property value="%{#session.SEAFARER_REMARK}"/> </font> <br>
										Your appointment has been cancelled automatically. <br/>
										Applicant is requested to take corrective action.<br>
									
										Rejection of SID application due to following reasons,<br>
										<ul>
								<li><font size="4">If name is not as per CDC</font> <s:a action="getDocs.action">click Here</s:a></li>
								<li><font size="4">If CDC expiry date not updated then applicant has to mail concerned shipping office.</font></li>
								
								</ul>
								<br>
								<s:if test="%{#session.SEAFARER_REJECT_REMARK==null}">
								<p><font face="verdana" color="green">Have You Done Necessary Changes then  <s:a action="rejectApplicationStatus.action"> 
										click Here
											</s:a></font></p>
								 </s:if>
								<s:if test="%{#session.SEAFARER_REJECT_REMARK==1}">
								 <fieldset>
  									<legend>Status :</legend>
								 Your Application Approval is in Process.
								</fieldset>
								</s:if>
								<s:if test="%{#session.SEAFARER_REJECT_REMARK==2}">
								 <fieldset>
  									<legend>Status :</legend>
								 Your Application Approval is in Process.
								</fieldset>
								</s:if>
								<s:if test="%{#session.SEAFARER_REJECT_REMARK==3}">
								 <fieldset>
  									<legend>Status :</legend>
								It seems like you have not made necessary changes in Egovernance/INDOS, <br>
								for further processing please make necessary changes in <a href="http://220.156.189.33/esamudraUI/well.do?method=loadPage">Egovernance/INDOS</a>
								</fieldset>
								
								
								</s:if>
								<s:if test="%{#session.SEAFARER_REJECT_REMARK==0}">
								</s:if>
								
										<!-- To re-apply for SID card, please <s:a action="takingAppointment" title="Shcedule Appointment">reschedule</s:a> the appointment. -->
									</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==4 && #session.APPOINTMENT_STATUS==9}">
										<div class="panel callout radius message">
											Your application has been rejected at document verification stage .<br/>
											Your appointment details are as follows : <br/><br/>
										
											Date : <s:property value="%{#session.APPOINTMENT.timeStamp}"/> <br/>
											Time Slot : <s:property value="%{#session.APPOINTMENT.startTime}"/> to  
														<s:property value="%{#session.APPOINTMENT.endTime}"/> <br/>
											Address : <s:property value="%{#session.APPOINTMENT.centreAddress}"/>  <br/><br/><br/>
											
											Note : In case, you are unable to make it on scheduled date , you can cancel and <s:a action="takingAppointment" title="Shcedule Appointment">reschedule</s:a>
											 the appointment
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==5}">
										<div class="panel callout radius message">
											Your SID Card has been issued and it's forwarded for printing.
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==6}">
										<div class="panel callout radius message">
											Your SID Card is ready and forwarded for dispatch . We will notify you as we dispatched the card.
										</div>
									</s:if>
									<s:if test="%{#session.APPLICATION_STATUS==7}">
										<div class="panel callout radius message">
											Your SID Card has been dispatched to the following address. <br/>
											<s:property value="%{#session.SEAFARER_ADDRESS.houseNo}"/> ,<s:property value="%{#session.SEAFARER_ADDRESS.street}"/> <br/>
											<s:property value="%{#session.SEAFARER_ADDRESS.village}"/> , <s:property value="%{#session.SEAFARER_ADDRESS.district}"/> <br/>
											<s:property value="%{#session.SEAFARER_ADDRESS.pinCode}"/> <br/>
											<s:property value="%{#session.SEAFARER_ADDRESS.state}"/> <br/><br/>
											
											Docket No : <s:property value="%{#session.SEAFARER_ADDRESS.docketNo}"/><br/>
											Delivery Status : <s:if test="%{#session.DELIVERY_STATUS}"> Delivered on above address at 
																	<s:property value="%{#session.SEAFARER_ADDRESS.deliveryDate}"/>  .
															 </s:if>
															 <s:else>
															 		Dispatched .
															 </s:else>
									</div>	
									</s:if>
									<br>
									<div class="panel callout radius message">
									<font size="3" color="orange">Note: Payment expires after three months.</font>
									<br>Payment Status:
									<s:if test="%{#session.PaymentStatus==false}">
									<font size="3" color="red">Make Payment.</font>
									</s:if>
									<s:if test="%{#session.PaymentStatus==true}">
									<font size="3" color="green"> Active.</font>
									</s:if>
									<s:if test="%{#session.PaymentStatus==null}">
									<font size="3" color="red"> Make Payment</font>
									</s:if>
									</div>
					
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