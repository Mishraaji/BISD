<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
span {background-color: black; color: white} 
</style>
<title>Welcome</title>

	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
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
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> 


				--><td width="75%" valign="top">
					
					   <s:a action="Welcome2JSP">Overall Instructions for SID(सीड की पूरी जानकारी)</s:a><br/><br/>
					   <!-- <div class="subHeader">Online SID Application </div> -->
						
						<div class="customHeader2">
	<i class="step size-24"></i>  &nbsp;&nbsp; General Instructions(सामान्‍य निर्देश)
	</div>

						<!--<h3>SID Online Application</h3>
						-->
						<h4>What you need(सामान्‍य निर्देश के लिए क्‍या आवश्‍यक है.):</h4>
						<p>1.Your internet browser must support 128 bit encryption and must have java script enabled.
						</p>
						<p>1.आपका इंटरनेट ब्राउसर एन्क्रिप्‍शन बीट 128 सपोर्ट करता हो और जावा स्क्रिप्‍ट सक्रिय होना चाहिए.</p>
						<p>2.The minimum versions of mizilla firefox that this site supports are version 40.0.x or higher.</p>
						<p>2.मोझिला फायर फाक्‍स का निम्‍नतम वर्सन हो,40.0 या उससे अधिक वर्सन साइड में स्‍पोर्ट करता हो.</p>
						<p>3.The time to download pages depends on your internet service providers speed
						</p>
						<p>3.इंटरनेट से पेज को समय पर डाउनलोड</p>
<p>4.It is mentioned that the details in your CDC and INDOS database would be captured in your Seafarers Identity Document. Hence if you wish to make any change in the INDOS and CDC database, you may please do so before applying for the SID. For changes in INDOS database such as name, date of birth, place of birth, state of birth, country of birth, nationality, height, hair color, eye color, identification mark, complexion please send an e-mail to INDOS cell at <a href="Ibsindos@vsnl.net">Ibsindos@vsnl.net</a> with a scanned copy of INDOS certificate, Passport and CDC. 
						</p>
						<p>4.सीडीसी और इनडोस डाटाबेस के विवरण का उल्‍लेख किया गया हो तो समुद्रकर्मियों के पहचान पत्र कागजात साथ ले जा सकते हैं. यदि इनडोस और सीडीसी डाटाबेस में किसी परिवर्तन पर पहले सीड में आवेदन करना होगा. इनडोस डाटाबेस में परिवर्तन जैसे नाम,जन्‍म तारीख,जन्‍म स्‍थान,राज्‍य ,अधिवासी,राष्‍ट्रीयता,कद,बालों का कलर,ऑख का कलर,शरीर में पहचान चिन्‍ह इत्‍यादि इनडोस सेल के दर्शाए गए मेल (Ibsindos@vsnl.)पर और साथ में इनडोस सर्टिफिकेट,पासपोर्ट और सीडीसी की स्‍केन कॅापी कर भेज दे.</p>
<p>5.You are requested to ensure that your data related to Continuous Discharge Certificate (CDC) and INDOS Number in the database of the Directorate General of Shipping is correct, updated and linked. In cases the details are not visible in CDC checker, then the candidate may please fill and submit an online application available at (<a href="http://220.156.189.33/IndosApplicationjlndos/CDCChecker.isp">http://220.156.189.33/IndosApplicationjlndos/CDCChecker.isp</a>) after which an online application number would be generated. The said application will be processed by respective Shipping Master office. Queries with respect to such application may please be taken up with the respective Shipping Master office, by sending email to the IDs given above with a copy to the supervisory officer. The application number may please be mentioned in the e-mail. In those cases, wherein the CDC details are visible in the checker, but the INDOS number is not reflected or incorrectly reflected in the CDC details, it indicates that the CDC and INDOS data requires integration. In such cases, the seafarer may please fill the excel sheet given therein and forward the same by e-mail to the respective shipping master. The Shipping Master office, after necessary verification would, forward the same to e-Governance cell for integration. The correct data would be automatically reflected, once the integration is carried out. Time required for the same would be seven working days. </p>
<p>5.यह सुनिश्‍चित किया जाय कि सतत उन्‍मोचन प्रमाणपत्र(सीडीसी)और इनडोस नं. के डाटाबेस नौवहन महानिदेशालय से संबंधित डाटाबेस सही,प्रमाणित और मिलान हो. इस तरह के विवरण में सीडीसी चेकर में त्रुटि दिखाई देने पर और ऑनलाइन उपलब्‍ध आवेदन  भर कर प्रस्‍तुत करें. बाद में आवेदन नंबर प्रदर्शित किया जाए. (http://220.156.189.33/IndosApplicationjlndo/CDCCheckerisp)यह उक्‍त आवेदन संबंधित शिपिंग मास्‍टर कार्यालय द्वारा संसाधित किया जाएगा. इस तरह के आवेदन की पूछताछ शिपिंग मास्‍टर कार्यालय से की जा सकती है. सर्वेक्षक अधिकारी को एक प्रति के साथ उपर दिए गए आइडी को इमेल भेजा जा सकता है. आवेदन में इमेल का उल्‍लेख किया जा सकता है एैसे मामलों में जहॉ सीडीसी विवरण हो लेकिन इंडोस नंबर प्रतिबिंबित नहीं हो या गलत ढंग से दर्शाया गया हो. जिससे यह दर्शाता है कि सीडीसी और इंडोस डाटा के लिए एकीकरण की आवश्‍यकता है. एैसे में समुद्रकर्मी एक्‍सेल सीट में पूरी जानकारी भरकर शिपिंग मास्‍टर को इमेल द्वारा भेज दे. शिपिंग मास्‍टर कार्यालय सत्‍यापन करने के बाद इगव्‍हनर्स सेल को एकीकरण करने के लिए अग्रेषित करेगा. एकीकरण होने पर सही डाटा स्‍वचालित रूप से प्रतिबिंबित हो जाएगा.इसके लिए आवश्‍यक रूप से सात दिन का कार्यदिवस होगा.</p>
<p>
6.Other than the above, if the candidate wishes to make any correction in the INDOS database or CDC data, then he may first get the same done by approaching the office of INDOS cell or Shipping master, as case may be and get the desired correction done. 
</p>
<p>6.उपर्युक्‍त यदि, उम्‍मीदवार इंडोस डाटाबेस या सीडीसी डाटा में कोई सुधार करने की इच्‍छा रखता हो तो शिपिंग मास्‍टर कार्यालय में आकर वांछित सुधार कर सकता है.</p>
						<!--<p align="justify">
							The concept of an universal Identification system for the seafarers was mooted in 1950s. Accordingly, International labour Organization (ILO) brought forward the ILO Convention C-108 on seafarers Identity Document. India has ratified this convention and issuing a Continuous Discharge Certificate cum Seafarers Identity Document to its seafarers in the form of a booklet.
						</p>
						<p align="justify">
						The world maritime community had felt the need for a more uniform and robust Identification system for the seafarers consequent to the discussions. The ILO had adopted another Convention C.185 on Biometric Seafarers Identity Document to be given to all seafarers. The new biometric SID has the provisions for the bar coding of the biometrics based identity of seafarers and a centralized data base maintained in the issuing country, which can be accessed globally through an interoperable & standard biometric template.
						</p>
						--></div>
				</td>
			</tr>
		</table>
				
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




