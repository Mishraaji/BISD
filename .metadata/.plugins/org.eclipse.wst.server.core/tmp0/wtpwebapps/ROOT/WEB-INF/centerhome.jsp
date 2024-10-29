<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>BSID | Centre Admin </title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
    <script src="/js/vendor/modernizr.js"></script>
    
    <style type="text/css">
    .label {
    	font-size: 20px;
    	background-color: white;
    	color: #333333;
    
    }
    ul {
    	margin-left: 0.5rem !important;
    }
    ul, ol, dl {
    
    	line-height: 1.0;
    }
    
  button, .button {
border-style: solid;
border-width: 0px;
cursor: pointer;
font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif;
font-weight: normal;
line-height: normal;
margin: 0 0 1.25rem;
position: relative;
text-decoration: none;
text-align: center;
-webkit-appearance: none;
-webkit-border-radius: 0;
display: inline-block;
padding-top: 5px;
padding-right: 0;
padding-bottom: 5px;
padding-left: 2rem;
font-size: 1rem;
background-color: #4DAECF;
border-color: #3E8BA6;
color: white;
transition: background-color 300ms ease-out;

}

button.secondary, .button.secondary {
    background-color: #b9b9b9 !important;
    border-color: #333333 !important;
    color: #333333 !important; }
    button.secondary:hover, button.secondary:focus, .button.secondary:hover, .button.secondary:focus {
      background-color: #4A4A4A !important; 
   
      }
    button.secondary:hover, button.secondary:focus, .button.secondary:hover, .button.secondary:focus {
      color: #fff !important; }




ul li:HOVER a i{
	color: #fff;
}
    </style>

 <s:head />
</head>

<body>
<s:if test="%{#session.USER_ROLE==1}">
<jsp:include page="header.jsp"></jsp:include>
</s:if>
<div class="row">
<div class="panel callout radius small-6 columns">
  <div class="customHeader"> <i class="step fi-clock size-28"></i> Appointment</div>
  <br/>
  <div style="text-align: center; opacity:0.7;">
  	 <i class="step fi-home size-150" style="color: #333"></i>
  </div>
  
 	<ul style="list-style-type: none;" >
	  <li>
	  		<s:if test="%{#session.USER_ROLE==1}"><s:a action="adminappScheduler" class="secondary button expand " style="text-align: left; padding-left: 15px;">
	  		 	<i class="step fi-plus size-16 " > Manage Appointment</i>
	  		</s:a></s:if>
	  </li>
	  
		  
	 
	</ul> 
 
</div>


<div class="panel callout radius small-6 columns">
  <div class="customHeader"> <i class="step fi-torso-business size-28"></i>  Manage Users </div>
   <br>
  <div style="text-align: center; opacity:0.7;">
  	 <i class="step fi-torsos-all size-150" style="color: #333"></i>
  </div>
  
 	<ul style="list-style-type: none;">
	  <li>
	  		<s:a action="viewAddUser.action" class="secondary button expand " style="text-align: left; padding-left: 15px;">
	  		 	<i class="step fi-plus size-16"> Add New User</i>
	  		</s:a>
	  </li>
	  <li>
	  		<s:a action="viewUsers" class="secondary button expand text-left" style="text-align: left; padding-left: 15px;" >
	  		 	<i class="step fi-list size-16"> Centre Users</i>
	  		</s:a>
	  </li>
		  <li>
	  		<s:a action="viewUsersUpdate" class="secondary button expand text-left" style="text-align: left; padding-left: 15px;">
	  		 	<i class="step fi-pencil size-16"> Edit or Delete user</i>
	  		</s:a>
	  </li>
	 
	</ul> 
 
</div>


</div>

<script src="/js/vendor/jquery.js"></script>
 <script src="/js/foundation.min.js"></script>
 <script>
      	$(document).foundation();
 </script>

</body>
</html>