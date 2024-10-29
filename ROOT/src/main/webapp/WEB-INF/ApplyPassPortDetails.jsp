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
    <style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
    
    }
    
    
    </style>
    
    
	<script>
	  $(function() {
	    $( "#date" ).datepicker({ dateFormat: "yy-mm-dd"});
	  });
  </script>
<sx:head />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Passport Details</title>

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
	<a href=# class=" tinny disabled button"> Detail of Employer </a>
	<a href=# class=" tinny disabled button">Attachments</a> 
</div>

<s:form action="/ApplyNewSubmit2.action" method="post" style="width:100%;" theme="simple">

	
<table width="100%">
<tr>
	<td>Name of Candidate</td>
	<td><s:textfield ></s:textfield> </td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>
<s:textfield name="PASSPORTNO" key="PASSPORT NO:" size="20"required="true" />
<s:textfield name="PLACEOFISSUE" key="PLACE OF ISSUE:" size="20" />
		

<!--<sx:datetimepicker name="DATEOFISSUE" label="DATE OF ISSUE:"
         displayFormat="dd/MM/yyyy" required="true"/>

--><s:textfield name="EXPIRYDATE" label="EXPIRY DATE:"
          required="true" id="date" />

		

	

		
			 

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

	

--><tr>
<td align="center" colspan="2">		
<s:submit method="execute" value="Next" theme="simple" class="medium button"/>
<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a>
</tr>
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







