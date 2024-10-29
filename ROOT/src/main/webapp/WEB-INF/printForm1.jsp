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
    

<style>
	table {
background: white;
margin-bottom: 0.25rem !important;
border: solid 1px #dddddd;
}

table tr td {
	padding: 0.25rem 0.25rem;
	font-size: 0.75rem;
}


p {
font-family: inherit;
font-weight: normal;
font-size: 0.80rem;
line-height: 1.6;
margin-bottom: 0.6rem;
text-rendering: optimizeLegibility;
}


      .noPrint 
      {            
     			 display: none;     
      } 
           
       
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Success</title>
</head>
<body>


    <script language="javascript" type="text/javascript">
        function printDiv(divID) {
        	
        	$('#buttons').hide();
        	$('#header').hide();
        	$('#headerLine').hide();
        	$('#message').hide();
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
        }
    </script>

<div class="row" id="header">
 <h2 style="text-align: center; color: #008cba;"> SEAFARER IDENTITY DOCUMENT</h2>
 <div class="secondary tiny button"> <s:a action="Welcome2JSP"> Home </s:a>  </div>
</div>

<hr style="border-color:  #b9b9b9" id="headerLine"/>

<div class="row">

<div class="small12 columns" style="text-align: center;" >
<div style="position:absolute; top:0px;" id="message">
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
<div id="printable">
		
<table style="width: 90%; text-align: left; margin-bottom: 0rem;margin-top: 1rem;" align="center">

<tr>
	<td colspan="4" align="center">
		GOVERNMENT OF INDIA<BR/>
		MINISTRY OF SHIPPING<BR/></BR>
		
		<u>APPLICATION FORM FOR SEAFARERS IDENTITY DOCUMENT (SID)</u>
		
		<br><br>
		READ THE INSTRUCTIONS CAREFULLY BEFORE FILLING THE APPLICATION FORM<br><br>
		
	</td>
</tr>
	<!--<tr>
		<td colspan="3">
			INDOS AND CDC DETAILS
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem; " align="center" >
					<tr>
						<td>BANK CHALLAN No. :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.bankChalanNo}"/></td>
						<td>DATED :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.bankChalanDate}" /></td>
					</tr>

					<tr>
						<td>AMOUNT :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.bankChalanAmount}"/></td>
						<td>BANK BRANCH :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.bankBranch}" /></td>
					</tr>
			
			</table>
		</td>
		<td valign="bottom">
			<div style="text-align:center ;">
			<img alt="photo" src="<s:url action='ImageAction?applicationId=%{#session.CURRENT_APPLICATION.applicationId}' />" height="110" width="80" style="border: 1px solid #000;">
		</div>
		</td>
	</tr>
	
	--><tr>
		<td colspan="4">INDOS & CDC Details
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
					
					<tr>
						<td width="25%">INDOS NO. :</td>
						<td width="25%"><s:property value="%{#session.CURRENT_APPLICATION.indosNo}"/></td>
						<td width="25%">Date of Issue :</td>
						<td width="25%"><s:property value="%{#session.CURRENT_APPLICATION.indosIssueingDate}"/></td>
					</tr>
				
					<tr>
						<td>CDC NUMBER :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.CDCNo}"/></td>
						<td>ISSUING DATE :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.CDCIssuingDate}" /></td>
					</tr>
	
					<tr>
						<td>CDC DATE OF EXPIRY : </td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.CDCExpiryDate}"/></td>
						<td>ISSUING AUTHORITY : </td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.CDCIssuingAuthority}" /></td>
					</tr>
			
			</table>
		</td>
	</tr>

	
	

	<%-- <tr>
		<td>RANK IN WHICH CDC WAS ISSUED</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.rank}"/></td>
		<td>DECK</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.deck}" /></td>
	</tr>
	
	<tr>
		<td>ENGINE</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.engine}"/></td>
		<td>OTHERS</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.others}" /></td>
	</tr>
	
	<tr>
		<td>NO OF SEAFARERS SERVICEE XPERIENCE</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.workexp}"/></td>
		<td>NO OF VESSELS WORKED</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.novess}" /></td>
	</tr> --%>
	<tr>
		<td colspan="4">
			PERSONAL DETAILS
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
				
				<tr>
					<td width="25%">NAME :</td>
					<td width="25%"><s:property value="%{#session.CURRENT_APPLICATION.fisrtName}"/> <s:property value="%{#session.CURRENT_APPLICATION.midleName}"/> <s:property value="%{#session.CURRENT_APPLICATION.lastName}"/></td>
					<td width="25%">FATHER'S NAME :</td>
					<td width="25%"><s:property value="%{#session.CURRENT_APPLICATION.fathersName}" /></td>
				</tr>
				
				<tr>
					<td>SEX :</td>
					<td>
					<s:property value="%{#session.CURRENT_APPLICATION.sex}" />
						<s:if test="%{#session.CURRENT_APPLICATION.sex=='m'}">
							Male
						</s:if>
						<s:elseif test="%{#session.CURRENT_APPLICATION.sex=='f'}">
					 		Female
					</s:elseif>
					</td>
					<td>DATE OF BIRTH :</td>
					<td><s:property value="%{#session.CURRENT_APPLICATION.dob}" /></td>
				</tr>
				<tr>
					<td>NATIONALITY :</td>
					<td><s:property value="%{#session.CURRENT_APPLICATION.nationality}"/></td>
					<td>PLACE OF BIRTH :</td>
					<td><s:property value="%{#session.CURRENT_APPLICATION.placeOfBirth}" /></td>
				</tr>
				<tr>
					<td>Email Address : </td>
					<td colspan="3"><s:property value="%{#session.CURRENT_APPLICATION.email}"/></td>
				</tr>
				<tr>
					<td>Mobile No : </td>
					<td colspan="3"><s:property value="%{#session.CURRENT_APPLICATION.mobileNo}"/></td>
				<tr>
				<td>Height : </td>
				<td><s:property value="%{#session.CURRENT_APPLICATION.height}" /></td>
				<td>Identification Marks : </td>
				<td><s:property value="%{#session.CURRENT_APPLICATION.identificationMark}"/></td>
			</tr>
	
			</table>
		</td>
	</tr>

	<tr>
		<td colspan="4">
		
			ADDRESS 
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
					<tr>
						<td  width="25%">STREET :</td>
						<td  width="25%"><s:property value="%{#session.CURRENT_APPLICATION.street}"/></td>
						<td  width="25%">VILLAGE POST TEHSIL :</td>
						<td  width="25%"><s:property value="%{#session.CURRENT_APPLICATION.village}" /></td>
					</tr>
					
					<tr>
						<td>DISTRICT :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.district}"/></td>
						<td>PINCODE :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.pinCode}" /></td>
					</tr>
					<tr>
						<td>PHONENO :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.phoneNo}"/></td>
						<td>NEAREST POLICE STATION :</td>
						<td><s:property value="%{#session.CURRENT_APPLICATION.nearestPoliceStation}" /></td>
					</tr>
				
			</table>
		</td>
	</tr>
	
	<s:if test="%{#session.operation=='duplicateSID'}">
	<tr>
		<td colspan="4">
		FIR DETAILS
		<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
		<tr>
				<td> FIR No. : </td>
				<td> <s:property value="%{#session.CURRENT_APPLICATION.firNo}" /></td>
				<td>POLICE STATION : </td>
				<td><s:property value="%{#session.CURRENT_APPLICATION.policeStationName}"/>
		</tr>
	
		<tr>
				<td>DATED :</td>
				<td><s:property value="%{#session.CURRENT_APPLICATION.firDate}"/> </td>
				<Td>LOCATION :</Td>
				<td><s:property value="%{#session.CURRENT_APPLICATION.firDistrict}"/> ,
					<s:property value="%{#session.CURRENT_APPLICATION.firState}"/> 
				</td>
		</tr>
		</table>
		</td>
	</tr>
	</s:if>
	
	<s:if test="%{#session.operation=='newSID'}">
			<tr>
				<td colspan="4">
				
					16. have you ever applied for SID before <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.CURRENT_APPLICATION.appliedBefore =='Yes'}">checked="checked" </s:if> > Yes
					 &nbsp; &nbsp; &nbsp; <input type="checkbox" <s:if test="%{#session.CURRENT_APPLICATION.appliedBefore =='No'}">checked="checked" </s:if>> No
					 
				</td>
			</tr>
			 <s:if test="%{#session.CURRENT_APPLICATION.appliedBefore =='Yes'}">
			 
			 <tr>
			 		<td colspan="4">
			 			Provide Details (mentioning reason with File Number) : <s:property value="%{#session.CURRENT_APPLICATION.fileNo}"/>
			 		</td>
			 </tr>
			 
			 </s:if>
			 <tr>
			 		<td colspan="4">
					 		17.Have you been at any time debarred for obtaining <br/>
					 		a.  &nbsp;&nbsp; CDC  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.CURRENT_APPLICATION.deniedCDC =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" <s:if test="%{#session.CURRENT_APPLICATION.deniedCDC =='No'}">checked="checked" </s:if>> No <br/>
					 		b.  &nbsp;&nbsp; SID  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.CURRENT_APPLICATION.deniedSID =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" <s:if test="%{#session.CURRENT_APPLICATION.deniedSID =='No'}">checked="checked" </s:if>> No <br/>
							 <br/>
			 		</td>
			 </tr>
	</s:if>
	 
	 <tr>
	 		<td colspan="3" width="75%">
	 			Signature :
	 			
	 		
	 		</td>
	 		<td>
	 			Date : 
	 		</td>
	 </tr>
	<tr>
		<td colspan="4">
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/><br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<div style="color :black; font-size:14px; text-align:center; text-decoration:underline">   DECLARATION 
	
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			
			
			
			<p align="justify">
					1. I hereby declare that all the statements made in this application are true and complete to the best of my knowledge and belief and nothing
			has been concealed / distorted. 
			
			</p>
			<p align="justify">
			2.  I also affrim and declare that I have not previously been issued with a Seafarer's Identity Document (SID) and I have nat submitted an 
			application for SID to any other Shipping Master in India.
			</p>
			
			<p align="justify">
			3. I am aware that , if at any time , I am found to have concealed.distorted any material information and the Shipping Master has reason to believe 
			that I have obtained the SID by presenting false or erroneous information , my SID will be cancelled.suspended forthwith as per the provision 
			contained the Merchant Shipping (Biometric Seafarer's Identity Document) Rules , 2014 , as amended.
			</p>
			
			
					
		</td>
	</tr>
	<tr>
		<td colspan="2" width="50%">
			Place :
		</td>
		<td colspan="2">
			Signature of the Applicant :
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			Date :
		</td>
		<td colspan="2">
			Name of the Applicant : <s:property value="%{#session.CURRENT_APPLICATION.fisrtName}"/> 
									<s:property value="%{#session.CURRENT_APPLICATION.midleName}"/>
									<s:property value="%{#session.CURRENT_APPLICATION.lastName}"/>
		</td>
	</tr>
<%-- 	<tr>
		<td>PASSPORT NO</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.pasportno}"/></td>
		<td>PLACE OF ISSUE</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.poi}" /></td>
	</tr>
	
	<tr>
		<td>EXPIRY DATE</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.expdate}"/></td>
		<td>HOUSE NO</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.houseno}" /></td>
	</tr> --%>
	
	
	<%-- <tr>
		<td>HOUSENO1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.houseno1}"/></td>
		<td>STREET1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.street1}" /></td>
	</tr>
	<tr>
		<td>VILLAGEPOSTTEHSIL1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.village}"/></td>
		<td>DISTRICT1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.district1}" /></td>
	</tr>
	<tr>
		<td>PINCODE1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.pin1}"/></td>
		<td>PHONENO1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.phoneno1}" /></td>
	</tr>
	<tr>
		<td>NEAREST POLICES TATION1</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.policestation2}"/></td>
		<td>EMAIL</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.email}" /></td>
	</tr> --%>
	
<%-- 	<tr>
		<td>COLOR O HAIR</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.hairc}"/></td>
		<td>COLOR OF EYES</td>
		<td><s:property value="%{#session.CURRENT_APPLICATION.eyec}" /></td>
	</tr> --%>

</table>
</div>
</div>


<div align="center" id="buttons">
	<a href="#"  onclick="javascript:printDiv('printable')"  class="small button" target="_blank">Print Report </a>
	<s:submit value=" Cancel " action="home" theme="simple" class="medium secondary button"/>
</div>

</div>




 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>
