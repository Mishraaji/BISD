<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bsid | Users</title>

<script type="text/javascript" src="/js/vendor/jquery.js"></script>
<style type="text/css">
 .label {
    	font-size: 16px !important;
    	background-color: white  !important;
    	color: #333333  !important;
    	text-align: left  !important;
    
    }
 </style>

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	loadUsers('ele');
} );

</script>
<s:if test="%{#session.USER_ROLE==11 || #session.USER_ROLE==1}">
<jsp:include page="header.jsp"></jsp:include></s:if>
<div class="row">
<div class="large-12 columns">
<div class="customHeader" style="text-align:left; padding-left:15px;">
		<i class="step fi-pencil size-28"></i> Manage Users
	</div><br/>


<center>
<s:if test="%{#session.USER_ROLE==11}">
<s:select list="#session.CENTRE_LIST" label=" Select Centre " id="ccCode" name="ccCode"
        onchange="loadUsers(this)" style="width:250px;text-align:center;" headerKey="Select Centre">
</s:select>
</s:if>
<s:else>
<font><s:property value="#session.collectionCentre" /></font>
<s:hidden id="ccCode" name="ccCode" value="%{#session.cccode}"></s:hidden>
</s:else>
</center>

</center>
<div id="users" style="display:none; width:100%;">

</div>

</div>
</div>

<script language="JavaScript" type="text/javascript">

function loadUsers(ele){
  var id=$('#ccCode').val();
 
	
$.ajax({
            url: 'listUsersUpdate.action', // action to be perform
            type: 'POST',       //type of posting the data
            data: { 'ccCode': id }, // data to set to Action Class
       dataType: 'html',
       success: function (responce) {
     
       $('#users').html('');
       $('#users').load('${pageContext.request.contextPath}/centreUsersUpdateJSP'); 
      
       $('#users').show();
  
       },
       error: function(xhr, ajaxOptions, thrownError){
          alert('An error occurred! ' + thrownError);
       }
  });
 }



</script>


</body>
</html>