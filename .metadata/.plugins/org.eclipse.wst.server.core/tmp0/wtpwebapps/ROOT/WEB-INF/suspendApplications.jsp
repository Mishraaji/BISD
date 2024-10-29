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
} );

</script>

<div class="row">
<div class="large-12 columns">



	

						<s:set value="verified" var="verified"></s:set>
		<table id="applications" class="display" cellspacing="0" width="100%">
		    <thead>
		    <tr>
		    <th></th>
		            <th>SID No.</th>
		            <th>Name</th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.USERS">
    	
		    	  <tr>
		    	  <td></td>
		            <td><s:property value="sidno"/> </td>
		            <td><s:property value="fname"/></td>
		        </tr>
    
    		</s:iterator>
		      
		    </tbody>
	</table>
		
			
	
</div>
</div>



</body>
</html>