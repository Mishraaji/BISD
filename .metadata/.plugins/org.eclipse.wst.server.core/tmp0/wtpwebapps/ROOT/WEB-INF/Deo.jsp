<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>Struts 2-Login Application </title>
</head>
<body>
<s:form action="/Result" method="post">

<s:textfield name="BANKCHALLANNUMBER" key="BANK CHALLAN NUMBER" size="20" required="true" value="%{#session.bankchallanno}"/>
<s:textfield name="DATED" key="DATED" size="20" required="true" value="%{#session.dated}"/>
<s:textfield name="AMOUNT" key="AMOUNT" size="20" required="true" value="%{#session.amount}"/>
<s:textfield name="BANKBRANCH" key="BANK/BRANCH" size="20" required="true" value="%{#session.bankbranch}"/>
<s:textfield name="CDCNUMBER" key="CDC NUMBER:" size="20" required="true" value="%{#session.cdcnumber}"/>
<s:textfield name="ISSUINGDATE" key="ISSUING DATE:" displayFormat="dd/MM/yyyy" required="true" value="%{#session.issuingdate}"/>
<s:textfield name="DATEEXPIRYCDC" key="CDC EXPIRY DATE:" size="20" required="true" value="%{#session.dateexpirycdc}"/>
<s:textfield name="ISSUINGAUTHORITY" key="ISSUING AUTHORITY:" size="20" required="true" value="%{#session.issuingauthority}"/>
<s:textfield name="RANKINWHICHCDCWASISSUED" key="RANK IN WHICH CDC WAS ISSUED:" size="20" value="%{#session.rank}"/>
<s:textfield name="DECK" key="DECK:" size="20" value="%{#session.deck}"/>
<s:textfield name="ENGINE" key="ENGINE:" size="20" value="%{#session.engine}"/>
<s:textfield name="OTHERS" key="OTHERS:" size="20" value="%{#session.others}"/>
<s:textfield name="NOOFSEAFARERSSERVICEEXPERIENCE" key="NO. OF SEAFARERS SERVICE EXPERIENCE" size="20" required="true" value="%{#session.workexp}"/>
<s:textfield name="NOOFVESSELSWORKED" key="NO. OF VESSELS WORKED:" size="20" required="true" value="%{#session.novess}"/>
<s:textfield name="NAME" key="NAME:" size="20" required="true" required="true" value="%{#session.qualification}"/>
<s:textfield name="FATHERSNAME" key="FATHERS NAME:" size="20" required="true" value="%{#session.name}"/>
<s:textfield name="SEX" key="SEX:" size="20" required="true" value="%{session.sex}"/>
<s:textfield name="DATEOFBIRTH" key="DATE OF BIRTH:"
         size="20" required="true" value="%{#session.dob}"/>
<s:textfield name="NATIONALITY" key="NATIONALITY" size="20" required="true" value="%{#session.nationality}"/>
<s:textfield name="PLACEOFBIRTH" key="PLACE OF BIRTH:" size="20" required="true" value="%{#session.pob}"/>
<s:textfield name="PASSPORTNO" key="PASSPORT NO:" size="20"required="true" value="%{#session.pasportno}"/>
<s:textfield name="PLACEOFISSUE" key="PLACE OF ISSUE:" size="20" value="%{#session.poi}"/>
<s:textfield name="EXPIRYDATE" key="EXPIRY DATE:"
          required="true" value="%{#session.expdate}"/>
<s:textfield name="HOUSENO" key="HOUSE NO:" size="20" required="true" value="%{#session.houseno}"/>
<s:textfield name="STREET" key="STREET:" size="20" required="true" value="%{#session.street}"/>
 <s:textfield name="VILLAGEPOSTTEHSIL" key="VILLAGE/POST/TEHSIL:" size="20"required="true" value="%{#session.village}"/>
<s:textfield name="DISTRICT" key="DISTRICT:" size="20" required="true" value="%{#session.district}"/>
<s:textfield name="PINCODE" key="PIN CODE:" size="20"required="true" value="%{#session.pin}"/>
<s:textfield name="PHONENO" key="PHONE NO:" size="20" required="true" value="%{#session.phoneno}"/>
<s:textfield name="NEARESTPOLICESTATION" key="NEAREST POLICE STATION:" size="20" value="%{#session.policestation}"/>
 <s:textfield name="HOUSENO1" key="HOUSE NO:" size="20" required="true" value="%{#session.houseno1}"/>
<s:textfield name="STREET1" key="STREET:" size="20"required="true" value="%{#session.street1}"/>
<s:textfield name="VILLAGEPOSTTEHSIL1" key="VILLAGE/POST/TEHSIL:" size="20" required="true" value="%{#session.village1}"/>
<s:textfield name="DISTRICT1" key="DISTRICT:" size="20" required="true" value="%{#session.district1}"/>
<s:textfield name="PINCODE1" key="PIN CODE:" size="20"required="true" value="%{#session.pin1}"/>
<s:textfield name="PHONENO1" key="PHONE NO:" size="20" required="true" value="%{#session.phoneno1}"/>
<s:textfield name="NEARESTPOLICESTATION1" key="NEAREST POLICE STATION" size="20" required="true" value="%{#session.policestation2}"/>
<s:textfield name="EMAIL" key="EMAIL:" size="20" value="%{#session.email}"/>
<s:textfield name="MOBILENO" key="MOBILE NO:" size="20" value="%{#session.mobileno}"/>
<s:textfield name="HEIGHT" key="HEIGHT:" size="20" required="true" value="%{#session.height}"/>
<s:textfield name="COLOROFHAIR" key="COLOR OF HAIR" size="20" required="true" value="%{#session.hairc}"/>
<s:textfield name="COLOROFEYES" key="COLOR OF EYES:" size="20" required="true" value="%{#session.eyec}"/>
<s:textfield  name="IDENTIFICATIONMARKS" key="IDENTIFICATION MARKS:" size="20" required="true" value="%{#session.identmark}"/>

<s:checkbox name="isVerified" label="Verified"/>


<s:submit method="execute" value="Submit" />

<s:token/></s:form>
</body>
</html>