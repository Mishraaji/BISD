<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Probable Duplicates</title>

<script type="text/javascript" src="/js/vendor/jquery.js"></script>
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
	<div class="twelve column">
		
				<table id="applications" class="display" cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>SID No</th>
				            <th>NaME</th>
				            <th title="Date of Birth">DOB</th>
				            <th title="Place of Birth">POB</th>
				           	<th>Sex</th>
				            <th>CDC No</th>
				            <th>Indos No</th>
				            <th>Identification Mark</th>
				           
				        </tr>
				    </thead>
				    <tbody>
				     <s:iterator value="#session.PROBABLE_DUPLICATES">
		    	
				    	  <tr>
				            <td><s:property value="SIDNo"/> </td>
				            <td>
				            	<s:property value="lastName"/>
				            	<s:property value="firstName"/> 
				            	<s:property value="midleName"/>
				            	
				            </td>
				            <td><s:property value="dob"/></td>
				           	<td><s:property value="placeOfBirth"/></td> 
				           	<td><s:property value="gender"/></td>
				           	<td><s:property value="CDCNo"/></td>
				           	<td><s:property value="indosNo"/></td>
				           	<td><s:property value="identificationMark"/></td>
				            
				        </tr>
		    
		    		</s:iterator>
				      
				      
				    </tbody>
			</table>
				
			
	
</div>
</div>


</body>
</html>