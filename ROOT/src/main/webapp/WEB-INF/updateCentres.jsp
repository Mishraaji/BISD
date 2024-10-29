<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bsid | Users</title>

<script type="text/javascript" src="/js/vendor/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );

</script>
<s:if test="%{#session.USER_ROLE==11}">
<jsp:include page="header.jsp"></jsp:include></s:if>
<div class="row">
<div class="large-12 columns">


	
	<div class="customHeader" style="text-align:left; padding-left:15px;">
		<i class="step fi-pencil size-28"></i> Manage Centres
	</div>
		<table id="example" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>CENTRE NAME</th>
		            <th>ADDRESS</th>
		            <!-- <th>ADMIN NAME</th> -->
		            <th>Edit</th>
		            <th>Delete</th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.CENTRES">
    	
		    	  <tr>
		            <td><s:property value="name"/> </td>
		            <td>
		            	<s:property value="address"/><br/>
		            	<s:property value="city"/>,<s:property value="state"/><br/>
		            	 <s:property value="pinCode"/>
		            
		            </td>
		              <!-- <td><s:property value="adminName"/></td> -->
		             <td>
		             	<s:a action="editCentre.action" class=" tiny button"> Edit 
		             		<s:param name="centreId" value="ccCode"> </s:param>
		             	</s:a>
		             </td>
		              <td>
		             	<s:a action="deleteCentre.action" class=" tiny button"> Delete 
		             	<s:param name="centreId" value="ccCode"> </s:param>
		             	</s:a>
		             </td>
		        </tr>
    
    		</s:iterator>
		      
		      
		    </tbody>
		    </table>
	
</div>
</div>

<script src="/js/foundation.min.js"></script>
 <script>
      	$(document).foundation();
 </script>


</body>
</html>