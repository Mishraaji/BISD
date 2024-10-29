<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<title>BSID | Log in </title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    
    
    <style type="text/css">
    .label {
    	font-size: 20px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
    
    <style>
    .blink_text {

    animation:1s blinker linear infinite;
    -webkit-animation:1s blinker linear infinite;
    -moz-animation:1s blinker linear infinite;

     color: red;
    }

.blink_text_sup {
animation-name: example;
    animation:1s example linear infinite;
    -webkit-animation:1s example linear infinite;
    -moz-animation:1s example linear infinite;

     color: black;
    }
    @keyframes example {
  
       0%   {color: red;}
  25%  {color: yellow;}
  50%  {color: blue;}
  100% {color: green;}
  }

    @-moz-keyframes blinker {  
     0% { opacity: 0.0; }
     50% { opacity: 0.5; }
     100% { opacity: 1.0; }
     }

    @-webkit-keyframes blinker {  
     0% { opacity: 0.0; }
     50% { opacity: 0.5; }
     100% { opacity: 1.0; }
     }

    @keyframes blinker {  
     0% { opacity: 0.0; }
     50% { opacity: 0.5; }
     100% { opacity: 1.0; }
     }
.steps span{
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

.myTable td {
	
	line-height: 0.9rem;
}

.label {
	line-height: 0.9rem !important;
}


.myTable input[type="text"], input[type="password"] {
	
font-size: 0.875rem;
margin: 0 0 0.5rem 0;
padding: 0.5rem;
height: 2.5rem;
}

form {
margin: 0 0 0 0;

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
    
     <s:head />
</head>

<body onload="window.history.forward(1);">
<script type="text/javascript">

$(document).ready(function() {
	checkbrowser();
	$("input[type='text']").bind('copy paste cut',function(e) { 
		e.preventDefault(); //disable cut,copy,paste
	});
document.getElementById("ste11").style.display= "none";
document.getElementById("ste12").style.display= "none";
document.getElementById("ste13").style.display= "none";
document.getElementById("ste14").style.display= "none";
document.getElementById("ste15").style.display= "none";
document.getElementById("ste16").style.display= "none";
document.getElementById("ste17").style.display= "none";
document.getElementById("ste18").style.display= "none";
document.getElementById("ste19").style.display= "none";
document.getElementById("ste20").style.display= "none";
/*document.getElementById("steH11").style.display= "none";
document.getElementById("steH12").style.display= "none";
document.getElementById("steH13").style.display= "none";
document.getElementById("steH14").style.display= "none";
document.getElementById("steH15").style.display= "none";
document.getElementById("steH16").style.display= "none";
document.getElementById("steH17").style.display= "none";
document.getElementById("steH18").style.display= "none";
document.getElementById("steH19").style.display= "none";
document.getElementById("steH20").style.display= "none";*/
document.getElementById("showlesssteps").style.display= "none";
	});

	   /* $(function(){
	       $('#login').ebcaptcha();
	   }); */

function moresteps()
{
document.getElementById("showlesssteps").style.display= "";
document.getElementById("showsteps").style.display= "none";
document.getElementById("ste11").style.display= "";
document.getElementById("ste12").style.display= "";
document.getElementById("ste13").style.display= "";
document.getElementById("ste14").style.display= "";
document.getElementById("ste15").style.display= "";
document.getElementById("ste16").style.display= "";
document.getElementById("ste17").style.display= "";
document.getElementById("ste18").style.display= "";
document.getElementById("ste19").style.display= "";
document.getElementById("ste20").style.display= "";
/*document.getElementById("steH11").style.display= "";
document.getElementById("steH12").style.display= "";
document.getElementById("steH13").style.display= "";
document.getElementById("steH14").style.display= "";
document.getElementById("steH15").style.display= "";
document.getElementById("steH16").style.display= "";
document.getElementById("steH17").style.display= "";
document.getElementById("steH18").style.display= "";
document.getElementById("steH19").style.display= "";
document.getElementById("steH20").style.display= "";*/
}

function lesssteps()
{
document.getElementById("showsteps").style.display= "";
document.getElementById("ste11").style.display= "none";
document.getElementById("ste12").style.display= "none";
document.getElementById("ste13").style.display= "none";
document.getElementById("ste14").style.display= "none";
document.getElementById("ste15").style.display= "none";
document.getElementById("ste16").style.display= "none";
document.getElementById("ste17").style.display= "none";
document.getElementById("ste18").style.display= "none";
document.getElementById("ste19").style.display= "none";
document.getElementById("ste20").style.display= "none";
/*document.getElementById("steH11").style.display= "none";
document.getElementById("steH12").style.display= "none";
document.getElementById("steH13").style.display= "none";
document.getElementById("steH14").style.display= "none";
document.getElementById("steH15").style.display= "none";
document.getElementById("steH16").style.display= "none";
document.getElementById("steH17").style.display= "none";
document.getElementById("steH18").style.display= "none";
document.getElementById("steH19").style.display= "none";
document.getElementById("steH20").style.display= "none";*/
document.getElementById("showlesssteps").style.display= "none";
}

function checkbrowser(){
	
    
	 if (!(navigator.userAgent.indexOf("Chrome") > 0)) {
       
    }
    else
    	{
    	alert("Please use mozilla firefox browser to login.");
		document.getElementById("loginBrowserCheck").style.visibility="hidden";
		try {
			document.getElementById("loginBrowserCheck").remove();
			}
			catch(err) {
			  
			}
    	}

}

function formscript()
{
	document.getElementById("login").action="${pageContext.request.contextPath}/monitorscript";
	document.getElementById("login").submit();
	return true;
}

    
    </script>
<s:actionerror />
<noscript>
<style type="text/css">
        #loginBrowserCheck {visibility:hidden;}
    </style>
    <div class="noscriptmsg" style="font-size: 20px;;color: red;padding-left: 12%;padding-top: 1%;padding-bottom: 1%;">
    JavaScript is turned off in your web browser. Turn it on to take full advantage of this site, then refresh the page.
    </div>
</noscript>

 <jsp:include page="header.jsp"></jsp:include>





<div class="row">

<div class="small12 columns" style="text-align: center;">
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
 


<%-- <div style="position:absolute; top:0px;">
					<s:if test="%{#session.ERROR_MESSAGE!=null}">
						<div data-alert class="alert-box warning radius" >
							<s:property value="#session.ERROR_MESSAGE"/>
							 <a href="#" class="close">&times;</a>
						</div>
					<s:set value="session.ERROR_MESSAGE" scope="session" var="ERROR_MESSAGE"> </s:set>
						<s:set  value="ERROR_MESSAGE" scope="session" var="ERROR_MESSAGE"> </s:set>
					</s:if>
					
					<s:if test="%{#session.SUCCESS_MESSAGE!=null}">
						<div  data-alert class="alert-box info radius">
							<s:property value="#session.SUCCESS_MESSAGE"/>
							 <a href="#" class="close">&times;</a>
						</div>
						<s:set value="session.SUCCESS_MESSAGE" scope="session" var="SUCCESS_MESSAGE" var=""> </s:set>
						<s:set  value="SUCCESS_MESSAGE" scope="session" var="SUCCESS_MESSAGE"> </s:set>
					</s:if>
			
</div> --%>

</div>
</div>
<br/>
<div>

<div class="row">
<div id="notice" class="small-12 columns" style="background-color: lightblue;text-align: center;"></div>

<div class="small-7 columns" style="text-align: center;">

	
						
						
						<div>
<div id="table-wrapper">
  <div id="table-scroll">
						<table class="steps myTable">
							<tr>
								<td colspan="2">
										<div class="customHeader2 ">
					   						<i class="step fi-list-bullet size-40 "></i>
					   						Steps for Online SID Application <a href="#" data-reveal-id="myModal"><span style="text-align:right !important;color:white !important;border:none;">(हिंदी)</span></a><br/> 
					   					</div>
								 </td>
							</tr>
						
						
							<tr>
							<td align="right">
							1
							</td>					
							<td width="80%">
							Before proceeding you must read the  <a href="${pageContext.request.contextPath}/Instructions.jsp">general instructions</a> and collect the <a href="${pageContext.request.contextPath}/Reqdoc.jsp">required documents</a>.
							</td>
							</tr>
							<tr>
							<td align="right">
							2
							</td>					
							<td>Login to the SID portal with your INDOS number and the password.
							</td>
							</tr>
							<tr>
							<td align="right">
							3
							</td>					
							<td>
							Click on the Link "Apply for SID" 
							</td>
							</tr>
							<tr>
							<td align="right">
							4
							</td>					
							<td>
							Check the personal details in the form and click to continue.
							</td>
							</tr>
							<tr>
							<td align="right">
							5
							</td>					
							<td>
							Fill the address details and click continue 
							</td>
							</tr>
							<tr>
							<td align="right">
							6
							</td>					
							<td>
							Fill other details and click continue
							</td>
							</tr>
							<tr>
							<td align="right">
							7
							</td>					
							<td>
							Make payment through e-payment portal 
							</td>
							</tr>
							<tr>
							<td align="right">
							8
							</td>					
							<td>
							Submit the application 
							</td>
							</tr>
							<tr>
							<td align="right">
							9
							</td>					
							<td>
							Click on "Schedule Appointment" on the screen to schedule an appointment.
							</td>
							</tr>
							<tr>
							<td align="right">
							10
							</td>					
							<td>
							Select the collection centre along with the date and time from the slots available. 
							</td>
							</tr>
							<tr id="ste11">
							<td align="right">
							11
							</td>					
							<td>
							Your application would be transmitted online to the verification officer, who will check the application.
							</td>
							</tr>
                            <tr id="ste12">
							<td align="right">
							12
							</td>					
							<td>
							Within 10 days of submission of application, you will receive a notification on the verification result of the application through an e-mail.
							</td>
							</tr>
							<tr id="ste13">
							<td align="right">
							13
							</td>					
							<td>You are informed that the fee once paid is non-refundable. Your appointment would be treated as confirmed, only on payment of the fee.
							</td>
							</tr>
							<tr id="ste14">
							<td align="right">
							14
							</td>					
							<td>If you wish to reschedule your confirmed appointment (after payment of fee), same can be done do so for maximum two more occasions (excluding the first appointment). If you reschedule your appointment for more than two occasions, then you will have to pay the fee again. In other words fee once paid is valid only for three appointments.
							</td>
							</tr>
							<tr id="ste15">
							<td align="right">
							15
							</td>					
							<td>Please report to the collection centre at the appointed date and time.
							</td>
							</tr>
							<tr id="ste16">
							<td align="right">
							16
							</td>					
							<td>Please bring the printout of the Print report/Acknowledgment report,original passport,original CDC and the copy receipt of payent for verification.Data capturing personanel,after examining your dcuments would return the same and caputre your biometric data i.e photograph.
							</td>
							</tr>
							<tr id="ste17">
							<td align="right">
							17
							</td>					
							<td>Seafarers Identity Document would be issued and printed. 
							</td>
							</tr>
							<tr id="ste18">
							<td align="right">
							18
							</td>					
							<td>Same shall be dispatched by speed post AD within two working days. 
							</td>
							</tr>  
							<tr id="ste19">
							<td colspan=2>
							<span>Appellate mechanism</span>
							<br> <br>  The appellate mechanism in case, the candidate is denied an SID-- The appellate mechanism would be offline. First appellate authority would be the Principal Officer. The candidate may approach the Principal Officer having jurisdiction over the shipping master. The Principal Officer, shall, after giving an opportunity y to the candidate of being heard, may pass an order within 15 days of the appeal. 
							</td>
							</tr>
							<tr id="ste20">
							<td colspan=2>
							In case, the Candidate is not satisfied with the order of the Principal Officer, he may file a second appeal with the Director General of Shipping, who after giving an opportunity to the candidate, may pass an order within thirty days of such appeal.
							</td>
							</tr>
							</table></div></div>
<input type="button" onClick="moresteps()" value="Read More" id="showsteps">
<input type="button" onClick="lesssteps()" value="Read Less" id="showlesssteps">
<br/>


<div id="myModal" class="reveal-modal" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog" style="width:60%;left: 60%;background-color: #e0ffff;">
  <div id="table-wrapper">
  <div id="table-scroll">
						<table class="steps myTable">
							<tr>
								<td colspan="2">
										<div class="customHeader2 ">
					   						<i class="step fi-list-bullet size-40 "></i>
					   						ऑनलाइन सीड आवेदन के लिए निम्‍नलिखित चरण<br/> 
					   					</div>
								 </td>
							</tr>
						
						
							<tr>
							<td align="right">
							1
							</td>					
							<td width="80%">
							प्रक्रिया  करने से पहले आप सभी <a href="${pageContext.request.contextPath}/Reqdoc.jsp">आवश्‍यक कागजात</a> और <a href="${pageContext.request.contextPath}/Instructions.jsp">सामान्‍य निर्देशों</a> को पढ लें |
							</td>
							</tr>
							<tr>
							<td align="right">
							2
							</td>					
							<td>आपके इनडोस नं.और पासवर्ड से सीड पोर्टल लॉगीन करें |
							</td>
							</tr>
							<tr>
							<td align="right">
							3
							</td>					
							<td>
							अपलाय फार सीड पर लिंक कर क्लिक करें  |
							</td>
							</tr>
							<tr>
							<td align="right">
							4
							</td>					
							<td>
							फार्म में वैयक्तिक विवरण जॉच लें और क्लिक करें |
							</td>
							</tr>
							<tr>
							<td align="right">
							5
							</td>					
							<td>
							संपूर्ण पता भरे और क्लिक करें | 
							</td>
							</tr>
							<tr>
							<td align="right">
							6
							</td>					
							<td>
							अन्‍य विवरण भी भरे और क्लिक करें |
							</td>
							</tr>
							<tr>
							<td align="right">
							7
							</td>					
							<td>
							 इ पेमेन्‍ट पोर्टल के माध्‍यम से भूगतान करें |
							</td>
							</tr>
							<tr>
							<td align="right">
							8
							</td>					
							<td>
							आवेदन प्रस्‍तुत करें |
							</td>
							</tr>
							<tr>
							<td align="right">
							9
							</td>					
							<td>
							अपाइंटमेन्‍ट शेडयूल पर क्लिक करने पर अपाइंटमेन्‍ट  की शेडयूल स्क्रिन पर दिखाई देगी |
							</td>
							</tr>
							<tr>
							<td align="right">
							10
							</td>					
							<td>
							 उपलब्‍ध स्‍लाट से कलेक्‍शन सेन्‍टर के साथ दिनांक और समय सिलेक्‍ट करें | 
							</td>
							</tr>
							<tr id="ste11">
							<td align="right">
							11
							</td>					
							<td>
							 आपके आवेदन सत्‍यापित अधिकारी द्वारा जॉच करने पर ऑनलाइन हस्‍तांतरित किए जाएंगे |
							</td>
							</tr>
                            <tr id="ste12">
							<td align="right">
							12
							</td>					
							<td>
							10 दिन के भीतर आवेदन प्रस्‍तुत करने होगें, आवेदन का सत्‍यापन करने पर इमेल के माध्‍यम से अधिसूचना भेजी जाएगी |
							</td>
							</tr>
							<tr id="ste13">
							<td align="right">
							13
							</td>					
							<td>आपको यह सूचित किया जाता है कि शुल्‍क भूगतान होने पर शुल्‍क की वापसी नहीं की जाएगी. आपकी नियुक्ति भूगतान शुल्‍क प्राप्‍त होने पर ही विचारणीय होगी |
							</td>
							</tr>
							<tr id="ste14">
							<td align="right">
							14
							</td>					
							<td>(शुल्‍क भूगतान के बाद ही ) अपाइन्‍टमेंट रिशेडयूल विचारणीय होगी,अधिकतम दो और मौकों के लिए ऐसा किया जा सकता है.(पहले अपाइन्‍टमेंट को छोडकर).यदि आप दो से अधिक अवसरों के लिए अपनी नियुक्ति का पुनरीक्षण कर रहे हैं, तब आपको फिर से शुल्‍क का भुगतान करना होगा. दूसरे शब्‍दों में शुल्‍क का भुगतान केवल तीन नियुक्तियों के लिए मान्‍य है |
							</td>
							</tr>
							<tr id="ste15">
							<td align="right">
							15
							</td>					
							<td>कृपया नियत दिनांक और समय पर संग्रह केंद्र पर रिपोर्ट करें |
							</td>
							</tr>
							<tr id="ste16">
							<td align="right">
							16
							</td>					
							<td>कृपया सत्‍यापन के लिए प्रिंट निकालकर प्रिंट रिपोर्ट/रिपोर्ट पावती,ओरिजनल पासपोर्ट, ओरिजनल सीडीसी और भुगतान की गई रसीद की प्रति साथ लाये. आपके दस्‍तावेजों की जॉच करने के बाद वहीं लौटा दिया जाएगा. कार्मिक अपना डाटा साथ ले जा सकते है और आपके बायोमेट्रिक डाटा ,फोटोग्राफ को साथ ले जा सकते है |
							</td>
							</tr>
							<tr id="ste17">
							<td align="right">
							17
							</td>					
							<td>समुद्रकर्मियों का पहचान पत्र जारी और मुद्रित किया जाएगा | 
							</td>
							</tr>
							<tr id="ste18">
							<td align="right">
							18
							</td>					
							<td>स्‍पीड पोस्‍ट द्वारा दो दिन में प्रेषित किया जाएगा | 
							</td>
							</tr>  
							<tr id="ste19">
							<td></td>
							<td>
							<span>अपीलीय तंत्र</span>
							<br> <br>अपीलीय तंत्र के मामले में, प्रत्‍याशी को सीड से वंचित किया हो - तो अपीलीय तंत्र ऑफलाइन होगी; प्रथम अपीलीय प्राधिकृत मुख्‍य अधिकारी होगें | अभ्‍यर्थी शिंपिग मास्‍टर के अधिकार क्षेत्र वाले मुख्‍य  अधिकारी से संपर्क कर सकते हैं. मुख्‍य अधिकारी द्वारा अभ्‍यर्थी को अवसर प्रदान कर सकते है |  अभ्‍यर्थी द्वारा अपील करने पर 15 दिन के भीतर आदेश जारी किया जा सकता है | 
							</td>
							</tr>
							<tr id="ste20">
							<td></td>
							<td>
							एैसे मामले में अभ्‍यर्थी संतुष्‍ट नहीं है तब वह दूसरा अपील नौवहन महानिदेशालय को कर सकता है | एैसे मामले में अभ्‍यर्थी को 30 दिन के भीतर आदेश जारी किया जा सकता है |
							</td>
							</tr>
							</table></div></div>
  <a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>
</div>
</div>

<div class="small-5 columns myTable" style="text-align: center;">
	
			<s:form action="/login.action?typeApp=newApp" method="post" style="text-align:center;  width:100%; margin-top:1.7rem;" id="login" name="login">
			
			
			
			 <tr>
		    	<td colspan="2">
		    		<div class="customHeader2">
						<i class="step fi-unlock size-28"></i>  &nbsp;&nbsp;  

					</div>
					<div  style="text-align: left; color: #333333; line-height: 1rem; font-size: 14px; padding:5px;">
					<i class="step fi-info size-14" style="color: #008cba;"></i> use your indos no and indos password to login.
			
					</div> 							
								
			</td>
		   </tr>
		   <tr>
		    <s:textfield name="username" key="INDOS NO"  size="20" placeholder="Indos No " required="true"/>
		   <s:password name="password" key="PASSWORD" size="20" placeholder="Indos Password"  required="true"/>
		  </tr>
		  <tr>  		    <td align="center" colspan="2">
		    		    <img src="${pageContext.request.contextPath}/Captcha.jpg" border="0"></td>
		    		    </tr>
            <s:textfield label="Captcha" name="j_captcha_response" size="20" maxlength="10"/>
		    
		   <tr>
		    	<td colspan="2">
		    		<s:submit method="execute" id="loginBrowserCheck" key="label.login" value="Login" align="center" class="medium button" theme="simple"/>
		   		
		   			
		   		</td>
		   </tr>
		  
		  
		    
		  
		 <tr>
		 <td>
		<!-- <input type="submit" id="mscr" name="mscr" style="color: transparent; background-color: transparent; border-color: transparent; cursor: default;" value="mscr">
		 --></td>
		 </tr>
		</s:form>
		<a href="forgotPassword.jsp" style="color: #008CBA;text-align: right;float:right;">Forgot Password?</a>
		
	
</div>

</div>
<div class="row">
<div class="small-12 columns" style="text-align: center;">
	 <%-- <div class="bottomStrip">
		  Developed and maintain by <a href="http://cdac.in/"> CDAC </a> Mumbai.
	</div> --%>
	</div>
	</div>
	</div>
	 <div class="bottomStrip">
		  © Copyright 2017 DGS
	<div>
</div>
</div>

<script>
$(document).ready(function(){
    $("#notice").html('<h5><span class="blink_text" style="color:red">Notice :</span><span class="blink_text" ></h5><marquee><h4><a href="${pageContext.request.contextPath}/getDocsNews4" target="_new" style="color:green"><span class="blink_text_sup"><sup>New</sup></span>	BSID Resumed.<span style="color:red"><font size="3">(Read More)</font></span></a></h4></marquee></span>');
	$("#notice").append("<ul><a href=\"${pageContext.request.contextPath}/getDocsNews1\" target=\"_new\" style=\"color:green\">Safety Instructions....(Read More)</ul>")
	$("#notice").append("<ul><a href=\"${pageContext.request.contextPath}/getDocsNews2\" target=\"_new\" style=\"color:green\">Steps for UK Brazil to take appointment....(Read More)</ul>")
	$("#notice").append("<ul><a href=\"${pageContext.request.contextPath}/getDocsNews3\" target=\"_new\" style=\"color:yellow\"><span class=\"blink_text_sup\"></span> Regarding Seafarer Queries : Draft_BSID_Circular (Read More)</ul>")


 

	/*$("#notice").append("<details><summary><span class=\"blink_text_sup\"><sup>New</sup></span>Seafarers who have appointment date on 14 Jan 2021 in <font color='red'>Vizag only</font>....(Read More)</summary>"+
			"<p>"+
			"Those Seafarers who have taken appointment on 14 Jan 2021 is holiday at Vizag and hence those seafarers who have taken appointment date 14 Jan 2021 have to come to the"+ 
			" chosen appointment place Vizag at 15 Jan 2021 or 18 Jan 2021 on working days."+
			"<br><b>Inconvenience caused in this regards is regretted.</b>"+
			"</p>"+
			"</details>");*/
});
</script>


 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
</body>
</html>