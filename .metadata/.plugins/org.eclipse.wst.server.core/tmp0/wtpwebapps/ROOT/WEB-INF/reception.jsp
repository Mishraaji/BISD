<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>

<title>Reception</title>

<link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.ebcaptcha.js"></script>
    
    
    <script type="text/javascript">
	$( document ).ready(function() {
		$("#skip_button").click(function() {
			$("#tsubmit").attr('action', '/skip_application');
			$("#tsubmit").submit();
		});
	});
    
    </script>
    
  
</head>
  
<body>
  
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>

<div style="position:absolute; top:0px;">
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
<hr style="border-color:  #b9b9b9"/>

<div class="row">
	<div class="twelve column">
	<div style="position:absolute; top:0px;">
					<s:if test="%{#session.token_error!=null}">
						<div data-alert class="alert-box warning radius" >
							<s:property value="#session.token_error"/>
							 <a href="#" class="close">&times;</a>
						</div>
						<s:set value="session.token_error" scope="session" var="token_error"> </s:set>
					</s:if>
					<s:if test="%{#session.token_success!=null}">
						<div  data-alert class="alert-box warning radius" style="color: black !important;">
							<s:property value="#session.token_success"/>
							 <a href="#" class="close">&times;</a>
						</div>
						<s:set value="session.token_success" scope="session" var="token_success"> </s:set>
					</s:if>
					
	</div> 	
		
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
						<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top" >
					<div class="customHeader2" style="text-align: left; padding-left : 5%;">Remove Token </div>
						<s:form action="/application_status_remove" method="post" style="text-align:center;  width:100%; margin-top:1.7rem;" id="tsubmit" name="tsubmit">
							<s:set value="opetation" var="opetation" scope="session"></s:set>
							<table style="width: 100%;">
								<tr>
									<td >
										<s:textfield id="application_no" name="application_no" key="Application NO" size="20" maxlength="10" placeholder="Application No " required="true"/><br/>
									</td>
								</tr>
								<tr style="display: inline;" >	
									<td style="display: inline;" >
										<s:submit value="submit" id="submit" name="submit" class="success button" style="display: inline;"></s:submit>
									</td>
									
								</tr>		
							</table>
						</s:form>	
				</td>
			</tr>
		</table>
				
	</div>
</div>


<script src="/js/foundation.min.js"></script>
<script>
      	$(document).foundation();
</script>
 
 
</body>

</html>




