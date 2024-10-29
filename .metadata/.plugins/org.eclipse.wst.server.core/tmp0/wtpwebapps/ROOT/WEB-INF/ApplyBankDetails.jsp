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
    
    	<script>
    	
    	$(document).ready(function(){
    		
    		var cdcDate = $('#date3').val();
    		var currentDate=new Date();
    		var cdcDate1=new Date(cdcDate);
    		if( cdcDate1.getFullYear() < currentDate.getFullYear())
    			{
    			$('#sbmtO').hide();
    			$('#herror').show();
    			}
    		else
    			{
    			console.log(" cdcDate "+cdcDate1.getFullYear()+" currentDate : "+currentDate.getFullYear());
    			}

    	});
	  $(function() {
	    $( "#date" ).datepicker({ dateFormat: "dd/mm/y"});
	   
	   /*  var currentDate = new Date();  
	    $("#date").datepicker("setDate",currentDate);
	    $("#date1").datepicker("setDate",currentDate);
	    $("#date2").datepicker("setDate",currentDate);
	    $("#date3").datepicker("setDate",currentDate); */
	  });
	  
	  
  </script>
  
  
  <script type="text/javascript">

 jQuery.validator.addMethod("exactlength", function(value, element, param) {
	 return this.optional(element) || value.length == param;
	}, jQuery.format("Please enter exactly {0} characters."));



/*(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
        	
        	
      	  

            //form validation rules
            $("#bankDetail").validate({
               
            	errorElement:'div',
            	rules: {
            		BANKCHALLANNUMBER: "required",
                	
            		DATED : "required" ,
            		
            		AMOUNT : "required" ,
            		
		    		BANKBRANCH :  {
    							required : true ,
		    					
		    			
		    				} ,
            		
            	
            		
                },
                messages: {
                	BANKCHALLANNUMBER: "Challan Number is required.",
                  
            		DATED : "Date is required." ,
            		
            		AMOUNT : "Amount is required.",
            		
            		BANKBRANCH : "Bank / branch name is required."
			                    
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

})(jQuery, window, document);*/
</script>
  
  
  
     <s:head />
<sx:head />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>INDOS/CDC Details</title>





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

<div class="small12 columns" >
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
	<a href=# class=" tinny button">INDOS and CDC Details  </a> 
	<a href=# class=" tinny disabled button"> Personal Details </a>
	<a href=# class=" tinny disabled button"> Dispatch Address </a>
	<a href=# class=" tinny disabled button">Other Details</a>
	<a href=# class=" tinny disabled button">Declarations</a> 
</div>



<s:form action="/ApplyNewSubmit1.action" method="post" 
	style="width:100%;text-align:left;" class="panel callout radius" theme="simple" id="bankDetail" name="bankDetail">
	<s:hidden name="operation" value="%{#session.operation}"> </s:hidden>
<div class="customHeader3" style="font-size: 12px;">
	<i class="step fi-info size-21"> </i> 
	Your basic information is fetched from INDOS . If you want to modify , please login 
	<a href="http://220.156.189.33/esamudraUI/logOut.do?method=loadIndexPage" style="color: white;" target="_blank"> here . </a>
</div>
<table width="100%">

	<%--<tr>
		<td colspan="4" align="left">
			<div style="color :#008cba; font-size:18px; "> Bank Challan Details : 
				<s:hidden name="applicationType" value="%{#session.}"></s:hidden>
			</div>
		</td>

	</tr>	
<tr>
	<td>
		Bank Challan No.
	</td>
	<td>
	 <s:textfield name="BANKCHALLANNUMBER" id="challanNumber" label="" size="20" required="true" placeholder="DD or Bank Challan No"/>
	</td>
	<td>
	Dated
	</td>
	<td>
	<s:textfield name="DATED" label="" id="date"  placeholder="Challan date"/>
	</td>
</tr>		


<tr>
	<td>Amount</td>
	<td><s:textfield name="AMOUNT" id="amount" label="" size="20" required="true" placeholder="Challan Amount" /></td>
	<td>Bank / Branch</td>
	<td><s:textfield name="BANKBRANCH" id="branch" label="" size="20" required="true" placeholder="e.g. State Bank of India" /></td>
</tr>
 <tr>
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
	
			</div>
		</td>

	</tr>	
<tr>
	<td>
		INDOS No.
	</td>
	<td>
		<s:textfield name="indosNo" value="%{#session.SEAFARER.indosNo}" readonly="true"> </s:textfield>
		<s:fielderror fieldName="indosNo"></s:fielderror>
	</td>
	<td>Date of Issue(MM/DD/YY)</td>
	<td>
		<s:textfield name="indosIssueingDate" id="date1" value="%{#session.SEAFARER.indosIssueingDate}" readonly="true"> </s:textfield>
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
	<td><s:textfield name="CDCNUMBER" value="%{#session.SEAFARER.CDCNo}" readonly="true"> </s:textfield>
	<s:fielderror fieldName="CDCNUMBER"></s:fielderror>
	</td>
	<td>Issuing Authority</td>
	<td><s:textfield name="ISSUINGAUTHORITY" value="%{#session.SEAFARER.CDCIssuingAuthority}" readonly="true"> </s:textfield></td>
</tr>

<tr>
	
<td>Date of issue(MM/DD/YY)</td>
<td> <s:textfield name="CDCISSUINGDATE" id="date2" value="%{#session.SEAFARER.CDCIssuingDate}" readonly="true"> </s:textfield>
<s:fielderror fieldName="CDCISSUINGDATE"></s:fielderror>
</td>
<td>Expiry Date(MM/DD/YY)</td>
<td> <s:textfield name="DATEEXPIRYCDC" id="date3" value="%{#session.SEAFARER.CDCExpiryDate}" readonly="true"> </s:textfield>
<s:fielderror fieldName="DATEEXPIRYCDC"></s:fielderror>
<div class="error" style="display: none;" id="herror">CDC expiry date is not updated. Please make necessary changes.</div>
</td>
</tr>
	 
<%-- <tr>
	<td colspan="2">Rank in which CDC was issued</td>
	<td><s:textfield name="RANKINWHICHCDCWASISSUED" size="30"> </s:textfield></td>
</tr> --%>

	




	
<tr>
<td align="center" colspan="4">

<s:if test="%{#session.SEAFARER.indosNo != null && #session.SEAFARER.CDCNo != null && #session.SEAFARER.CDCIssuingDate != null && #session.SEAFARER.CDCExpiryDate != null }">
<s:submit method="execute" id="sbmtO" value="Continue" theme="simple" class="medium button"/>
</s:if>
<s:else>
<Font><b>You cannot apply for SID. Please fill your all CDC/INDOS details first then only apply.</b></Font>
</s:else>

<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a></td>
</tr>


</table>
<s:token/></s:form>


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







