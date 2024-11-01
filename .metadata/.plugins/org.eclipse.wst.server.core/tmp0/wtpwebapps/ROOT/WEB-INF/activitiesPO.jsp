<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

<title>Officer DashBoard</title>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<script>
$(document).ready(function(){
  $("#make_payment").click(function(){
    alert("NOTE: In case, if you have already done a successful payment but you are unable to take an appointment for SID. Please confirm with your bank and if payment is deducted from your bank, please do not make another payment and try to take appointment after two working days.");
  });
});
</script>
</head>
     <script  type="text/javascript">  
      
    function doSubmit()  
    {  
    window.open("ApplyNew.jsp");  
    }  
    </script> 
  
<body>
  





<div class="row">
	<div class="twelve column sideBar">
		
	
				
					<s:if test="%{#session.USER_ROLE==4}">
						<div class="customHeader2">
		    				<i class="step fi-thumbnails size-28"></i><s:a action="Welcome2JSP" style="color:white !important;">SEAFARER MENU</s:a>
		   				 </div>
						 <ul style="list-style-type: none;">
						 	<s:a action="Apply.action"> 
						 		
						 		<li><i class="step fi-pencil size-21"></i>  Apply for SID </li>
						 	</s:a>
						 	<s:a action="renew.action" > 
						 		
						 		<li><i class="step fi-refresh size-21"></i> Renew SID </li>
						 	</s:a>
							<s:a action="makePayment.action" id="make_payment"> 
						 		<li><i class="step fi-refresh size-21"></i> Make Payment </li>
						 	</s:a>
						 	<s:a action="takingAppointment" > 
						 		<li><i class="step fi-clock size-21"></i> Schedule Appointment</li>
						 	</s:a>
						 	<s:a action="cancelAppointment" > 
						 		<li><i class="step fi-x size-21"></i> Cancel Appointment</li>
						 	</s:a>
						 	
							<s:a action="printFormaction"> 
						 		<li><i class="step fi-print size-21"></i> Print Report</li>
						 	</s:a>
						 	
						 	<s:a action="printAck" > 
						 		<li><i class="step fi-print size-21"></i> Print Acknowledgement </li>
						 	</s:a>
						 	<s:a action="duplicate.action" > 
						 		
						 		<li><i class="step fi-foundation size-21"></i> Duplicate SID </li>
						 	</s:a>
						 	<!--<s:a action="sidStatus.action" > 
						 		<li><i class="step fi-check size-21"></i> SID Status </li>
						 	</s:a>
						 	--><s:a action="applicationStatus.action" > 
						 		<li><i class="step fi-graph-horizontal size-21"></i> Application Status </li>
						 	</s:a>
						 	
						 	
						 	<s:a action="statusJSP" > 
						 		<li><i class="step fi-graph-horizontal size-21"></i> SID Checker </li>
						 	</s:a>
						 	
						 	
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						 	
						 	
						 	<s:a href="HelpJSP" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 </ul>
				
					</s:if>
				
					<s:elseif test="%{#session.USER_ROLE==5}">
						<div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> DCO Menu
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
						 	<s:a action="viewAppointments.action" > 
						 		<li><i class="step fi-clock size-21"></i> View Appointments</li>
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
								<li><i class="fa fa-history size-21"></i> Applications History</li>
							</s:a>
						 	<!-- Sidharth Bhawal -->
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/DeoHelp.jsp" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
				
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==6}">
						<div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> VO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="getApplications.action" >
								<s:param name="typeApp">newApp</s:param>
								<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Applications </li>
						 	</s:a>
						 	
						 	<!-- View Replace Seafer Appointents to vo Avinash khade -->
						 	<%-- <s:a action="getReplaceApplications.action" >
								<s:param name="typeApp">newApp</s:param>
								<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-pencil size-21"></i>Replace Card Applications </li>
						 	</s:a> --%>
						 	
						 	<%-- <s:a action="rejectedApplications.action" > 
							<s:param name="rePrint">newn</s:param>
						 		<li><i class="step fi-refresh size-21"></i> Rejected Applications</li>
						 	</s:a> --%>
						 <%-- 	<s:a action="#" > 
						 		<li><i class="step fi-clock size-21"></i> View Appointments</li>
						 	</s:a> --%>
						 	<s:a action="viewPrintForms.action" >
						 		<li><i class="step fi-print size-21"></i> Print Report</li>
						 	</s:a>
						 	<s:a action="verifiedApplications.action" >
							<s:param name="rePrint">newn</s:param>  
						 		<li><i class="step fi-check size-21"></i> Verified Applications</li>
						 	</s:a>
						 	<!-- Sidharth Bhawal -->
						 	<s:a action="applicationsHistory.action" >								
								<li><i class="fa fa-history size-21"></i> Applications History</li>
							</s:a>
						 	<!-- Sidharth Bhawal -->
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
							 <s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/voHelp.jsp" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==7}">
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
								<li><i class="fa fa-history size-21"></i> Applications History</li>
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
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==8}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> PO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="cardForPrinting.action" >  
								<s:param name="typeApp">newApp</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Cards </li>
						 	</s:a>
						 	<!--<s:a action="#" > 
						 		<li><i class="step fi-pencil size-21"></i> Card Tracker </li>
						 	</s:a>-->
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						  	<!--<a href="${pageContext.request.contextPath}/jsp/Help/ioHelp.jsp" >  
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</a>
						 --></ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==9}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> DO Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a action="cardForPrinting.action" >  
								<s:param name="typeApp">newApp</s:param>
						 		<li><i class="step fi-pencil size-21"></i> New Cards </li>
						 	</s:a>
						 	<s:a action="dispatchedCards.action" >  
								<s:param name="typeApp">dispatchApp</s:param>
						 		<li><i class="step fi-pencil size-21"></i> Dispatched Cards </li>
						 	</s:a>
						 <!-- Vinay -->
						 	<s:a action="applicationsHistory.action" >								
								<li><i class="fa fa-history size-21"></i> Applications History</li>
							</s:a>
						 	<!-- Vinay -->
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						  	<!--<s:a action="#" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 --></ul>
					</s:elseif>
					<!-- written by Sidharth Bhawal -->
					<s:elseif test="%{#session.USER_ROLE==13}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i> Reception
		   				 </div>
   						  <ul style="list-style-type: none;" >
   						  
   						    <s:a action="addtoken.action" >								
								<li><i class="step fi-pencil size-21"></i> Add Token</li>
							</s:a>
						 	<!-- Sidharth Bhawal -->
						 	<s:a action="applicationsHistory.action" >								
								<li><i class="fa fa-history size-21"></i> Applications History</li>
							</s:a>
						 	<!-- Sidharth Bhawal -->
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
							<s:a action="changePasswordOfficerJSP" > 
						 		<li><i class="step fi-info size-21"></i> Change Password </li>
						 	</s:a>
						  	</ul>
					</s:elseif>
					<%-- <s:elseif test="%{#session.USER_ROLE==11}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i>Admin Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a href="home.jsp"> 
						 		<li><i class="step fi-home size-21"></i>Home</li>
						 	</s:a>
						 
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<s:a action="#" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 </ul>
					</s:elseif>
					<s:elseif test="%{#session.USER_ROLE==1}">
						  <div class="customHeader2">
		    				<i class="step fi-list-thumbnails size-28"></i>Centre Admin Menu
		   				 </div>
   						  <ul style="list-style-type: none;" >
						 	<s:a href="centerhome.jsp"> 
						 		<li><i class="step fi-home size-21"></i>Home</li>
						 	</s:a>
						 
						 	<s:a action="logout.action" > 
						 		<li><i class="step fi-power size-21"></i> Logout </li>
						 	</s:a>
						  	<s:a action="#" > 
						 		<li><i class="step fi-info size-21"></i> Help </li>
						 	</s:a>
						 </ul>
					</s:elseif> --%>
				
				 
			
			
				
	</div>
</div>



 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
</script>
	
</body>

</html>




