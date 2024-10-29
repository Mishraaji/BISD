<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Take appointment and move to payment</title>
</head>
<body onload="document.frm1.submit()">
<form action="https://pgi.billdesk.com/pgidsk/PGIMerchantPayment " method="post", name="frm1">
	<s:hidden name="msg"></s:hidden>

</form>
</body>
</html>