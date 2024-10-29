<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
span {background-color: black; color: white} 
</style>
<style>

ul.a {list-style-type: square;}

</style>
<title>Welcome</title>

	<link rel="stylesheet" href="css/foundation.css" />
  	<link rel="stylesheet" href="css/custom.css" />
  	<link rel="stylesheet" href="css/foundation-icons/foundation-icons.css" />
  	<link href="css/Captchastyle.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.ebcaptcha.js"></script>
   
    
   

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
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
		
		<table style="width: 100%;">
			<tr>
				
<!--<TD> <span> Text <BR><BR> Longer text that stretches out above text-background color... 
 </span></TD> -->
 
 <h2 align="center" class="heading">SID Collection Center</h2>

  <div class="row">      
  <table align="center">
  <tr>
  <td><b>Mumbai</b></td>
  <td>Govt Shipping office, Nov Bhavan, 10, RK Marg ballard estate, Mumbai - 400001</td>
  </tr>
  <tr>
  <td><b>Chennai</b></td>
  <td>Government Shipping office/Seaman's Employment office, Anchorgate Building 3rd Floor, Rajaji Salai, Chennai - 600001</td>
  </tr>
  <tr>
  <td><b>Kolkata</b></td>
  <td>Government Shipping Office Marine House, Hastings, Kolkata - 700022.</td>
  </tr>
  
  <tr>
  <td><b>Noida</b></td>
  <td>Mercantile Marine Department,  IWAI Bhawan, 3rd Floor,  A-13, Sector-01, Noida - 201301</td>
  </tr>
  <tr>
  <td><b>Goa</b></td>
  <td>Mercantile Marine Department, Headland Sada, Goa - 403804</td>
  </tr>
  <tr>
  <td><b>Kochi</b></td>
  <td>Mercantile Marine Department, Willingdon Island, North End PO, Kochi - 682009</td>
  </tr>
  <tr>
  <td><b>Kandla</b></td>
  <td>Mercantile Marine Department, Plot No. 16, Sector-8,Government Office Area, Behind KPT Admin Building, Near Maitri Bhavan,Gandhidham - 370201</td>
  </tr>
  <tr>
  <td><b>New Mangalore</b></td>
  <td>Mercantile Marine Department, Type V Qtrs.,  First Floor, MMD Resi Qtr. Bldg, 23rd Street, Panambur, New Mangalore - 575010</td>
  </tr>
  <tr>
  <td><b>Vizag</b></td>
  <td>Mercantile Marine Department, # 7-8-26/A, Harbour Park Down, Visakhapatnam - 530003</td>
  </tr>
  </table>
 </div>
 
 

 
 
				
			</tr>
		</table>
		<jsp:include page="footer.jsp"></jsp:include>			
	</div>
</div>



 	
     <script src="js/foundation.min.js"></script>
     <script>
      	$(document).foundation();
    </script>
	<script type="text/javascript">
   $(window).load(function() {
       $("#featured").orbit();
   });
</script>
</body>

</html>



