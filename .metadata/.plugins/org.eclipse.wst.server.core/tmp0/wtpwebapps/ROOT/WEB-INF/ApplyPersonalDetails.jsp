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
  	
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.js"></script>
	<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
 
	<script>
	  $(function() {
	   /*  $( "#date" ).datepicker({ dateFormat: "yy-mm-dd"});
	    $( "#date1" ).datepicker({ dateFormat: "yy-mm-dd"}); */
	  /*   var currentDate = new Date();  
	    $("#date").datepicker("setDate",currentDate);
	    $("#date1").datepicker("setDate",currentDate); */
	  });
  </script>
    
    <style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
    
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
            $("#personalDetails").validate({
               
            	errorElement:'div',
            	rules: {
            		
            		
            		EMAIL : {
								required : true ,
								email : true
		    			
		    				} , 
            		
		    		
		    		MOBILENO :{
								required : true ,
								number : true ,
								exactlength:10,
		    			
		    				}  
		    		
		    	
            	
            		
                },
                messages: {
                	
            		
                	EMAIL : {
								required : "Please enter your valid Email Address" ,
								email : "invalid email address e.g. abc@abc.com"
    			
    				} ,
                	
    			
    				
    				MOBILENO : {
								required : "Please enter your mobile no" ,
								number : "Numbers only",
								exactlength : "mobile number must be of 10 digits"
		
				} ,
                submitHandler: function(form) {
                	
                
                		form.submit();
                	
                	
                }}
                
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);

$( document ).ready(function() {
	var dob1 = $('#date').val();
	if(dob1 != ''){
	   dob = new Date(dob1);
	var today = new Date();
	var age =  Math.abs(Math.floor((today-dob) / (365.25 * 24 * 60 * 60 * 1000)));
	if(age < 18)
		{
		$('#sbmtO').hide();
		$('#berror').show();
		}
	}
	//Vinay
	//Applied Regex For Validating Height
	var height = $('#height').val();
	var regex = /^[0-9]+$/;
	if(height=='' || height < 7 ||( !regex.test(height)))
		{
		$('#sbmtO').hide();
		$('#herror').show();
		}
});
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Personal Details</title>

<s:head/>
</head>
<sx:head />
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
	<a href=# class=" tinny  button"> Personal Details </a>
	<a href=# class=" tinny disabled button"> Dispatch Address </a>
	<a href=# class=" tinny disabled button"> Other Details </a>
	<a href=# class=" tinny disabled button">Declaration</a> 
</div>
<s:form action="/ApplyNewSubmit4.action" method="post" style="width:100%;text-align:left; " 
		class="panel callout radius" theme="simple" name="personalDetails" id="personalDetails">
<div class="customHeader3" style="font-size: 12px;">
	<i class="step fi-info size-21"> </i> 
	Your Personal information is fetched from INDOS . If you want to modify , please login 
	<a href="http://220.156.189.33/esamudraUI/logOut.do?method=loadIndexPage" style="color: white;" target="_blank"> here . </a>
</div>	
<table width="100%">
	<tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">   Personal Details : 
	
			</div>
		</td>

	</tr>	
	<tr>
		<td>Name of candidate</td>
		<td>
			<%-- <s:textfield name="NAME" key="NAME:" size="20" required="true" required="true" value="%{#session.SEAFARER.name}" readonly="true"/> --%>
			<s:textfield name="firstName" key="NAME:"  required="true" value="%{#session.SEAFARER.fisrtName}" readonly="true"/>
			<s:fielderror fieldName="firstName"></s:fielderror>
		</td><td>
			<s:textfield name="midleName" key="NAME:"  value="%{#session.SEAFARER.midleName}" readonly="true"/>
			</td><td>
			<s:textfield name="lastName" key="NAME:"  value="%{#session.SEAFARER.lastName}" readonly="true"/>
				
		</td>
	</tr>
	<tr>
		<td>Father's Name <span style="color : red">(*)</span></td>
		<td colspan="3"><s:textfield name="FATHERSNAME" key="FATHERS NAME:" size="20" 
				value="%{#session.SEAFARER.fathersName}" readonly="true"/>
				<!--<s:fielderror fieldName="FATHERSNAME"></s:fielderror>-->
				</td>
	</tr>
	<tr>
		<td>Sex <span style="color : red">(*)</span></td>
		<td>
				<s:radio label="Gender" name="SEX" list="#{'m':'male','f':'female'}"   value="%{#session.SEAFARER.sex}"  disabled="true"/>
				<s:hidden name="SEX" value="%{#session.SEAFARER.sex}"></s:hidden>
				<s:fielderror fieldName="SEX"></s:fielderror>			
			
		</td>
		<td>Date of Birth(MM/DD/YY) <span style="color : red">(*)</span></td>
		<td><s:textfield name="DATEOFBIRTH" label="DATE OF BIRTH:" id="date" required="true" 
			value="%{#session.SEAFARER.dob}" readonly="true" />
			<div class="error" style="display: none;" id="berror">Please confirm your age details</div>
			<s:fielderror fieldName="DATEOFBIRTH"></s:fielderror>
			</td>
	</tr>
	
	<tr>
		<td>Nationality <span style="color : red">(*)</span></td>
		<td><s:textfield name="NATIONALITY" key="NATIONALITY" size="20" required="true" 
			value="%{#session.SEAFARER.nationality}" readonly="true" />
			<s:fielderror fieldName="NATIONALITY"></s:fielderror>
			</td>
		<td>Place of Birth <span style="color : red">(*)</span></td>
		<td><s:textfield name="PLACEOFBIRTH" key="PLACE OF BIRTH:" size="20" required="true" 
				value="%{#session.SEAFARER.placeOfBirth}" readonly="true" />
				<s:fielderror fieldName="PLACEOFBIRTH"></s:fielderror>
				</td>
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
		<td>Email Address <span style="color : red">(*)</span></td>
		<td colspan="3"><s:textfield name="EMAIL" key="EMAIL:" size="20" 
			value="%{#session.SEAFARER.email}"  />
			<s:fielderror fieldName="EMAIL"></s:fielderror>
			</td>
	</tr>
	<tr>
		<td>Mobile No <span style="color : red">(*)</span></td>
		<td colspan="3"><s:textfield name="MOBILENO" key="MOBILE NO:" maxlength="10" 
			value="%{#session.SEAFARER.mobileNo}"  />
			<s:fielderror fieldName="MOBILENO"></s:fielderror>
			</td>
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
			value="%{#session.SEAFARER.height}" readonly="true" id="height"/>
			<div class="error" style="display: none;" id="herror">Please check your height details and it must be in numeric format !</div>
			<s:fielderror fieldName="HEIGHT"></s:fielderror>
			</td>
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
		<td colspan="3"><s:textfield  name="IDENTIFICATIONMARKS" key="IDENTIFICATION MARKS:" size="50" required="true"
			value="%{#session.SEAFARER.identificationMark}" readonly="true"/></td>
	</tr>
	<tr>
		<td align="center" colspan="4">	
		<!-- Modified by Sidharth Bhawal(18-06-2019) -->	
			<s:a action="IndosDetailBack"><input type="button" value=" Back " class="medium secondary button"/></s:a>
		<!-- Modified by Sidharth Bhawal(18-06-2019) -->	
			<s:if test="%{#session.SEAFARER.fisrtName != null && #session.SEAFARER.sex != null && #session.SEAFARER.placeOfBirth != null && #session.SEAFARER.nationality != null && #session.SEAFARER.dob != null && #session.SEAFARER.height != null }">
			<s:submit method="execute" value="Continue" theme="simple" class="medium button" id="sbmtO"/>
			</s:if>
			<s:else>
			<Font><b>You cannot apply for SID. Please fill your all CDC/INDOS details first then only apply.</b></Font>
			</s:else>

			<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a>
		</td>
   </tr>
	
</table>
<s:token/></s:form>
<hr style="border-color:  #b9b9b9"/>

</div>


</div>

<div class="row">

</div>
 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>








