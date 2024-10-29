<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
 span {
background-color: #008cba;
border-color: #007095;
color: white;
font-weight:bold;
cursor: default;
opacity: 0.7;
box-shadow: none;
padding: 5px 5px 5px 5px;
 border: 1px solid  #007095;
    border-radius: 3px;
} 

#table-wrapper {
  position:relative;
}
#table-scroll {
  height:500px;
  overflow:auto;  
  margin-top:20px;
}
#table-wrapper table {
  width:100%;
    
}
#table-wrapper table thead th .text {
  position:absolute;   
  top:-20px;
  z-index:2;
  height:20px;
  width:35%;
} 
</style>
<title>Welcome</title>
  	
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    
   

</head>
<body>

<div style="position:absolute; top:0px;">
					<s:if test="%{#session.ERROR_MESSAGE!=null}">
						<div data-alert class="alert-box warning radius" >
							<s:property value="#session.ERROR_MESSAGE"/>
							 <a href="#" class="close">&times;</a>
						</div>
						<s:set value="session.ERROR_MESSAGE" scope="session" var="ERROR_MESSAGE"> </s:set>
					</s:if>
					
					<s:if test="%{#session.SUCCESS_MESSAGE!=null}">
						<div  data-alert class="alert-box warning radius" style="color: black !important;">
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
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				
				</td>
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> 


				--><td width="75%" valign="top">
					
					   
					   <div class="customHeader">
					   		<i class="step fi-list-bullet size-40 "></i>
					   		Payment Form 
					   	</div>
						<br/>
						<div>

						 <div id="table-wrapper">
  <div id="table-scroll">
					<s:form action="/makePayment.action" method="post" 
					style="width:100%;text-align:center; " validate="true" 
					theme="simple" name="payApplication" id="payApplication">
					<table >
					<tr>
						<th>Payment Type :
						</th>
						<td> <s:radio name="payee" id="payee" onchange="payeeDetails(this)" list="{'Fresh Appointment','LockDown Appointment','UK_Brazil Appointment','Duplicate Card Payment'}" required="true" unchecked='true'></s:radio>
						</td>
					</tr>
					<tr >
					<td colspan='3' >
					<s:a action="makePayment" id="sub" class="button"> 
						 		Make Payment
						 		
						 	</s:a>
					<s:a action="makePayment" id="lockdown" class="button"> 
						 		Make Lockdown Payment
						 	</s:a>		 	
						 	</td>
					</tr>
					</table>
					<table>
					<tr>
					<td>
					
					<div id="log"></div>
					</td>
					</tr>
					</table>
				
					
					<s:hidden name="applicationId" value="%{#session.CURRENT_APPLICATION.applicationId}"></s:hidden>
					<s:hidden name="userRole" value="%{#session.USER_ROLE}"></s:hidden><br>
						
					
				<s:token/></s:form>
				<script>
				
				/* Avinash disable lockdown payment option for fresh (start) */
				<% 
		    	if(session.getAttribute("LOCKDOWN")!=null){
		    	boolean a = (boolean)session.getAttribute("LOCKDOWN");
		    	if(a==false){
				%> 

				
				document.getElementById("payeeLockDown Appointment").disabled=false
				/* Turn on the fresh payment option by turning disabled to false */
				document.getElementById("payeeFresh Appointment").disabled=false
				<%}}%>
				
				/* Avinash disable lockdown payment option for fresh (end) */
				
				var x = document.getElementById("sub");
				var lockdown = document.getElementById("lockdown");
				lockdown.style.display = "none";
				 x.style.display = "none";
				 
				 
			/* 	var newsLine=["<p style='color:red'>Fresh Appointments have to make payment and schedule appointments.</p>",
						"<p style='color:red'>"+ "Note :</p>"+
					    "<b>From lockdown period <u>23 March 2020 to 31 June 2020</u>  who have taken appointment they have to re-schedule appointment directly .</b><br>"
					    +"<p style='color:blue'>"+"LockDown Period Appointments need not have to pay again."
					    +"</p><br> <p style='color:red'> Eligibility Criteria: </p>"+
					    " <font face = 'Times New Roman' size = '3'>1) Person must not have cancelled his appointment by himself.</font><br>"
					    +"<font face = 'Times New Roman' size = '3'>2) Person is not eligible to take appointment if the person is rejected by VO officer or IO Officer.</font>",
					    " <p style='color:red'> Eligibility Criteria: </p>"+
						 "1) <b>This category Person have to <u>make payment.</u></b><br>"+
						 "2) <b>This seafarers must have to <u>provide proof of emmigration of UK or Brazil at the day of appointment.</u></b>"
					 
						]; */
						var newsLine=["","",""];
				var ele = document.getElementsByName('payee'); 
	              
	            for(i = 0; i < ele.length; i++) { 
	                if(ele[i].checked) {
	                	 document.getElementById("log").innerHTML
	                        = newsLine[i]; 
	                	 if(i==0 || i==2){
	                		 document.getElementById("sub").disabled = false; 
	                		 x.style.display = "block";
	                		 lockdown.style.display = "none";
	                	 }
	                	 else
	                		 {
	                		 document.getElementById("sub").disabled = true;
	                		 x.style.display = "none";
	                		 lockdown.style.display = "block";
	                		 }
	                }
	               
	                
	            } 
				function payeeDetails(e){
					//alert(e.value);
					//Fresh Appointment','LockDown Appointments','UK_Brzil Appointments
					var i=0;
					 if(e.value==="Fresh Appointment"){
						// alert(e.value);
						 document.getElementById("log").innerHTML
	                        = newsLine[0];
						 i=0;
					 }
					 else if(e.value==="LockDown Appointment"){
						 //alert(e.value);
						 document.getElementById("log").innerHTML
	                        = newsLine[1];
						 i=1;
					 }
					 else if(e.value==="UK_Brazil Appointment"){
						// alert(e.value);
						 document.getElementById("log").innerHTML
	                        = newsLine[2];	
						 i=2;
					 }
					
					
					 if(i==0 || i==2){
                		 document.getElementById("sub").disabled = false; 
                		 x.style.display = "block";
                		 lockdown.style.display = "none";
                	 }
                	 else
                		 {
                		 document.getElementById("sub").disabled = true;
                		 x.style.display = "none";
                		 lockdown.style.display = "block";
                		 }
		            
				}
				
				</script>
					
					
					
					<%--   -- ---------------------------
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
					 <s:select name="appointmentPlace" id="appointmentPlace"  list="{'Mumbai','Kolkata','Chennai','Noida','Goa','New Manglore','Kochi','Vizag','Kandla'}" required="true" unchecked='true'></s:select>
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
					ukBrazil.style.display = "none";
					freshAndLockdown.style.display = "none";
					
					var ele1 = document.getElementsByName('appointmentType'); 
		              
		            for(i = 0; i < ele1.length; i++) { 
		                if(ele1[i].checked) {
		                	 
		                	 if(i==0 || i==1){
		                		  
		                		 freshAndLockdown.style.display = "block";
		                		 ukBrazil.style.display = "none";
		                		 
		                	 }
		                	 else
		                		 {
		                		 
		                		 freshAndLockdown.style.display = "none";
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
						 
						 if(i==0 || i==1){
							 freshAndLockdown.style.display = "block";
	                		 ukBrazil.style.display = "none";
	                		 
	                	 }
	                	 else
	                		 {
	                		 freshAndLockdown.style.display = "none";
	                		 ukBrazil.style.display = "block";
	                		 
	                		 }
						 alert("You have selected : "+e.value);
						 
		            }
					</script> --%>
					 </td>
					</tr>
					</table>
					</div></div>
</div>
</div>
		<jsp:include page="footer.jsp"></jsp:include>	
	</div>
</div>

 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
	<script type="text/javascript">
   $(window).load(function() {
       $("#featured").orbit();
   });
</script>
</body>

</html>




