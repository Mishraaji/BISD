<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
} );

</script>
<div class="row">
<div class="large-12 columns">



	

	
		<table id="applications" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>APPLICATION ID</th>
		            <th>NAME</th>
		            <th>INDOS No.</th>
		           	<th>VIEW</th>
		            <th>PRINT</th>
		           
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
		            
		             <td class="sorting_1" align="center">
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
			            		View Application
			            	</s:a>
			            </s:elseif>
			            <s:elseif test="%{#session.operation=='viewApplication'}">
			            	<s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
			            		View 
			            	</s:a>
			            
		            	</s:elseif>
		            </td>
		            <td align="center">
		             	
		             	<s:if test="%{#session.operation=='viewApplication'}">
			            <s:a action="viewApplication2.action" >
			            		<s:param name="applicationId" value="applicationId"> </s:param>
			            		Print 
			            	</s:a>
			            
		            	 </s:if>
		            </td>
		        </tr>
    
    		</s:iterator>
		      
		      
		    </tbody>
	</table>
		
			
	
</div>
</div>



</body>
</html>