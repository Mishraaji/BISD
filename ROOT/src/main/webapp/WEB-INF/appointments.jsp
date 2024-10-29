<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DCO | Appointments</title>

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
$(document).ready(function() {
    $('#appointments').dataTable();
} );

</script>
</head>
<body>


<div class="row">
<div class="large-12 columns">



	

	
		<table id="appointments" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>SEAFARER NAME</th>
		            <th>DATE</th>
		           	<th>TIME SLOT</th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.APPOINTMENTS">
    	
		    	  <tr>
		            <td><s:property value="applicationId"/> 
		            	<s:set value="applicationId" var="applicationId"></s:set>
		            </td>
		            <td>
		            	<s:property value="application.fisrtName"/> 
		            	<s:property value="application.midleName"/>
		            	<s:property value="application.lastName"/>
		            </td>
		             <td><s:property value="timeStamp"/></td>
		             <td><s:property value="startTime"/> to <s:property value="endTime"/></td>
		            
		        </tr>
    
    		</s:iterator>
		      
		      
		    </tbody>
	</table>
		
			
	
</div>
</div>



</body>
</html>