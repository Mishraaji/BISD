<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>BSID | Super Admin </title>
  	<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
    <link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
   <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
	<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
	
    
 

 <s:head />
 <style type="text/css">
 .label {
    	font-size: 16px !important;
    	background-color: white  !important;
    	color: #333333  !important;
    	text-align: left  !important;
    
    }
 </style>
 
 <script type="text/javascript">

 jQuery.validator.addMethod("exactlength", function(value, element, param) {
	 return this.optional(element) || value.length == param;
	}, jQuery.format("Please enter exactly {0} characters."));



(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
        	
        	
      	  

            //form validation rules
            $("#addCenter").validate({
               
            	errorElement:'div',
            	rules: {
            		name: "required",
                	
            		address : "required" ,
            		
            		city : "required" ,
            		
            		pinCode : {
								required : true ,
								exactlength:6,
		    					number : true
		    			
		    				} ,
            		
		    		adminName :  {
    							required : true 
		    					
		    			
		    				} ,
            		
            		email : {
            					required : true ,
            					email : true 
            					
            			
            				} 
            		
                },
                messages: {
                	name: "Center Name is required.",
                   
                  
					
            		
            		address : "Addres is required." ,
            		
            		city : "City is required." ,
            		
            		pinCode : {
								required : "Please Enter pin code , Numbers Only "  ,
								
								exactlength: "6 numbers only",
		    					number : "Invalid Pin Code - Numbers Only" 
		    					
		            			
		    				} ,
            		
		    				adminName :  {
            						required : "Admin Name is required."  
			    					
			            			
			    				} ,
            		
            		email : {
		            			required : "Please Enter Email Address"  ,
		    					email : "Please Enter Valid Email "
		            			
            				}
			                    
                },
                submitHandler: function(form) {
                	
                	if(confirm("Please verify once all the enteries made by you are correct and valid. If you are sure ,  press OK to Submit it. ")){
                		form.submit();
                	}
                	
                	
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


 
</head>

<body>
<script type="text/javascript">

	    /* $(function(){
	        $('#addCenter').ebcaptcha();
	    }); */

    </script>
    <s:if test="%{#session.USER_ROLE==11}">
<jsp:include page="header.jsp"></jsp:include></s:if>

<div class="row">

<div class="large-12 columns" >
	<s:form action="/editCenter1.action" method="post" style="width:100%" name="addCenter" id="addCenter" validate="true">
		<div class="customHeader">
	<i class="step fi-home size-24"></i>  &nbsp;&nbsp; Edit Centre
	</div>
	 <div style="height:5%;">
    
    </div>
		<s:textfield name="name" id="name" label="Centre Name" required="true" 
			value="%{#session.CURRENT_CENTRE.name}"></s:textfield>
	
		<s:textarea name="address" id="address" label="Address" rows="4" cols="20" required="true"
			value="%{#session.CURRENT_CENTRE.address}"></s:textarea>
		<s:textfield name="city" id="city" label="City" required="true"
			value="%{#session.CURRENT_CENTRE.city}" ></s:textfield>
		<s:select label="State" name="state" id="state" value="%{#session.CURRENT_CENTRE.state}"
																	 list="{ 'Andaman & Nicobar' ,
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
		 <s:textfield name="pinCode" id="pinCode" label="Pin Code" size="20" 
		 	required="true" maxlength="6" value="%{#session.CURRENT_CENTRE.pinCode}"/>
		 	
		 <s:textfield name="centerCode" id="centerCode" label="Center Code" size="20" 
		 	required="true" maxlength="6" value="%{#session.CURRENT_CENTRE.centerCode}" readonly="true"/>	
		 <!--<s:textfield name="adminName" id="adminName" label="Admin Name"   size="20" required="true"
		 	value="%{#session.CURRENT_CENTRE.adminName}"/>-->
		 <tr>  		    <td align="center" colspan="2">
		    		    <img src="${pageContext.request.contextPath}/Captcha.jpg" border="0"></td>
		    		    </tr>
            <s:textfield label="Captcha" name="j_captcha_response" size="20" maxlength="10"/>
		    
		<br/>
		<s:hidden name="operation" value="edit"></s:hidden>
			<s:submit method="execute" label="Submit" value="Submit" align="center" class="button" />
	
	<s:token/></s:form>

</div>
</div>


 <script src="/js/foundation.min.js"></script>
 <script>
      	$(document).foundation();
 </script>
</body>
</html>