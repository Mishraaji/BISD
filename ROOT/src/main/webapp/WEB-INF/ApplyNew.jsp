<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sx:head />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<s:property value="%{#session.username}"/>
<title>ApplyNew</title>

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
<s:form action="/ApplyNewSubmit.action" method="post">
		

 <s:textfield name="BANKCHALLANNUMBER" key="BANK CHALLAN NUMBER" size="20" required="true"/>
 
 
<sx:datetimepicker name="DATED" label="DATED"
         displayFormat="dd/MM/yyyy" required="true" />
 
 

 


<s:textfield name="AMOUNT" key="AMOUNT" size="20" required="true" />
	 

<s:textfield name="BANKBRANCH" key="BANK/BRANCH" size="20" required="true" />
	

<s:textfield name="CDCNUMBER" key="CDC NUMBER:" size="20" required="true"/>




<sx:datetimepicker name="ISSUINGDATE" label="ISSUING DATE:"
         displayFormat="dd/MM/yyyy" required="true"/>
<sx:datetimepicker name="DATEEXPIRYCDC" label="CDC EXPIRY DATE:"
         displayFormat="dd/MM/yyyy" required="true"/>
		
<s:textfield name="ISSUINGAUTHORITY" key="ISSUING AUTHORITY:" size="20" required="true"/>
		

<s:textfield name="RANKINWHICHCDCWASISSUED" key="RANK IN WHICH CDC WAS ISSUED:" size="20" />
		


		 

<s:textfield name="DECK" key="DECK:" size="20" />
	
 
<s:textfield name="ENGINE" key="ENGINE:" size="20" />
		
<s:textfield name="OTHERS" key="OTHERS:" size="20" />
		
 
<s:textfield name="NOOFSEAFARERSSERVICEEXPERIENCE" key="NO. OF SEAFARERS SERVICE EXPERIENCE" size="20" required="true" /> 
<s:textfield name="NOOFVESSELSWORKED" key="NO. OF VESSELS WORKED:" size="20" required="true"/>
		

<s:textfield name="NOOFPROFESSIONALQUALIFICATIONGAINED" key="NO. OF PROFESSIONAL QUALIFICATION GAINED:" size="20" required="true" />
		

<s:textfield name="NAME" key="NAME:" size="20" required="true" required="true"/>
	
<s:textfield name="FATHERSNAME" key="FATHERS NAME:" size="20" required="true"/>
<s:textfield name="SEX" key="SEX:" size="20" required="true"/>
		

<sx:datetimepicker name="DATEOFBIRTH" label="DATE OF BIRTH:"
         displayFormat="dd/MM/yyyy" required="true"/>
<s:textfield name="NATIONALITY" key="NATIONALITY" size="20" required="true"/>
<s:textfield name="PLACEOFBIRTH" key="PLACE OF BIRTH:" size="20" required="true"/>
<s:textfield name="PASSPORTNO" key="PASSPORT NO:" size="20"required="true" />
<s:textfield name="PLACEOFISSUE" key="PLACE OF ISSUE:" size="20" />
		

<!--<sx:datetimepicker name="DATEOFISSUE" label="DATE OF ISSUE:"
         displayFormat="dd/MM/yyyy" required="true"/>

--><sx:datetimepicker name="EXPIRYDATE" label="EXPIRY DATE:"
         displayFormat="dd/MM/yyyy" required="true"/>
<s:textfield name="HOUSENO" key="HOUSE NO:" size="20" required="true"/>
<s:textfield name="STREET" key="STREET:" size="20" required="true"/>
		
 <s:textfield name="VILLAGEPOSTTEHSIL" key="VILLAGE/POST/TEHSIL:" size="20"required="true" />
		
<s:textfield name="DISTRICT" key="DISTRICT:" size="20" required="true"/>
<s:textfield name="PINCODE" key="PIN CODE:" size="20"required="true" />
 <s:textfield name="PHONENO" key="PHONE NO:" size="20" required="true"/>
<s:textfield name="NEARESTPOLICESTATION" key="NEAREST POLICE STATION:" size="20" required="true"/>
		
		
 <s:textfield name="HOUSENO1" key="HOUSE NO:" size="20" required="true"/>
		
<s:textfield name="STREET1" key="STREET:" size="20"required="true" />
<s:textfield name="VILLAGEPOSTTEHSIL1" key="VILLAGE/POST/TEHSIL:" size="20" required="true"/>
		
 <s:textfield name="DISTRICT1" key="DISTRICT:" size="20" required="true"/>
 <s:textfield name="PINCODE1" key="PIN CODE:" size="20"required="true" />

<s:textfield name="PHONENO1" key="PHONE NO:" size="20" required="true"/>
		

<s:textfield name="NEARESTPOLICESTATION1" key="NEAREST POLICE STATION" size="20" required="true"/>
		
<s:textfield name="MOBILENO" key="MOBILE NO:" size="20" />
<s:textfield name="EMAIL" key="EMAIL:" size="20"/>

	
		
<s:textfield name="HEIGHT" key="HEIGHT:" size="20" required="true"/>
	
<s:textfield name="COLOROFHAIR" key="COLOR OF HAIR" size="20" required="true"/>
		
<s:textfield name="COLOROFEYES" key="COLOR OF EYES:" size="20" required="true"/>
		
<s:textfield  name="IDENTIFICATIONMARKS" key="IDENTIFICATION MARKS:" size="20" required="true"/>
		
			 

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
<td align="right">		
<s:submit method="execute" value="Submit" theme="simple"/>
<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a></td>
</tr>
<s:token/></s:form>
	</body>

</html>







