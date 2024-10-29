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
   
    $('body').on('click', 'button', function() {
    	var no =this.value;
    	$.ajax({
            url: 'application_status_async.action', // action to be perform
            type: 'POST',       //type of posting the data
            data: { 'application_no': no  }, // data to set to Action Class
       success: function (responce) {
    	   $('#'+no).prop('disabled', true);
    	   
    	  alert(responce);
       },
       error: function(xhr, ajaxOptions, thrownError){
          alert('An error occurred! ' + thrownError);
       }
 		 });
        
    });
} );

</script>

<div class="row">
<div class="large-12 columns" >



	

						<s:set value="verified" var="verified"></s:set>
		<table id="applications" class="display section-to-print" cellspacing="0" width="100%">
		    <thead>
		  	
		         <tr>
		            <th>APPLICATION ID</th>
		            <th>STATUS</th>
		            <th>NAME</th>
		            <th>PLACE OF BIRTH</th>
		            <th id='datesort'>Appointment Date</th>  
		            <th>START-TIME</th>
		            <th></th>
		        </tr>
		        
		    </thead>
		    <tbody>
		     <s:iterator value="#session.APPLICATIONS" var="myobj">
		    	  <tr>
		    	  
		           
		             <s:if test='%{applicationStatus=="Verified" && btn==false}'>
		             <td><button id="${applicationId }"  value=<s:property value="applicationId"/> ><s:property value="applicationId"/></button>
		            </td>
		            
		    	  
		    	 </s:if>
		           <s:else>
		           <td><button disabled="disabled"  value=<s:property value="applicationId"/> ><s:property value="applicationId"/></button>
		            </td>
		           </s:else>
		            
		             <td>
		            	<s:property value="applicationStatus"/>		
		            </td>
		            <td>
		            	<s:property value="name"/> 
		            </td>
		            <td>
		            	<s:property value="placeOfBirth"/>		
		            </td>
		            <td><s:property value="appointmentDate"/></td>
		            <td><s:property value="startTime"/></td>
		            <td style="display:none;">uk-<s:property value="slotId"/></td> 
		        </tr>
    		</s:iterator>
		    </tbody>
	</table>
		
			
	
</div>
</div>



</body>
</html>