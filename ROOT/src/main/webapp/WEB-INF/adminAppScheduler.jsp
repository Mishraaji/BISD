<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@page import="login.UserAccountBean"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Expires", "0");
response.addHeader("X-XSS-Protection","1; mode=block"); 
response.setHeader("Access-Control-Allow-Origin","*");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Center Admin Appointment Scheduler</title>
</head>
<body>
<!-- Include CSS for JQuery Frontier Calendar plugin (Required for calendar plugin) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-frontier-cal-1.3.2.css" />

<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="/css/appointment/jquery-ui-1.8.1.custom.css" />

  	<link rel="stylesheet" href="/css/custom.css" />
  	<link rel="stylesheet" href="/css/foundation-icons/foundation-icons.css" />
<!--
Include JQuery Core (Required for calendar plugin)
** This is our IE fix version which enables drag-and-drop to work correctly in IE. See README file in js/jquery-core folder. **
-->
<script type="text/javascript" src="/js/appointment/jquery-1.4.2-ie-fix.min.js"></script>

<!-- Include JQuery UI (Required for calendar plugin.) -->
<script type="text/javascript" src="/js/appointment/jquery-ui-1.8.1.custom.min.js"></script>

<!--
	(Required for plugin)
	Dependancies for JQuery Frontier Calendar plugin.
    ** THESE MUST BE INCLUDED BEFORE THE FRONTIER CALENDAR PLUGIN. **
-->
<script type="text/javascript" src="/js/appointment/jshashtable-2.1.js"></script>

<!-- Include JQuery Frontier Calendar plugin -->
<script type="text/javascript" src="/js/appointment/1.js"></script>

</head>
<body style="background-color: #D6F3FF">

<!-- Some CSS for our example. (Not required for calendar plugin. Used for example.)-->
<style type="text/css" media="screen">
/*
Default font-size on the default ThemeRoller theme is set in ems, and with a value that when combined 
with body { font-size: 62.5%; } will align pixels with ems, so 11px=1.1em, 14px=1.4em. If setting the 
body font-size to 62.5% isn't an option, or not one you want, you can set the font-size in ThemeRoller 
to 1em or set it to px.
http://osdir.com/ml/jquery-ui/2009-04/msg00071.html
*/
.shadow {
	-moz-box-shadow: 3px 3px 4px #aaaaaa;
	-webkit-box-shadow: 3px 3px 4px #aaaaaa;
	box-shadow: 3px 3px 4px #aaaaaa;
	/* For IE 8 */
	-ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#aaaaaa')";
	/* For IE 5.5 - 7 */
	filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#aaaaaa');
}

.buttonDiv {color: white;
    display: block;
    font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif;
    font-size: 0.8125rem;
    font-weight: normal;
    text-transform: none;
    width: 100%;
    background: none repeat scroll 0 0 #006282;
    line-height: 45px;
    padding: 0 15px;
}
  
div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, p, blockquote, th, td {
    margin: 0;
}


h3 {
    font-size: 1.6875rem;
}
h1, h2, h3, h4, h5, h6 {
    line-height: 1.4;
}
h1, h2, h3, h4, h5, h6 {
    color: #222222;
    font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif;
    font-style: normal;
    text-rendering: optimizelegibility;
}
body {
    color: #222222;
    cursor: default;
    font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
}
html, body {
    font-size: 90%;
}

</style>

<script type="text/javascript">
$(document).ready(function(){	

	var clickDate = "";
	var clickAgendaItem = "";
	
	/**
	 * Initializes calendar with current year & month
	 * specifies the callbacks for day click & agenda item click events
	 * then returns instance of plugin object
	 */
	var jfcalplugin = $("#mycal").jFrontierCal({
		date: new Date(),
		dayClickCallback: myDayClickHandler,
		agendaClickCallback: myAgendaClickHandler,
		agendaDropCallback: myAgendaDropHandler,
		agendaMouseoverCallback: myAgendaMouseoverHandler,
		applyAgendaTooltipCallback: myApplyTooltip,
		agendaDragStartCallback : myAgendaDragStart,
		agendaDragStopCallback : myAgendaDragStop,
		dragAndDropEnabled: true
	}).data("plugin");


	
	
	/**
	 * Do something when dragging starts on agenda div
	 */
	function myAgendaDragStart(eventObj,divElm,agendaItem){
		// destroy our qtip tooltip
		if(divElm.data("qtip")){
			divElm.qtip("destroy");
		}	
	};
	
	/**
	 * Do something when dragging stops on agenda div
	 */
	function myAgendaDragStop(eventObj,divElm,agendaItem){
		//alert("drag stop");
	};
	
	/**
	 * Custom tooltip - use any tooltip library you want to display the agenda data.
	 * for this example we use qTip - http://craigsworks.com/projects/qtip/
	 *
	 * @param divElm - jquery object for agenda div element
	 * @param agendaItem - javascript object containing agenda data.
	 */
	function myApplyTooltip(divElm,agendaItem){

		// Destroy currrent tooltip if present
		if(divElm.data("qtip")){
			divElm.qtip("destroy");
		}
		
		var displayData = "";
		
		var title = agendaItem.title;
		var startDate = agendaItem.startDate;
		var endDate = agendaItem.endDate;
		var allDay = agendaItem.allDay;
		var data = agendaItem.data;
		displayData += "<br><b>" + title+ "</b><br><br>";
		if(allDay){
			displayData += "(All day event)<br><br>";
		}else{
			displayData += "<b>Starts:</b> " + startDate + "<br>" + "<b>Ends:</b> " + endDate + "<br><br>";
		}
		for (var propertyName in data) {
			displayData += "<b>" + propertyName + ":</b> " + data[propertyName] + "<br>"
		}
		// use the user specified colors from the agenda item.
		var backgroundColor = agendaItem.displayProp.backgroundColor;
		var foregroundColor = agendaItem.displayProp.foregroundColor;
		var myStyle = {
			border: {
				width: 5,
				radius: 10
			},
			padding: 10, 
			textAlign: "left",
			tip: true,
			name: "dark" // other style properties are inherited from dark theme		
		};
		if(backgroundColor != null && backgroundColor != ""){
			myStyle["backgroundColor"] = backgroundColor;
		}
		if(foregroundColor != null && foregroundColor != ""){
			myStyle["color"] = foregroundColor;
		}
		// apply tooltip
		/*divElm.qtip({
			content: displayData,
			position: {
				corner: {
					tooltip: "bottomMiddle",
					target: "topMiddle"			
				},
				adjust: { 
					mouse: true,
					x: 0,
					y: -15
				},
				target: "mouse"
			},
			show: { 
				when: { 
					event: 'mouseover'
				}
			},
			//style: myStyle
		});*/

	};

	/**
	 * Make the day cells roughly 3/4th as tall as they are wide. this makes our calendar wider than it is tall. 
	 */
	jfcalplugin.setAspectRatio("#mycal",0.75);

	/**
	 * Called when user clicks day cell
	 * use reference to plugin object to add agenda item
	 */
	function myDayClickHandler(eventObj){
		// Get the Date of the day that was clicked from the event object
		var date = eventObj.data.calDayDate;
		// store date in our global js variable for access later
		clickDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
		// open our add event dialog
		var CurrentDate = new Date().setHours(0,0,0,0);
		var SelectedDate = clickDate;
		//alert(CurrentDate+"-------"+SelectedDate+"----"+new Date($('[id$=txtYear]').val(), $('[id$=drpMonth]').val(), $('[id$=spDate]').val()))
		//if(CurrentDate > SelectedDate){
		    //CurrentDate is more than SelectedDate
			
		//}
		//else{
		    //SelectedDate is more than CurrentDate
		//}
			//alert(CurrentDate+"---"+date)
			var weekend = date.getDay() == 0 || date.getDay() == 6;
			if (!(CurrentDate >= date || weekend)) {
				//alert("innnnnnn")
				$('#add-event-form').dialog('open');
			}
			

	};
	
	/**
	 * Called when user clicks and agenda item
	 * use reference to plugin object to edit agenda item
	 */
	function myAgendaClickHandler(eventObj){
		// Get ID of the agenda item from the event object
		var agendaId = eventObj.data.agendaId;		
		// pull agenda item from calendar
		var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);
		clickAgendaItem = agendaItem;
		$("#display-event-form").dialog('open');
	};
	
	/**
	 * Called when user drops an agenda item into a day cell.
	 */
	function myAgendaDropHandler(eventObj){
		// Get ID of the agenda item from the event object
		var agendaId = eventObj.data.agendaId;
		// date agenda item was dropped onto
		var date = eventObj.data.calDayDate;
		// Pull agenda item from calendar
		var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);		
		alert("You dropped agenda item " + agendaItem.title + 
			" onto " + date.toString() + ". Here is where you can make an AJAX call to update your database.");
	};
	
	/**
	 * Called when a user mouses over an agenda item	
	 */
	function myAgendaMouseoverHandler(eventObj){
		var agendaId = eventObj.data.agendaId;
		var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);
		//alert("You moused over agenda item " + agendaItem.title + " at location (X=" + eventObj.pageX + ", Y=" + eventObj.pageY + ")");
	};
	/**
	 * Initialize jquery ui datepicker. set date format to yyyy-mm-dd for easy parsing
	 */
	$("#dateSelect").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true,
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'dd-mm-yy'
	});

	/**
	 * Set datepicker to current date
	 */
	$("#dateSelect").datepicker('setDate', new Date());


	
	/**
	 * Use reference to plugin object to a specific year/month
	 */
	$("#dateSelect").bind('change', function() {
		var selectedDate = $("#dateSelect").val();
		var dtArray = selectedDate.split("-");
		var year = dtArray[2];
		// jquery datepicker months start at 1 (1=January)		
		var month = dtArray[1];
		// strip any preceeding 0's		
		month = month.replace(/^[0]+/g,"")		
		var day = dtArray[0];
		// plugin uses 0-based months so we subtrac 1
		jfcalplugin.showMonth("#mycal",year,parseInt(month-1).toString());
	});	
	/**
	 * Initialize previous month button
	 */
	$("#BtnPreviousMonth").button();
	$("#BtnPreviousMonth").click(function() {
		jfcalplugin.showPreviousMonth("#mycal");
		//addingSundays("#mycal");
		// update the jqeury datepicker value
		var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
		var cyear = calDate.getFullYear();
		// Date month 0-based (0=January)
		var cmonth = calDate.getMonth();
		var cday = calDate.getDate();
		// jquery datepicker month starts at 1 (1=January) so we add 1
		$("#dateSelect").datepicker("setDate",cday+"-"+(cmonth+1)+"-"+cyear);
		return false;
	});
	/**
	 * Initialize next month button
	 */
	$("#BtnNextMonth").button();
	$("#BtnNextMonth").click(function() {
		//alert("next")
		jfcalplugin.showNextMonth("#mycal");
		// update the jqeury datepicker value
		var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
		var cyear = calDate.getFullYear();
		// Date month 0-based (0=January)
		var cmonth = calDate.getMonth();
		var cday = calDate.getDate();
		// jquery datepicker month starts at 1 (1=January) so we add 1
		$("#dateSelect").datepicker("setDate",cday+"-"+(cmonth+1)+"-"+cyear);		
		return false;
	});
	
	/**
	 * Initialize delete all agenda items button
	 */
	$("#BtnDeleteAll").button();
	$("#BtnDeleteAll").click(function() {	
		jfcalplugin.deleteAllAgendaItems("#mycal");	
		return false;
	});		
	
	/**
	 * Initialize iCal test button
	 */
	$("#BtnICalTest").button();
	$("#BtnICalTest").click(function() {
		// Please note that in Google Chrome this will not work with a local file. Chrome prevents AJAX calls
		// from reading local files on disk.		
		jfcalplugin.loadICalSource("#mycal",$("#iCalSource").val(),"html");	
		return false;
	});	

	/**
	 * Initialize add event modal form
	 */
	$("#add-event-form").dialog({
		
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		buttons: {
			'Add Event': function() {

				var what = jQuery.trim($("#what").val());
				var holidayEvent = htmlEscape(what);
				var eventType=$('input[name="event"]:checked').val();
				var regExp =/^[ A-Za-z./-]*$/;
				//alert($('input[name=event]:checked').size());
				if($('input[name=event]:checked').size() <=0)
				{
					alert("Please select atleast any one event");
				}
				else
				{
				if(what == ""){
					alert("Please enter a short event description into the \"what\" field.");
				}
				else
					if(!(regExp.test(what)))
						{
							alert("Please enter valid value for \"what\" field.");
						}
				else{
										
					var startDate = $("#startDate").val();
					//alert(startDate+"--------startDate");
					
					var startDtArray = startDate.split("-");
					//alert(startDtArray+"---------startDtArray");
					
					var startYear = startDtArray[0];
					//alert(startYear+"-----------startYear");
					
					// jquery datepicker months start at 1 (1=January)		
					var startMonth = startDtArray[1];
					//alert(startMonth+"---------startMonth");		
					var startDay = startDtArray[2];
					//alert(startDay+"-----------startDay");
					// strip any preceeding 0's		
					startMonth = startMonth.replace(/^[0]+/g,"");
					startDay = startDay.replace(/^[0]+/g,"");
					var startHour = jQuery.trim($("#startHour").val());
					var startMin = jQuery.trim($("#startMin").val());
					var startMeridiem = jQuery.trim($("#startMeridiem").val());
					startHour = parseInt(startHour.replace(/^[0]+/g,""));
					if(startMin == "0" || startMin == "00"){
						startMin = 0;
					}else{
						startMin = parseInt(startMin.replace(/^[0]+/g,""));
					}
					if(startMeridiem == "AM" && startHour == 12){
						startHour = 0;
					}else if(startMeridiem == "PM" && startHour < 12){
						startHour = parseInt(startHour) + 12;
					}

					var endDate = $("#endDate").val();
					var endDtArray = endDate.split("-");
					var endYear = endDtArray[0];
					// jquery datepicker months start at 1 (1=January)		
					var endMonth = endDtArray[1];		
					var endDay = endDtArray[2];
					// strip any preceeding 0's		
					endMonth = endMonth.replace(/^[0]+/g,"");

					endDay = endDay.replace(/^[0]+/g,"");
					var endHour = jQuery.trim($("#endHour").val());
					var endMin = jQuery.trim($("#endMin").val());
					var endMeridiem = jQuery.trim($("#endMeridiem").val());
					endHour = parseInt(endHour.replace(/^[0]+/g,""));
					if(endMin == "0" || endMin == "00"){
						endMin = 0;
					}else{
						endMin = parseInt(endMin.replace(/^[0]+/g,""));
					}
					if(endMeridiem == "AM" && endHour == 12){
						endHour = 0;
					}else if(endMeridiem == "PM" && endHour < 12){
						endHour = parseInt(endHour) + 12;
					}
					
					//alert("Start time: " + startHour + ":" + startMin + " " + startMeridiem + ", End time: " + endHour + ":" + endMin + " " + endMeridiem);
					
					// Dates use integers
					var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),startHour,startMin,0,0);
					var endDateObj = new Date(parseInt(endYear),parseInt(endMonth)-1,parseInt(endDay),endHour,endMin,0,0);
					//alert(startDateObj+"-----------"+endDateObj);
					// add new event to the calendar
					jfcalplugin.addAgendaItem(
						"#mycal",
						what,
						eventType,
						"Special",
						startDateObj,
						endDateObj,
						false,
						{	
							myDate: new Date()
							
						},
						{
							backgroundColor: $("#colorBackground").val(),
							foregroundColor: $("#colorForeground").val()
						}
						

					);


					
					
					$(this).dialog('close');

				}
				}
				
			},
			Cancel: function() {
				$(this).dialog('close');
			}
		},
		open: function(event, ui){
			$('input[name=event]').attr('checked', false);
			// initialize start date picker
			$("#startDate").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true,
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: 'yy-mm-dd'
			});
			// initialize end date picker
			$("#endDate").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true,
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: 'yy-mm-dd'
			});
			// initialize with the date that was clicked
			$("#startDate").val(clickDate);
			$("#endDate").val(clickDate);
			/*$("#newstartDate").val(clickDate);
			$("#newendDate").val(clickDate);*/
			// initialize color pickers
			/*$("#colorSelectorBackground").ColorPicker({
				color: "#333333",
				onShow: function (colpkr) {
					$(colpkr).css("z-index","10000");
					$(colpkr).fadeIn(500);
					return false;
				},
				onHide: function (colpkr) {
					$(colpkr).fadeOut(500);
					return false;
				},
				onChange: function (hsb, hex, rgb) {
					$("#colorSelectorBackground div").css("backgroundColor", "#" + hex);
					$("#colorBackground").val("#" + hex);
				}
			});
			//$("#colorBackground").val("#1040b0");		
			$("#colorSelectorForeground").ColorPicker({
				color: "#ffffff",
				onShow: function (colpkr) {
					$(colpkr).css("z-index","10000");
					$(colpkr).fadeIn(500);
					return false;
				},
				onHide: function (colpkr) {
					$(colpkr).fadeOut(500);
					return false;
				},
				onChange: function (hsb, hex, rgb) {
					$("#colorSelectorForeground div").css("backgroundColor", "#" + hex);
					$("#colorForeground").val("#" + hex);
				}
			});*/
			//$("#colorForeground").val("#ffffff");				
			// put focus on first form input element
			$("#what").focus();
		},
		close: function() {
			// reset form elements when we close so they are fresh when the dialog is opened again.
			$("#startDate").datepicker("destroy");
			$("#endDate").datepicker("destroy");
			$("#startDate").val("");
			$("#endDate").val("");
			$("#startHour option:eq(0)").attr("selected", "selected");
			$("#startMin option:eq(0)").attr("selected", "selected");
			$("#startMeridiem option:eq(0)").attr("selected", "selected");
			$("#endHour option:eq(0)").attr("selected", "selected");
			$("#endMin option:eq(0)").attr("selected", "selected");
			$("#endMeridiem option:eq(0)").attr("selected", "selected");			
			$("#what").val("");
			//$("#colorBackground").val("#1040b0");
			//$("#colorForeground").val("#ffffff");
		}
	});
	
	
	/**
	*XSS cross scripting handling for holiday add event
	*/
	
	function htmlEscape(str) {
	    return str
	        .replace(/&/g, '&amp;')
	        .replace(/"/g, '&quot;')
	        .replace(/'/g, '&#39;')
	        .replace(/</g, '&lt;')
	        .replace(/>/g, '&gt;');
	}

	
	/**
	 * Initialize display event form.
	 */
	$("#display-event-form").dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		buttons: {		
			Cancel: function() {
				$(this).dialog('close');
			},
			'Edit': function(event, ui) {
				//alert("Make your own edit screen or dialog!");
				if(clickAgendaItem != null){
					$("#display-event-edit-form").dialog('open');
				}
				
			},
			'Delete': function() {

				if(confirm("Are you sure you want to delete this agenda item?")){
					if(clickAgendaItem != null){
						jfcalplugin.deleteAgendaItemById("#mycal",clickAgendaItem);
						//jfcalplugin.deleteAgendaItemByDataAttr("#mycal","myNum",42);
					}
					$(this).dialog('close');
				}
			}			
		},
		open: function(event, ui){
			if(clickAgendaItem != null){
				var title = clickAgendaItem.title;
				var startDate = clickAgendaItem.startDate;
				var endDate = clickAgendaItem.endDate;
				var allDay = clickAgendaItem.allDay;
				var data = clickAgendaItem.data;
				// in our example add agenda modal form we put some fake data in the agenda data. we can retrieve it here.
				$("#display-event-form").append(
					"<br><b>" + title+ "</b><br><br>"		
				);				
				if(allDay){
					$("#display-event-form").append(
						"(All day event)<br><br>"				
					);				
				}else{
					$("#display-event-form").append(
						"<b>Starts:</b> " + startDate + "<br>" +
						"<b>Ends:</b> " + endDate + "<br><br>"				
					);				
				}
				for (var propertyName in data) {
					$("#display-event-form").append("<b>" + propertyName + ":</b> " + data[propertyName] + "<br>");
				}
							
			}		
		},
		close: function() {
			// clear agenda data
			$("#display-event-form").html("");
		}
	});	 
	
	$("#display-event-edit-form").dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		buttons: {
		'Save Changes': function() {

		var tnoOfApp=/^\d\d$/;
		if(clickAgendaItem.buttonType != "holiday")
		{
		if(document.getElementById("noOfApp").value == null || document.getElementById("noOfApp").value == "")
		{
			alert("Please select no of appointments you want for this slot")
			return;
		}
		else
		 if(!(tnoOfApp.test(document.getElementById("noOfApp").value)))
		 {
			alert("Enter only numeric values only")
			return;
		 }
		}


		var answer = confirm('Are you sure you want save changes for this?');
				
		/*var getCondition = yesnodialog('Yes', 'No', $(this));

		alert(getCondition);*/
		if (answer)
		{
		var what = clickAgendaItem.title;
		var eventType = clickAgendaItem.buttonType;
		var startDate = $("#newStartDate").val();
		//alert(startDate+"--------startDate");
		
		var startDtArray = startDate.split("-");
		//alert(startDtArray+"---------startDtArray");
		
		var startYear = startDtArray[0];
		//alert(startYear+"-----------startYear");
		
		// jquery datepicker months start at 1 (1=January)		
		var startMonth = startDtArray[1];
		//alert(startMonth+"---------startMonth");		
		var startDay = startDtArray[2];
		//alert(startDay+"-----------startDay");
		// strip any preceeding 0's		
		startMonth = startMonth.replace(/^[0]+/g,"");
		startDay = startDay.replace(/^[0]+/g,"");
		var startHour = jQuery.trim($("#newStartHour").val());
		var startMin = jQuery.trim($("#newStartMin").val());
		var startMeridiem = jQuery.trim($("#newStartMeridiem").val());
		startHour = parseInt(startHour.replace(/^[0]+/g,""));
		if(startMin == "0" || startMin == "00"){
			startMin = 0;
		}else{
			startMin = parseInt(startMin.replace(/^[0]+/g,""));
		}
		if(startMeridiem == "AM" && startHour == 12){
			startHour = 0;
		}else if(startMeridiem == "PM" && startHour < 12){
			startHour = parseInt(startHour) + 12;
		}

		var endDate = $("#newEndDate").val();
		var endDtArray = endDate.split("-");
		var endYear = endDtArray[0];
		// jquery datepicker months start at 1 (1=January)		
		var endMonth = endDtArray[1];		
		var endDay = endDtArray[2];
		// strip any preceeding 0's		
		endMonth = endMonth.replace(/^[0]+/g,"");

		endDay = endDay.replace(/^[0]+/g,"");
		var endHour = jQuery.trim($("#newEndHour").val());
		var endMin = jQuery.trim($("#newEndMin").val());
		var endMeridiem = jQuery.trim($("#newEndMeridiem").val());
		endHour = parseInt(endHour.replace(/^[0]+/g,""));
		if(endMin == "0" || endMin == "00"){
			endMin = 0;
		}else{
			endMin = parseInt(endMin.replace(/^[0]+/g,""));
		}

		if(endMeridiem == "AM" && endHour == 12){
			endHour = 0;
		}else if(endMeridiem == "PM" && endHour < 12){
			endHour = parseInt(endHour) + 12;
		}
		
		//alert("Start time: " + startHour + ":" + startMin + " " + startMonth + " / " +startYear + "------"+ startDay+", End time: " + endHour + ":" + endMin + " " + endMeridiem);
		
		// Dates use integers
		var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),startHour,startMin,0,0);
		var endDateObj = new Date(parseInt(endYear),parseInt(endMonth)-1,parseInt(endDay),endHour,endMin,0,0);
		
		// add new event to the calendar
		//var buttonvalue = $(this).find("#buttonSpan").text();
		
		var test = jfcalplugin.addAgendaItem(
			"#mycal",
			what,
			eventType,
			"Special",
			startDateObj,
			endDateObj,
			false,
			{	
				myDate: new Date()
				
			},
			{
				backgroundColor: $("#colorBackground").val(),
				foregroundColor: $("#colorForeground").val()
			}
			

		);
		
		if(test != 1)
		{
			if(clickAgendaItem != null){
				
				jfcalplugin.deleteAgendaItemById("#mycal",clickAgendaItem);
			//jfcalplugin.deleteAgendaItemByDataAttr("#mycal","myNum",42);
			}
		}	
		}

		$(this).dialog('close');
		
		},		
			Cancel: function() {
			$(this).dialog('close');
		}
		},
		open: function(event, ui){
		var title = clickAgendaItem.title;
		var buttonVal = clickAgendaItem.buttonType;
		var NewstartDate = clickAgendaItem.startDate;
		var NewendDate = clickAgendaItem.endDate;
		var allDay = clickAgendaItem.allDay;
		var data = clickAgendaItem.data;
		// in our example add agenda modal form we put some fake data in the agenda data. we can retrieve it here.
		//alert(buttonVal)
		$("#display-event-edit-form").append(
			"<center><font id='titleForEdit'>" + title+ "</font><center>"		
		);				
		if(allDay){
			$("#display-event-edit-form").append(
				"(All day event)<br><br>"				
			);				
		}else{
			$("#display-event-edit-form").append(
					"<table style='width:100%; font-size: 11px;'><tr>"+
						"<td><label><b>Previous Start Date</b></label></td><td colspan='3'>" + NewstartDate + "</td></tr><tr><td>&nbsp;</td></tr>" +
						"<tr><td><label>New Start Date</label><br/><input type='text' name='newStartDate' id='newStartDate' value='' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%;padding: .4em;' />" +"<br></td>" +
						"<td><label>Start Hour</label>" +
							"<select id='newStartHour' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%;padding: .4em;'>" +
								"<option value='12' SELECTED>12</option>" +
								"<option value='1'>1</option>" +
								"<option value='2'>2</option>" +
								"<option value='3'>3</option>" +
								"<option value='4'>4</option>" +
								"<option value='5'>5</option>" +
								"<option value='6'>6</option>" +
								"<option value='7'>7</option>" +
								"<option value='8'>8</option>" +
								"<option value='9'>9</option>" +
								"<option value='10'>10</option>" +
								"<option value='11'>11</option>" +
							"</select>" +				
						"</td><td><label>Start Minute</label>" +
							"<select id='newStartMin' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%;padding: .4em;'>" +
								"<option value='00' SELECTED>00</option>" +
								"<option value='10'>10</option>" +
								"<option value='20'>20</option>" +
								"<option value='30'>30</option>" +
								"<option value='40'>40</option>" +
								"<option value='50'>50</option>" + 
							"</select>"	+			
						"</td><td><label>Start AM/PM</label>" +
							"<select id='newStartMeridiem' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%;padding: .4em;'>" +
								"<option value='AM' SELECTED>AM</option>" +
								"<option value='PM'>PM</option>" +
							"</select>" +				
						"</td></tr><tr><td><br/></td></tr>"+
					"<tr><td><label><b>Previous End Date</b></label></td><td colspan='3'>" + NewendDate + "</td></tr><tr><td>&nbsp;</td></tr>" +
					"<tr><td><label>New End Date</label><input type='text' name='newEndDate' id='newEndDate' value='' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%; padding: .4em;'/>" +"<br></td>" +
					"<td><label>End Hour</label>" +
							"<select id='newEndHour' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%; padding: .4em;'>" +
								"<option value='12' SELECTED>12</option>" +
								"<option value='1'>1</option>" +
								"<option value='2'>2</option>" +
								"<option value='3'>3</option>" +
								"<option value='4'>4</option>" +
								"<option value='5'>5</option>" +
								"<option value='6'>6</option>" +
								"<option value='7'>7</option>" +
								"<option value='8'>8</option>" +
								"<option value='9'>9</option>" +
								"<option value='10'>10</option>" +
								"<option value='11'>11</option>" +
							"</select>" +				
							"</td><td><label>End Minute</label>" +
							"<select id='newEndMin' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%;padding: .4em;'>" +
								"<option value='00' SELECTED>00</option>" +
								"<option value='10'>10</option>" +
								"<option value='20'>20</option>" +
								"<option value='30'>30</option>" +
								"<option value='40'>40</option>" +
								"<option value='50'>50</option>" +
							"</select>" +				
							"</td><td><label>End AM/PM</label>" +
							"<select id='newEndMeridiem' class='text ui-widget-content ui-corner-all' style='margin-bottom:12px; width:95%;padding: .4em;'>" +
								"<option value='AM' SELECTED>AM</option>" +
								"<option value='PM'>PM</option>" +
							"</select>" +				
							"</td></tr>"+
							"<tr><td id='nApp' colspan='4'><td></tr>"+
							"<tr><td></td></tr>"+								
				"</table>"
				/*"<b>Previous Starts:</b> " + NewstartDate + "<br>" +
				"<input type='text' name='newStartDate' id='newStartDate' value=''/>" +"<br>"+
				"<b>Previous Ends:</b> " + NewendDate + "<br>"+
				"<input type='text' name='newEndDate' id='newEndDate' value='' style='margin-bottom:12px; width:95%; padding: .4em;' class='text ui-widget-content ui-corner-all'/>" +"<br>"*/				
			);
			if(buttonVal=="addSlot" ||  buttonVal==null || buttonVal == undefined)
			{
			$("#nApp").append(
						"<b>*</b><label>No of appointments per slot :</label>&emsp;&emsp;<input type='text' id='noOfApp' name='noOfApp' size='8'>"
					);
			}	
			$("#newStartDate").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true,
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: 'yy-mm-dd',
				minDate: 0,
				beforeShowDay: $.datepicker.noWeekends 
			});
			$("#newEndDate").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true,
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: 'yy-mm-dd',
				minDate: 0,
				beforeShowDay: $.datepicker.noWeekends 
			});	
			$("#newStartDate").datepicker('setDate', new Date());
			$("#newEndDate").datepicker('setDate', new Date());		
		}
		for (var propertyName in data) {
			$("#display-event-edit-form").append("<b>" + propertyName + ":</b> " + data[propertyName] + "<br>");
		}	
		$("#display-event-form").dialog('close');
		},
		close: function() {
			// clear agenda data
			$("#display-event-edit-form").html("");
		}	
	});

		
	$('input[name="event"]').click(function() {
	//alert($('input[name="event"]:checked').size);

		
			//alert($('input[name="event"]:checked').val());
			if($('input[name="event"]:checked').val()=="holiday")
			{
				$("#timeslotVisible").css({
                    			"visibility" : "hidden"
               			 });
			}
			else
			{
				$("#timeslotVisible").css({
                    			"visibility" : "visible"
               			 });
			}
		
	});


	function yesnodialog(button1, button2, element){
		  var btns = {};
		  btns[button1] = function(){ 
		      $(this).dialog("close");
		      return Yes;
		  };
		  btns[button2] = function(){ 
		      // Do nothing
		      $(this).dialog("close");
		      return No;
		  };
		  $("<div></div>").dialog({
		    autoOpen: true,
		    title: 'Confirm your changes',
		    modal:true,
		    buttons:btns
		  });
		}
		
			
	
	/**
	Commented while taking values from DB on 28th july
	*/
	/*$(function(){*/


            /*var date = new Date();
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();

           if($("#dateToSelect").length > 0){
               $("#dateToSelect").datepicker({
                maxDate: new Date(currentYear, currentMonth, currentDate)
            });
           }*/

           //$('#mycal').datepicker({ minDate: 0 });

		   		
		/*var d = new Date();
		var n = d.getDate();
		
		
		//var startDate = $("#startDate").val();
		//var startDtArray = startDate.split("-");
		var startYear = d.getFullYear();
		// jquery datepicker months start at 1 (1=January)		
		var startMonth = d.getMonth()+1;
		//alert(d.getMonth())		
		var startDay = d.getDate();
		// strip any preceeding 0's		
		//startMonth = startMonth.replace(/^[0]+/g,"");
		//startDay = startDay.replace(/^[0]+/g,"");
		var startHour = jQuery.trim("10");
		var startMin = jQuery.trim("00");
		var startMeridiem = jQuery.trim("AM");
		startHour = parseInt(startHour.replace(/^[0]+/g,""));
		if(startMin == "0" || startMin == "00"){
			startMin = 0;
		}else{
			startMin = parseInt(startMin.replace(/^[0]+/g,""));
		}
		if(startMeridiem == "AM" && startHour == 12){
			startHour = 0;
		}else if(startMeridiem == "PM" && startHour < 12){
			startHour = parseInt(startHour) + 12;
		}

		//var endDate = $("#endDate").val();
		//var endDtArray = endDate.split("-");
		var endYear;
		var endMonth;
		// jquery datepicker months start at 1 (1=January)	
		if(d.getMonth()=="11")
		{
			 endYear = d.getFullYear()+1;
			 endMonth = 1;
			 alert(endYear + "-----"+endMonth)
		}
		else
		{
			endYear = d.getFullYear();
			endMonth = d.getMonth()+2;
		}	
		// jquery datepicker months start at 1 (1=January)		
		//var endMonth = d.getMonth()+2;		
		var endDay = d.getDate()-1;
		// strip any preceeding 0's		
		//endMonth = endMonth.replace(/^[0]+/g,"");

		//endDay = endDay.replace(/^[0]+/g,"");
		var endHour = jQuery.trim("12");
		var endMin = jQuery.trim("00");
		var endMeridiem = jQuery.trim("PM");
		endHour = parseInt(endHour.replace(/^[0]+/g,""));
		if(endMin == "0" || endMin == "00"){
			endMin = 0;
		}else{
			endMin = parseInt(endMin.replace(/^[0]+/g,""));
		}
		if(endMeridiem == "AM" && endHour == 12){
			endHour = 0;
		}else if(endMeridiem == "PM" && endHour < 12){
			endHour = parseInt(endHour) + 12;
		}
		
		//alert("Start time: " + startHour + ":" + startMin + " " + startMeridiem + ", End time: " + endHour + ":" + endMin + " " + endMeridiem);
		
		// Dates use integers
		var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),startHour,startMin,0,0);
		var endDateObj = new Date(parseInt(endYear),parseInt(endMonth)-1,parseInt(endDay),endHour,endMin,0,0);

		// add new event to the calendar
		jfcalplugin.addAgendaItem(
			"#mycal",
			"Time Slot-1",
			null,
			"General",
			startDateObj,
			endDateObj,
			false,
			{	
				myDate: new Date()
				
			},
			{
				backgroundColor: $("#colorBackground").val(),
				foregroundColor: $("#colorForeground").val()
			}
			

		);*/

		/**
		Adding Second slot 
		*/

		
		/*var startYear = d.getFullYear();
		// jquery datepicker months start at 1 (1=January)		
		var startMonth = d.getMonth()+1;
		//alert(d.getMonth())		
		var startDay = d.getDate();
		// strip any preceeding 0's		
		//startMonth = startMonth.replace(/^[0]+/g,"");
		//startDay = startDay.replace(/^[0]+/g,"");
		var startHour = jQuery.trim("2");
		var startMin = jQuery.trim("00");
		var startMeridiem = jQuery.trim("PM");
		startHour = parseInt(startHour.replace(/^[0]+/g,""));
		if(startMin == "0" || startMin == "00"){
			startMin = 0;
		}else{
			startMin = parseInt(startMin.replace(/^[0]+/g,""));
		}
		if(startMeridiem == "AM" && startHour == 12){
			startHour = 0;
		}else if(startMeridiem == "PM" && startHour < 12){
			startHour = parseInt(startHour) + 12;
		}

		//var endDate = $("#endDate").val();
		//var endDtArray = endDate.split("-");
		var endYear;
		var endMonth;
		// jquery datepicker months start at 1 (1=January)	
		if(d.getMonth()=="11")
		{
			 endYear = d.getFullYear()+1;
			 endMonth = 1;
		}
		else
		{
			endYear = d.getFullYear();
			endMonth = d.getMonth()+2;
		}	
				
		var endDay = d.getDate()-1;
		// strip any preceeding 0's		
		//endMonth = endMonth.replace(/^[0]+/g,"");

		//endDay = endDay.replace(/^[0]+/g,"");
		var endHour = jQuery.trim("4");
		var endMin = jQuery.trim("00");
		var endMeridiem = jQuery.trim("PM");
		endHour = parseInt(endHour.replace(/^[0]+/g,""));
		if(endMin == "0" || endMin == "00"){
			endMin = 0;
		}else{
			endMin = parseInt(endMin.replace(/^[0]+/g,""));
		}
		if(endMeridiem == "AM" && endHour == 12){
			endHour = 0;
		}else if(endMeridiem == "PM" && endHour < 12){
			endHour = parseInt(endHour) + 12;
		}
		
		//alert("Start time: " + startHour + ":" + startMin + " " + startMeridiem + ", End time: " + endHour + ":" + endMin + " " + endMeridiem);
		
		// Dates use integers
		var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),startHour,startMin,0,0);
		var endDateObj = new Date(parseInt(endYear),parseInt(endMonth)-1,parseInt(endDay),endHour,endMin,0,0);

		// add new event to the calendar
		jfcalplugin.addAgendaItem(
			"#mycal",
			"Time Slot-2",
			null,
			"General",
			startDateObj,
			endDateObj,
			false,
			{	
				myDate: new Date()
				
			},
			{
				backgroundColor: $("#colorBackground").val(),
				foregroundColor: $("#colorForeground").val()
			}
			

		);*/
		/*
		});*/

	$(function(){
		//alert("Start time: " + startHour + ":" + startMin + " " + startMonth + " / " +startYear + "------"+ startDay+", End time: " + endHour + ":" + endMin + " " + endMeridiem);
		//0:0 8 / 2014------8
		//var startDateObj = new Date(parseInt(startYear),parseInt(startMonth)-1,parseInt(startDay),startHour,startMin,0,0);
		 $.ajax({
        url: "getAppCalender",
        type:"POST",
        dataType: 'json',
        async: false,
        success: function(data){
       //var endDate = data.endDate;
       
   $.each(data.getcal.starttime, function(j,startTime){
         var ajax = $({});
         ajax.queue(function(next){
             //alert(startDate+"-------"+data.getcal.startDate[j])
             /*
             Dateformat :--- yyyy-mm-dd
             timeformat :--- 24hrs
             */
             var startDateArray = new Array();
             startDateArray = data.getcal.startDate[j].split("-");
             
             var endDateArray = new Array();
             endDateArray = data.getcal.endDate[j].split("-");
             
             var startTimeArray = new Array();
             startTimeArray = startTime.split(":");
             
             var endTimeArray = new Array();
             endTimeArray = data.getcal.endtime[j].split(":");

             //alert(endTimeArray[0]+"---"+endTimeArray[1]);
             //alert(startDateArray[0]+"/"+ startDateArray[1]+"/"+startDateArray[2]);
             startDateArray[1] = startDateArray[1].replace(/^[0]+/g,"");
             startDateArray[2] = startDateArray[2].replace(/^[0]+/g,"");

             endDateArray[1] = endDateArray[1].replace(/^[0]+/g,"");
             endDateArray[2] = endDateArray[2].replace(/^[0]+/g,"");
             
             var startYearN = startDateArray[0];$
            
             var startDateObj = new Date(parseInt(startYearN),parseInt(startDateArray[1])-1,parseInt(startDateArray[2]),startTimeArray[0],startTimeArray[1],0,0);
             var endDateObj = new Date(parseInt(endDateArray[0]),parseInt(endDateArray[1])-1,parseInt(endDateArray[2]),endTimeArray[0],endTimeArray[1],0,0);

	//alert(startDateObj+ "----------"+ endDateObj)
             if(data.getcal.type[j]=="Holiday")
             {
            	 jfcalplugin.addAgendaItem(
              			"#mycal",
              			data.getcal.reason[j],
              			"holiday",
              			"gen",
              			startDateObj,
              			endDateObj,
              			false,
              			{	
              				Reason_For_Holiday:data.getcal.reason[j]
              				
              			},
              			{
              				backgroundColor: $("#colorBackground").val(),
              				foregroundColor: $("#colorForeground").val()
              			}
              			

              		);
             }
             else
             {
             jfcalplugin.addAgendaItem(
         			"#mycal",
         			(j+1)+"--Slot",
         			"addSlot",
         			"gen",
         			startDateObj,
         			endDateObj,
         			false,
         			{	
         				NoOfAppointments: data.getcal.no_of_appointment[j]
         				
         			},
         			{
         				backgroundColor: $("#colorBackground").val(),
         				foregroundColor: $("#colorForeground").val()
         			}
         			

         		);
             } 	
           next();
           });
       
   			});    
        }
        });
	});
	
	
});
</script>

<div>

<div style="position:absolute; top:0px; width:100%;">
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
<center>
<div style="background-image: url('${pageContext.request.contextPath}/images/head.jpg');background-repeat: no-repeat;background-position: center;background-size: 80% 150px;
    background-repeat: no-repeat; height:30%;"></div>

</center>
 <%-- <div class="right"> <s:a action="logout" class="tiny secondary button"> Logout </s:a> </div> --%>

</div>


<s:if test="%{#session.USER_ROLE==1}">
<s:a action="AdminHome" style="float: left !important; padding-left: 10%;text-decoration: none;"><div class="buttonDiv"><center>  Home </center> </div></s:a>
<a href="logout.action" style="float: right !important; padding-right: 13%;text-decoration: none;font-weight: bolder;"><div class="buttonDiv"><center>  Logout </center> </div></a>
 <br/><br/><br/> <br/>

	<div>

		<div id="example" style="margin: auto; width:80%;">
		
		
		<!--<input type="radio" name="center" value="Mumbai"/><font style="font-size:14px;">Mumbai</font>
		<input type="radio" name = "center" value="Chennai"/><font style="font-size:14px;">Chennai</font>
		<input type="radio" name = "center" value="Banglore"/><font style="font-size:14px;">Banglore</font>
		<input type="radio" name = "center" value="Delhi"/><font style="font-size:14px;">Delhi</font>
		
		-->
		
		<div id ="toolbar" class="ui-widget-header ui-corner-all" style="padding:3px; vertical-align: middle; white-space:nowrap; overflow: hidden;">
			<button id="BtnPreviousMonth">Previous Month</button>
			<button id="BtnNextMonth">Next Month</button>
			&nbsp;&nbsp;&nbsp;
			<font name="Center" style="font-size: 13px;">Date:</font> <input type="text" id="dateSelect" name="dateselect" />
			&nbsp;&nbsp;&nbsp;
			<!-- <button id="BtnDeleteAll">Delete All</button>&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			<font name="Center" style="font-size: 13px;margin-right:15%;" >Center&nbsp;&nbsp;:&nbsp;&nbsp;<s:property value="#session.collectionCentre"/></font>
			<s:a action="addDefaultValue" style="text-decoration: none;"><input type="button" value="Add default slots or values" /></s:a>
		</div>

		<br><br>

		<!--
		You can use pixel widths or percentages. Calendar will auto resize all sub elements.
		Height will be calculated by aspect ratio. Basically all day cells will be as tall
		as they are wide.
		-->
		<div id="mycal" style="box-shadow: 3px 3px 3px 3px #7A8B8B, -0.5em 0.5em 1.5em 1.5em #668B8B;">
		</div>

		</div>

		<!-- debugging-->
		<div id="calDebug"></div>

		<!-- Add event modal form -->
		<style type="text/css">
			//label, input.text, select { display:block; }
			fieldset { padding:0; border:0; margin-top:25px; }
			.ui-dialog .ui-state-error { padding: .3em; }
			.validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
		<div id="add-event-form" title="Add New Event">
		
<div>
	<form>
			<fieldset>
			<input type="radio" name="event" id="event" value="holiday"><b>Holiday</b>
			<!-- <input type="radio" name="event" id = "event" value="addSlot"><b>Add Slot</b> -->
			<br/><br/>
				<label for="name" >What?</label>
				<input type="text" name="what" id="what" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
				<table style="width:100%; padding:5px;visibility:hidden;font-size: 11px;" id="timeslotVisible">
					<tr>
						<td>
							<label>Start Date</label>
							<input type="text" name="startDate" id="startDate" value="" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>				
						</td>
						<td>&nbsp;</td>
						<td>
							<label>Start Hour</label>
							<select id="startHour" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="12" SELECTED>12</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
							</select>				
						<td>
						<td>
							<label>Start Minute</label>
							<select id="startMin" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="00" SELECTED>00</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
							</select>				
						<td>
						<td>
							<label>Start AM/PM</label>
							<select id="startMeridiem" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="AM" SELECTED>AM</option>
								<option value="PM">PM</option>
							</select>				
						</td>
					</tr>
					<tr>
						<td>
							<label>End Date</label>
							<input type="text" name="endDate" id="endDate" value="" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>				
						</td>
						<td>&nbsp;</td>
						<td>
							<label>End Hour</label>
							<select id="endHour" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="12" SELECTED>12</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
							</select>				
						<td>
						<td>
							<label>End Minute</label>
							<select id="endMin" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="00" SELECTED>00</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
							</select>				
						<td>
						<td>
							<label>End AM/PM</label>


							<select id="endMeridiem" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
								<option value="AM" SELECTED>AM</option>
								<option value="PM">PM</option>
							</select>				
						</td>				
					</tr>			
				</table>
				
			</fieldset>
			</form>
		</div>
		</div>

		<div id="display-event-form" title="View Agenda Item">	
		</div>		

		<div id="display-event-edit-form" title="Edit Agenda Item">	
		</div>
	</div><!-- end example tab -->
</s:if>

</body>
</html>