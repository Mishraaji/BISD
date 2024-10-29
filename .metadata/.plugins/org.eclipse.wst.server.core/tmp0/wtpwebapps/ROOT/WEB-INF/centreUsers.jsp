<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Expires", "0");
response.addHeader("X-XSS-Protection","1; mode=block"); 
response.setHeader("Access-Control-Allow-Origin","*");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BSID | Centre Users</title>

<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );

</script>
<div class="row">
<div class="large-12 columns">


	
	
		<table id="example" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>USER NAME</th>
		            <th>EMAIL</th>
		            <th>ROLE</th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.USERS">
    	
		    	  <tr>
		            <td><s:property value="userName"/> </td>
		            <td><s:property value="email"/></td>
		             <td><s:property value="role"/></td>
		        </tr>
    
    		</s:iterator>
		      
		      
		    </tbody>
		    </table>
	
</div>
</div>


</body>
</html>