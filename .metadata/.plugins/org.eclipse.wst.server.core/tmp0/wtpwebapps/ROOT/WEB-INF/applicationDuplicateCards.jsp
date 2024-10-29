<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Officer | Applications</title>

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    $('#applications').dataTable();
    setTimeout(function() {
        $("#datesort").trigger('click');
    },10);
} );

</script>

<div class="row">
<div class="large-12 columns">



	

						<s:set value="verified" var="verified"></s:set>
		<table id="applications" class="display" cellspacing="0" width="100%">
		    <thead>
		    
		        <tr>
		            <th>FIR No</th>
		            
		            <th>NAME</th>
		            
		           <th>Appointmet Date</th>
		            <th>Application Id</th>
		            <th></th>
		           
		        </tr>
		      
		    </thead>
		    <tbody>
		     <s:iterator value="#session.APPLICATIONS">
		    	  <tr>
		            
		            
		            <td bgcolor="green"><s:property value="applicationId"/> 
		            <s:a action="takeFir.action" >
			            		
			            		<s:param name="applicationId" value="applicationId"> </s:param>
			            		<s:set value="applicationId" var="applicationId"></s:set>
			            		
			            		view FIR
			          </s:a>
		            
		            </td>
		            <td>
		            	<s:property value="fisrtName"/> 
		            	<s:property value="midleName"/>
		            	<s:property value="lastName"/>
		            </td>
		           
		           
		             <%-- <td><s:property value="indosNo"/></td> --%>
		             <td><s:property value="Date"/></td>
		             <td><s:property value="appId"/> 
		            	<s:set value="appId" var="appId"></s:set>
		            </td>
		             <td class="sorting_1">

		              	<s:set var="operation" value="operation"> </s:set> 
		             	<s:if test="operation=='printForm'">
			             	<s:a action="printForm.action"  >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
			            		Print Report
			            	</s:a>
			            </s:if>
			           <%--  <s:elseif test="operation=='viewApplication'">
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
							
			            		View Application1
			            	</s:a>
			            </s:elseif> --%>
			            <s:elseif test="%{#session.operation=='viewApplication' && #request.rePrint=='rePrint'}">
			            	<s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
								<s:param name="rePrint" value="rePrint"> </s:param>
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
						<s:elseif test="%{#session.operation=='viewApplication' && #request.rePrint=='newn'}">
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
						<s:elseif test="%{#session.operation=='viewApplication' && #request.rePrint=='reApprove'}">
			            	<s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
								<s:param name="rePrint">reApprove</s:param>
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
			            <s:elseif test="operation=='viewApplication'">
			            	<s:a action="viewduplicatecard.action" style="color: green;">
			            		<s:param name="applicationId" value="applicationId"> </s:param>
								<s:param name="rePrint">duplicatecard</s:param>
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
			            
			            	<%-- <s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
								<s:param name="rePrint">duplicatecard</s:param>
							<c:choose>
							<c:when test="${param.typeApp != 'newApp' }">
									<s:param name="verified">verified</s:param>
							</c:when>
							<c:otherwise>
									<s:param name="verified">iverified</s:param>
							</c:otherwise>
</c:choose>
			            		view Application
			            	</s:a> --%>
			            
			            </s:elseif>
			           
		            	
		            </td>
		        </tr>
    
    		</s:iterator>
		      
		      
		    </tbody>
	</table>
		
			
	
</div>
</div>



</body>
</html>