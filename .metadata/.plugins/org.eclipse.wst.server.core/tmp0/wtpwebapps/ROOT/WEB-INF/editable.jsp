<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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

<%-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> --%>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<%-- <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script> --%>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<script>


</script>
   <script>

   function openReveal(id){
	   $('#'+id).foundation('reveal', 'open');
   }

   function closeReveal(id){
	   $('#'+id).foundation('reveal', 'close');
   }
   
   function showAB(){
  		 var selectedVal = "";
       	 var selected = $("input[type='radio'][name='appliedBefore']:checked");
        	 if (selected.length > 0) {
           	 selectedVal = selected.val();
            
            if(selectedVal==='Yes'){
           	 $('#details').show();
           	
            }else if(selectedVal==='No'){
          	  $('#details').hide();
            }
        }

  	}
   function checkDoc()
   {
	   $('input[type="checkbox"]').click(function(){
	   if ($('#OCDC').is(":checked") && $('#OPassport').is(":checked") && $('#printFormD').is(":checked") && $('#printAcknowledgmentD').is(":checked") && $('#checkMe').is(":checked"))
		   {
		   
		   $("#errorlabelT").hide();
		   $('#sbmtD').prop('disabled', false);
		   }
	   else
		   {
		   
		   $("#errorlabelT").show();
		   $('#sbmtD').prop('disabled', true);
		   }
	   });
	   
   }
      
   	$( document ).ready(function() {
   		
   		showAB(); 
   		checkDoc();
   		
   		jQuery.validator.addMethod("exactlength", function(value, element, param) {
   		 return this.optional(element) || value.length == param;
   		}, jQuery.validator.format("Please enter exactly {0} characters."));
   		
   		jQuery.validator.setDefaults({
   		  debug: true,
   		  success: "valid" ,
   		  submitHandler: function(form) {
        	form.submit();
     	 }
   		});
   		var form = $( "#editApplication" );
   		form.validate({
            
        
        	rules: {
        		/*BANKCHALLANNUMBER: "required",
            	
        		DATED : "required" ,
        		
        		AMOUNT : "required" ,
        	
        		BANKBRANCH : "required" ,*/
	    		
				HOUSENO: "required",
            	
        		STREET : "required" ,
        		
        		VILLAGEPOSTTEHSIL : "required" ,
        		
        	 	PINCODE : {
							required : true ,
							exactlength:6,
	    					number : true
	    			
	    				} , 
        		
	    		DISTRICT :  {
							required : true ,
	    					
	    			
	    				} ,
	    		PHONENO :{
							number : true
	    			
	    				}  ,
	    		
	    		NEARESTPOLICESTATION : "required" ,
	    		
				appliedBefore: "required",
            	
        		fileNo : "required" ,
        		
        		deniedCDC : "required" ,
        		
	    		deniedSID : "required" ,
	    		
	    		verified : "required" ,
	    		
	    		OTP : "required"
	    		
	    	
	  		  			
        	},
            messages: {
            	/*BANKCHALLANNUMBER: "Challan Number is required.",
              
        		DATED : "Date is required." ,
        		
        		AMOUNT : "Amount is required.",
        		
        		BANKBRANCH : "Bank / branch name is required." ,*/
        		
        		HOUSENO: " House No is required.",
                
            	STREET : "Street is required." ,
        		
            	VILLAGEPOSTTEHSIL : "Village / Tehsil Post is required.",
        		
            	PINCODE : {
							required : "Pin code is required" ,
							exactlength: "Pin code must be of 6 digits .",
	    					number : "Pin code must be Numeric"
			
						  } ,
            	
				DISTRICT : " District is required." ,
				
				PHONENO : {
							
							number : "Numbers only"
	
						   }  ,
				
				NEARESTPOLICESTATION : "Nearest Police Station Name is required." ,
				
				appliedBefore: "Have you ever applied for SID before ?",
                
            	fileNo : "Details required including File No.." ,
        		
            	deniedCDC : "Have you been at any time debarred for obatining CDC ?",
        	
            	deniedSID : "Have you been at any time debarred for obatining SID ?",
            			
            	OTP : "Please Enter the OTP (It has been sent to seafarer's mobile.)"
            			
            	
        }});
   	
   $('#tab1Next').click(function () {  
   		
   		if(form.valid()){
   			$("#tab2").click(); 
   		}
   	});
	$('#tab2Next').click(function () {  
   			if(form.valid()){
   				$("#tab3").click(); 
   			}
   		});
	$('#tab3Next').click(function () {  
		if(form.valid()){
			$("#tab4").click(); 
		}
		
	});
	$('#tab2Pre').click(function () {  
		
		$("#tab1").click(); 
	});
	$('#tab3Pre').click(function () {  
		
		$("#tab2").click(); 
	});
	$('#tab4Pre').click(function () {  
		
		$("#tab3").click(); 
	});
	
	$('#sbmt').click(function () {  
		
		form.submit(); 
	});
	
	 });
   
	  $(function() {
	    $( "#date" ).datepicker({ dateFormat: "mm-dd-yyyy"});
	    $( "#date1" ).datepicker({ dateFormat: "mm-dd-yyyy"});
	    $( "#date2" ).datepicker({ dateFormat: "mm-dd-yyyy"});
	    $( "#date3" ).datepicker({ dateFormat: "mm-dd-yyyy"});
	 
	     //var currentDate = new Date();  
	    //$("#date").datepicker("setDate",currentDate);
	    //$("#date1").datepicker("setDate",currentDate);
	    //$("#date2").datepicker("setDate",currentDate);
	    //$("#date3").datepicker("setDate",currentDate);
	  });
	  
	  
  </script>
 <script>
function openReveal(id){
	   $('#'+id).foundation('reveal', 'open');
   }

   function closeReveal(id){
	   $('#'+id).foundation('reveal', 'close');
   }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Success</title>

</head>
 
<script type="text/javascript">
function showimagepreview(input) {
if (input.files && input.files[0]) {
var filerdr = new FileReader();
filerdr.onload = function(e) {
$('#imgprvw').attr('src', e.target.result);
}
filerdr.readAsDataURL(input.files[0]);
}
}
function showimagepreview1(input) {
	if (input.files && input.files[0]) {
	var filerdr = new FileReader();
	filerdr.onload = function(e) {
	$('#imgprvw1').attr('src', e.target.result);
	}
	filerdr.readAsDataURL(input.files[0]);
	}
	}
function getInputValue(obj)
{
	
	var inputValue = document.getElementById('remark').value;
	
    if(obj.href.indexOf(inputValue) == -1){
        obj.href += inputValue;
    }
}


</script>
<body>
<div class="row">
	<div class="twelve column">

<s:form action="/editApplication.action" method="post" enctype="multipart/form-data" 
		style="width:100%;text-align:left; " validate="true" theme="simple" name="editApplication" id="editApplication">
		
		<s:set var="ioFlag" value="true"></s:set>
		<s:set var="finalButton" value=" Submit "></s:set>
		<s:if test="%{#session.USER_ROLE==7}"> 
				<s:set var="ioFlag" value="false"></s:set>
				<s:set var="finalButton" value="Generate SID Card"></s:set>
				<s:set var="rePrintButton" value="RePrint"></s:set>
		</s:if>
	
	<div class="">	
	 <dl class="tabs" data-tab style="width: 100%;">
        <dd class="active" style="width: 25%;"><a href="#panel2-1" id="tab1">INDOS & CDC </a></dd>
        <dd style="width: 25%;"><a href="#panel2-2" id="tab2">Personal Info</a></dd>
        <dd style="width: 25%;"><a href="#panel2-3" id="tab3">Address</a></dd>
        <dd style="width: 25%;"><a href="#panel2-4" id="tab4">Other Details</a></dd>
       
      </dl>
           <s:if test="%{#parameters.verified[0] == 'iverified'  && #session.USER_ROLE==6}">
			<div class="customHeader3" style="font-size: 12px;line-height:5px !important;">
				Click "Refresh" button to fetch data from INDOS system.
			</div>
			</s:if>
		
      	<s:if test="%{#parameters.verified[0] == 'verified' && #request.rePrint=='reApprove' && #session.USER_ROLE==7}">
			<div class="customHeader3" style="font-size: 12px;line-height:5px !important;">
				Click "Refresh" button to fetch data from INDOS system.
			</div>
		</s:if>
      
      <div class="tabs-content">
        <div class="content active" id="panel2-1">
         	<table width="100%" align="center">
         		<tr>
         			<td colspan="4">
         				
	         			<s:if test="%{#session.CURRENT_APPLICATION.size > 0}">
	         				<div class="panel callout radius" >
	         					<div style="color :#008cba; font-size:18px; ">Application Remarks :
	         						 <span class="right small button disabled radius">
	         								Application No : <s:property value="%{#session.CURRENT_APPLICATION.applicationId}" /> 
	         						</span>
	         					</div><br/>
	         					<ul>
	         						<s:iterator value="#session.CURRENT_APPLICATION.remarks">
	         							<li>
	         								<span><s:property value="remark"/></span> <br/>
	         								<small><s:property value="remarkStatus"/>  by <s:property value="operatorName"/> (<s:property value="operatorType"/>) on <s:property value="remarkDate"/> </small>
	         							</li>
	         						</s:iterator>
	         					</ul>
	         				</div>
	         			</s:if>
	         			<s:else>
	         				 <div class="small button disabled radius">
	         								Application No : <s:property value="%{#session.CURRENT_APPLICATION.applicationId}" /> 
	         				</div>
	         			</s:else>
	         			
	         			
         			</td>
         		</tr>
         		<!-- 
         		Bank challan is not shown to officers
         		
         		<tr>
					<td>
						Bank Challan No.
					</td>
					<td>
					 <s:textfield name="BANKCHALLANNUMBER" id="challanNumber" label="" size="20" required="true" 
					 		value="%{#session.CURRENT_APPLICATION.bankChalanNo}"  	readonly="#ioFlag" />
					 
					</td>
					<td>
					Dated
					</td>
					<td>
					<s:textfield name="DATED" label="" id="date"  value="%{#session.CURRENT_APPLICATION.bankChalanDate}" 
						disabled="#ioFlag"  />
					</td>
				</tr>		
				
				
				<tr>
					<td>Amount</td>
					<td><s:textfield name="AMOUNT" id="amount" label="" size="20" required="true" 
							value="%{#session.CURRENT_APPLICATION.bankChalanAmount}" readonly="#ioFlag"  /></td>
					<td>Bank / Branch</td>
					<td><s:textfield name="BANKBRANCH" id="branch" label="" size="20" required="true" 
							value="%{#session.CURRENT_APPLICATION.bankBranch}" readonly="#ioFlag"  /></td>
				</tr> -->



				<%-- <tr>
						<td colspan="4" align="left">
							<div style="color :#008cba; font-size:18px; "> Category : 
					
							</div>
						</td>
				
					</tr>	
				<tr>
				
					<td> Category</td>
					
					<td colspan="3">
						 <s:radio label="CATEGORY" name="category" list="#{'1':'Category 1','2':'Category 2'}" value="1" />
							 
					</td>
				
				</tr> --%>
				<tr>
						<td colspan="4" align="left">
							<div style="color :#008cba; font-size:18px; "> INDOS Details 
					<s:hidden name="applicationId" value="%{#session.CURRENT_APPLICATION.applicationId}"> </s:hidden>
							</div>
						</td>
				
					</tr>	
				<tr>
					<td>
						INDOS No.
					</td>
					<td>
						<s:textfield name="indosNo" readonly="true"
								value="%{#session.CURRENT_APPLICATION.indosNo}" > </s:textfield>
					</td>
					<td>Date of Issue<br/>(MM/DD/YY)</td>
					<td>
						<s:textfield name="indosIssueingDate" id="date1" value="%{#session.CURRENT_APPLICATION.indosIssueingDate}" readonly="true"> </s:textfield>
					</td>
				</tr>
				<tr>
						<td colspan="4" align="left">
							<div style="color :#008cba; font-size:18px; "> CDC Details : 
					
							</div>
						</td>
				
					</tr>	
				 
				
				 
				<tr>
					<td>CDC No.</td>
					<td><s:textfield name="CDCNUMBER" readonly="true"
							value="%{#session.CURRENT_APPLICATION.CDCNo}" > </s:textfield></td>
					<td>Issuing Authority</td>
					<td><s:textfield name="ISSUINGAUTHORITY" readonly="true"
							value="%{#session.CURRENT_APPLICATION.cdcIssueingAuthority}" > </s:textfield></td>
				</tr>
				
				<tr>
					
				<td>Date of issue<br/>(MM/DD/YY)</td>
				<td> <s:textfield name="CDCISSUINGDATE" id="date2" readonly="true"
							value="%{#session.CURRENT_APPLICATION.CDCIssuingDate}"> </s:textfield></td>
				<td>Expiry Date<br/>(MM/DD/YY)</td>
				<td> <s:textfield name="DATEEXPIRYCDC" id="date3" readonly="true"
							value="%{#session.CURRENT_APPLICATION.CDCExpiryDate}"> </s:textfield></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<s:if test="%{#parameters.verified[0] == 'verified' && #request.rePrint=='reApprove' && #session.USER_ROLE==7}">
						<s:a action="refreshForm?indosNo=%{#session.CURRENT_APPLICATION.indosNo}&rePrint=reApprove&verified=verified"><input type="button" class="small button" value="Refresh" id="refreshTab1"></s:a>
						</s:if>
						
						<s:if test="%{#parameters.verified[0] == 'iverified'  && #session.USER_ROLE==6}">
						<s:a action="refreshForm?indosNo=%{#session.CURRENT_APPLICATION.indosNo}&verified=iverified"><input type="button" class="small button" value="Refresh" id="refreshTab1"></s:a>
						</s:if>
						<input type="button" class="small button" value="Next" id="tab1Next">
					</td>
				</tr>	 
				
         	</table>
        </div>
        <div class="content" id="panel2-2">
          		<table width="100%">
          		<tr>
         			<td colspan="4">
         				<div class="small button disabled radius">
	         					Application No : <s:property value="%{#session.CURRENT_APPLICATION.applicationId}" /> 
	         			</div>
	         			
         			</td>
         		</tr>
          			<tr>
						<td>Name of candidate</td>
						<td>
							<s:textfield name="firstName"  size="20" required="true" 
								value="%{#session.CURRENT_APPLICATION.fisrtName}" readonly="true"/>
						</td>
						<td>
							<s:textfield name="midleName"  size="20" 
								value="%{#session.CURRENT_APPLICATION.midleName}" readonly="true"/>
						</td>
						<td>
							<s:textfield name="lastName"  size="20"  
								value="%{#session.CURRENT_APPLICATION.lastName}" readonly="true"/>
						</td>
					</tr>
					<tr>
						<td>Father's Name</td>
						<td colspan="3"><s:textfield name="FATHERSNAME" key="FATHERS NAME:" size="20"
								value="%{#session.CURRENT_APPLICATION.fathersName}" readonly="true"/></td>
					</tr>
					<tr>
						<td>Sex</td>
						<td><s:radio label="Gender" name="SEX" list="#{'m':'male','f':'female'}"   value="%{#session.CURRENT_APPLICATION.sex}" disabled="true"/>
							<s:hidden name="SEX" value="%{#session.CURRENT_APPLICATION.sex}"></s:hidden>
						</td>
						<td>Date of Birth<br/>(MM/DD/YY)</td>
						<td><s:textfield name="DATEOFBIRTH" label="DATE OF BIRTH:" id="date" required="true" 
							value="%{#session.CURRENT_APPLICATION.dob}" readonly="true" /></td>
					</tr>
					
					<tr>
						<td>Nationality</td>
						<td><s:textfield name="NATIONALITY" key="NATIONALITY" size="20" required="true" 
							value="%{#session.CURRENT_APPLICATION.nationality}" readonly="true" /></td>
						<td>Place of Birth</td>
						<td><s:textfield name="PLACEOFBIRTH" key="PLACE OF BIRTH:" size="20" required="true" 
								value="%{#session.CURRENT_APPLICATION.placeOfBirth}" readonly="true" /></td>
					</tr>
						<%-- <tr>
						<td colspan="4" align="left">
							<div style="color :#008cba; font-size:18px; ">  9. Passport Details : 
					
							</div>
						</td>
				
					</tr>	
					
					<tr>
						<td>Valid Passport No.</td>
						<td colspan="3"><s:textfield name="PASSPORTNO" key="PASSPORT NO:" size="20"required="true" /></td>
					</tr>
					<tr>
						<td>Place of Issue</td>
						<td colspan="3"> <s:textfield name="PLACEOFISSUE" key="PLACE OF ISSUE:" size="20" /></td>
					</tr>
					<tr>
						<td>Date of Issue</td>
						<td colspan="3"><s:textfield name="EXPIRYDATE" label="EXPIRY DATE:" required="true" id="date1" /></td>
					</tr> --%>
					<tr>
						<td>Email Address</td>
						<td colspan="3"><s:textfield name="EMAIL" key="EMAIL:" size="20" 
							value="%{#session.CURRENT_APPLICATION.email}" readonly="true" /></td>
					</tr>
					<tr>
						<td>Mobile No </td>
						<td colspan="3"><s:textfield name="MOBILENO" key="MOBILE NO:" size="20" 
							value="%{#session.CURRENT_APPLICATION.mobileNo}" readonly="true" /></td>
					</tr>
						<tr>
						<td colspan="4" align="left">
							<div style="color :#008cba; font-size:18px; ">  Physical Features
					
							</div>
						</td>
				
					</tr>	
					<tr>
						<td>Height </td>
						<td><s:textfield name="HEIGHT" key="HEIGHT:" size="20" required="true" 
							value="%{#session.CURRENT_APPLICATION.height}" readonly="true"/></td>
						<td> (in Centimeters)</td>
						<td></td>
					</tr>
				<%-- 	<tr>
						<td width="25%">Colour of Hair </td>
						<td  width="25%"><s:textfield name="COLOROFHAIR" key="COLOR OF HAIR" size="20" required="true"/></td>
						<td  width="25%">Colour of Eyes</td>
						<td  width="25%"><s:textfield name="COLOROFEYES" key="COLOR OF EYES:" size="20" required="true"/></td>
					</tr> --%>
					<tr>
						<td colspan="1">Identification Marks (If any)</td>
						<td colspan="3"><s:textfield  name="IDENTIFICATIONMARKS" key="IDENTIFICATION MARKS:" size="50"
							value="%{#session.CURRENT_APPLICATION.identificationMark}" readonly="true"/></td>
					</tr>
					<tr>
					<td colspan="4" align="center">
						<input type="button" class="small button" value="Back" id="tab2Pre">
						
						<input type="button" class="small button" value="Next" id="tab2Next">
						
					</td>
				</tr>	 
          		</table>
        </div>
        <div class="content" id="panel2-3">
         	<table width="100%">
         		<tr>
         			<td colspan="4">
         				<div class="small button disabled radius">
	         					Application No : <s:property value="%{#session.CURRENT_APPLICATION.applicationId}" /> 
	         			</div>
         			</td>
         		</tr>
         		<tr>
					<td>House No.</td>
					<td colspan="3"><s:textfield name="HOUSENO" key="HOUSE NO:" size="40" required="true" 
							value="%{#session.CURRENT_APPLICATION.HouseNo}" 
							readonly="#ioFlag"  /></td>
				</tr>
				<tr>
					<td>Street</td>
					<td colspan="3"><s:textfield name="STREET" key="STREET:" size="40" required="true"
							value="%{#session.CURRENT_APPLICATION.street}"
							readonly="#ioFlag"  /></td>
				</tr>
				<tr>
					<td>Village / Post<br/>office / Tehsil</td>
					<td colspan="3"><s:textfield name="VILLAGEPOSTTEHSIL" key="VILLAGE/POST/TEHSIL:" size="40" required="true" 
							value="%{#session.CURRENT_APPLICATION.village}" 
							readonly="#ioFlag"  /></td>
				</tr>
				
				<tr>
					<td>District</td>
					<td colspan="3"> <s:textfield name="DISTRICT" key="DISTRICT:" size="40" required="true"
							value="%{#session.CURRENT_APPLICATION.district}" 
							readonly="#ioFlag" /></td>
				</tr>
				<tr>
					<td>State / Union Territories</td>
					<td>
						<s:select label="State" name="state" id="state" style="width:300px;" 
						readonly="#ioFlag" 
							value="%{#session.CURRENT_APPLICATION.state}" list="{ 'Andaman & Nicobar' ,
																						'Andhra Pradesh' ,	
																						'Arunachal Pradesh' ,	
																						'Assam' ,	
																						'Bihar' ,	
																						'Chandigarh' ,	
																						'Chhattisgarh' ,
																						'Goa' ,	
																						'Gujarat' ,	
																						'Haryana' ,
																						'Himachal Pradesh' ,	
																						'Jammu and Kashmir' ,	
																						'Jharkhand' ,	
																						'Karnataka' ,	
																						'Kerala' ,	
																						'Madhya Pradesh' ,	
																						'Maharashtra' ,	
																						'Manipur' ,	
																						'Meghalaya' ,	
																						'Mizoram' ,
																						'Nagaland' ,	
																						'New Delhi' ,	
																						'Orissa' ,	
																						'Puducherry' ,	
																						'Punjab' ,	
																						'Rajasthan' ,	
																						'Sikkim' ,
																						'Tamil Nadu' ,	
																						'Tripura' ,
																						'Telangana' ,
																						'Uttar Pradesh' ,	
																						'Uttarakhand' ,	
																						'West Bengal' ,	
																						'Dadra and Nagar' , 
																						'Daman and Diu' ,	
																						'Lakshadweep' 	}">
								</s:select>
					</td>
					<td>PIN Code</td>
					<td><s:textfield name="PINCODE" key="PIN CODE:" size="40" required="true" 
							value="%{#session.CURRENT_APPLICATION.pinCode}" 
							readonly="#ioFlag" /></td>
				</tr>
				<tr>
					<td>Phone No.<br/> with STD Code</td>
					<td> <s:textfield name="PHONENO" key="PHONE NO:" size="40"
							value="%{#session.CURRENT_APPLICATION.phoneNo}" 
							readonly="#ioFlag"  /></td>
				</tr>
				<tr>
					<td>Juridicial Police Station</td>
					<td colspan="3"><s:textfield name="NEARESTPOLICESTATION" key="NEAREST POLICE STATION:" size="40" required="true"
							value="%{#session.CURRENT_APPLICATION.nearestPoliceStation}"
							readonly="#ioFlag"  /></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="button" class="small button" value="Back" id="tab3Pre">
						<input type="button" class="small button" value="Next" id="tab3Next">
						
					</td>
				</tr>
         	</table>
        </div>
        <div class="content" id="panel2-4">
          	<table width="100%">
          		<tr>
         			<td colspan="4">
         				 <div class="small button disabled radius">
	         					Application No : <s:property value="%{#session.CURRENT_APPLICATION.applicationId}" /> 
	         			</div>
         			</td>
         		</tr>
         		
         		
         		<s:if test="%{#session.CURRENT_APPLICATION.hasAppliedEarlier=='No' || #session.CURRENT_APPLICATION.hasAppliedEarlier=='Yes'}">
          		<tr>
					<td>
						Have you ever applied for SID before ?
					</td>
					
					<td colspan="2" align="right">
						<s:radio  name="appliedBefore" list="#{'Yes':'Yes','No':'No'}"  
							value="%{#session.CURRENT_APPLICATION.hasAppliedEarlier}"
							onclick="showAB()" 
							disabled="#ioFlag" 
							 />
					</td>
				</tr>
		
		</s:if>
		<s:else>
		<tr><td colspan="4">This application is came for renewing SID</td></tr>
		</s:else>
		
				<tr style="display: none;" id="details">
					<td colspan="2">
						 Provide Details (mentioning reason with File Number)
					</td>
					<td colspan="2">
						<s:textfield name="fileNo" size="40" value="%{#session.CURRENT_APPLICATION.earlierApplicationId}" 
						 readonly="#ioFlag" 	></s:textfield>
					</td>
				</tr>
				<tr>
					<td colspan="4">
					Are you under debarred for applying
					</td>
					
				
				</tr>
				
				<tr>
					
					<td align="right">a.  CDC</td>
					<td colspan="2" align="right">
						<s:radio  name="deniedCDC" list="#{'Yes':'Yes','No':'No'}" 
								  value="%{#session.CURRENT_APPLICATION.deniedCDC}" 
								 disabled="#ioFlag"  />
					</td>
				</tr>
				
				<tr>
					
					<td align="right">b . SID</td>
					<td colspan="2" align="right">
						<s:radio  name="deniedSID" list="#{'Yes':'Yes','No':'No'}" 
								  value="%{#session.CURRENT_APPLICATION.deniedSID}" 
								  disabled="#ioFlag"  />
					</td>
				</tr>
				
<s:if test="%{#session.USER_ROLE==7}">
				<tr>
				
					<td colspan="4" align="left">
						<div style="color :#008cba; font-size:18px; "> Photo :
				
						</div>
					</td>
			
				</tr>	
				<tr>
				<s:if test="%{#parameters.verified[0] != 'verified' }">
					<td align="center">
						<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=100' />" 
								width="200" height="200"/><br/><br/>
								<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=102' />" 
								width="200" height="200"/><br/>
						<s:if test="%{#session.USER_ROLE!=7}"> 	
						<div class="">
							 <img id="imgprvw" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<img id="imgprvw1" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<s:if test="%{#parameters.verified[0] != 'verified' }">
							<div align="center">
										<p class="lead">Upload Photo</p>	<s:file name="image" label="Update Image" id="filUpload"
												onchange="showimagepreview(this)"
												style="text-align: center;" class="secondary button" title="Upload Photo">
											</s:file>
											
										<%-- <s:if test="%{#session.USER_ROLE==5}"> --%>
										<p class="lead">Upload Signature</p>
											<s:file name="signature" label="Upload Signature" id="filUpload"
												onchange="showimagepreview1(this)"
												style="text-align: center;" class="secondary button" title="Upload Signature">
											</s:file>
										
										<%-- </s:if>	 --%>
											
											
							</div>
						 
						</s:if>	
						</div>	
						</s:if> 
						
						</td>
						<td align="center">
						<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=103' />" 
								width="200" height="200"/><br/><br/>
						<s:textfield style="font-weight: bold;text-align: center;" size="40" value="Similarity Score :- %{#session.similarity_score}" readonly="true" 	></s:textfield>	
						<s:if test="%{#session.USER_ROLE!=7}"> 	
						<div class="">
							 <img id="imgprvw" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<img id="imgprvw1" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<s:if test="%{#parameters.verified[0] != 'verified' }">
							<div align="center">
										<p class="lead">Upload Photo</p>	<s:file name="image" label="Update Image" id="filUpload"
												onchange="showimagepreview(this)"
												style="text-align: center;" class="secondary button" title="Upload Photo">
											</s:file>
											
										<%-- <s:if test="%{#session.USER_ROLE==5}"> --%>
										<p class="lead">Upload Signature</p>
											<s:file name="signature" label="Upload Signature" id="filUpload"
												onchange="showimagepreview1(this)"
												style="text-align: center;" class="secondary button" title="Upload Signature">
											</s:file>
										
										<%-- </s:if>	 --%>
											
											
							</div>
						 
						</s:if>	
						</div>	
						</s:if> 
						
						</td>
				</s:if>
				<s:else>
					<td colspan="4" align="center" width="50%">
							<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=100' />" 
								width="200" height="200"/><br/>
								<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=102' />" 
								width="200" height="200"/><br/>
						<s:if test="%{#session.USER_ROLE!=7}"> 	
						<div class="">
							 <img id="imgprvw" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<img id="imgprvw1" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<s:if test="%{#parameters.verified[0] != 'verified' }">
							<div align="center">
										<p class="lead">Upload Photo</p>	<s:file name="image" label="Update Image" id="filUpload"
												onchange="showimagepreview(this)"
												style="text-align: center;" class="secondary button" title="Upload Photo">
											</s:file>
											
										<%-- <s:if test="%{#session.USER_ROLE==5}"> --%>
										<p class="lead">Upload Signature</p>
											<s:file name="signature" label="Upload Signature" id="filUpload"
												onchange="showimagepreview1(this)"
												style="text-align: center;" class="secondary button" title="Upload Signature">
											</s:file>
										
										<%-- </s:if>	 --%>
											
											
							</div>
						 
						</s:if>	
						</div>	
						</s:if> 
						<s:hidden name="userRole" value="%{#session.USER_ROLE}"> </s:hidden>
					</td>
				</s:else>
				<!--<s:if test="%{#parameters.verified[0] != 'verified' }">
					<td colspan="2" width="50%">
					<div class="panel callout radius">
						<i class="step fi-alert size-21" style="color: red;"></i><span style="font-size: 21px;"> Instructions :</span>  
							<ul>
								<li>Photo should be taken within the last 6 months</li>
								<li>File type: Jpg or Jpeg</li>
								<li>File size: Greater than 500kb and less than 1MB</li>
								<li>Dimensions: Minimum 900 pixels wide x 1200 pixels high -- maximum 4500 pixels wide x 6000 pixels high</li>
								<li>Aspect Ratio: 4:3 (Width:Height ratio) </li>
							</ul>
							<div><a href="http://travel.state.gov/content/visas/english/general/photos.html" target="_blank">Edit / Crop photo </a> </div>
					</div>
					</td>
					</s:if>-->
			
				</tr>	
</s:if>


<s:if test="%{#session.USER_ROLE==5}">
				<tr>
				
					<td colspan="4" align="left">
						<div style="color :#008cba; font-size:18px; "> Photo :
				
						</div>
					</td>
			
				</tr>	
				<tr>
				<s:if test="%{#parameters.verified[0] != 'verified' }">
					<td align="center">
						<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=100' />" 
								width="200" height="200"/><br/><br/>
								<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=102' />" 
								width="200" height="200"/><br/>
						
						
						</td>
						<td align="center">
						<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=103' />" 
								width="200" height="200"/><br/><br/>
						<s:textfield style="font-weight: bold;text-align: center;" size="40" value="Similarity Score :- %{#session.similarity_score}" readonly="true" 	></s:textfield>	
						 
						
						</td>
				</s:if>
				<s:else>
					<td colspan="4" align="center" width="50%">
							<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=100' />" 
								width="200" height="200"/><br/>
								<img src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=102' />" 
								width="200" height="200"/><br/>
						<s:if test="%{#session.USER_ROLE!=7}"> 	
						<div class="">
							 <img id="imgprvw" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<img id="imgprvw1" alt="Image Preview" width="200" height="200" align="top" 
							 			style="text-align: center;"/><br/><br/>
					<s:if test="%{#parameters.verified[0] != 'verified' }">
							<div align="center">
										<p class="lead">Upload Photo</p>	<s:file name="image" label="Update Image" id="filUpload"
												onchange="showimagepreview(this)"
												style="text-align: center;" class="secondary button" title="Upload Photo">
											</s:file>
											
										<%-- <s:if test="%{#session.USER_ROLE==5}"> --%>
										<p class="lead">Upload Signature</p>
											<s:file name="signature" label="Upload Signature" id="filUpload"
												onchange="showimagepreview1(this)"
												style="text-align: center;" class="secondary button" title="Upload Signature">
											</s:file>
										
										<%-- </s:if>	 --%>
											
											
							</div>
						 
						</s:if>	
						</div>	
						</s:if> 
						<s:hidden name="userRole" value="%{#session.USER_ROLE}"> </s:hidden>
					</td>
				</s:else>
				<!--<s:if test="%{#parameters.verified[0] != 'verified' }">
					<td colspan="2" width="50%">
					<div class="panel callout radius">
						<i class="step fi-alert size-21" style="color: red;"></i><span style="font-size: 21px;"> Instructions :</span>  
							<ul>
								<li>Photo should be taken within the last 6 months</li>
								<li>File type: Jpg or Jpeg</li>
								<li>File size: Greater than 500kb and less than 1MB</li>
								<li>Dimensions: Minimum 900 pixels wide x 1200 pixels high -- maximum 4500 pixels wide x 6000 pixels high</li>
								<li>Aspect Ratio: 4:3 (Width:Height ratio) </li>
							</ul>
							<div><a href="http://travel.state.gov/content/visas/english/general/photos.html" target="_blank">Edit / Crop photo </a> </div>
					</div>
					</td>
					</s:if>-->
			
				</tr>	
</s:if>
			<!-- 	 <tr>
				 	<td align="center"> OTP </td>
                    <td colspan="3">    
                        <s:textfield name="OTP" placeholder="OTP has been sent to Seafarer at his mobile"> </s:textfield>
                    </td>
                </tr> -->
				<s:if test="%{#parameters.verified[0] != 'verified' }">
				<s:if test="%{#session.USER_ROLE!=5}">
				<tr>
						<td colspan="4">
							
							<s:textarea rows="4" cols="20" name="remark" placeholder="Remarks (if Any)"> </s:textarea>
							<s:checkbox name="verified"></s:checkbox>
							 I have verified the information with CDC details.
						</td>
				</tr>
				
				</s:if>
				<s:if test="%{#session.USER_ROLE==5}"><tr><td colspan="2">Select Document :</td><td colspan="2">
				<s:checkbox name="printFormD" id="printFormD"></s:checkbox>Printed Form<br/>
				<s:checkbox name="printAcknowledgmentD" id="printAcknowledgmentD"></s:checkbox>Printed Acknowledgment<br/>
				<s:checkbox name="OCDC" id="OCDC"></s:checkbox>Original CDC<br/>
				<s:checkbox name="OPassport" id="OPassport"></s:checkbox>Original Passport<br/></td></tr>
				<tr>
						<td colspan="4">
							
							<s:textarea rows="4" cols="20" name="remark" placeholder="Remarks (if Any)"> </s:textarea>
							<s:checkbox name="verified" id="checkMe"></s:checkbox>
							 I have physically verified seafarer's CDC and Passport and data has been captured.
						</td>
				</tr>
				</s:if>
				<tr>
					<td colspan="4" align="center">
						
						<input type="button" class="secondary button" value="Back" id="tab4Pre" name="tab4Pre">
						 <s:if test="%{#session.USER_ROLE==7}"> 
						 
							<s:submit method="execute"  value="Generate SID Card" theme="simple" class="success button" id="sbmt"/>
							<a  class="secondary button" onclick="openReveal('rejectConfirm')"> Reject  </a>
						</s:if>
						<s:else>
							
							<s:if test="%{#session.USER_ROLE==5}">
							<s:submit method="execute"  value=" Forward Application " theme="simple" class="button" id="sbmtD" disabled="true"/>
							<p id="errorlabelT" style="color:red;display: none;">Please bring all the documents to proceed.</p>
							</s:if>
							<s:if test="%{#session.USER_ROLE!=5}">
							<s:submit method="execute"  value=" Forward Application " theme="simple" class="button" id="sbmt"/>
							<a  class="secondary button" onclick="openReveal('rejectConfirm')"> Reject  </a>
							</s:if>
						</s:else>
						
					</td>
				</tr>
</s:if>
<s:if test="%{#parameters.verified[0] == 'verified' && #request.rePrint=='rePrint' && #session.USER_ROLE==7}">
<tr>
						<td colspan="4">
							
							<s:textarea rows="4" cols="20" name="remark" id ="remark" placeholder="Remarks (if Any)"> </s:textarea>
							<s:checkbox name="verified"></s:checkbox>
							 Photo and signature is captured properly.I am generating SID card for this seafarer.
						</td>
				</tr>
<tr>

					<td colspan="4" align="center">
		<s:a action="rePrintApplication.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&remark=" theme="simple" class="button" onclick="getInputValue(this);">RePrint</s:a>
</td>
</tr>
		</s:if>
<s:if test="%{#parameters.verified[0] == 'verified' && #request.rePrint=='reApprove' && #session.USER_ROLE==7}">
<tr>
					<td colspan="4" align="center">
		<s:a action="reApproveApplication.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}" theme="simple" class="button">Approve</s:a>
</td>
</tr>
		</s:if>

          	</table>
        </div>
      </div>
      </div>
     <s:hidden name="userRole" value="%{#session.USER_ROLE}"> </s:hidden>
	<s:token/>
	</s:form>	

<div id="rejectConfirm" class="reveal-modal small" data-reveal>

<s:form action="/rejectApplication.action" method="post" 
		style="width:100%;text-align:center; " validate="true" 
		theme="simple" name="rejectApplication" id="rejectApplication">
		
	<p class="lead">Are you sure ! you want to reject this application ?</p>
	
	<s:textarea rows="5" cols="30" name="remark" placeholder="Please mention reason for rejection." style="width:100%;"> </s:textarea>
	<s:hidden name="applicationId" value="%{#session.CURRENT_APPLICATION.applicationId}"></s:hidden>
	<s:hidden name="userRole" value="%{#session.USER_ROLE}"></s:hidden>
	<s:submit method="execute" value=" Reject Application " class="button"> </s:submit>	
	<a class="secondary button" onclick="closeReveal('rejectConfirm')"> Cancel </a>
<s:token/></s:form>
  
 
  <a class="close-reveal-modal">&#215;</a>
</div>

</div>
</div>
</body>

</html>
