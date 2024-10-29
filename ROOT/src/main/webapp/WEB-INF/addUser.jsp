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
            		userName: "required",
                	
            		
            		
            		email : {
            					required : true ,
            					email : true 
            					
            			
            				} 
            		
                },
                messages: {
                	userName: "User Name is required.",
                   
                  
					
            		
            		
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
<script>
function getRole()
{
	var e = document.getElementById("roleId");
	var strUser = e.options[e.selectedIndex].value;
	
	if(strUser == 7)
	{
		document.getElementById("filUpload").style.visibility = "visible" ;
		document.getElementById("filUploadlabel").style.visibility = "visible" ;
	}
	else{
		document.getElementById("filUpload").style.visibility = "hidden" ;
		document.getElementById("filUploadlabel").style.visibility = "hidden" ;
	}
	
}

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

 
</head>

<body>
<script type="text/javascript">

	    /* $(function(){
	        $('#addCenter').ebcaptcha();
	    }); */

    </script>
    <%-- <s:if test="%{#session.USER_ROLE==11}"> --%>
<jsp:include page="header.jsp"></jsp:include>
<%-- </s:if> --%>
<div class="row">

<div class="large-12 columns" >
	<s:form action="/addUser.action" method="post" style="width:100%;" name="addCenter" id="addCenter" validate="true" enctype="multipart/form-data">
		
		<div class="customHeader">
			<i class="step fi-torso size-36"></i> Add New User
		</div>
	 <s:if test="%{#session.USER_ROLE==11}">
    	<s:select list="#session.CENTRE_LIST" label=" Select Centre " id="ccCode" name="ccCode"
    		style="width:250px;"></s:select>
		</s:if>
		<s:else>
		<s:hidden id="ccCode" name="ccCode" value="%{#session.cccode}"></s:hidden>
		</s:else>
		<s:textfield name="userName" id="userName" label="User Name (*)" required="true" style="width:60%;"></s:textfield>
	
		<s:textfield name="email" id="email" label="User Email (*)"   size="20" required="true"  
		 	placeholder="This email will serve as user name for the user" style="width:60%;"/>
		<s:select list="#session.ROLES" label=" Select Role " id="roleId" name="roleId" style="width:250px;" onchange="getRole();"></s:select>
		
<tr>
    <td class="tdLabel"><label class="label" id="filUploadlabel" style="visibility: hidden;"> Shipping Master's Signature :</label></td>
    <td>

			<s:file name="signature" id="filUpload"
					style="visibility: hidden;" theme="simple" title="Upload Signature">
			</s:file>
		</td>
</tr>
		<tr>  		    <td align="center" colspan="2">
		    		    <img src="${pageContext.request.contextPath}/Captcha.jpg" border="0"></td>
		    		    </tr>
            <s:textfield label="Captcha" name="j_captcha_response" size="20" maxlength="10"/>
		<br/>
		
		<s:hidden name="operation" value="addUSer"></s:hidden>
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