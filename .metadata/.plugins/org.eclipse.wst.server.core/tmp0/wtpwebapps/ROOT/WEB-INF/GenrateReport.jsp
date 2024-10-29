<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Officer DashBoard</title>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
</head>
<body>
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>

</div>
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
<hr style="border-color:  #b9b9b9"/>
<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
				<div class="customHeader2" style="text-align: left; padding-left : 5%;">Genrate Reports</div>
						
						<form action="reportGenrate.action" method="post" style="text-align:center;  width:100%; margin-top:1.7rem;" id="tsubmit" name="tsubmit">
							<s:set value="opetation" var="opetation" scope="session"></s:set>
							<table style="width: 100%;">
							<tr>
							<select id="reportlist" name="reportlist" required="true">
								  <option >IO Issued Report</option>
								  <option >Card's Dispatched Report</option>
								  <option >Card Remaining For Printing Report(Using Date Of Isuued)</option>
								  <option >Card Printed But Not Dispatched(Using Date Of Isuued)</option>
								  <option >Today's Appointments</option>
							</select>
							</tr>
								<tr>
									<td >
										<%-- <s:textfield id="application_no" name="application_no" key="Date From" size="10" maxlength="10" placeholder="Date From" required="true"/> --%>
										 
    										<input type="date" id="application_no" name="application_no">
									</td>
								<td >
										<%-- <s:textfield id="application_no1" name="application_no1" key="Date To" size="10" maxlength="10" placeholder="Date From" required="true"/> --%>
										
										<input type="date" id="application_no1" name="application_no1">
									</td>
									
								
								</tr>
								<tr style="display: inline;" >	
									<td style="display: inline;" >
										<s:submit value="submit" id="submit" name="submit" class="success button" style="display: inline;"></s:submit>
									</td>
								</tr>
								<div style="text-align: left;" align="left" >
								<s:if test="%{#session.report.todayPrint!=null}">
										<!-- <tr>
											<td colspan="4" align="left">
												<div style="color :#008cba; font-size:18px; "> Report Details </div>
											</td>
										</tr> -->
										<%-- <tr>
											<td align="left" >
												Application No : <s:property value="%{#session.report.todayPrint}"/>
											</td>
											
										</tr> --%>
										<tr>
										<th colspan="3" align="center" style="color :#008cba; font-size:18px; "><s:property value="%{#session.selectchoice.select}"/> Report Status From <s:property value="%{#session.report.application_no}"/>   TO    <s:property value="%{#session.report.application_no1}"/></th>
								</tr>
								<s:iterator value="#session.report.centerWiseIOApprovedbyName" var="prop"  >
								<tr  align="center" >
								<th colspan="2" style="color :black; font-size:18px; "><s:property value="#prop.key" />	</th>
								<td style="color :black; font-size:18px; "><s:property value="#prop.value" />	</td>
								</tr>
								</s:iterator>
								
								</s:if>
								</div>
							</table>
						</form>
					 <%
					 session.setAttribute("report",null); 
					 %>
					  
				</td>
			</tr>
		</table>
				
	</div>
</div>


<script src="/js/foundation.min.js"></script>
<script>
      	$(document).foundation();
</script>
</body>
</html>