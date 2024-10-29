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
<div class="row">
 <jsp:include page="../../header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="../../WEB-INF/activities.jsp"></jsp:include>
				
				</td>
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> 


				--><td width="75%" valign="top">
					
					  
					   <div class="customHeader2">
	<i class="step size-24"></i>  &nbsp;&nbsp; Rejected Application Help
	</div>
						</br>

						<p>You see the list of all rejected applications which are rejected by you.
						</p>
						<h4>Search</h4>
						<p>Search: You can search the particular rejected application by providing application ID (or name or indos number)in the search field.</p>
						<p>
						</p>
						
						<p> The applications can be sort as per the column title by clicking on the column heading.</p>
						<h4>View Applications</h4>						
						<p>View Application: By clicking on view application link of particular application, it shows the application in edit mode.</p>
						<p>Verify and correct if required the INDOS and CDC Details, personal details, address details, and other details of seafarer.</p>
						<p>Verify his image and biometric.</p>
						<p>Put remarks in the remarks field if any.</p>
						<p>Check the verified option and click on generate SID card to forward it to printing officer.</p>
						
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




