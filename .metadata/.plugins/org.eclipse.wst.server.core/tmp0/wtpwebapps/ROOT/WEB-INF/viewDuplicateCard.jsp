<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Schedule Appointment</title>
    <!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
    <link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />
    <link rel="stylesheet" type="text/css" href="/css/appointment/defaultStyle.css" />
    <link rel="stylesheet" href="/css/custom.css" />
    <link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
    <link rel="stylesheet" href="/css/foundation.css" />
    <link rel="shortcut icon" href="/images/SID_favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="/css/custom.css" />
    <!-- Include JQuery Core (Required for calendar plugin) -->
    <script type="text/javascript" src="/js/appointment/jquery-1.4.2-ie-fix.min.js"></script>
    <!-- Include JQuery UI (Required for calendar plugin.) -->
    <script type="text/javascript" src="/js/appointment/jquery-ui-1.8.1.custom.min.js"></script>
    <script type="text/javascript" src="/js/appointment/pages.js"></script>
    <style type="text/css">
        .label {
            font-size: 18px;
            background-color: white;
            color: #333333;
        }

        /* CSS to center the popup */
        #rejectPopup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            z-index: 9999;
        }
    </style>
    <style type="text/css">
        table thead tr th, table thead tr td, table tfoot tr th, table tfoot tr td {
            padding: 0.5rem 0.625rem 0.625rem;
            font-size: 0.875rem;
            font-weight: bold;
            color: white !important;
            text-align: center;
        }
    </style>
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
                <td rowspan="2" width="25%" valign="top">
                    <jsp:include page="activities.jsp"></jsp:include>
                </td>
                <td width="75%" valign="top">
                    <div class="customHeader2" style="text-align: left;">
                        &nbsp;&nbsp;<i class="step fi-clock size-24"></i> FIR Details
                    </div>
                    <s:if test="%{#session.ERROR_MESSAGE!=null}">
                        <div data-alert class="alert-box warning radius">
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
                    <div id="ackDiv" name="ackDiv">
                        <br/>
                        <div style="border: 1px;border-color: black;">
                            <s:form method="post" validate="true" id="firApprove" name="firApprove" action="/approveDuplicateSID">
                                <table align="center">
                                    <tr>
                                        <td><s:textfield label="FIR No" name="firNo" readonly="true" value="%{#session.DUPLICATEAPPCARD.applicationId}" /></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield label="Dated" name="firDate" id="date" readonly="true" value="%{#session.DUPLICATEAPPCARD.firDate}"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><s:textfield label="Name of Police Station" name="policeStationName" readonly="true" value="%{#session.DUPLICATEAPPCARD.policeStationName}"/></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield label="District" name="firDistrict" readonly="true" value="%{#session.DUPLICATEAPPCARD.firDistrict}"/></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield label="State" name="firState" id="state" readonly="true" value="%{#session.DUPLICATEAPPCARD.firState}"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center"><s:a action="takeFir.action" name="firUpload" id="firUpload" style="text-align: center;">
                                        <s:param name="applicationId" value="applicationId"> </s:param>
                                        Download FIR Copy
                                        </s:a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <%-- <s:submit method="execute" value="Approve " theme="simple" class="medium button"/>
                                            
                                                <!-- Added the onClick attribute to call JavaScript function -->
                                                <a onclick="showRejectPopup()" class="secondary button">Reject</a> --%>
                                                <s:a action="viewApplication.action" >
			            		<s:param name="applicationId" value="applicationId" > </s:param>
			            		
							<c:choose>
							<c:when test="${param.typeApp != 'newApp' }">
									<s:param name="verified">verified</s:param>
							</c:when>
							<c:otherwise>
									<s:param name="verified">iverified</s:param>
							</c:otherwise>
</c:choose>
			            		<button type="button"  class="k-button k-button-icontext"><span class="k-icon k-cancel"></span>Next</button>
			            	</s:a>
                                            
                                        </td>
                                    </tr>
                                </table>
                                <s:token/>
                            </s:form>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div id="rejectPopup" style="display: none;">
            <textarea id="rejectionReason" rows="4" cols="50"></textarea><br>
            <button onclick="rejectWithReason()">Reject Application</button>
            <button onclick="hideRejectPopup()">Cancel</button>
        </div>
        <script>
            function showRejectPopup() {
                document.getElementById('rejectPopup').style.display = 'block';
            }

            function hideRejectPopup() {
                document.getElementById('rejectPopup').style.display = 'none';
            }

            function rejectWithReason() {
                var reason = document.getElementById('rejectionReason').value;
                var form = document.getElementById('firApprove');
                form.action = "/rejectDuplicateApplication";
                form.submit();
            }
        </script>
    </div>
</div>
</body>
</html>
