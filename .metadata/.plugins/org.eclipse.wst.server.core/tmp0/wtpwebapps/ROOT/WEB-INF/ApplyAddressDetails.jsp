<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sx:head />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address Details</title>
<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
  	<link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" media="screen" />
    
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    
    <style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
    
      <script type="text/javascript">
      
      function getval(sel)
      {
          if(sel.value == "Select State"){
        	  document.getElementById("saveDetails").disabled = true;
              document.getElementById("selectError").style.display = "block";
          }
          else
 		 {
        	  document.getElementById("saveDetails").disabled = false;
        	  document.getElementById("selectError").style.display = "none";
         }
          alert("Your Selected State is : "+sel.value);
      }
      
 jQuery.validator.addMethod("exactlength", function(value, element, param) {
	 return this.optional(element) || value.length == param;
	}, jQuery.format("Please enter exactly {0} characters."));

 jQuery.validator.addMethod("lettersonly", function(value, element) {
	  return this.optional(element) || /^[a-z]+$/i.test(value);
	}, "Letters only please");

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
        	
        	
      	  

            //form validation rules
            $("#addressDetail").validate({
               
            	errorElement:'div',
            	rules: {
            		HOUSENO: "required",
                	
            		STREET : "required" ,
            		
            		VILLAGEPOSTTEHSIL : "required" ,
            		
            	 	PINCODE : {
								required : true ,
								exactlength:6,
		    					number : true
		    			
		    				} , 
            		
		    		DISTRICT :  {
    							required : true 
		    					
		    			
		    				} ,
		    		PHONENO :{
								number : true
								
		    			
		    				}  ,
		    		
		    		NEARESTPOLICESTATION : "required"
		    		
            	
            		
                },
                messages: {
                	HOUSENO: " House No is required.",
                  
                	STREET : "Street is required." ,
            		
                	VILLAGEPOSTTEHSIL : "Village / Tehsil Post is required.",
            		
                	PINCODE : {
								required : "Pin code is required" ,
								exactlength: "Pin code must be of 6 digits .",
		    					number : "Pin code must be Numeric"
    			
    				} ,
                	
    				DISTRICT : {
    					required : " District is required." 
    				},
    				
    				PHONENO : {
								
								number : "Numbers only"
		
			}  ,
    				
    				NEARESTPOLICESTATION : "Nearest Police Station Name is required."
			                    
                },
                submitHandler: function(form) {
                	
                
                		form.submit();
                	
                	
                	
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);
</script>


<s:head/>
</head>
 <script language="javascript" type="text/javascript">  
      
    function doSubmit()  
    {  
    window.open("SeafarerDashBoard.jsp");  
    }  
    </script> 
<body>
<s:actionerror />


<div class="row">

 <jsp:include page="header.jsp"></jsp:include>

 <s:a action="Welcome2JSP"><div class="secondary tiny button">  Home</div></s:a><s:a action="logout.action" ><div class="secondary tiny button" style="float:right">Logout</div></s:a>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">

<div class="small12 columns" style="text-align: center;">
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


<div class="customHeader1" >
	<a href=# class=" tinny disabled button">INDOS and CDC Details  </a> 
	<a href=# class=" tinny disabled button"> Personal Details </a>
	<a href=# class=" tinny  button"> Dispatch Address </a>
	<a href=# class=" tinny disabled button">Other Details</a>
	<a href=# class=" tinny disabled button">Declaration</a> 
</div>

<s:form action="/ApplyNewSubmit3.action" method="post" style="width:100%;text-align:left; " 
	validate="true" class="panel callout radius" theme="simple" id="addressDetail" name="addressDetail">
<div class="customHeader3" style="font-size: 12px;">
	<i class="step fi-info size-21"> </i> 
	Please provide you current address . Your SID will be sent to this address.
	
</div>		
		
<table width="100%">
	<tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">   Dispatch Address : 
	
			</div>
		</td>

	</tr>	
	<tr>
		<td>House No.<span style="color : red">(*)</span></td>
		<td colspan="3"><s:textfield name="HOUSENO" key="HOUSE NO:" size="40" required="true" placeholder="e.g. 123" value="%{#session.SEAFARER_ADDRESS.houseNo}"/>
		<s:fielderror fieldName="HOUSENO"></s:fielderror>
		</td>
	</tr>
	<tr>
		<td>Street <span style="color : red">(*)</span></td>
		<td colspan="3"><s:textfield name="STREET" key="STREET:" size="40" required="true" placeholder="e.g. M G Road"
					 value="%{#session.SEAFARER_ADDRESS.street}"/>
					 <s:fielderror fieldName="STREET"></s:fielderror>
					 </td>
	</tr>
	<tr>
		<td>Village / Post<br/>office / Tehsil <span style="color : red">(*)</span></td>
		<td colspan="3">
			 <s:textfield name="VILLAGEPOSTTEHSIL" key="VILLAGE/POST/TEHSIL:" size="40" required="true" 
			 	placeholder="village or city you lives in" value="%{#session.SEAFARER_ADDRESS.village}" />
			 	<s:fielderror fieldName="VILLAGEPOSTTEHSIL"></s:fielderror>
			 	</td>
	</tr>
	
	<tr>
		<td>District <span style="color : red">(*)</span></td>
		<td colspan="3"> <s:textfield name="DISTRICT" key="DISTRICT:" size="40" required="true" 
			placeholder="your district name" value="%{#session.SEAFARER_ADDRESS.district}"/>
			<s:fielderror fieldName="DISTRICT"></s:fielderror>
			</td>
	</tr>
	<tr>
		<td>State / Union Territories <span style="color : red">(*)</span></td>
		<td>
			<s:select onchange="getval(this)" label="State" name="state" id="state" value="%{#session.SEAFARER_ADDRESS.state}"
										 style="width:300px;" list="{ 'Select State','Andaman & Nicobar' ,
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
					<span id="selectError" style="color : red"> Please Select State</span>
		</td>
		<td>PIN Code <span style="color : red">(*)</span></td>
		<td><s:textfield name="PINCODE" key="PIN CODE:" maxlength="6" required="true" 
				placeholder="e.g. 400001" value="%{#session.SEAFARER_ADDRESS.pinCode}"/>
				<s:fielderror fieldName="PINCODE"></s:fielderror>
				</td>
	</tr>
	<tr>
		<td>Phone No.<br/> with STD Code</td>
		<td colspan="3"> <s:textfield name="PHONENO" key="PHONE NO:" maxlength="11"/>
				<s:fielderror fieldName="PHONENO"></s:fielderror>
				</td>
	</tr>
	<tr>
		<td>Juridicial Police Station <span style="color : red">(*)</span></td>
		<td colspan="3">
		<s:textfield name="NEARESTPOLICESTATION" key="NEAREST POLICE STATION:" size="40" required="true" 
		   placeholder="Nearerest police station" value="%{#session.SEAFARER_ADDRESS.houseNo}"/>
		   <s:fielderror fieldName="NEARESTPOLICESTATION"></s:fielderror>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="4">	
		<!-- Modified by Sidharth Bhawal(18-06-2019) -->
		<s:a action="PersonalDetailBack"><input type="button" value=" Back " class="medium secondary button"/></s:a>
		<!-- Modified by Sidharth Bhawal(18-06-2019) -->	
		<s:submit method="execute" value="Continue" theme="simple"  class="medium button" id ="saveDetails" disabled = "true"/>
		<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a></td>
		</tr>
</table>

  


		

		





<!--<s:label for="MEDCER" value="MEDICAL CERTIFICATE:"/>
   <s:file name="attachment" required="true"/>

		

<s:label for="PAASOPORT" value="PAASOPORT:"/>
   <s:file name="attachment" required="true"/>
 </span>
	
			 

<s:label for="INDOS" value="INDOS:"/>
   <s:file name="attachment" required="true"/>
</span>
		
			 

<s:label for="10THCERT" value="10TH CERTIFICATE:"/>
   <s:file name="attachment" required="true"/>

		
			 

<s:label for="SEAFAREREXPERIENCE" value="SEA SERVICE EXPERIENCE:"/>
   <s:file name="attachment" required="true" />

		 

<s:label for="PROFESSIONALEXPERIENCE" value="PROFESSIONAL EXPERIENCE:"/>
   <s:file name="attachment" required="true"/>

	

-->
<s:token/></s:form>



</div>

</div>
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>




