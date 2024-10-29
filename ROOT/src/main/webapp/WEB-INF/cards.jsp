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
<title>Officer | Applications</title>

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
<link href="/css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript">
	function viewCard(url)
	{
		var width=350;
		var height=485;
		var leftPosition, topPosition;
	    //Allow for borders.
	    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
	    //Allow for title and status bars.
	    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
	    //Open the window.
		 window.open(url,'cardPreview',"status=no,height=" + height + ",width=" + width + ",resizable=no,left="
				    + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
				    + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
		
	}
	
	
	
</script>

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    $('#applications').dataTable();
} );


function openReveal(id){
	   $('#'+id).foundation('reveal', 'open');
}

function closeReveal(id){
	   $('#'+id).foundation('reveal', 'close');
}

</script>


<div class="row">
<div class="large-12 columns">



	

	
		<table id="applications" class="display" cellspacing="0" width="100%">
		    <thead>
		        <tr>
		            <th>SID No</th>
		            <th>NAME</th>
		            <th>Tracking Number</th>
		            <th>INDOS No.</th>
		           
		            <th></th>
		           
		        </tr>
		    </thead>
		    <tbody>
		     <s:iterator value="#session.CARDS">
    	
		    	  <tr>
		            <td><s:property value="SIDNo"/> 
		            	<s:set value="SIDNo" var="SIDNo"></s:set>
		            </td>
		            <td>
		            	<s:property value="lastName"/>
		            	<s:property value="firstName"/> 
		            	<s:property value="midleName"/>
		            	
		            	<s:set value="lastName"  var="lastName" scope="session"/>
		            	<s:set value="firstName" var="lastName" scope="session"/>
		            	<s:set value="midleName" var="lastName" scope="session"/>
		            	
		            </td>
		            <td><input type="text" name="track" id="track${applicationId}" maxlength="14" style="width:150px;"></td>
		             <td><s:property value="indosNo"/></td>
		            
		             <td class="sorting_1">
		             <%-- <s:if test="%{#session.USER_ROLE == 8}">
		             
		             	<input type="button" class="tiny button" onclick="viewCard('<s:url action="/printCard?sidNo=%{#SIDNo}"></s:url>')"  value="Print"/>
		            	<s:a action="/printed.action" class="tiny button"> 
		            		<s:param name="applicationId" value="applicationId"> </s:param>
		            		Done 
		            	</s:a>
		              </s:if> --%>
		              <s:if test="%{#session.USER_ROLE ==9}">
		              	<s:a  action="getAddress.action" class="tiny button">
		              		<s:param name="applicationId" value="applicationId"> </s:param>
		              		<s:param name="sidNo" value="SIDNo"> </s:param>
		              		Dispatch
		              	</s:a>
		              	<input type="button" class="tiny button" name="print${applicationId}" value="Print">
		              	<input type="button" class="tiny button" name="printAck${applicationId}" value="PrintAck">
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