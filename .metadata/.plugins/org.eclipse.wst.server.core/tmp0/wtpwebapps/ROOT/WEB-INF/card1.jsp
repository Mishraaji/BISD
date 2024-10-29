<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Expires", "0");
response.addHeader("X-XSS-Protection","1; mode=block"); 
response.setHeader("Access-Control-Allow-Origin","*");
%>
<html>
<head>

<title>CURRENT_APPLICATION </title>

<link rel="stylesheet" href="/css/CURRENT_APPLICATION.css" />
  <script src="/js/vendor/jquery.js"></script>
</head>
 <script type="text/javascript">
        function printDiv(divID) {
        	
        	$('#hideMe').hide();
        	
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
            document.body.innerHTML = oldPage;

        }

     /* window.onresize = function() {
        	window.resizeTo(350, 485);
        	
        };*/


        
        /*function resizeToMinimum(){

        	alert("Hel");
        	alert("asdasf");
        	//setTimeout(function(){ alert("Hellooo"); }, 1000);
                window.resizeTo(350, 485);
        	}

        
      window.addEventListener('resize', resizeToMinimum,false);*/



      (function($,sr){

    	  // debouncing function from John Hann
    	  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
    	  var debounce = function (func, threshold, execAsap) {
    	      var timeout;

    	      return function debounced () {
    	          var obj = this, args = arguments;
    	          function delayed () {
    	              if (!execAsap)
    	                  func.apply(obj, args);
    	              timeout = null; 
    	          };

    	          if (timeout)
    	              clearTimeout(timeout);
    	          else if (execAsap)
    	              func.apply(obj, args);

    	          timeout = setTimeout(delayed, threshold || 500); 
    	      };
    	  }
    	    // smartresize 
    	    jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

    	})(jQuery,'smartresize');


    	// usage:
    	$(window).smartresize(function(){ 
    		window.resizeTo(350, 485);
    	});
      
        
        
    </script>
<body>
<div  id="printable">
	<div style="text-align: center;">
		
		
		
		
		
		<div>
			<!--
			this div is commented while giving demo to dgshipping, i added background CURRENT_APPLICATION image file to outer div
			 <div class="zone1">
				<div style="display: inline; ">
					<img alt="" src="images/ashokchinha.png" height="15px">
				</div>
				<div  style="display: inline; padding-left: 10px; padding-right: 10px;">
					  
					 		<span> Indian Seafarer Identity</span>
				</div>	
				<div style="display: inline;">
					<img alt="" src="images/tiranga.png" height="15px">
				</div>	
			</div> 

			-->
			
			
			
			<%-- <div class="details leftAlign">
				  SID No: <span class="content">M01000001</span>
				  <span class="rightAlign">CDC No <span class="content">MUM10001</span> </span>
			</div> --%>
			<!-- <table style="width: 100%; margin-top: 10%;" > 
				<tr>
					<td width="50%">   SID No:  <span class="content"><s:property value="%{#session.CURRENT_APPLICATION.SIDNo}"/> </span></td>
					<td width="50%" align="right" style="text-align: right;">CDC No: <span class="content"><s:property value="%{#session.CURRENT_APPLICATION.CDCNo}"/></span> </td> 
				</tr>
			</table>-->
			<div class="outer">
				<div class="photo">
					<img alt="" src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=100' />"
						height="95px" width="80px"><br/>
					
						<img alt="" src="<s:url action='ImageAction.action?applicationId=%{#session.CURRENT_APPLICATION.applicationId}&documentType=102' />"
							 height="20px" style="background-color: transparent !important;margin-top: 7%;"><br/>
				<div style="width: 130%;text-align: left;font-size: 10px !important;" ><!-- Seafarer's signature--></div>	
				</div>
				
				<div class="details">
					<div class="inline">
					<table class="CURRENT_APPLICATIONTable" cellpadding="5px">
					<tr>
					<td colspan="3"><span class="content">Name</span></td>
					</tr>
					<tr>
					<td colspan="3"><span class="content leftAlign"><s:property value="%{#session.CURRENT_APPLICATION.lastName}"/>
					    <s:property value="%{#session.CURRENT_APPLICATION.firstName}"/>
					    <s:property value="%{#session.CURRENT_APPLICATION.midleName}"/></span></td>
					</tr>
					<tr>
							<td width="20%">
								<!-- Nationality -->
								<span class="content">Nationality</span>
							</td>
							<td width="10%">
								<!-- Sex<br/> -->
								<span class="content">Gender</span>
							</td>
							<td width="70%">
								<!-- Date & place of birth <br/> -->
								<span class="content">BirthDate </span>
							</td>
							
							
						</tr>
						<tr>
						<td width="20%">
								IND
							</td>
						<td width="10%">
								<!-- Sex<br/> -->
								<s:property value="%{#session.CURRENT_APPLICATION.gender}"/>
							</td>
							<td width="70%">
								<!-- Date & place of birth <br/> -->
								<s:property value="%{#session.CURRENT_APPLICATION.dob}"/> 
							</td>
							
							
						</tr>
						<tr>
						<td>
								<!-- Date & place of birth <br/> -->
								<span class="content">Birth Place</span>
							</td><td colspan="2">
								<!-- Date & place of birth <br/> -->
								<s:property value="%{#session.CURRENT_APPLICATION.placeOfBirth}"/>
							</td>
							</tr>
							<tr>
							<td colspan="2"><span class="content">Identification mark</span></td>
								<td colspan="2"><s:property value="%{#session.CURRENT_APPLICATION.identificationMark}"/>
								
							</td> 
							</tr>
							
							<tr>
							<td><span class="content">Document No</span></td>
							<td colspan="2"><span class="content">Date Of Issue</span></td>
							</tr>
							
							<tr>
							<td><s:property value="%{#session.CARDS.SIDNo}"/> </td>
							<td colspan="2"><!-- Date & place of issue<br/>-->
								<s:property value="%{#session.CARDS.dateOfIssue}"/> 
							</td>
								</tr>
							
							<tr>
							<td width="80%" colspan="2"><span class="content">Date Of Expiry</span></td>
							
							</tr>
							
							<tr>
							<td width="80%" >
								<!-- Date & place of birth <br/> -->
								<s:property value="%{#session.CARDS.sid_doe}"/>
							</td>
							
							</tr>
							
							
							
							<!-- <tr>
							<td width="40%" >
								
								<span class="content">Date Of Expiry</span>
							</td>
							</tr>
							<tr>
							
							<td width="40%" >
								
								<s:property value="%{#session.CURRENT_APPLICATION.dateOfExpiry}"/>
							</td>
						</tr>
						<tr>
							<td width="40%" colspan="2">
								<span class="content">Date Of Issue </span>
							</td>
							<td width="40%" >
							 <span class="content">Place Of Issue</span>
							 </td>
							<!-- <td>
								Expiry date<br/>
								<span class="content">&nbsp;</span>
							</td> -->
						<!-- </tr>
						<tr>
							
							<td width="40%" >
							 <s:property value="%{#session.CURRENT_APPLICATION.placeOfIssue}"/>
							 </td>
							<!-- <td>
								Expiry date<br/>
								<span class="content">&nbsp;</span>
							</td> -->
						<!-- </tr>
						<tr><td></td></tr>
						<tr class="leftAlign">
							<!-- <td>Identification mark  :<br/>
								<s:property value="%{#session.CURRENT_APPLICATION.identificationMark}"/>
								
							</td> -->
							
						<!-- <tr>
							<td colspan="3" style="text-align: center;">
									
									, For Director General of Shipping, Ministry of Shipping, GoI
							</td>
						</tr> -->
					</table>
					</div>
				</div>
			</div>
			
		</div>
		<!-- <div id="back" style="page-break-before: always;">
		<br/>
		<div class="outer">
			<div style="font-size:0.625rem; text-align: center;border-bottom: 1px solid black;margin-top: 4%;">
				
				Director General Of Shipping,9th floor,Beta Building,i-Think Campus, Kanjur Marg East,Mumbai 400042 
				Email:dgship-dgs@nic.in, Tele:91-22-25752040/1/2/3/5, Web:www.dgshipping.gov.in
			</div>
			<div class="zone6">
				<div style="text-align: center; border-top: 1px solid black; padding-top: 1px; padding-bottom: 1px;">
				<img alt="" src="<s:url action='/ImageAction?sidNo=%{#session.CURRENT_APPLICATION.SIDNo}&documentType=barCode'/>" >	 
				</div>
			</div>
			<div style="font-size:0.575rem;" align="justify">
				This document is a seafarers' Identity document for the purpose of the Seafarers' Identity Documents Convention[Revised] ,2003
				of the International Labour Organization. This document is a stand-alone document and not a passport.
				<hr/>
			</div>
			<div class="zone7" style=" font-size:10px; " align="justify">
				
				<div class="mrzLine2"><s:property value="%{#session.CURRENT_APPLICATION.mrz}"/></div>
				
			</div>
		</div>
		</div> -->
	</div>
	
</div>
<div align="center" id="hideMe">
	<%-- <a href="#"  onclick="javascript:printDiv('printable')"  class="small button">Print</sa> --%>

</div>
<script src="/js/foundation.min.js"></script>
<script>
      	$(document).foundation();
</script>
</body>

</html>




