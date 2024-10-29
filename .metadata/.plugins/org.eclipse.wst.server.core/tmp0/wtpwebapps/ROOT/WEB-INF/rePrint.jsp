<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title><link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
</head>
   
  
<body>
  
<script type="text/javascript">
$(document).ready(function() {
    $('#applications').dataTable();
} );

</script>

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
				<div class="customHeader2" style="text-align: left; padding-left : 5%;">Reprint Card </div>
						<s:set value="opetation" var="opetation" scope="session"></s:set>

				<div class="row">
<div class="large-12 columns">



	

						<s:set value="verified" var="verified"></s:set>
	
		<table id="applications" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>APPLICATION ID</th>
		            <th>NAME</th>
		            <th>INDOS No.</th>
		           
		            <th></th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.APPLICATIONS">
    	
		    	  <tr>
		            <td><s:property value="applicationId"/> 
		            	<s:set value="applicationId" var="applicationId"></s:set>
		            </td>
		            <td>
		            	<s:property value="fisrtName"/> 
		            	<s:property value="midleName"/>
		            	<s:property value="lastName"/>
		            </td>
		             <td><s:property value="indosNo"/></td>
		            
		             <td class="sorting_1">
		             	<s:set var="operation" value="operation"> </s:set>
		             	<s:if test="operation=='printForm'">
			             	<s:a action="printForm.action"  >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
			            		Print Report
			            	</s:a>
			            </s:if>
			            <s:elseif test="operation=='viewApplication'">
			            	<s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
								
									<s:param name="verified">verified</s:param>

			            		View Application
			            	</s:a>
			            </s:elseif>
			            <s:elseif test="%{#session.operation=='viewApplication'}">
			            	<s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
							<c:choose>
		<c:when test="${param.typeApp != 'newApp' }">
									<s:param name="verified">verified</s:param>
							</c:when>
							<c:otherwise>
									<s:param name="verified">iverified</s:param>
							</c:otherwise>
</c:choose>
			            		View Application
			            	</s:a>
			            
			            </s:elseif>
		            	
		            </td>
		        </tr>
    
    		</s:iterator>
		      
		      
		    </tbody>
	</table>
		
			
	
</div>
</div>

				</td>

</body>
</html>