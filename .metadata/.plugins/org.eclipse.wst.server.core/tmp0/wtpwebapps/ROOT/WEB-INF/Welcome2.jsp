<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
 span {
background-color: #008cba;
border-color: #007095;
color: white;
font-weight:bold;
cursor: default;
opacity: 0.7;
box-shadow: none;
padding: 5px 5px 5px 5px;
 border: 1px solid  #007095;
    border-radius: 3px;
} 

#table-wrapper {
  position:relative;
}
#table-scroll {
  height:500px;
  overflow:auto;  
  margin-top:20px;
}
#table-wrapper table {
  width:100%;
    
}
#table-wrapper table thead th .text {
  position:absolute;   
  top:-20px;
  z-index:2;
  height:20px;
  width:35%;
} 
</style>
<title>Welcome</title>
  	
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    
   

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
						<div  data-alert class="alert-box warning radius" style="color: black !important;">
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
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> 


				--><td width="75%" valign="top">
					
					   
					   <div class="customHeader">
					   		<i class="step fi-list-bullet size-40 "></i>
					   		Steps for Online SID Application  
					   	</div>
						<br/>
						<div>

						 <div id="table-wrapper">
  <div id="table-scroll">
						<table>
				                        <tr>
							<td>
							<span>Step 1</span>
							</td>					
							<td>
							Before proceeding you must read the  <s:a action="InstructionsJSP">general instructions</s:a> and collect the <s:a action="ReqdocJSP">required documents</s:a>.
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 2</span>
							</td>					
							<td>Login to the SID portal with your INDOS number and the password.
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 3</span>
							</td>					
							<td>
							Click on the Link "Apply for SID" 
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 4</span>
							</td>					
							<td>
							Check the personal details in the form and click to continue.
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 5</span>
							</td>					
							<td>
							Fill the address details and click continue 
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 6</span>
							</td>					
							<td>
							Fill other details and click continue
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 7</span>
							</td>					
							<td>
							Make payment through e-payment portal 
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 8</span>
							</td>					
							<td>
							Submit the application 
							</td>
							</tr>
							<tr>
							<td>
							<span>Step 9</span>
							</td>					
							<td>
							Click on "Schedule Appointment" on the screen to schedule an appointment.
							</td>
							</tr>
							<tr>
							<td>
							<span>Step10</span>
							</td>					
							<td>
							Select the collection centre along with the date and time from the slots available. 
							</td>
							</tr>
							<tr id="ste11">
							<td>
							<span>Step11</span>
							</td>					
							<td>
							Your application would be transmitted online to the verification officer, who will check the application.
							</td>
							</tr>
                                                        <tr id="ste12">
							<td>
							<span>Step12</span>
							</td>					
							<td>
							Within 10 days of submission of application, you will receive a notification on the verification result of the application through an e-mail and SMS.
							</td>
							</tr>
							<tr id="ste13">
							<td>
							<span>Step13</span>
							</td>					
							<td>You are informed that the fee once paid is non-refundable. Your appointment would be treated as confirmed, only on payment of the fee.
							</td>
							</tr>
<tr id="ste14">
							<td>
<span>Step14</span>
							</td>					
							<td>If you wish to reschedule your confirmed appointment (after payment of fee), same can be done do so for maximum two more occasions (excluding the first appointment). If you reschedule your appointment for more than two occasions, then you will have to pay the fee again. In other words fee once paid is valid only for three appointments.
							</td>
							</tr>
							<tr id="ste15">
							<td>
							<span>Step15</span>
							</td>					
							<td>Please report to the collection centre at the appointed date and time.
							</td>
							</tr>
							<tr id="ste16">
							<td>
								<span>Step16</span>
							</td>					
							<td>Please bring the printout of the Print report/Acknowledgment report,original passport,original CDC and the copy receipt of payent for verification.Data capturing personanel,after examining your dcuments would return the same and caputre your biometric data i.e photograph.
							</td>
							</tr>
							<tr id="ste17">
							<td>
							<span>Step17</span>
							</td>					
							<td>Seafarers Identity Document would be issued and printed. 
							</td>
							</tr>
							<tr id="ste18">
							<td>
							<span>Step18</span>
							</td>					
							<td>Same shall be dispatched by speed post AD within two working days. 
							</td>
							</tr>
<tr id="ste19">
<td colspan=2>
<span>Appellate mechanism</span>
<br> <br> 
The appellate mechanism in case, the candidate is denied an SID-- The appellate mechanism would be offline. First appellate authority would be the Principal Officer. The candidate may approach the Principal Officer having jurisdiction over the shipping master. The Principal Officer, shall, after giving an opportunity y to the candidate of being heard, may pass an order within 15 days of the appeal. 
</td>
</tr>
<tr id="ste20">
<td colspan=2>
In case, the Candidate is not satisfied with the order of the Principal Officer, he may file a second appeal with the Director General of Shipping, who after giving an opportunity to the candidate, may pass an order within thirty days of such appeal.
</td>
</tr>
							</table></div></div>
</div>
</div>
		<jsp:include page="footer.jsp"></jsp:include>	
	</div>
</div>

 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
	<script type="text/javascript">
   $(window).load(function() {
       $("#featured").orbit();
   });
</script>
</body>

</html>




