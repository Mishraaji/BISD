<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<title>BSID | Log in </title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
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
height: 2rem;
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
	

function checkbrowser(){
			
	           
	            if (navigator.userAgent.indexOf("Firefox") > 0) {
	               
	            }
	            else
	            	{
	            	alert("Please use mozilla firefox browser to login.");
	        		document.getElementById("loginBrowserCheck").style.visibility="hidden";
	            	
	            	}
	       
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
<div class="row">


<div class="small-12 columns" style="text-align: center;">

	
						
						
						<div>
<div id="table-wrapper">
  <div id="table-scroll">
						<table class="steps myTable">
							<tr>
								<td colspan="2">
										<div class="customHeader2 ">
					   						<i class="step fi-list-bullet size-40 "></i>
					   						Appellate mechanism / अपीलीय तंत्र<br/> 
					   					</div>
								 </td>
							</tr>
							<tr id="ste19">
							<td></td>
							<td>
							<span>Appellate mechanism</span>
							<br> <br>  The appellate mechanism in case, the candidate is denied an SID-- The appellate mechanism would be offline. First appellate authority would be the Principal Officer. The candidate may approach the Principal Officer having jurisdiction over the shipping master. The Principal Officer, shall, after giving an opportunity y to the candidate of being heard, may pass an order within 15 days of the appeal. 
							</td>
							</tr>
							<tr id="ste20">
							<td></td>
							<td>
							In case, the Candidate is not satisfied with the order of the Principal Officer, he may file a second appeal with the Director General of Shipping, who after giving an opportunity to the candidate, may pass an order within thirty days of such appeal.
							</td>
							</tr>
							<tr><td><br/></td></tr>
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

						
</div>
</div>


</div>
<div class="row">
<div class="small-12 columns" style="text-align: center;">
	 <%-- <div class="bottomStrip">
		  Developed and maintain by <a href="http://cdac.in/"> CDAC </a> Mumbai.
	</div> --%>
	
	 <div class="bottomStrip">
© Copyright 2017 DGS
	<div>
</div>
</div>

</div>
</div>


 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
</body>
</html>