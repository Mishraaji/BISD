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
		    <s:if test="#request.rePrint=='duplicatecard'">
		        <tr>
		            <th>FIR No</th>
		            <th>NAME</th>
		            <th>SID No</th>
		           
		            <th></th>
		           
		        </tr>
		        </s:if>
		<s:else>	
		
		<form action="dispatchedCards.action" method="post"  id="tsubmit" name="tsubmit">
							<s:set value="opetation" var="opetation" scope="session"></s:set>
							
							<table style="width: 100%;">
								<tr>
									<td >
    										<input type="date" id="application_no" name="application_no">
									</td>
								<td >		
										<input type="date" id="application_no1" name="application_no1">
									</td>
								
									
								</tr>
								
								<tr style="display: inline; " >	
									<td style="display: inline;" >
										<s:submit value="submit" id="submit" name="submit" class="success button" style="display: inline;" ></s:submit>
									</td>
								</tr>
								
								
							</table>
							
								
	<table align="center">
		         <tr >
		            <th>SID No</th>
		            <th>Name</th>
		            <th>INDOS No.</th>
		              <th >Tracking no</th>
		            <th id='datesort'>Dispatch Date</th>
		           
		            <th></th>
		           
		        </tr>
		        <tr>
		        
		        <s:iterator value="#session.APPLICATIONS">
		    	  <tr>
		            <td><s:property value="sidno"/> 
		            	<s:set value="sidno" var="sidno"></s:set>
		            </td>
		            <td>
		            
		            	<s:property value="firstName"/> 
		            	<s:property value="middleName"/>
		            	<s:property value="lastName"/>
		            	<s:set value="lastName"  var="lastName" scope="session"/>
		            	<s:set value="firstName" var="lastName" scope="session"/>
		            	<s:set value="middleName" var="lastName" scope="session"/>
		            </td>
		            <td><s:property value="indosno"/></td>
		            <td><s:property value="docket_no"/></td>
		            
		           
		             <td><s:property value="dispatchDate"/></td>
		             </s:iterator>
		        
		        </tr>
		        </table>
						</form>	

		        </s:else>
		    </thead>
		    <tbody>
		    
		     <s:iterator value="#session.APPLICATIONS">
		    	  <tr>
		            <%-- <td><s:property value="sidno"/> 
		            	<s:set value="sidno" var="sidno"></s:set>
		            </td>
		            <td>
		            
		            	<s:property value="firstName"/> 
		            	<s:property value="middleName"/>
		            	<s:property value="lastName"/>
		            	<s:set value="lastName"  var="lastName" scope="session"/>
		            	<s:set value="firstName" var="lastName" scope="session"/>
		            	<s:set value="middleName" var="lastName" scope="session"/>
		            </td>
		            <td><s:property value="indosno"/></td>
		            <td><s:property value="docket_no"/></td>
		            
		           
		             <td><s:property value="dispatchDate"/></td> --%>
		            
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
			            	<s:a action="viewduplicatecard.action" >
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