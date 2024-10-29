<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

<title>PO Dash Board</title>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
</head>
   
  
<body>
  
<div class="row">
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
 <jsp:include page="header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activitiesPO.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
				<div class="customHeader2" style="text-align: left; padding-left : 5%;">New Cards </div>
						<s:set value="opetation" var="opetation" scope="session"></s:set>
						<jsp:include page="asyncCard.jsp"></jsp:include>
				</td>
			</tr>
		</table>
				
	</div>
</div>


<script src="/js/foundation.min.js"></script>
<script>
      	$(document).foundation();
</script>
		<script>
   
	   
	 //Update Tracking ID
	 $("input").change(function(){
		   var  string=this.id.split('-');
		   if(string[0]==="track")
		   {
			   var value = $("#track-"+string[1]+"-"+string[2]).val();
			   if(value.length>9)
			   $("#dispatch-"+string[1]+"-"+string[2]).prop("disabled", false);
			   else
			   $("#dispatch-"+string[1]+"-"+string[2]).prop("disabled", true);  
		   }
		 }); 
	
	$("button").click(function(){
	  
	   var  string=this.id.split('-');
	  
	   //Change Color
	   $("#"+this.id).removeClass("btn-secondary");
		  $("#"+this.id).addClass("btn-primary");
		
		  
		  
	  
	   //PRint Receipt
	   if(string[0]==="print")
	   {
		   var win = window.open('getAddress.action?applicationId='+string[1]+'&sidNo='+string[2], '_blank');
		   if (win) {
		       //Browser has allowed it to be opened
		      // win.focus();
		   } else {
		       //Browser has blocked it
		       alert('Please allow popups for this website');
		   }
		   
	   }
	   
	   //Print Ack
	   
	   if(string[0]==="printAck")
	   {
		   var win = window.open('printDispatchAck.action?applicationId='+string[1]+'&sidNo='+string[2], '_blank');
		   if (win) {
		       //Browser has allowed it to be opened
		      // win.focus();
		   } else {
		       //Browser has blocked it
		       alert('Please allow popups for this website');
		   }
		   
		  
	   }
	   
	   //Dispatch
	   if(string[0]==="dispatch")
	   {
		  
		   var value = $("#track-"+string[1]+"-"+string[2]).val();
				
		   var remark = prompt("Remark, If any :", "");
		   $('table#applications tr#'+string[1]).hide();
		   $.ajax({
	            url: 'dispatched.action', // action to be perform
	            type: 'POST',       //type of posting the data
	            data: { 'applicationId': string[1],'docketNo':$("#track-"+string[1]+"-"+string[2]).val(),'remark':remark,'sidNo':string[2] }, // data to set to Action Class
	       success: function (responce) {
	    
	    	  var decision= dispatchMsg(responce);
	  
	    	  if(decision)
	    		  {
	    		  $('table#applications tr#'+string[1]).show();
	    		  }
	       },
	       error: function(xhr, ajaxOptions, thrownError){
	          alert('An error occurred! ' + thrownError);
	       }
	 		 });
		  
		   
		  
	   }
	   
	   
	}); 
	function dispatchMsg(responce){
		 var dispatchMsg=responce.split(":");
	     try{
	    	 if(dispatchMsg[0]==='Error')
	    		 {
	    		 alert(dispatchMsg[1]);
	    		return true;
	    		 }
	    	 else
	    		 {
	    		 return false;
	    		 }
	     }
	     catch(err) {
	    	 
	     }
	}
	</script>
</body>

</html>




