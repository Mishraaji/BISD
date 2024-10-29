<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="login.UserAccountBean"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@page import="java.util.ArrayList"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Schedule Appointment</title>
</head>

<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->


<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
<link rel="stylesheet" href="/css/custom.css" />
<script src="/js/vendor/jquery.js"></script>
  	  
<!--
Include JQuery Core (Required for calendar plugin)
** This is our IE fix version which enables drag-and-drop to work correctly in IE. See README file in js/jquery-core folder. **
-->


<!-- Include JQuery UI (Required for calendar plugin.) -->

<script>
	  
		  /* This is the function that will get executed after the DOM is fully loaded */
		 
		 var flag=0; 
		 
		  $(function() {
		    /*$( "#appDate" ).datepicker({
		      changeMonth: true,//this option for allowing user to select month
		      changeYear: true, //this option for allowing user to select from year range
		      beforeShowDay: $.datepicker.noWeekends ,
		      minDate: 0,
		      onSelect: function( selectedDate ) {
			      var appDate = selectedDate;
		    	 var centerCode = $('#selectedcccode :selected').val();

		    	 

		    	 $('#formS').submit();
		    	 
		    }
		    });*/
		    /*$('.appointmentShow').jPaginate(
					{
						'max': 10,
						'links': 'buttons'
					});*/

		 //$("#selectedcccode").change(function()
				  $(document).on('change','#selectedcccode',function(){
					    
					  
				        var ccid = $(this).val();
				        if(ccid!=-1)
				        { 
				        	var d = new Date();
				        	var currentDate = new Date();
				        	//currentDate = Date.parse(currentDate);
				        	//alert(currentDate);
				        	
				        	
				        	d.setDate(d.getDate()+1);
				        	var frmDate=d;
				        	$dateDiv = $("<input type='hidden' id='appDate' name='appDate' value='"+frmDate+"'/>");

				        	d.setDate(d.getDate() +90);
				        	var tilldate = d;
				        	
				        	$tillDateDiv=$("<input type='hidden' id='tillDate' name='tillDate' value='"+tilldate+"'/>");
				        	$("#formS").append($dateDiv);
				        	$("#formS").append($tillDateDiv);
				        	
				        	
				        	
				        	$('#formS').submit();

				        	//$( "#appDate" ).val("");
				        	$( "#dispT" ).css({
					        	"visibility":"visible"
				        	});
				        	
					     }
				        else
				        {
					        alert("Please select center code of your choice");
				        	//$( "#appDate" ).val("");
				        	$( "#dispT" ).css({
					        	"visibility":"hidden"
				        	});
					    }

				    });	
		    
		  });


		function sendApp()
		{
			if($("input[type='radio']:checked").val()=="undefined"||$("input[type='radio']:checked").val()==null||$("input[type='radio']:checked").val()=="")
			{
				alert("Please select one time slot");
				return false;
			}
			else
			{
				document.getElementById("formS").action="saveAppointment";
				document.getElementById("formS").submit();
			}
		}
		</script>
		 <style type="text/css">
    .label {
    	font-size: 18px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
<style type="text/css">
table thead tr th, table thead tr td, table tfoot tr th, table tfoot tr td {
padding: 0.5rem 0.625rem 0.625rem;
font-size: 0.875rem;
font-weight: bold;
color: white !important;
text-align: center;
}

</style>
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
<s:if test="%{#session.USER_ROLE==4}">
 <jsp:include page="header.jsp"></jsp:include>
 </s:if>
</div>

<hr style="border-color:  #b9b9b9"/>
<%
//Fresh
ArrayList<String> slots=(ArrayList<String>)request.getAttribute("slotId");
ArrayList<String> dateSlot=(ArrayList<String>)request.getAttribute("dateSlot");
ArrayList<String> dates=(ArrayList<String>)request.getAttribute("dayAll");
//String type =(String) request.getAttribute("type");
//llLockdown
ArrayList<String> slots_l=(ArrayList<String>)request.getAttribute("slotId_l");
ArrayList<String> dateSlot_l=(ArrayList<String>)request.getAttribute("dateSlot_l");
ArrayList<String> dates_l=(ArrayList<String>)request.getAttribute("dayAll_l");

%>

<div class="row">
	<div class="twelve column">
		
		<table>
			<tr>
				<td rowspan="2" width="25%" valign="top">
				<s:if test="%{#session.USER_ROLE==4}">
				<jsp:include page="activities.jsp"></jsp:include>
				</s:if>
				</td>
				<td width="75%" valign="top">
<div class="customHeader2" style="text-align: left;">
	&nbsp;&nbsp;<i class="step fi-clock size-24"></i>  Schedule your appointment
	</div>

					<s:if test="%{#session.ERROR_MESSAGE!=null}">
                                               <div data-alert class="alert-box warning radius" style="color: red;">
                                                       <s:property value="#session.ERROR_MESSAGE"/>
                                                        
                                               </div>
                                               <s:set value="ERROR_MESSAGE" var="session.ERROR_MESSAGE" scope="session"> </s:set>
</s:if>

<s:else>
					<s:form style="width:100%;text-align:center; " validate="true" theme="simple"  >
					<table >
					<tr>
						<th>Appointment Type :
						</th>
						</tr>
						<tr>
						<td> <s:radio name="appointmentType" id="appointmentType" onchange="appointmentTypes(this)" list="{'Fresh Appointment','LockDown Appointment','UK_Brazil Appointment'}" required="true" unchecked='true'></s:radio>
						</td>
					</tr>
					</table>
					</s:form>
					<div id="freshAndLockdown">
					<s:if test="%{#session.payment == true}">
					<s:form id="formS" name="formS" action="getappointment" method="post" 
style="width:100%;text-align:center; " 
	validate="true" class="panel callout radius" theme="simple">
	
	<div class="large-4 columns" style="font-size: 16px; margin-top: 0.7em;">
	Appointment Center
	</div>
	<div class="large-8 columns">
		<s:select label="select center" name="selectedcccode" list="%{#session.centers}" id="selectedcccode">
		<!--<option value="-1"><--Select Center</option>  
		<option value="5">Mumbai</option>
		<option value="3">Chennai</option>
		<option value="7">Kolkata</option>
		<option value="4">Delhi</option>
		--></s:select>
	</div>
		
		<br/>
<!--<c:choose>
  		<c:when test="${flag}">
		<div id="dateDiv" style="visibility: visible;">
			
			Please select date for getting appointment &emsp;
			<input type="text" id="appDate" name="appDate" value="${appDate} "></input>
		
		</div>
</c:when>
		<c:otherwise>
<div id="dateDiv" style="visibility: hidden;">
			
			Please select date for getting appointment &emsp;
			<input type="text" id="appDate" name="appDate"></input>
		
		</div>
 </c:otherwise>
</c:choose>-->
<!-- <div id="dateDiv" style="visibility: hidden;">
			
			Please select date for getting appointment &emsp;
			<input type="text" id="appDate" name="appDate"></input>
		
		</div> -->
		<div class="large-12 columns">
		<c:choose>
		<c:when test="${flag}">
		
		<table style="visibility: visible ;" id="dispT" class="appointmentShow" width="100%" >
		<thead style="background-color: #008cba;text-align: center;">		
		<tr>
		<th>No</th>
		<th colspan="2">Date</th>
		<th>Time Slot</th>
		</tr>
		</thead>
		<tfoot style="background-color: #008cba;text-align: center;color: white !important;">		
		<tr>
		<th>No</th>
		<th colspan="2">Date</th>
		<th>Time Slot</th>
		</tr>
		</tfoot>
		<!--<c:forEach items="${dateSlot}" var="festival">

		<tr style="background-color: #A8B2B8;">
		<td style="-moz-border-radius: 5px;border-radius: 5px;" ><input type="radio" name="slotTimeValue" value="${festival}"></td>
		<td>${festival}</td>
        <td>Available</td>
		</tr>
		</c:forEach>-->

<%

if(slots != null && slots.size()!=0){
	for(int i = 0;i<slots.size();i++)
	{
	
	%>
	
	<tr style="background-color: #b6edff;">
			<td><%=i+1%></td>
			<td style="-moz-border-radius: 5px;border-radius: 5px;" ><input type="radio" name="slotTimeValue" class="rowSlot" value="<%=slots.get(i) %>delimit<%=dates.get(i) %>"></td>
			<td name="dateHidden" class="dateHidden"><%=dates.get(i) %></td>
			<td><%=dateSlot.get(i) %></td>
			</tr>
	<%} 
}else
{	%>
<tr style="background-color: #b6edff">
			<td colspan="4">Available dates not found for this center</td>
			</tr>

<%} %>

		</table>
		
		</c:when>
		<!-- <c:otherwise>
   <table border="1" id="dispT"  style="visibility: hidden">
<tr><td>
		<table cellpadding="15px" style="text-align: center;">
<tr><td>No Values</td></tr>
	</table>
    </td>
</tr>
</table>
  </c:otherwise>-->
		</c:choose>
		</div>
 <!-- <input type="hidden" name="dateHidden" id="dateHidden" value="${appDate}"> --> 
<input type="hidden" name="ccodeHidden" id="ccodeHidden" value="${selectedcccode}">

<%if(slots != null && slots.size()!=0){%>
<div id="submitID" style="visibility: visible;">
<input type="button" value = "Submit" class="button" onclick="sendApp()">
</div>

<%} %>

<s:token/></s:form>
					
					</s:if>
					
					
					
					
					<s:else>
					<s:a action="makePayment" id="sub" class="button"> 
						 		Make Payment
						 		
						 	</s:a>
					</s:else>
					</div>
					<!-- Swaraj Adhav 26 july 2021 -->
		<script>
		 var flag_l=0
		 
		  $(function() {
		    /*$( "#appDate" ).datepicker({
		      changeMonth: true,//this option for allowing user to select month
		      changeYear: true, //this option for allowing user to select from year range
		      beforeShowDay: $.datepicker.noWeekends ,
		      minDate: 0,
		      onSelect: function( selectedDate ) {
			      var appDate = selectedDate;
		    	 var centerCode = $('#selectedcccode :selected').val();

		    	 

		    	 $('#formS').submit();
		    	 
		    }
		    });*/
		    /*$('.appointmentShow').jPaginate(
					{
						'max': 10,
						'links': 'buttons'
					});*/

		 //$("#selectedcccode").change(function()
				  $(document).on('change','#selectedcccode_l',function(){
					    
					  
				        var ccid = $(this).val();
				        if(ccid!=-1)
				        { 
				        	var d = new Date();
				        	var currentDate = new Date();
				        	//currentDate = Date.parse(currentDate);
				        	//alert(currentDate);
				        	
				        	
				        	d.setDate(d.getDate()+7);
				        	var frmDate=d;
				        	$dateDiv = $("<input type='hidden' id='appDate' name='appDate' value='"+frmDate+"'/>");

				        	d.setDate(d.getDate() +90);
				        	var tilldate = d;
				        	
				        	$tillDateDiv=$("<input type='hidden' id='tillDate' name='tillDate' value='"+tilldate+"'/>");
				        	$("#formS_l").append($dateDiv);
				        	$("#formS_l").append($tillDateDiv);
				        	
				        	
				        	
				        	$('#formS_l').submit();

				        	//$( "#appDate" ).val("");
				        	$( "#dispT" ).css({
					        	"visibility":"visible"
				        	});
				        	
					     }
				        else
				        {
					        alert("Please select center code of your choice");
				        	//$( "#appDate" ).val("");
				        	$( "#dispT" ).css({
					        	"visibility":"hidden"
				        	});
					    }

				    });	
		    
		  });


		function sendApp_l()
		{
			if($("input[type='radio']:checked").val()=="undefined"||$("input[type='radio']:checked").val()==null||$("input[type='radio']:checked").val()=="")
			{
				alert("Please select one time slot");
				return false;
			}
			else
			{
				document.getElementById("formS_l").action="saveLockdownAppointment";
				document.getElementById("formS_l").submit();
			}
		}
		  	
	</script>
					<% 
    	if(session.getAttribute("LOCKDOWN")!=null){
    	boolean a = (boolean)session.getAttribute("LOCKDOWN");
    	if(a==true){
    	%>
						<div id="Lockdown">
					<s:form id="formS_l" name="formS_l" action="getlockdownappointment" method="post" 
style="width:100%;text-align:center; " 
	validate="true" class="panel callout radius" theme="simple">
	
	<div class="large-4 columns" style="font-size: 16px; margin-top: 0.7em;">
	Appointment Center
	</div>
	<div class="large-8 columns">
		<s:select label="select center" name="selectedcccode_l" list="%{#session.centers}" id="selectedcccode_l">
		<!--<option value="-1"><--Select Center</option>  
		<option value="5">Mumbai</option>
		<option value="3">Chennai</option>
		<option value="7">Kolkata</option>
		<option value="4">Delhi</option>
		--></s:select>
	</div>
		
		<br/>
		<!--<c:choose>
  		<c:when test="${flag}">
		<div id="dateDiv" style="visibility: visible;">
			
			Please select date for getting appointment &emsp;
			<input type="text" id="appDate" name="appDate" value="${appDate} "></input>
		
		</div>
</c:when>
		<c:otherwise>
<div id="dateDiv" style="visibility: hidden;">
			
			Please select date for getting appointment &emsp;
			<input type="text" id="appDate" name="appDate"></input>
		
		</div>
 </c:otherwise>
</c:choose>-->
<!-- <div id="dateDiv" style="visibility: hidden;">
			
			Please select date for getting appointment &emsp;
			<input type="text" id="appDate" name="appDate"></input>
		
		</div> -->
		<div class="large-12 columns">
		<c:choose>
		<c:when test="${flag_l}">
		
		<table style="visibility: visible ;" id="dispT" class="appointmentShow" width="100%" >
		<thead style="background-color: #008cba;text-align: center;">		
		<tr>
		<th>No</th>
		<th colspan="2">Date</th>
		<th>Time Slot</th>
		</tr>
		</thead>
		<tfoot style="background-color: #008cba;text-align: center;color: white !important;">		
		<tr>
		<th>No</th>
		<th colspan="2">Date</th>
		<th>Time Slot</th>
		</tr>
		</tfoot>
		<!--<c:forEach items="${dateSlot_l}" var="festival">

		<tr style="background-color: #A8B2B8;">
		<td style="-moz-border-radius: 5px;border-radius: 5px;" ><input type="radio" name="slotTimeValue" value="${festival}"></td>
		<td>${festival}</td>
        <td>Available</td>
		</tr>
		</c:forEach>-->

<%

if(slots_l != null && slots_l.size()!=0){
	for(int i = 0;i<slots_l.size();i++)
	{
	
	%>
	
	<tr style="background-color: #b6edff;">
			<td><%=i+1%></td>
			<td style="-moz-border-radius: 5px;border-radius: 5px;" ><input type="radio" name="slotTimeValue" class="rowSlot" value="<%=slots_l.get(i) %>delimit<%=dates_l.get(i) %>"></td>
			<td name="dateHidden" class="dateHidden"><%=dates_l.get(i) %></td>
			<td><%=dateSlot_l.get(i) %></td>
			</tr>
	<%} 
}else
{	%>
<tr style="background-color: #b6edff">
			<td colspan="4">Available dates not found for this center</td>
			</tr>

<%} %>

		</table>
		
		</c:when>
		<!-- <c:otherwise>
   <table border="1" id="dispT"  style="visibility: hidden">
<tr><td>
		<table cellpadding="15px" style="text-align: center;">
<tr><td>No Values</td></tr>
	</table>
    </td>
</tr>
</table>
  </c:otherwise>-->
		</c:choose>
		</div>
 <!-- <input type="hidden" name="dateHidden" id="dateHidden" value="${appDate}"> --> 
<input type="hidden" name="ccodeHidden" id="ccodeHidden" value="${selectedcccode_l}">
<%if(slots_l != null && slots_l.size()!=0){%>
<div id="submitID" style="visibility: visible;">
<input type="button" value = "Submit" class="button" onclick="sendApp_l()">
</div>

<%} %>

<s:token/></s:form>
					
					
	
					</div>
									
					<%}} %>
														<div id="ukBrazil">
					<s:form id="ukBrazilap" action="ukBrazilAppointment" enctype="multipart/form-data" method="post" style="width:100%;text-align:center; " validate="true" theme="simple">						

					<table>
					<tr>
					<th>
					Select Appointment Date:
					</th>
					</tr>
					<tr>
					<td>
					<input type="date" id="apdate" onchange="dateChange(this)" required="true" name="apdate">
					</td>
					</tr>
					<th>
					Select Appointment Place:
					</th>
					</tr>
					<tr>
					<td>
					 <s:select name="appointmentPlace" id="appointmentPlace"  list="{'Mumbai','Kolkata','Chennai','Noida','Goa','New Manglore','Kochi','Vizag','Kandla','Andaman and Nicobar'}" required="true" unchecked='true'></s:select>
					</td>
					</tr>
					<tr><td>Upload Letter Copy : <s:file name="letterUpload" label="Upload letter Copy" id="letterUpload" style="text-align: center;" class="secondary button" required="true" onchange="validate_fileupload(this)"> </s:file>
					</td></tr>
					<tr><td>
					<p style='color:red'>(Please upload pdf file only Max. Size 900kb) </p>
					</td></tr>
					<tr><td><s:hidden name="applicationId" value="%{#session.CURRENT_APPLICATION.applicationId}"></s:hidden></td></tr>
					<tr>
					<td>
					<s:checkbox name="declarationPayment" id="declarationPayment" unchecked='true'/>I declare that I have made payment to dgshipping and my money is deducted from bank account.
					</td>
					</tr>
					<tr><td>
					
					<input type="submit" id="schedule" value = "Submit" class="button" >
					</td> 
					</tr>
					<tr><th><p style='color:red'>Note : Upload the  letter  from recruitment agency
mentioning details of the vessel, port and date of joining vessel in Brazil/UK. Also present given letter at the  place of appointment center at given appointment date.<br>
					Please select only working days. Don't select Saturday ,Sunday and public holidays.</p></th></tr>
					</table>
					</s:form>
					</div>
					<script>
					document.getElementById("appointmentTypeFresh Appointment").disabled=false //activating the fesh appointment
					document.getElementById("appointmentTypeLockDown Appointment").disabled=false
					function validate_fileupload(fileName)
					{
						
					    var allowed_extensions = new Array("pdf");
					    var file_extension = fileName.value.split('.').pop().toLowerCase(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

					    for(var i = 0; i <= allowed_extensions.length; i++)
					    {
					        if(allowed_extensions[i]==file_extension)
					        {
					        	
					        	
					        	
					        	
					        	 var FileSize = fileName.files[0].size/1024/1024; 
					        
					             if (FileSize > 1) {
					                 alert('File size exceeds 1 MB ! Please upload pdf less than 1 MB size.');
					                // $(file).val(''); //for clearing with Jquery
					             return false;
					             } 
					             document.getElementById("schedule").disabled = false; // valid file extension
					        return true;
					        }
					    }
						alert("Please provide pdf format letter !");
					    document.getElementById("schedule").disabled = true;
					}
					var days1 = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
					document.getElementById("schedule").disabled = true;				
										function dateChange(e){
											var d1 = new Date(e.value);
											var dayName1 = days1[d1.getDay()];
										
											var today = new Date();
											var dd = String(today.getDate()).padStart(2, '0');
											var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
											var yyyy = today.getFullYear();

											today =  yyyy + '-'+mm+'-'+dd;
											
											//alert(today+" == "+e.value);
											var date1 = new Date(e.value);
											var date2 = new Date(today);
											var diffDays =  date1.getDate() - date2.getDate() ;
											var year = date1.getFullYear()-date2.getFullYear();
											if(diffDays<0 && year <=0){
												alert("You cannot select past day!");
												document.getElementById("schedule").disabled = true; 
											}
											else if(dayName1=='Sunday'||dayName1=='Saturday')
												{
												document.getElementById("schedule").disabled = true;
												alert("You cannot select Saturday/Sunday! Don't Select Public Holiday!");
												}
											else
												{
												
												document.getElementById("schedule").disabled = false; 
												}
											
										}
					var freshAndLockdown = document.getElementById("freshAndLockdown");
					var ukBrazil = document.getElementById("ukBrazil");
					var Lockdown = document.getElementById("Lockdown");
					ukBrazil.style.display = "none";
					freshAndLockdown.style.display = "none";
					if( Lockdown != null ){
					Lockdown.style.display="none";
					}
					var ele1 = document.getElementsByName('appointmentType'); 
		              
		            for(i = 0; i < ele1.length; i++) { 
		                if(ele1[i].checked) {
		                	 
		                	 if(i==0 ){
		                		  
		                		 freshAndLockdown.style.display = "block";
		                		 if(Lockdown != null)
							Lockdown.style.display="none";
		                		 ukBrazil.style.display = "none";
		                		 
		                	 }
		                	 else if(i==1){
		                		 freshAndLockdown.style.display = "none";
		                		 if(Lockdown != null)
							Lockdown.style.display="block";
		                		 ukBrazil.style.display = "none";
		                	 }
		                	 else
		                		 {
		                		 
		                		 freshAndLockdown.style.display = "none";
						if(Lockdown != null)
			                		 Lockdown.style.display="none";
		                		 ukBrazil.style.display = "block";
		                		 
		                		 }
		                }
		               
		                
		            } 
		            
		            function appointmentTypes(e){
		            	var i=0;
						 if(e.value==="Fresh Appointment"){
							 i=0;
							
						 }
						 else if(e.value==="LockDown Appointment"){
							 i=1;
							
						 }
						 else if(e.value==="UK_Brazil Appointment"){	
							 i=2;
						 }
						 
						 if(i==0 ){
	                		  
	                		 freshAndLockdown.style.display = "block";
					if(Lockdown != null)
	                		 Lockdown.style.display="none";
	                		 ukBrazil.style.display = "none";
	                		 
	                	 }
	                	 else if(i==1){
	                		 freshAndLockdown.style.display = "none";
					if(Lockdown != null)
	                		 Lockdown.style.display="block";
	                		 ukBrazil.style.display = "none";
	                	 }
	                	 else
	                		 {
	                		 
	                		 freshAndLockdown.style.display = "none";
					if(Lockdown != null)
	                		 Lockdown.style.display="none";
	                		 ukBrazil.style.display = "block";
	                		 
	                		 }
	                 alert("You have selected : "+e.value);
						
						 
		            }
					</script>


<!-- &emsp;<input type="button" value="Cancel"> --></s:else>

				</td>
			</tr>
			
		</table>
	</div>
</div>
<!-- <s:a action="cancelAppointment">Cancel Appointment</s:a>-->
	
	<div class="bottomStrip"></div>
 <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
      	<%--- Swaraj Adhav 20 Aug 2021 Disabling LockDown radio button for fresh applicants ---%>
    	<% 
    	if(session.getAttribute("LOCKDOWN")!=null){
    	boolean a = (boolean)session.getAttribute("LOCKDOWN");
    	if(a==false){
    	%>
    	//->
    	
    	document.getElementById("appointmentTypeLockDown Appointment").disabled=true
    	console.log("disabled")
    	<%}
    		}
    	%>
    </script>
</body>    
    
</html>