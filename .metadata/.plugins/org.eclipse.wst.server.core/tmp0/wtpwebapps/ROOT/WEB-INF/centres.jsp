<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bsid | Centres</title>

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

<jsp:include page="header.jsp"></jsp:include>

<div class="row">
<div style="position:absolute; top:0px; width:100%;">
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
<div class="large-12 columns">


	
	<div class="customHeader" style="text-align:left; padding-left:15px;"><br/>
		<i class="step fi-list size-28"></i> Centre List
	</div>
		<table id="example" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>CENTRE NAME</th>
		            <th>CENTRE CODE</th>
		            <th>ADDRESS</th>
		            <th>ADMIN NAME</th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.CENTRES">
    	
		    	  <tr>
		            <td><s:property value="name"/> </td>
		            <td><s:property value="centerCode"/> </td>
		            <td>
		            	<s:property value="address"/><br/>
		            	<s:property value="city"/>,<s:property value="state"/><br/>
		            	 <s:property value="pinCode"/>
		            
		            </td>
		             <td><s:property value="adminName"/></td>
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