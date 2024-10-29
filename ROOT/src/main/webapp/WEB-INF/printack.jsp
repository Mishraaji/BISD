<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print ack</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>

function doPrint() 
{
	window.print();
	parent.history.back();
	window.close();
}	
	
</script>
</head>
<body style="line-height: 0.5;font-size: 14px;" onload="doPrint()"> 
<%
	SimpleDateFormat formatter;
	String strDate;

	Date date=new Date();
	formatter = new SimpleDateFormat("dd-MMM-yyyy");  
	strDate = formatter.format(date); 
%>
<div style="border: 2px solid black;">
<h4 style="text-align: center;">सरकारी नौवहन कार्यालय,<s:if test="%{#session.CCCODE==1}"> मुंबई</s:if><s:if test="%{#session.CCCODE==2}"> कोलकाता</s:if><s:if test="%{#session.CCCODE==3}"> चेन्नई</s:if></h4>
<p style="text-align: center;"><strong>Government Shipping Office,<s:if test="%{#session.CCCODE==1}"> Mumbai</s:if><s:if test="%{#session.CCCODE==2}"> Kolkata</s:if><s:if test="%{#session.CCCODE==3}"> Chennai</s:if></strong></p>

<p style="float: left;">संख्या /Application :<s:property value="%{#session.d_ack_detail.applicationno}"/></p>
<p style="float: right;">दिनांक/Date : <%out.print(strDate);%></p>
<br/><br/><br/>
<p>प्रति /TO</p>
<p><s:property value="%{#session.d_ack_detail.firstname}"/> <s:property value="%{#session.d_ack_detail.middlename}"/> <s:property value="%{#session.d_ack_detail.lastname}"/></p>
<p><s:property value="%{#session.d_ack_detail.houseNo}"/>,<s:property value="%{#session.d_ack_detail.StreetName}"/></p>
<p><s:property value="%{#session.d_ack_detail.village}"/>,<s:property value="%{#session.d_ack_detail.district}"/>,<s:property value="%{#session.d_ack_detail.state}"/></p>
<p><s:property value="%{#session.d_ack_detail.pincode}"/></p>
<p>विषय: <strong><s:property value="%{#session.d_ack_detail.firstname}"/> <s:property value="%{#session.d_ack_detail.middlename}"/> <s:property value="%{#session.d_ack_detail.lastname}"/></strong> को जारी एस.आई.डी. <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> को अग्रेषण |</p>
<p>Sub: Forwarding of SID <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> issued to <strong><s:property value="%{#session.d_ack_detail.firstname}"/> <s:property value="%{#session.d_ack_detail.middlename}"/> <s:property value="%{#session.d_ack_detail.lastname}"/></strong>.</p>
<p style="padding-left: 30px;">महोदय/Sir,</p>
<p style="padding-left: 60px;line-height: 0.8;">एस.आई.डी जारी करने हेतू आवेदन पत्र  <strong><s:property value="%{#session.d_ack_detail.applydate}"/></strong> के संदर्भ में जारी कि गई एस.आई.डी. <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> दिनांक <br/><br/><strong><s:property value="%{#session.d_ack_detail.issuedate}"/></strong> को सलंग्न प्रेषित किया जाता हैं |</p>
<p style="padding-left: 60px;">आपसे अनुरोध हैं कि&nbsp;एस.आई.डी प्राप्ती कि पावती भेजे |</p>
<p style="padding-left: 60px;line-height: 0.8;">With reference to your application dated <strong><s:property value="%{#session.d_ack_detail.applydate}"/></strong> for issue of SID, please find enclosed here with SID<br/><br/>bearing no. <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> dated <strong><s:property value="%{#session.d_ack_detail.issuedate}"/></strong> issued to you.</p>
<p style="padding-left: 60px;">You are requested to acknowledge the receipt of the SID</p>
<p line-height: 0.8;><strong>This is a system generated letter, which does not require signature of forwarding authority.</strong></p>
<p>संलग्नक : यथोपरी/Encl:As above</p>
</div>
<br/>
<div style="border: 2px solid black;">
<h4 style="text-align: center;">सरकारी नौवहन कार्यालय,<s:if test="%{#session.CCCODE==1}"> मुंबई</s:if><s:if test="%{#session.CCCODE==2}"> कोलकाता</s:if><s:if test="%{#session.CCCODE==3}"> चेन्नई</s:if></h4>
<p style="text-align: center;"><strong>Government Shipping Office,<s:if test="%{#session.CCCODE==1}"> Mumbai</s:if><s:if test="%{#session.CCCODE==2}"> Kolkata</s:if><s:if test="%{#session.CCCODE==3}"> Chennai</s:if></strong></p>

<p style="float: left;">संख्या /Application :<s:property value="%{#session.d_ack_detail.applicationno}"/></p>
<p style="float: right;">दिनांक/Date : <%out.print(strDate);%></p>
<br/><br/><br/>
<p>प्रति /TO</p>
<p><s:property value="%{#session.d_ack_detail.firstname}"/> <s:property value="%{#session.d_ack_detail.middlename}"/> <s:property value="%{#session.d_ack_detail.lastname}"/></p>
<p><s:property value="%{#session.d_ack_detail.houseNo}"/>,<s:property value="%{#session.d_ack_detail.StreetName}"/></p>
<p><s:property value="%{#session.d_ack_detail.village}"/>,<s:property value="%{#session.d_ack_detail.district}"/>,<s:property value="%{#session.d_ack_detail.state}"/></p>
<p><s:property value="%{#session.d_ack_detail.pincode}"/></p>
<p>विषय: <strong><s:property value="%{#session.d_ack_detail.firstname}"/> <s:property value="%{#session.d_ack_detail.middlename}"/> <s:property value="%{#session.d_ack_detail.lastname}"/></strong> को जारी एस.आई.डी. <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> को अग्रेषण |</p>
<p>Sub: Forwarding of SID <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> issued to <strong><s:property value="%{#session.d_ack_detail.firstname}"/> <s:property value="%{#session.d_ack_detail.middlename}"/> <s:property value="%{#session.d_ack_detail.lastname}"/></strong>.</p>
<p style="padding-left: 30px;">महोदय/Sir,</p>
<p style="padding-left: 60px;line-height: 0.8;">एस.आई.डी जारी करने हेतू आवेदन पत्र  <strong><s:property value="%{#session.d_ack_detail.applydate}"/></strong> के संदर्भ में जारी कि गई एस.आई.डी. <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> दिनांक <br/><br/><strong><s:property value="%{#session.d_ack_detail.issuedate}"/></strong> को सलंग्न प्रेषित किया जाता हैं |</p>
<p style="padding-left: 60px;">आपसे अनुरोध हैं कि&nbsp;एस.आई.डी प्राप्ती कि पावती भेजे |</p>
<p style="padding-left: 60px;line-height: 0.8;">With reference to your application dated <strong><s:property value="%{#session.d_ack_detail.applydate}"/></strong> for issue of SID, please find enclosed here with SID<br/><br/>bearing no. <strong><s:property value="%{#session.d_ack_detail.sidno}"/></strong> dated <strong><s:property value="%{#session.d_ack_detail.issuedate}"/></strong> issued to you.</p>
<p style="padding-left: 60px;">You are requested to acknowledge the receipt of the SID</p>
<p line-height: 0.8;><strong>This is a system generated letter, which does not require signature of forwarding authority.</strong></p>
<p>संलग्नक : यथोपरी/Encl:As above</p>
</div>
</body>
</html>