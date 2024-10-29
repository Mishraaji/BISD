<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BSID</title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/headercss.css" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
    <script src="/js/vendor/modernizr.js"></script>
    <style>
#container {
    text-align: center;
}
ul {
    display: inline-block;
}
</style>
</head>
<body>

<div class="row">
<div class="large-12 columns"> 

<div style="position:absolute; top:0px; width:100%;">
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
<div style="background-image: url('images/main-bg.png');">

<img alt="" src="images/logo.png" class="left" height="10" style="height: 130px; margin-top: 10px; margin-left: 10px;">
<img alt="" src="images/emblem.png" class="right" style="margin-top: 30px; margin-right: 10px;">
 	<center><h3 style="padding-top: 10px;margin-top: 0rem; margin-bottom: 0rem; font-weight: bold;">Directorate General of Shipping</h3>
 	<h4 style="margin-top: 0rem; margin-bottom: 0rem;">Ministry of Shipping Government of India</h4>
 	<h1 style="color: #006282; margin-top: 0rem; margin-bottom: 0rem;">SEAFARER IDENTITY DOCUMENT</h1></center><br/>
 <%-- <div class="right"> <s:a action="logout" class="tiny secondary button"> Logout </s:a> </div> --%>
</div>



<div id="container" >
                    <ul id="menu">
                        <li><a href="IoDashBoard.jsp"> Home </a>
                            
                        </li>
                        
                        
                        <li><a href="#"> Collection Centres </a>
                            
                        </li>
                        <li><a href="http://www.dgshipping.gov.in/" target="_blank"> DG Shipping </a>  
                        </li>
                       
                       
                       <li><a href="http://220.156.189.33/IndosApplication/Indos/CDCChecker.jsp" target="_blank"> CDC Checker </a></li>
                       
                        <li><a href="#"> INDOS Login </a>
                        
                        <li><a href="ContactUs.jsp"> Contact Us </a></li>
     					
     					<li><a href="Login.jsp"> Log Out </a></li> 
                        
                    </ul>
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