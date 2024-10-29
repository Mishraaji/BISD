<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
span {background-color: black; color: white} 
</style>
<title>Welcome</title>

	<link rel="stylesheet" href="../../css/foundation.css" />
  	<link rel="stylesheet" href="../../css/custom.css" />
  	<link rel="stylesheet" href="../../css/foundation-icons/foundation-icons.css" />
  	<link href="../../css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="../../js/vendor/modernizr.js"></script>
    <script src="../../js/vendor/jquery.js"></script>
    <script type="text/javascript" src="../../js/jquery.ebcaptcha.js"></script>
    
   

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
<s:if test="%{#session.USER_ROLE==4}">
<div class="row">
  <jsp:include page="../../header.jsp"></jsp:include>
</div>
</s:if>
<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		<s:if test="%{#session.USER_ROLE==4}">
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="../../WEB-INF/activities.jsp"></jsp:include>
				
				</td>
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> 


				--><td width="75%" valign="top">
				   <a href="${pageContext.request.contextPath}/Welcome2.jsp">Overall Instructions for SID</a><br/><br/>
					   <!-- <div class="subHeader">Online SID Application </div> -->
						
						<div class="customHeader2">
	<i class="step size-24"></i>  &nbsp;&nbsp; Photo Upload Help
	</div>
				<br/>
					
						<p>You must make sure photos for your SID meet all the rules - your application might be delayed if you don’t.</p>
						<p>Check your application form to see how many photos you need to provide.</p>						
						<h4>Photo size</h4>
						<p>You can’t use photos that have been cut down from larger pictures.</p>
						<p>Your photos must be professionally printed and 45 millimetres (<abbr title="millimetres">mm</abbr>) high by 35mm wide. Make sure you get the right size. </p>
						</p>
						<h4>The photos</h4>
						<p>Your photos must be:</p>
						
						<ul>
						<li>in colour on plain white photographic paper</li>
						  <li>taken against a plain cream or light grey background</li>
						  <li>identical</li>
						  <li>taken within the last month</li>
						  <li>clear and in focus</li>
						  <li>without any tears or creases </li>
						  <li>unmarked on both sides (unless a photo needs to be countersigned)</li>
						  <li>unaltered by computer software</li>
						</ul>
						<h4>The image of you</h4>
						<p>Your photos must show a close-up of your full head and shoulders. It must be only of you with no other objects or people.</p>
						
						<p>The image of you - from the crown of your head to your chin - must be between 29mm and 34mm high (see example below).</p>
						<p><img src="../../images/photos_help2.jpg" width="250" height="230" alt="How your head should appear in SID photos - described in text above"></p>
						
						<p>Your photos may be rejected unless they show you:</p>
						
						<ul>
						<li>facing forward and looking straight at the camera</li>
						  <li>with a neutral expression and your mouth closed</li>
						  <li>without anything covering the face </li>
						  <li>in clear contrast to the background</li>
						  <li>without a head covering (unless it’s worn for religious or medical reasons) </li>
						  <li>with eyes open, visible and free from reflection or glare from glasses</li>
						  <li>with your eyes not covered by sunglasses, tinted glasses, glasses frames or hair</li>
						  <li>without any ‘red eye’</li>
						  <li>without any shadows in the picture</li>
						</ul>
						<h4>Photos dos and don’ts</h4>
						<p><img src="../../images/photos_help1.jpg" width="588" height="863" alt="Examples of passport photos - described in text above"></p>
						
						
						
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
			</s:if>	
	</div>
</div>



 	
     <script src="../../js/foundation.min.js"></script>
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




