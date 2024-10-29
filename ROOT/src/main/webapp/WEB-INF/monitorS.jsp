<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page not found.....</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<hr style="border-color:  #b9b9b9"/>
<div class="customHeader">
	<i class="step fi-unlock size-48"></i>  &nbsp;&nbsp; 404 Page
	</div>
	 <div style="height:5%;">
    
    </div>
Page Not found...

<br/>
<br/>
<br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/>
<s:property value="%{#session.SERVER}" /> <br/>
<s:property value="%{#session.SID}" /> <br/>
<s:property value="%{#session.INDOS}" /> <br/>	
<s:property value="%{#session.SMTPS}" /> <br/>
<s:property value="%{#session.PAYMENT}" /> <br/>

</body>
</html>	
