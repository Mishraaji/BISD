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

      .noPrint 
      {            
     			 display: none;     
      } 
            
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Success</title>
<script>
function formConfirm()
{
	var d = confirm('Are you sure you want to submit the form?');
	if(d)
		{
		var link = document.getElementById("successForm");
		link.target = "_blank";
			location.href='welcomeHome.action';
			
			document.getElementById("successForm").action="${pageContext.request.contextPath}/FinalSubmit";
			document.getElementById("successForm").submit();
			return true;
			
		}
	else
		return false;
	
	}
</script>
</head>
<body>


<div class="row">
  <jsp:include page="header.jsp"></jsp:include>

 <s:a action="Welcome2JSP"><div class="secondary tiny button">  Home  </div></s:a> 
</div>

<hr style="border-color:  #b9b9b9"/>
<div class="row">

<div class="small12 columns" style="text-align: center;">

<div class="customHeader" >
	Please verify Your Details before Submitting the form ..
</div>
<br/>
<s:form method="post" enctype="multipart/form-data" 
		style="width:100%;text-align:left; " validate="true" class="panel callout radius" theme="simple" id="successForm">
		
<table style="width: 90%; text-align: left; border: 1px solid #000;" align="center" >
	<!-- <tr>
		<td>BANK CHALLAN NUMBER</td>
		<td><s:property value="%{#session.bankchallanno}"/></td>
		<td>DATED</td>
		<td><s:property value="%{#session.dated}" /></td>
	</tr>

	<tr>
		<td>AMOUNT</td>
		<td><s:property value="%{#session.amount}"/></td>
		<td>BANK BRANCH</td>
		<td><s:property value="%{#session.bankbranch}" /></td>
	</tr>-->
	
	<tr>
		<td>CDC NUMBER</td>
		<td><s:property value="%{#session.CDCNUMBER}"/></td>
		<td>ISSUING DATE</td>
		<td><s:property value="%{#session.CDCISSUINGDATE}" /></td>
	</tr>
	
	<tr>
		<td>CDC DATE OF EXPIRY </td>
		<td><s:property value="%{#session.DATEEXPIRYCDC}"/></td>
		<td>ISSUING AUTHORITY</td>
		<td><s:property value="%{#session.ISSUINGAUTHORITY}" /></td>
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
		<td>NAME</td>
		<td><s:property value="%{#session.firstName}"/> <s:property value="%{#session.midleName}"/> <s:property value="%{#session.lastName}"/></td>
		<td>FATHER'S NAME</td>
		<td><s:property value="%{#session.fathername}" /></td>
	</tr>
	
	<tr>
		<td>SEX</td>
	<td>
		<%
			if(session.getAttribute("sex").equals("m")){
		%>	
			Male
		<%} else if(session.getAttribute("sex").equals("f")){ %>
			Female
		<%} %>
		</td>
		<td>DATE OF BIRTH</td>
		<td><s:property value="%{#session.dob}" /></td>
	</tr>
	<tr>
		<td>NATIONALITY</td>
		<td><s:property value="%{#session.nationality}"/></td>
		<td>PLACE OF BIRTH</td>
		<td><s:property value="%{#session.pob}" /></td>
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
	
	<tr>
		<td>STREET</td>
		<td><s:property value="%{#session.street}"/></td>
		<td>VILLAGE POST TEHSIL</td>
		<td><s:property value="%{#session.village}" /></td>
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
	<tr>
		<td>HEIGHT</td>
		<td><s:property value="%{#session.height}" /></td>
		<td>STATE</td>
		<td><s:property value="%{#session.state}"/></td>
	</tr>
	<tr>
	<td>IDENTIFICATION MARKS</td>
		<td><s:property value="%{#session.identmark}"/></td>
	</tr>
<%-- 	<tr>
		<td>COLOR O HAIR</td>
		<td><s:property value="%{#session.hairc}"/></td>
		<td>COLOR OF EYES</td>
		<td><s:property value="%{#session.eyec}" /></td>
	</tr> --%>
	
	<tr>
<td align="center" colspan="4">		

<!--<s:submit method="execute" value="Submit" theme="simple" onclick="formConfirm();" class="medium button"/>-->
 <button class="medium button" onclick="formConfirm();">Submit</button> 
<s:a action="Welcome2JSP"><input type="button" value=" Cancel " class="medium secondary button"/></s:a></td>
</tr>
</table>

<s:token/></s:form>
<!-- <a href="#" onClick=" window.print(); return false">Print</a> 

confirm('Are you sure you want to submit the form?')?alert('1'):alert('2')
location.href='welcomeHome.action':return false;
-->



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
