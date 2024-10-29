<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />

	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" media="screen" />
  	
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
 	<style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
    
    }
    

<style>

      .noPrint 
      {            
     			 display: none;     
      } 
            
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Sidstatus</title>
</head>
<body>


<div class="row">
 <h2 style="text-align: center; color: #008cba;"> SID STATUS INFORMATION</h2>
</div>

<hr style="border-color:  #b9b9b9"/>
<div class="row">

<div class="small12 columns" style="text-align: center;">

<div class="customHeader" >
	Your SID status is..
</div>
<br/>
<s:form action="/FinalSubmit.action" method="post" enctype="multipart/form-data" 
		style="width:100%;text-align:left; " validate="true" class="panel callout radius" theme="simple">
		
<table style="width: 90%; text-align: left; border: 1px solid #000;" align="center" >
	<tr>
		<p align="center">The SID number you have entered is incorrect. Please go back and enter valid SID number.</p>
			</tr>

	
</table>

<s:token/></s:form>
<!-- <a href="#" onClick=" window.print(); return false">Print</a> -->



</div>


</div>

<div class="row">

</div>
 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>
