<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Token System</title>
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){	
			
		        var seconds = 5;
		        setInterval(function () {
		            seconds--;
		            if (seconds == 0) {
		                
		                window.location = "/token_data";
		            }
		        }, 1000);
		        
		      
		       $(".dcoresult").css("background-color", "green");
		       $("#tokenstatus").css("background-color", "grey");
		      
		        $("#dcostatus").css("background-color", "grey");
		});	
	</script>
	<style type="text/css">
		th {
  				height: 1px;
  				
  				
			}
		
		td {
  				height: 1px;
  				
  				text-align: center;
			}
	</style>
</head>
<body>

	<!-- <jsp:include page="header.jsp"></jsp:include> --> 
	<table width="100%"  border="1px solid black">
<tr>
						<th style="font-size:45px;text-align: center;">
						Token Management
						</th>
						</tr>
</table>
	

<%int i=0; %>

<table width="100%"  border="1px solid black">
<tr>
						<th style="font-size:45px;text-align: center;">
						In Process
						</th>
						</tr>
</table>


<table width="100%"  border="1px solid black">
<s:iterator value="#session.tokendata" var="myobj">
					

<s:if test='%{deskno!=null && status=="taken"}'>
<tr class="dcoresult">
						<th style="font-size:35px;">DCO-<s:property value="deskno"/> </th>
						<th style="font-size:35px;">	
		           <s:set value="applicationno" var="applicationno"></s:set>
						<s:property value="applicationno"/> </th>
						<th style="font-size:35px;"> <s:property value="name"/>
		            </th>
</tr>
					</s:if>
					
</s:iterator>

</table>




<table width="100%"  border="1px solid black">
<tr>
<th style="font-size:40px;text-align: center;">
Waiting List
</th>

</tr>
</table>


<table width="100%"  border="1px solid black">
<s:iterator value="#session.tokendata" var="myobj">
 <s:if test='%{deskno==null || status=="incomplete"}'>
   

					 
					 <%if(i==0){ %>
					 
					 <tr id="tokenstatus">
								<th style="font-size:40px;text-align: center;">
									Indos No
								</th>
								<th style="font-size:40px;text-align: center;">
									Name
								</th>
							</tr>
					 <% i++;}  %>
					 <tr>
		          
		           <td style="font-size:35px;">
		           <s:set value="applicationno" var="applicationno"></s:set>
						<s:property value="applicationno"/>
		            </td >
		            <td style="font-size:35px;">
		            <s:property value="name"/>
		            </td>
		            
</tr>
		           </s:if>

</s:iterator>
</table>

	
	
	
</body>
</html>