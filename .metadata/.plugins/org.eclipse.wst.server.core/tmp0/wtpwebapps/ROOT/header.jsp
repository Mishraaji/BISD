<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Expires", "0");
response.addHeader("X-XSS-Protection","1; mode=block"); 
response.setHeader("Access-Control-Allow-Origin","*");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BSID</title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
    <script src="/js/vendor/modernizr.js"></script>
    <style type="text/css">
    #primary_nav_wrap
{
	margin-top:15px
	
	
}

#primary_nav_wrap ul
{
	
	position:relative;
	float:left;
	margin:0;
	padding:0
}



#primary_nav_wrap ul li
{
	position:relative;
	float:left;
	margin:0;
	padding:0
}



#primary_nav_wrap ul li:hover
{
	background:#f6f6f6
}

#primary_nav_wrap ul ul
{
	display:none;
	position:absolute;
	top:100%;
	left:0;
	
	padding:0
}

#primary_nav_wrap ul ul li
{
	float:none;
	width:200px
}

#primary_nav_wrap ul ul ul
{
	top:0;
	left:100%
}

#primary_nav_wrap ul li:hover > ul
{
	display:block
}
    </style>
</head>
<body>

<script type="text/javascript"> 
history.forward(); 
</script>

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
<div style="background-image: url('${pageContext.request.contextPath}/images/main-bg.png');">

<img alt="" src="${pageContext.request.contextPath}/images/logo.png" class="left" height="10" style="height: 130px; margin-top: 10px; margin-left: 10px;">
<img alt="" src="${pageContext.request.contextPath}/images/emblem.png" class="right" style="margin-top: 30px; margin-right: 10px;">
 	<center><h3 style="padding-top: 10px;margin-top: 0rem; margin-bottom: 0rem; font-weight: bold;">Directorate General of Shipping</h3>
 	<h4 style="margin-top: 0rem; margin-bottom: 0rem;">Ministry of Ports, Shipping and Waterways</h4>
 	<h4 style="margin-top: 0rem; margin-bottom: 0rem;">Government of India</h4>
 	<h1 style="color: #006282; margin-top: 0rem; margin-bottom: 0rem;">SEAFARER IDENTITY DOCUMENT</h1></center><br/>
 <%-- <div class="right"> <s:a action="logout" class="tiny secondary button"> Logout </s:a> </div> --%>
</div>

<s:if test="%{#session.USER_ROLE==11 || #session.USER_ROLE==1 || #session.USER_ROLE==null}">
<nav class="top-bar" id="primary_nav_wrap" data-topbar role="navigation">
  <ul class="title-area" >
    <li class="name">
      
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
  </ul>

  <section class="top-bar-section">
    <!-- Right Nav Section -->
   

    <!-- Left Nav Section -->
    <ul class="left">
    	<li class="divider"></li>
<s:if test="%{#session.USER_ROLE==11}">
       <li><s:a action="AdminHome.action"> Home </s:a></li></s:if>
       
<s:elseif test="%{#session.USER_ROLE==1}"><li><s:a action="AdminHome.action"> Home </s:a></li></s:elseif>

<s:else><li><s:a action="LoginJSP"> Home </s:a></li></s:else>
       <li class="divider"></li>
       <li class="current-menu-item" style="position:relative; z-index:1;"><a href="#"> SID Guideline</a>
       <ul>
       <li><a href="BSIDGuidelines.jsp">Steps For BSID</a></li>
       <li><a href="Appellate.jsp">Appellate mechanism</a></li>
       </ul>
       </li>
       <li class="divider"></li>
       <li><a href="collectionCenters.jsp"> Collection Centre </a></li>
<s:if test="%{#session.USER_ROLE==null}">
       <li class="divider"></li>
       <li><a href="http://www.dgshipping.gov.in/index.aspx" target='_blank'> DG Shipping </a></li>
</s:if>
<s:if test="%{#session.USER_ROLE!=null}">
       <li class="divider"></li>
       <li><s:a action="changePasswordJSP">Change Password</s:a></li>
</s:if>
<s:if test="%{#session.USER_ROLE==null}">
       <li class="divider"></li>
       <!-- <li><a href="http://220.156.189.33/esamudraUI/jsp/examination/checker/PP_IndosChecker.jsp" target='_blank'> INDOS Login </a></li>-->
		<li><a href="BSIDCert.jsp" target='_blank'>BSID Certificate</a></li>
</s:if>
       <li class="divider"></li>
     
     
       <li><a href="http://www.ilo.org/global/standards/subjects-covered-by-international-labour-standards/seafarers/lang--en/index.htm" target='_blank'> ILO Guidelines </a></li>
       <!--<li class="divider"></li>
       <li><a href="#">Photo Help</a></li>
       --><li class="divider"></li>
       <li><a href="http://220.156.189.33/IndosApplication/Indos/CDCChecker.jsp" target='_blank'> CDC Checker </a></li>
       <li class="divider"></li>
      <li><a href="SIDChecker.jsp" target='_blank'> SID Checker </a></li>
       <li class="divider"></li>
      <li><a href="ContactUs.jsp" class="">Contact</a></li>
<s:if test="%{#session.USER_ROLE!=null}">
<li class="divider"></li>
      
      <li><a href="logout.action"> Logout </a></li>
      </s:if>
    </ul>
  </section>
</nav>
</s:if>
</div>
</div>






 <script src="/js/foundation.min.js"></script>
 <script>
      	$(document).foundation();
 </script>
</body>
</html>