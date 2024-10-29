<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" media="screen" />
  	
 
 
<%--     <script type="text/javascript" src="/bsid1/js/jquery.validate.min.js"></script> --%>
 	
<style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
     }
    .noPrint {display: none; } 
            
</style>

<script src="/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

<body>
<script type="text/javascript">
$(document).ready(function() {
    $('#applications').dataTable();
} );

function goBack() {
    window.history.back()
}
function openReveal(id){
	   $('#'+id).foundation('reveal', 'open');
}

function closeReveal(id){
	   $('#'+id).foundation('reveal', 'close');
}
  	$( document ).ready(function() {
   		
   		
   		
   		
   		
   		jQuery.validator.setDefaults({
   		  debug: true,
   		  success: "valid" ,
   		  submitHandler: function(form) {
        	form.submit();
     	 }
   		});
   		var form = $( "#rejectApplication" );
   		form.validate({
            
        
        	rules: {
        		remark: "required",
            	
	    	
	  		  			
        	},
            messages: {
            	
            	remark: "Please mention the reason."
            			
            	
        }});
   	});
</script>

<div style="position:absolute; top:0px;">
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
 <div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;" height="80%" >
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top" height="40%">
				
				<s:form action="/markDuplicate.action" method="post" 
					style="width:100%;text-align:center; " validate="true" 
					theme="simple" name="rejectApplication" id="rejectApplication">
		
					<span class="lead">Replace SID card .</span>
					
					
				<br/><br/>
					<%-- <s:textarea rows="5" cols="30" name="remark" placeholder="Please mention the reason for issuing / marking as replace" style="width:100%;"> </s:textarea> --%>
					<s:hidden name="applicationId" value="%{#session.CURRENT_APPLICATION.applicationId}"></s:hidden>
					<s:hidden name="userRole" value="%{#session.USER_ROLE}"></s:hidden>
					<%-- <s:submit method="execute" value=" Mark Duplicate " class="button"> </s:submit> --%>	
					<%-- <s:a action="generateSID.action" class="success button" >Generate SID Card</s:a> --%>
					<s:a action="UpdateReplaceSid.action" class="success button" >Replace SID Card</s:a>
					<input type="button" class="secondary button" onclick="goBack()" value="Back">
				<s:token/></s:form>
  
				<div class="customHeader2" style="text-align: left; padding-left : 5%;">
					Previous Card Information.
				</div>
					<jsp:include page="duplicateCards.jsp" ></jsp:include>
					
				</td>
			</tr>
		</table>


	
	
</div>
</div>



</body>
</html>