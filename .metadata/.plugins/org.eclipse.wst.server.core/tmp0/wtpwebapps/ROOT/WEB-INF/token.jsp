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
		        
		      
		       $("#dcoresult").css("background-color", "green");
		       $("#tokenstatus").css("background-color", "grey");
		      
		        $("#dcostatus").css("background-color", "grey");
		});	
	</script>
	<style type="text/css">
		th {
  				height: 80px;
  				
  				
			}
		
		td {
  				height: 80px;
  				
  				text-align: center;
			}
	</style>
</head>
<body>
	<div class="row">
	 <jsp:include page="header.jsp"></jsp:include>
	</div>
	<hr style="border-color:  #b9b9b9"/>

		
			<%int i=0; 
				int j=1;
			%>
			
			<s:iterator value="#session.tokendata">
			<%
				if(i < (int)session.getAttribute("DCO_Count"))
				{
					if(i==0)
					{
						%>
						<table width="100%"  border="1px solid black">
							<tr id="dcostatus">
								<%--
									for(int k=1;k <= (int)session.getAttribute("DCO_Count");k++)
									{
										--%>
										<s:iterator value="#session.dco_counter">
											<th style="font-size:50px;text-align: center;">DCO-<s:property value="deskno"/></th>
										</s:iterator>		
										<%--
									}
								--%>
							</tr>
							<tr id="dcoresult">
							
						<%
					}
			%>
					<td style="font-size:80px;">
						<s:set value="applicationno" var="applicationno"></s:set>
						<s:property value="applicationno"/>
					</td>
			<%
					i++;
					if(i== (int)session.getAttribute("DCO_Count"))
					{
						%>
							</tr></table>
							<table id="tokentable"  width="100%"  border="1px solid black">
							<tbody>
							<tr id="tokenstatus">
								<th style="font-size:65px;text-align: center;">
									SID Application Id
								</th>
								<th style="font-size:65px;text-align: center;">
									Waiting Status
								</th>
							</tr>
						<%
					}
				}
				else
				{
					if(0 == (int)session.getAttribute("DCO_Count") && j==1)
					{
						%>
							<table id="tokentable"  width="100%"  border="1px solid black">
							<tbody>
							<tr id="tokenstatus">
								<th style="font-size:65px;text-align: center;">
									SID Application Id
								</th>
								<th style="font-size:65px;text-align: center;">
									Waiting Status
								</th>
							</tr>
						<%
					}
			%>
				<tr >
						<td style="font-size:80px;">
							<s:set value="applicationno" var="applicationno"></s:set>
							<s:property value="applicationno"/>
							
						</td>	
						<td style="font-size:80px;">
							<%
								if(j==0)
									out.print("Current");
								else
									out.print(j);
							
								j++;
							%>
							
						</td>	
				</tr>
				<%
				}
				%>
			</s:iterator>
		</tbody>
		
	</table>

</body>
</html>