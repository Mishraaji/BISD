<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

<title>Card Preview</title>

<!-- <link rel="stylesheet" href="/css/foundation.css" />  	<link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" /> -->
  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
  	<link href="/css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/js/vendor/modernizr.js"></script>
    <script src="/js/vendor/jquery.js"></script>
   
    
<style type="text/css">
	.message {
		font-size: 18px !important; 
		line-height: 25px !important;
	}
</style>

<script type="text/javascript">
	function viewCard()
	{
		var width=400;
		var height=500;
		var leftPosition, topPosition;
	    //Allow for borders.
	    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
	    //Allow for title and status bars.
	    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
	    //Open the window.
		 window.open('cardJSP','cardPreview',"status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
				    + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
				    + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
		
	}
	
	
	
</script>
</head>

<body>
<div class="row">
 <jsp:include page="header.jsp"></jsp:include>
</div>

<hr style="border-color:  #b9b9b9"/>


<div class="row">
	<div class="twelve column">
		
		<table style="width: 100%;">
			<tr>
				<td width="25%" valign="top">
					<jsp:include page="activities.jsp"></jsp:include>
				</td>
				<td width="75%" valign="top">
					<div class="panel callout radius message" style="text-align: center;">
					
						<s:if test="%{#session.ERROR_MESSAGE!=null}">
							<s:property value="#session.ERROR_MESSAGE"/>
							<s:set value="session.ERROR_MESSAGE" scope="session" var="ERROR_MESSAGE"> </s:set>
						</s:if>
					
						<s:if test="%{#session.SUCCESS_MESSAGE!=null}">
							<s:property value="#session.SUCCESS_MESSAGE"/>
							<s:set value="session.SUCCESS_MESSAGE" scope="session" var="SUCCESS_MESSAGE"> </s:set>
							<br/><br/>
							
						</s:if>
					
					</div>
					
					<input type="button" value="View Card" onclick="viewCard()" class="secondary button"/>
				</td>
			</tr>
		</table>
		
	</div>
</div>

<script src="/js/foundation.min.js"></script>
<script>
      	$(document).foundation();
</script>

<s:property value="#session.SUCCESS_MESSAGE"/>

</body>

</html>




