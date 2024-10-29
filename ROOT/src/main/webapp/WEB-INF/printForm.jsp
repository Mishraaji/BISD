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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="/js/jquery-barcode.js"></script>
	<script type="text/javascript" src="/js/html2canvas.js"></script>
	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
 	<style type="text/css">
    .label {
    	font-size: 14px;
    	background-color: white;
    	color: #333333;
    
    }
    

<style>

* {
color: #7F7F7F;
font-family: Arial, sans-serif;
font-size: 12px;
font-weight: normal;
}
#config {
overflow: auto;
margin-bottom: 10px;
}
.config {
float: left;
width: 200px;
height: 250px;
border: 1px solid #000;
margin-left: 10px;
}
.config .title {
font-weight: bold;
text-align: center;
}
.config .barcode2D,  #miscCanvas {
display: none;
}
#submit {
clear: both;
}
#barcodeTarget,  #canvasTarget {
margin-top: 20px;
}

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
<style>
@page { size: auto;  margin: 0mm; }
</style>
<script type="text/javascript">
         
      
      /* $(function(){
         
    	  //var username = $('#appIDnumber').html();
    	  var username = '211';
          var btype = "code39";
     	

            $("#barcodeTarget").html("").show().barcode(username, btype);
         
      }); */
      
      $(function(){
          var value =  $('#appIDnumber').html();
          var btype = "code39";
          

  	
            $("#barcodeTarget").barcode(value, btype);

  	html2canvas($('#barcodeTarget'), {
          onrendered: function (canvas) {

              var imageData = canvas.toDataURL('image/jpeg'); 

              $("#barcodeTarget").hide(); 
  $("#newimg").attr('src',imageData);
  $('#img').show();
       }
      });
          
      });
  
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Application No : <s:property value="%{#session.applicationId}"/></title>
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
            $('#buttons').show();
        	$('#header').show();
        	$('#headerLine').show();
            document.body.innerHTML = oldPage;

          
        }
    </script>


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

<div align="center" id="buttons">
<s:a action="Welcome2JSP"><div class="small button" style="float:left;">  Back</div></s:a>
	<a href="#"  onclick="javascript:printDiv('printable')"  class="small button" style="float:right">Print Report </a>
	
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
	<tr>
		<td colspan="2">
			APPLICATION NO: <h5 id="appIDnumber"><s:property value="%{#session.applicationId}"/></h5>
		</td>
		<td colspan="2" align="right">
			<div id="barcodeTarget" class="barcodeTarget" style="width:50%;"></div>
			<div id="img">
<img src="" id="newimg" class="barcodeTarget"/>
</div>	
		</td>
	</tr>
	<!--<tr>
		<td colspan="3">
			INDOS AND CDC DETAILS
			 <table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem; " align="center" >
					<tr>
						<td>BANK CHALLAN No. :</td>
						<td><s:property value="%{#session.bankchallanno}"/></td>
						<td>DATED :</td>
						<td><s:property value="%{#session.dated}" /></td>
					</tr>

					<tr>
						<td>AMOUNT :</td>
						<td><s:property value="%{#session.amount}"/></td>
						<td>BANK BRANCH :</td>
						<td><s:property value="%{#session.bankbranch}" /></td>
					</tr>
			
			</table> 
		</td>



		<!--<td valign="bottom">
			<div style="text-align:center ;">
			<img alt="photo" src="<s:url action='ImageAction?applicationId=%{#session.applicationId}&documentType=100' />" height="110" width="80" style="border: 1px solid #000;">
		</div>
		</td>
	</tr>-->
	
	<tr>
		<td colspan="4">INDOS & CDC Details
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
					
					<tr>
						<td width="25%">INDOS NO. :</td>
						<td width="25%"><s:property value="%{#session.indosNo}"/></td>
						<td width="25%">Date of Issue :</td>
						<td width="25%"><s:property value="%{#session.indosIssueingDate}"/></td>
					</tr>
				
					<tr>
						<td>CDC NUMBER :</td>
						<td><s:property value="%{#session.CDCNUMBER}"/></td>
						<td>ISSUING DATE :</td>
						<td><s:property value="%{#session.CDCISSUINGDATE}" /></td>
					</tr>
	
					<tr>
						<td>CDC DATE OF EXPIRY : </td>
						<td><s:property value="%{#session.DATEEXPIRYCDC}"/></td>
						<td>ISSUING AUTHORITY : </td>
						<td><s:property value="%{#session.ISSUINGAUTHORITY}" /></td>
					</tr>
			
			</table>
		</td>
	</tr>

	
	

	<%-- <tr>
		<td>RANK IN WHICH CDC WAS ISSUED</td>
		<td><s:property value="%{#session.rank}"/></td>
		<td>DECK</td>
		<td><s:property value="%{#session.deck}" /></td>
	</tr>
	
	<tr>
		<td>ENGINE</td>
		<td><s:property value="%{#session.engine}"/></td>
		<td>OTHERS</td>
		<td><s:property value="%{#session.others}" /></td>
	</tr>
	
	<tr>
		<td>NO OF SEAFARERS SERVICEE XPERIENCE</td>
		<td><s:property value="%{#session.workexp}"/></td>
		<td>NO OF VESSELS WORKED</td>
		<td><s:property value="%{#session.novess}" /></td>
	</tr> --%>
	<tr>
		<td colspan="4">
			PERSONAL DETAILS
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
				
				<tr>
					<td width="25%">NAME :</td>
					<td width="25%"><s:property value="%{#session.firstName}"/> <s:property value="%{#session.midleName}"/> <s:property value="%{#session.lastName}"/></td>
					<td width="25%">FATHER'S NAME :</td>
					<td width="25%"><s:property value="%{#session.fathername}" /></td>
				</tr>
				
				<tr>
					<td>SEX :</td>
					<td>
						<%
						if(session.getAttribute("sex").equals("m")){
					%>	
						Male
					<%} else if(session.getAttribute("sex").equals("f")){ %>
						Female
					<%} %>
					</td>
					<td>DATE OF BIRTH :</td>
					<td><s:property value="%{#session.dob}" /></td>
				</tr>
				<tr>
					<td>NATIONALITY :</td>
					<td><s:property value="%{#session.nationality}"/></td>
					<td>PLACE OF BIRTH :</td>
					<td><s:property value="%{#session.pob}" /></td>
				</tr>
				<tr>
					<td>Email Address : </td>
					<td colspan="3"><s:property value="%{#session.email}"/></td>
				</tr>
				<tr>
					<td>Mobile No : </td>
					<td colspan="3"><s:property value="%{#session.mobileno}"/></td>
				<tr>
				<td>Height : </td>
				<td><s:property value="%{#session.height}" /></td>
				<td>Identification Marks : </td>
				<td><s:property value="%{#session.identmark}"/></td>
			</tr>
	
			</table>
		</td>
	</tr>

	<tr>
		<td colspan="4">
		
			ADDRESS 
			<table style="width: 100%; text-align: left; border: 1px solid #000; margin-bottom: 0rem;" align="center" >
			<tr>
			<td  width="25%">House No. :</td>
						<td  width="25%"><s:property value="%{#session.houseno}"/></td>
						</tr>
					<tr>
						<td  width="25%">STREET :</td>
						<td  width="25%"><s:property value="%{#session.street}"/></td>
						<td  width="25%">VILLAGE POST TEHSIL :</td>
						<td  width="25%"><s:property value="%{#session.village}" /></td>
					</tr>
					
					<tr>
						<td>DISTRICT :</td>
						<td><s:property value="%{#session.district}"/></td>
						<td>STATE :</td>
						<td><s:property value="%{#session.state}" /></td>
						
					</tr>
					<tr>
						<td>PINCODE :</td>
						<td><s:property value="%{#session.pin}" /></td>
						<td>PHONE No :</td>
						<td><s:property value="%{#session.phoneno}"/></td>
					</tr>
					<tr>
					<td>NEAREST POLICE STATION :</td>
						<td><s:property value="%{#session.policestation}" /></td>
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
				<td> <s:property value="%{#session.firNo}" /></td>
				<td>POLICE STATION : </td>
				<td><s:property value="%{#session.policeStationName}"/>
		</tr>
	
		<tr>
				<td>DATED :</td>
				<td><s:property value="%{#session.firDate}"/> </td>
				<Td>LOCATION :</Td>
				<td><s:property value="%{#session.firDistrict}"/> ,
					<s:property value="%{#session.firState}"/> 
				</td>
		</tr>
		</table>
		</td>
	</tr>
	</s:if>
	
	<s:if test="%{#session.operation=='newSID'}">
			<tr>
				<td colspan="4">
				
					have you ever applied for SID before <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.appliedBefore =='Yes'}">checked="checked" </s:if> > Yes
					 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.appliedBefore =='No'}">checked="checked" </s:if>> No
					 
				</td>
			</tr>
			 <s:if test="%{#session.appliedBefore =='Yes'}">
			 
			 <tr>
			 		<td colspan="4">
			 			Provide Details (mentioning reason with File Number) : <s:property value="%{#session.fileNo}"/>
			 		</td>
			 </tr>
			 
			 </s:if>
			 <tr>
			 		<td colspan="4">
					 		Have you been at any time debarred for obtaining <br/>
					 		a.  &nbsp;&nbsp; CDC  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.deniedCDC =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.deniedCDC =='No'}">checked="checked" </s:if>> No <br/>
					 		b.  &nbsp;&nbsp; SID  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.deniedSID =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.deniedSID =='No'}">checked="checked" </s:if>> No <br/>
							 <br/>
			 		</td>
			 </tr>
			<tr>
			 		<td colspan="4">
					 		Please select documents which you have <br/>
							a.  &nbsp;&nbsp; Passport  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.Passport =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.Passport =='No'}">checked="checked" </s:if>> No <br/>
							<br/>
					 		b.  &nbsp;&nbsp; CDC  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.CDC =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.CDC =='No'}">checked="checked" </s:if>> No <br/>
					 		 <br/>
			 		</td>
			 </tr>
	</s:if>
	<s:if test="%{#session.operation=='renewSID'}">
			<tr>
				<td colspan="4">
				
					I am applying for renew SID.
					 
				</td>
			</tr>
			 <tr>
			 		<td colspan="4">
					 		Have you been at any time debarred for obtaining <br/>
					 		a.  &nbsp;&nbsp; CDC  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.deniedCDC =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.deniedCDC =='No'}">checked="checked" </s:if>> No <br/>
					 		b.  &nbsp;&nbsp; SID  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.deniedSID =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.deniedSID =='No'}">checked="checked" </s:if>> No <br/>
							 <br/>
			 		</td>
			 </tr>
			<tr>
			 		<td colspan="4">
					 		Please select documents which you have <br/>
							a.  &nbsp;&nbsp; Passport  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.Passport =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.Passport =='No'}">checked="checked" </s:if>> No <br/>
							<br/>
					 		b.  &nbsp;&nbsp; CDC  &nbsp;&nbsp; &nbsp;&nbsp;  <input type="checkbox" disabled="disabled" readonly="readonly"  <s:if test="%{#session.CDC =='Yes'}">checked="checked" </s:if> > Yes
							 &nbsp; &nbsp; &nbsp; <input type="checkbox" disabled="disabled" readonly="readonly" <s:if test="%{#session.CDC =='No'}">checked="checked" </s:if>> No <br/>
					 		 <br/>
			 		</td>
			 </tr>
	</s:if>
	

	 
	
	<tr>
		<td colspan="4">
			
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
			has been concealed/distorted. 
			
			</p>
			<p align="justify">
			2.  I also affirm and declare that I have not previously been issued with a Seafarer's Identity Document (SID) and I have not submitted an 
			application for SID to any other Shipping Master in India.
			</p>
			
			<p align="justify">
			3. I am aware that, if at any time, I am found to have concealed/distorted any material information and the Shipping Master has reason to believe 
			that I have obtained the SID by presenting false or erroneous information, my SID will be cancelled/suspended forthwith as per the provision of
			Merchant Shipping (Seafarer's Identity Document) Rules, 2016, as amended.
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
			Name of the Applicant : <s:property value="%{#session.firstName}"/>
									<s:property value="%{#session.midleName}"/>
									 <s:property value="%{#session.lastName}"/>
		</td>
	</tr>
<%-- 	<tr>
		<td>PASSPORT NO</td>
		<td><s:property value="%{#session.pasportno}"/></td>
		<td>PLACE OF ISSUE</td>
		<td><s:property value="%{#session.poi}" /></td>
	</tr>
	
	<tr>
		<td>EXPIRY DATE</td>
		<td><s:property value="%{#session.expdate}"/></td>
		<td>HOUSE NO</td>
		<td><s:property value="%{#session.houseno}" /></td>
	</tr> --%>
	
	
	<%-- <tr>
		<td>HOUSENO1</td>
		<td><s:property value="%{#session.houseno1}"/></td>
		<td>STREET1</td>
		<td><s:property value="%{#session.street1}" /></td>
	</tr>
	<tr>
		<td>VILLAGEPOSTTEHSIL1</td>
		<td><s:property value="%{#session.village}"/></td>
		<td>DISTRICT1</td>
		<td><s:property value="%{#session.district1}" /></td>
	</tr>
	<tr>
		<td>PINCODE1</td>
		<td><s:property value="%{#session.pin1}"/></td>
		<td>PHONENO1</td>
		<td><s:property value="%{#session.phoneno1}" /></td>
	</tr>
	<tr>
		<td>NEAREST POLICES TATION1</td>
		<td><s:property value="%{#session.policestation2}"/></td>
		<td>EMAIL</td>
		<td><s:property value="%{#session.email}" /></td>
	</tr> --%>
	
<%-- 	<tr>
		<td>COLOR O HAIR</td>
		<td><s:property value="%{#session.hairc}"/></td>
		<td>COLOR OF EYES</td>
		<td><s:property value="%{#session.eyec}" /></td>
	</tr> --%>

</table>
</div>
</div>




</div>




 	
     <script src="/js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>

</body>

</html>
