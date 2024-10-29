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
				<div class="customHeader2" style="text-align: left; padding-left : 5%;">Applications History</div>
						
						<form action="historyDetail.action" method="post" style="text-align:center;  width:100%; margin-top:1.7rem;" id="tsubmit" name="tsubmit">
							<s:set value="opetation" var="opetation" scope="session"></s:set>
							<table style="width: 100%;">
								<tr>
									<td >
										<s:textfield id="application_no" name="application_no" key="Application NO or INDOS NO" size="22" maxlength="10" placeholder="Application NO or INDOS NO" required="true"/><br/>
									</td>
								</tr>
								<tr style="display: inline;" >	
									<td style="display: inline;" >
										<s:submit value="submit" id="submit" name="submit" class="success button" style="display: inline;"></s:submit>
									</td>
								</tr>
								<div style="text-align: left;" align="left">
								<s:if test="%{#session.history.application_no!=null}">
										<tr>
											<td colspan="4" align="left">
												<div style="color :#008cba; font-size:18px; "> Application Details </div>
											</td>
										</tr>
										<tr>
											<td align="left" >
												Application No : <s:property value="%{#session.history.application_no}"/>
											</td>
											<td align="left" >
												CDC From : <s:property value="%{#session.history.cdc_issue_Place}"/>
											</td>
										</tr>
										<tr >
											<td align="left">
												Appointment Date : <s:property value="%{#session.history.appointment_date}"/><br/>
												Time :(<s:property value="%{#session.history.start_time}"/> - <s:property value="%{#session.history.end_time}"/>)
											</td>
											<td align="left">
												Applied Date : <s:property value="%{#session.history.applied_date}"/>
											</td>	
										</tr>
										<tr>
											<td align="left">
												Status : <s:property value="%{#session.history.status}"/>
											</td>
											<td align="left">
												Appointment Place : <s:property value="%{#session.history.appointment_place}"/>
											</td>
										</tr>
										<s:if test="%{#session.history.vo_rejected == 't'.toString()}">
											<tr>
												<td align="left" colspan="2">
													Application rejected due to "<s:property value="%{#session.history.vo_remark}"/>" by "<s:property value="%{#session.history.vo_id}"/>"
												</td>
												
											</tr>		
										</s:if>
										<s:if test="%{#session.history.isverified == 't'.toString()}">
											<tr>
												<td align="left" >
													Application verified by "<s:property value="%{#session.history.vo_id}"/>"
												</td>
													
												<s:if test="%{#session.history.verify_Date != null}">
												<td align="left" colspan="2">
													Date : "<s:property value="%{#session.history.verify_Date}"/>"
												</td>
												</s:if>
											</tr>		
										</s:if>
										<s:if test="%{#session.history.isdeochecked == 't'.toString()}">
											<tr>
												<td align="left" >
													Data captured successfully by "<s:property value="%{#session.history.deoid}"/>"
												</td>
												<s:if test="%{#session.history.deo_Date != null}">
												<td align="left" colspan="2">
													Date : "<s:property value="%{#session.history.deo_Date}"/>"
												</td>
												</s:if>
											</tr>		
										</s:if>
										<s:if test="%{#session.history.io_rejected == 't'.toString()}">
											<tr>
												<td align="left" colspan="2">
													Application rejected due to "<s:property value="%{#session.history.io_remark}"/>" by "<s:property value="%{#session.history.io_id}"/>"
												</td>
												
											</tr>		
										</s:if>
										
										<s:if test="%{#session.history.is_sid_issued == 't'.toString()}">
											<tr>
												<td align="left" >
													SID card issued successfully by "<s:property value="%{#session.history.io_id}"/>"
												</td>
												<s:if test="%{#session.history.issue_Date != null}">
												<td align="left" colspan="2">
													Date : "<s:property value="%{#session.history.issue_Date}"/>"
												</td>
												</s:if>
												
												
											</tr>		
										</s:if>
										<s:if test="%{#session.history.is_printed == 't'.toString()}">
											<tr>
												<td align="left" >
													SID card printed successfully by "<s:property value="%{#session.history.po_id}"/>"
												</td>
												<s:if test="%{#session.history.print_Date != null}">
												<td align="left" colspan="2">
													Date : "<s:property value="%{#session.history.print_Date}"/>"
												</td>
												</s:if>
												
												
											</tr>		
										</s:if>
										<s:if test="%{#session.history.is_dispatched == 't'.toString()}">
											<tr>
												<td align="left" >
													SID card dispatched successfully by "<s:property value="%{#session.history.do_id}"/>"
												</td>
												<s:if test="%{#session.history.dispatch_Date != null}">
												<td align="left" colspan="2">
													Date : "<s:property value="%{#session.history.dispatch_Date}"/>"
												</td>
												</s:if>
												
												
											</tr>		
										</s:if>
										<tr>
											
										</tr>	
								</s:if>		
								</div>
							</table>
						<form>
					 <%
					 session.setAttribute("history",null); 
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