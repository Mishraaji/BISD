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

 $.validator.addMethod('fileSize', function(value, element, param) {
	    // param = size (en bytes) 
	    // element = element to validate (<input>)
	    // value = value of the element (file name)
	    return this.optional(element) || (element.files[0].size <= param) 
	});

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
        	
        	
      	  

            //form validation rules
            $("#otherDetails").validate({
               
            	errorElement:'div',
            	rules: {
            		appliedBefore: "required",
                	
            		fileNo : "required" ,
            		
            		deniedCDC : "required" ,
            		
		    		deniedSID : "required" ,
		    		
		    		image :  {
		    				
		    				required : true ,
		    				
		    			
		    				
		    				fileSize : 1048576
		    		} ,
		    		
		    		firNo : "required" ,
		    		
		    		firDate : "required" ,
		    		
		    		policeStationName : "required" ,
		    		
		    		firDistrict : "required"
		    		
		    		
		    		
		    		
            	
            		
                },
                messages: {
                	appliedBefore: "Have you ever applied for SID before ?",
                  
                	fileNo : "Details required including File No.." ,
            		
                	deniedCDC : "Have you been at any time debarred for obatining CDC ?",
            	
                	deniedSID : "Have you been at any time debarred for obatining SID ?",
                			
                	image :{
	    				
			    				required : "Passport size photo is required" ,
			    				
			    				accept:  "jpg ,jpeg files only." ,
			    				
			    				fileSize : "Photo must be less than 1 MB."
	    		} ,
	    		
	    		firNo : "You must have registerd FIR for the lost / stolen SID Card , Please provide the FIR No." ,
	    		
	    		firDate : "When did you register the  FIR ? " ,
	    				
	    		policeStationName : "Please Enter the Police station name , where FIR is registerd." ,
	    		
	    		firDistrict : "Please mention the District Name of the Police station ,  where FIR is registerd"
			                    
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



<sx:head />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Other Details</title>

<s:head/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous">

</script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
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
</script>
<%-- <style>
ul {
    list-style-type: none;
    padding: 0px;
    margin: 0px;
}

ul li {
    background-image: url(images/arrow.jpg);
    background-repeat: no-repeat;
    background-position: 0px 5px; 
    padding-left: 14px;
}
</style> --%>
</head>
 <script language="javascript" type="text/javascript">  
     
 
 $( document ).ready(function() {
		showAB(); 
		
			var deniedCDC=false;
			   var deniedSID=false;
			$('input[type=radio][name=deniedCDC]').change(function() {
			  
				if (this.value == 'Yes') {
			    	$("#submitApplication").attr("disabled", true);
			    	alert("If you having denied CDC then you cannot proceed further !");
			    	deniedCDC=true;
			    }
			    else{
			    	
			    	deniedCDC=false;
			    	if(deniedCDC==false && deniedSID==false)
			    		{
			    		$("#submitApplication").attr("disabled", false);
			    		}
			    }
			});
			$('input[type=radio][name=deniedSID]').change(function() {
			    if (this.value == 'Yes') {
			    	deniedSID=true;
			    	$("#submitApplication").attr("disabled", true);
			    	alert("If you having denied SID then you cannot proceed further !");
			    }
			    else{
			    	deniedSID=false;
			    	if(deniedCDC==false && deniedSID==false)
		    		{
		    		$("#submitApplication").attr("disabled", false);
		    		}
			    }
			});
		
		
		
		
	
	 });

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
         

 function hideButton(e)
 {
	if(e.value=="Yes")
	{
		$('#submitButton').hide();
		$('#debarredLabel').show();
	}
	else
	{
		$('#submitButton').show();
		$('#debarredLabel').hide();
	}
 }
 
	
 
 
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
	<a href=# class=" tinny disabled button"> Dispatch Address </a>
	<a href=# class=" tinny  button"> Other Details </a>
	<a href=# class=" tinny disabled button">Declaration</a> 
</div>
<div class="customHeader12" style="font-size: 12px;">

</div>
<s:form action="/ApplyNewSubmit5.action" method="post" enctype="multipart/form-data"
	style="width:100%;text-align:left; "  class="panel callout radius" theme="simple" name="otherDetails" id="otherDetails">

<table width="100%">  
	<%-- <tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">  14.   Details of employer : (for category 2)
	
			</div>
		</td>

	</tr>	
	<tr>
		<td>Name</td>
		<td><s:textfield name="employerName"></s:textfield> </td>
		<td>Designation</td>
		<td><s:textfield name="designation"></s:textfield> </td>
	
	</tr>	
	<tr>
		<td>Address</td>
		<td colspan="3"> <s:textarea name="employerAddress"></s:textarea> </td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td colspan="3"> <s:textfield name="employerEmail" /> </td>
	</tr>
	<tr>
		<td>Telephone</td>
		<td> <s:textfield name="employerPhoneNo" /> </td>
		<td>Fax No</td>
		<td > <s:textfield name="employerFaxNo" /> </td>
	</tr>
	<tr>
		<td colspan="2">Details of letter of Employment</td>
		<td colspan="2"><s:textarea name="details"></s:textarea> </td>
	</tr> --%>
	
	<s:if test="%{#session.operation=='duplicateSID'}">
	<tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">   FIR Details : 
	
			</div>
		</td>

	</tr>	
		<tr>
			<td>FIR No:</td>
			<td><s:textfield name="firNo" placeholer="you must have registered FIR in case of SID lost or Stolen"/></td>
			<td>Dated</td>
			<td>
				<s:textfield name="firDate" id="date" label=""/>
			</td>
		</tr>
		
		<tr>
			<td colspan="1">Name of Police Station</td>
			<td colspan="2"> <s:textfield name="policeStationName" /></td>
		</tr>
		<tr>
			<td>District </td>
			<td><s:textfield name="firDistrict" /></td>
			<td>State / Union Territory </td>
			<td>
			
				<s:select label="State" name="firState" id="state" style="width:300px;" list="{ 'Andaman & Nicobar' ,
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
		</tr>
	</s:if>
	<s:if test="%{#session.operation=='newSID'}">
	
		<tr>
		<td colspan="2">
			16. Have you ever applied for SID before ?
		</td>
		
		<td>
			<s:radio  name="appliedBefore" list="#{'Yes':'Yes','No':'No'}"  value="No" required="true" onclick="showAB()" />
		</td>
	</tr>
	<tr style="display: none;" id="details">
		<td colspan="2">
			 Provide Details (mentioning reason with File Number)
		</td>
		<td colspan="2">
			<s:textfield name="fileNo" size="40"></s:textfield>
		</td>
	</tr>
	
	</s:if>
	<tr>
		<td colspan="4">
		17.	Are you under debarred for applying.<!--Are you still debarred?///// Have you been at any time debarred for obatining -->
		</td>
		
	
	</tr>
	
	<tr>
		<td width="25%"></td>
		<td>a.  CDC</td>
		<td >
			<s:radio  name="deniedCDC" list="#{'Yes':'Yes','No':'No'}"  value="No" required="true" onclick="hideButton(this)"/>
		</td>
	</tr>
	
	<tr>
		<td width="25%"></td>
		<td >b . SID</td>
		<td>
			<s:radio  name="deniedSID" list="#{'Yes':'Yes','No':'No'}"  value="No" required="true" onclick="hideButton(this)"/>
		</td>
	</tr>
	
<!-- 	<tr>
	
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; ">   Upload Photo : 
	
			</div>
		</td>

	</tr>	
	<tr>
	
		<td colspan="2" align="center" width="50%">
			<div class="panel callout radius">
				 <img id="imgprvw" alt="uploaded image preview" width="200" height="200" align="top" style="text-align: center;"/><br/><br/>
				<div align="center">
					<s:file name="image" label="" id="filUpload" onchange="showimagepreview(this)"
							style="text-align: center;" class="secondary button" > </s:file>
				</div>
			</div>	
		</td>
		<td colspan="2" width="50%">
			<i class="step fi-alert size-21" style="color: red;"></i><span style="font-size: 21px;"> Instructions :</span>  
				<ul>
					<li>Photo should be taken within the last 6 months</li>
					<li>File type: .jpg or .jpeg</li>
					<li>File size: Greater than 500kb and less than 1MB</li>
					<li>Dimensions: Minimum 900 pixels wide x 1200 pixels high -- maximum 4500 pixels wide x 6000 pixels high</li>
					<li>Aspect Ratio: 4:3 (Width:Height ratio) </li>
				</ul>
				<div><a href="http://travel.state.gov/content/visas/english/general/photos.html" target="_blank">Edit / Crop photo </a> </div>
		</td>
		

	</tr>	 -->
	<tr>
	<td colspan="4">
		18.Please state whether you possess these document<!-- Please select documents which you have -->
	</td>
	</tr>

	<tr>
		<td width="16%"></td>
		<td>a. Indian Passport</td>
		<td >
			<s:radio  name="Passport" list="#{'Yes':'Yes','No':'No'}"  value="No" required="true"/>
		</td>
	</tr>
	
	<tr>
		<td width="16%"></td>
		<td >b. Indian CDC</td>
		<td>
			<s:radio  name="CDC" list="#{'Yes':'Yes','No':'No'}"  value="No" required="true"/>
		</td>
	</tr>
	<%-- <tr>
		<td width="16%"></td>
		<td >c. EmailID</td>
		<td>
			<s:radio  name="Email" list="#{'Yes':'Yes','No':'No'}"  value="No" />
		</td>
	</tr> --%>
	<s:if test="%{#session.operation=='renewSID'}">
	<tr>
	<td colspan="4">19.Please enter your SID details</td>
	</tr>
	<tr><td width="16%" align="right">SID number: </td><td width="16%"><input type="text" name="SIDNo" id="SIDNo" required="true"></td>
	<td width="16%" align="right">SID Issue Date:</td><td width="16%"><input type="text" name="SIDIssueDate" id="SIDIssueDate" required="true" placeholder="e.g. 2021-09-25"></td>
	</tr>
	<tr><td width="16%" align="right">SID Expiry Date:</td><td width="16%"><input type="text" name="SIDExpiryDate" id="SIDExpiryDate" required="true" placeholder="e.g. 2021-09-25"></td>
	</tr>
	
</s:if>
<tr>
	<td align="center" colspan="4">(NOTE: Please bring original Indian Passport and Indian CDC at the time of appointment.)</td>
	</tr>
	<tr id="submitButton">
		<td align="center" colspan="4">	
			<!-- Modified by Sidharth Bhawal(18-06-2019) -->	
			<s:a action="DisAddressDetailBack"><input type="button" value=" Back " class="medium secondary button"/></s:a>
			<!-- Modified by Sidharth Bhawal(18-06-2019) -->
			<s:submit id='submitApplication' method="execute" value="Continue" theme="simple" class="medium button"/>
			<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a>
		</td>
	</tr>
<tr><td>&nbsp;</td></tr>
	<tr id="debarredLabel" style="display: none;" align="center">
	<td colspan="4" style="color: red;">Sorry, you cannot apply for SID because your SID or CDC is still debarred.</td>
	</tr>
</table>
 


<script>
			$( document ).ready(function() {
				var deniedCDC=true;
				   var deniedSID=true;
				$('input[type=radio][name=deniedCDC]').change(function() {
				  
					if (this.value == 'Yes') {
				    	$("#submitApplication").attr("disabled", true);
				    	alert("If you having denied CDC then you cannot proceed further !");
				    	deniedCDC=true;
				    }
				    else{
				    	
				    	deniedCDC=false;
				    	if(deniedCDC==false && deniedSID==false)
				    		{
				    		$("#submitApplication").attr("disabled", false);
				    		}
				    }
				});
				$('input[type=radio][name=deniedSID]').change(function() {
				    if (this.value == 'Yes') {
				    	deniedSID=true;
				    	$("#submitApplication").attr("disabled", true);
				    	alert("If you having denied SID then you cannot proceed further !");
				    }
				    else{
				    	deniedSID=false;
				    	if(deniedCDC==false && deniedSID==false)
			    		{
			    		$("#submitApplication").attr("disabled", false);
			    		}
				    }
				});
			});
			</script>
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





