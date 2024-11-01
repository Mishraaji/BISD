/**
 * Frontier JQuery Full Calendar Plugin.
 *
 * June 24, 2010 - v1.3.2 - Bug fix in getAgendaItemByDataAttr(). I suck...
 * June 23, 2010 - v1.3.1 - Bug fix in deleteAgendaItemByDataAttr() function, and new reRenderAgendaItems() function!
 * June 22, 2010 - v1.3   - Tooltip support. Additional callbacks, applyAgendaTooltipCallback, agendaDragStartCallback,
 *						    and agendaDragStopCallback.
 * June 17, 2010 - v1.2   - Drag-and-drop, CSS updates, allDay event option.
 * June 14, 2010 - v1.1   - Few bug fixes, tweaks, and basic VEVENT ical support.
 * June 09, 2010 - v1.0   - Initial version.
 *
 * Seth Lenzi
 * slenzi@gmail.com
 *
 * This plugin is free. Do with it as you want. I claim no responsibility if it explodes and ruins your day. ;)
 *
 * MIT License - http://en.wikipedia.org/wiki/MIT_License
 *
 * Dependencies:
 *
 * This plugin requires the following javascript libraries.
 *
 * 1) JQuery Core and JQuery UI.
 *    For IE you need to use the inlcuded modified version of jQuery Core, js/jquery-core/jquery-1.4.2-ie-fix.min.js for drag-and-drop.
 *    Drag-and-drop works fine in Chrome, Opera, Firefox, and Safari using unmodified jQuery core. For more info read the txt file
 *    that should have been included with this plugin at js/jquery-core/README-IE-FIX.TXT
 *    http://jquery.com/
 *    http://jqueryui.com
 *
 * 2) jshashtable.js
 *    Should be included with this plugin in the js/lib/ folder.
 *    Tim Down
 *    http://code.google.com/p/jshashtable/
 *    http://www.timdown.co.uk/jshashtable/index.html
 *
 ******************************************************
 **** These last ones are already inlcued in this file.
 ******************************************************
 *
 * 3) WResize is the jQuery plugin for fixing the IE window resize bug.
 *    This plugin is already included at the end of this file.
 *    Copyright 2007 / Andrea Ercolino
 *    LICENSE: http://www.opensource.org/licenses/mit-license.php
 *    WEBSITE: http://noteslog.com/
 *
 * 4) Javascript iCal parsers. Merci!
 *    This is already included in this file.
 *    http://code.google.com/p/ijp/
 */
(function ($) {
	var countingDaysInDisplayingCalender=0;
    var allOptions = new Array();
    var myCalendars = new Hashtable();
    String.prototype.startsWith = function (str) {
        return (this.match("^" + str) == str)
    };

    /**
     * for ajax call to populate disease list
     */
    function getXMLObject()  //XML OBJECT
    {
       var xmlHttp = false;
       try {
    	   	xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
       }
       catch (e) {
    	   	try {
    		   	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
         	}
         	catch (e2) {
         		xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
         	}
       	}
       	if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
       		xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
       	}
       return xmlHttp;  // Mandatory Statement returning the ajax object created
    }
     
    var xmlhttp;
    if (window.XMLHttpRequest)
      	{// code for IE7+, Firefox, Chrome, Opera, Safari
    	xmlhttp=new XMLHttpRequest();
      	}
    else
      	{// code for IE6, IE5
    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      	}
    
    function CalendarAgendaItem(title,buttonType,slotType, startDate, endDate, allDay, hashData) {
    	//alert($('input[name="event"]:checked').val())
        this.id = 0;
        this.titleValue = title;
	this.buttonValue=buttonType;
	this.slotTypeValue=slotType;
        this.startDt = startDate;
        this.endDt = endDate;
        this.allDayEvent = allDay;
        this.backgroundColor = null;
        this.foregroundColor = null;
        this.agendaData = hashData;
        this.isAllDay = function () {
            return this.allDayEvent
        };
        this.setAllDay = function (b) {
            this.allDayEvent = b
        };
        this.setBackgroundColor = function (c) {
            this.backgroundColor = c
        };
        this.setForegroundColor = function (c) {
            this.foregroundColor = c
        };
        this.getBackgroundColor = function () {
            return this.backgroundColor
        };
        this.getForegroundColor = function () {
            return this.foregroundColor
        };
        this.setAgendaId = function (agendaId) {
            this.id = agendaId
        };
        this.getAgendaId = function () {
            return this.id
        };
        this.getStartDate = function () {
            return this.startDt
        };
        this.getEndDate = function () {
            return this.endDt
        };
        this.setStartDate = function (d) {
            this.startDt = d
        };
        this.setEndDate = function (d) {
            this.endDt = d
        };
        this.getTitle = function () {
            return this.titleValue
        };
        this.setButtonValue = function (d) {
        	this.buttonValue = d
        };
	this.getButtonValue = function () {
            return this.buttonValue
        };
        this.setSlotType = function (d) {
        	this.slotTypeValue = d
        };
	this.getSlotType = function () {
            return this.slotTypeValue
        };
        this.addAgendaData = function (key, value) {
            this.agendaData.put(key, value)
        };
        this.getAgendaData = function (key) {
            return this.agendaData.get(key)
        };
        this.getAgendaDataHash = function () {
            return this.agendaData
        };
        this.toString = function () {
            var s = "Title: " + this.titleValue + "\n";
            s += "Start Date: " + this.startDt + "\n";
            s += "End Date: " + this.endDt + "\n";
            if (this.agendaData != null && this.agendaData.size() > 0) {
                var keys = this.agendaData.keys();
                for (var keyIndex = 0; keyIndex < keys.length; keyIndex++) {
                    var keyName = keys[keyIndex];
                    var val = this.getAgendaData(keyName);
                    s += keyName + ": " + val + "\n"
                }
            }
            return s
        }
    }

    function CalendarDayCell(jqyObj) {
        this.jqyObj = jqyObj;
        this.date = null;
        this.agendaDivArray = new Array();
        this.jqyMoreDiv = null;
        this.addClass = function (c) {
            this.jqyObj.addClass(c)
        };
        this.removeClass = function (name) {
            if (name != null && name != "") {
                this.jqyObj.removeClass(name)
            } else {
                this.jqyObj.removeClass()
            }
        };
        this.addMoreDiv = function (element) {
            if (this.jqyMoreDiv == null) {
               this.jqyMoreDiv = element;
                this.appendHtml(element)
            } else {
                this.jqyMoreDiv.remove();
                this.jqyMoreDiv = element;
                this.appendHtml(element)
            }
        };
        this.hasMoreDiv = function () {
            if (this.jqyMoreDiv != null) {
                return true
            }
            return false
        };
        this.addAgendaDivElement = function (id, element) {
            this.agendaDivArray.push(element)
        };
        this.clearAgendaDivElements = function () {
            this.clearHtml();
            this.jqyMoreDiv = null;
            this.agendaDivArray = new Array()
        };
        this.getNextAgendaYstartY = function (startY, agendaDivHeight, moreDivHeight) {
            var nextY = startY;
            var divArray = this.agendaDivArray;
            var max = (this.getY() + this.getHeight()) - (agendaDivHeight + 1) - (moreDivHeight + 1);
            if (divArray != null && divArray.length > 0) {
                divArray.sort(this.sortDivByY);
                var divTop = 0;
                var divBottom = 0;
                for (var i = 0; i < divArray.length; i++) {
                    divTop = parseInt(divArray[i].css("top").replace("px", ""));
                    divBottom = divTop + parseInt(divArray[i].css("height").replace("px", "")) + 1;
                    if ((divTop + 2 - nextY) > (agendaDivHeight + 1)) {} else {
                        if (!(divBottom < nextY)) {
                            nextY = divBottom
                        }
                    }
                }
            }
            if (nextY > max) {
                return -1
            }
            return parseInt(nextY)
        };
        this.sortDivByY = function (a, b) {
            var y1 = parseInt(a.css("top").replace("px", ""));
            var y2 = parseInt(b.css("top").replace("px", ""));
            if (y1 < y2) {
                return -1
            } else {
                if (y1 > y2) {
                    return 1
                } else {
                    return 0
                }
            }
        };
        this.setDate = function (date) {
            this.date = date
        };
        this.getDate = function () {
            return this.date
        };
        this.getHeight = function () {
            return this.jqyObj.height()
        };
        this.setHeight = function (h) {
            this.jqyObj.height(h)
        };
        this.getWidth = function () {
            return this.jqyObj.width()
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w)
        };
        this.getInnerWidth = function () {
            return this.jqyObj.innerWidth()
        };
        this.getInnerWidthPlusBorder = function () {
            return this.jqyObj.outerWidth()
        };
        this.getX = function () {
            return this.jqyObj.position().left
        };
        this.getY = function () {
            return this.jqyObj.position().top
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.appendHtml = function (htmlData) {
            this.jqyObj.append(htmlData)
        };
        this.clearHtml = function () {
            this.setHtml("")
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.addClickHandler = function (handler) {
            this.jqyObj.bind("click", {
                calDayDate: this.date
            }, handler)
        }
    }

    function CalendarHeaderCell(jqyObj) {
        this.jqyObj = jqyObj;
        this.addClass = function (c) {
            this.jqyObj.addClass(c)
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.getX = function () {
            return this.jqyObj.position().left
        };
        this.getY = function () {
            return this.jqyObj.position().top
        };
        this.getHeight = function () {
            return this.jqyObj.height()
        };
        this.setHeight = function (h) {
            this.jqyObj.height(h)
        };
        this.getWidth = function () {
            return this.jqyObj.width()
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w)
        };
        this.getInnerWidth = function () {
            return this.jqyObj.innerWidth()
        };
        this.getInnerWidthPlusBorder = function () {
            return this.jqyObj.outerWidth()
        }
    }

    function CalendarWeekHeaderCell(jqyObj) {
        this.jqyObj = jqyObj;
        this.date = null;
        this.addClass = function (c) {
            this.jqyObj.addClass(c)
        };
        this.setDate = function (date) {
            this.date = date
        };
        this.getDate = function () {
            return this.date
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.getX = function () {
            return this.jqyObj.position().left
        };
        this.getY = function () {
            return this.jqyObj.position().top
        };
        this.getHeight = function () {
            return this.jqyObj.height()
        };
        this.setHeight = function (h) {
            this.jqyObj.height(h)
        };
        this.getWidth = function () {
            return this.jqyObj.width()
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w)
        };
        this.getInnerWidth = function () {
            return this.jqyObj.innerWidth()
        };
        this.getInnerWidthPlusBorder = function () {
            return this.jqyObj.outerWidth()
        };
        this.addClickHandler = function (handler) {
            this.jqyObj.bind("click", {
                calDayDate: this.date
            }, handler)
        }
    }

    function CalendarHeader(jqyObj) {
        this.jqyObj = jqyObj;
        this.headerCells = new Array();
        this.appendCalendarHeaderCell = function (calHeaderCell) {
            this.headerCells.push(calHeaderCell);
            this.jqyObj.append(calHeaderCell.jqyObj)
        };
        this.getHeaderCells = function () {
            return this.headerCells
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w)
        }
    }

    function CalendarWeekHeader(jqyObj) {
        this.jqyObj = jqyObj;
        this.weekHeaderCells = new Array();
        this.appendCalendarWeekHeaderCell = function (weekHeaderCell) {
            this.weekHeaderCells.push(weekHeaderCell);
            this.jqyObj.append(weekHeaderCell.jqyObj)
        };
        this.getHeaderCells = function () {
            return this.weekHeaderCells
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w)
        }
    }

    function CalendarWeek(jqyObj) {
        this.jqyObj = jqyObj;
        this.days = new Array();
        this.appendCalendarDayCell = function (calDayCell) {
            this.days.push(calDayCell);
            this.jqyObj.append(calDayCell.jqyObj)
        };
        this.getDays = function () {
            return this.days
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w)
        }
    }

    function addingSundays(firstDayOfTheCalender)
	{
    	//alert("firstDay----"+firstDayOfTheCalender)
		//var d = new Date();
    	//var date = $("#dateSelect").datepicker('getDate');
    	//alert(date)
    	/*var d = firstDayOfTheCalender;
    	/*var firstDay = new Date(d.getFullYear(), d.getMonth(), 1).getDay();
        return Math.ceil((d.getDate() + firstDay)/7);*/
		/*var getTot = daysInMonth(d.getMonth(),d.getFullYear());//countingDaysInDisplayingCalender;//// //Get total days in a month
		var sat = new Array();   //Declaring array for inserting Saturdays
		var sun = new Array();   //Declaring array for inserting Sundays

		for(var i=1;i<=getTot;i++){    //looping through days in month
		    var newDate = new Date(d.getFullYear(),d.getMonth(),i)
		    if(newDate.getDay()==0){
			    alert(i)   //if Sunday
		        sun.push(i);
		    }

		}*/
    	
    	
    	/*var calDate = this.getCurrentDate("#mycal"); // returns Date object
		var cyear = calDate.getFullYear();
		// Date month 0-based (0=January)
		var cmonth = calDate.getMonth();
		var cday = calDate.getDate();
		
		alert(cyear+"--"+cmonth+"--"+cday);*/
	}

    
	
	function daysInMonth(month,year) {
	    return new Date(year, month, 0).getDate();
	}
    
    function Calendar() {
        this.jqyObj = null;
        this.calHeaderObj = null;
        this.weeks = new Array();
        this.weekHeaders = new Array();
        this.displayDate = new Date();
        this.agendaItems = new Hashtable();
        //this.dragAndDropEnabled = true;
        this.dayHash = new Hashtable();
        this.clickEvent_dayCell = null;
        this.clickEvent_agendaCell = null;
        this.dropEvent_agendaCell = null;
        this.mouseOverEvent_agendaCell = null;
        this.callBack_agendaTooltip = null;
        //this.dragStart_agendaCell = null;
        //this.dragStop_agendaCell = null;
        this.agendaId = 1;
        this.cellBorderWidth = 1;
        this.dayCellHeaderCellHeight = 17;
        this.agendaItemHeight = 15;
        this.aspectRatio = 1;
        this.initialize = function (calElm, date, dayCellClickHandler, agendaCellClickHandler, agendaCellDropHandler,agendaCellMouseoverHandler, agendaTooltipHandler) {
            this.jqyObj = calElm;
            this.displayDate = date;
            this.clickEvent_dayCell = dayCellClickHandler;
            this.clickEvent_agendaCell = agendaCellClickHandler;
            this.dropEvent_agendaCell = agendaCellDropHandler;
            //this.dragAndDropEnabled = dragAndDrop;
            this.mouseOverEvent_agendaCell = agendaCellMouseoverHandler;
            this.callBack_agendaTooltip = agendaTooltipHandler;
            //this.dragStart_agendaCell = agendaCellDragStartHandler;
           // this.dragStop_agendaCell = agendaCellDragStopHandler;
            this.do_init()
        };
        this.do_init = function () {
            this.clear(false);
            var calHeaderCell;
            var calHeader = this.buildCalendarHeader();
            for (var dayIndex = 0; dayIndex < Calendar.dayNames.length; dayIndex++) {
                calHeaderCell = this.buildCalendarHeaderCell();
                calHeaderCell.setHtml("&nbsp;" + Calendar.dayNames[dayIndex]);
                calHeader.appendCalendarHeaderCell(calHeaderCell);
                if (dayIndex == 6) {
                    calHeaderCell.addClass("JFrontierCal-Header-Cell-Last")
                }
            }
            this.addHeader(calHeader);
            var today = new Date();
            var currentYearNum = this.getCurrentYear();
            var currentMonthNum = this.getCurrentMonth();
            var currentDayNum = today.getDate();
            var daysInCurrentMonth = this.getDaysCurrentMonth();
            var daysInPreviousMonth = this.getDaysPreviousMonth();
            var daysInNextMonth = this.getDaysNextMonth();
            var dtFirst = new Date(this.getCurrentYear(), this.getCurrentMonth(), 1, 0, 0, 0, 0);
            var dtLast = new Date(this.getCurrentYear(), this.getCurrentMonth(), daysInCurrentMonth, 0, 0, 0, 0);
            var firstDayWkIndex = dtFirst.getDay();
            var lastDayWkIndex = dtLast.getDay();
            var showTodayStyle = ((today.getFullYear() == currentYearNum && today.getMonth() == currentMonthNum) ? true : false);
            var totalDayCells = daysInCurrentMonth + firstDayWkIndex;
            if (lastDayWkIndex > 0) {
                totalDayCells += Calendar.dayNames.length - lastDayWkIndex - 1
            }
            var numberWeekRows = Math.ceil(totalDayCells / Calendar.dayNames.length);
            var dayNum = 1;
            var dt = null;
            var firstDayPrevMonth = (daysInPreviousMonth - firstDayWkIndex) + 1;
            var calDayCell;
            var calWeekObj;
            var calWeekHeaderCellObj;
            var calWeekHeaderObj;
            calWeekObj = this.buildCalendarWeek();
            calWeekHeaderObj = this.buildCalendarWeekHeader();
            for (var dayIndex = 0; dayIndex < Calendar.dayNames.length; dayIndex++) {
                calDayCell = this.buildCalendarDayCell();
                calWeekHeaderCellObj = this.buildCalendarWeekHeaderCell();
                if (dayIndex < firstDayWkIndex) {
                    dt = new Date(currentYearNum, (currentMonthNum - 1), firstDayPrevMonth, 0, 0, 0, 0);
                  var weekend = dt.getDay() == 0 || dt.getDay() == 6;
                    if(weekend)
                    {
                    	calWeekHeaderCellObj.addClass("myweekend");
                    }
                    calDayCell.setDate(dt);
                    calWeekHeaderCellObj.setDate(dt);
                    calWeekHeaderCellObj.setHtml(firstDayPrevMonth + "&nbsp;");
                    calDayCell.addClass("JFrontierCal-PrevMonth-Day-Cell");
                    calWeekHeaderCellObj.addClass("JFrontierCal-PrevMonth-Week-Header-Cell");
                    firstDayPrevMonth += 1
                } else {
                    dt = new Date(currentYearNum, currentMonthNum, dayNum, 0, 0, 0, 0);
                    var weekend = dt.getDay() == 0 || dt.getDay() == 6;
                    if(weekend)
                    {
                    	calWeekHeaderCellObj.addClass("myweekend");
                    }
                    calDayCell.setDate(dt);
                    calWeekHeaderCellObj.setDate(dt);
                    calWeekHeaderCellObj.setHtml(dayNum + "&nbsp;");
                    if (showTodayStyle && dayNum == currentDayNum) {
                        calDayCell.addClass("JFrontierCal-Day-Cell-Today");
                        calWeekHeaderCellObj.setHtml(dayNum + "&nbsp;")
                    }
                    dayNum += 1
                } if (dayIndex == 6) {
                    calDayCell.addClass("JFrontierCal-Day-Cell-Last");
                    calWeekHeaderCellObj.addClass("JFrontierCal-Week-Header-Cell-Last")
                }
                if (this.clickEvent_dayCell != null) {
                    calDayCell.addClickHandler(this.clickEvent_dayCell);
                    calWeekHeaderCellObj.addClickHandler(this.clickEvent_dayCell)
                }
                calDayCell.jqyObj.data("dayDate", dt);
                if (this.dragAndDropEnabled) {
                    calDayCell.jqyObj.droppable({
                        hoverClass: "JFrontierCal-Day-Cell-Droppable",
                        tolerance: "pointer",
                        accept: ".JFrontierCal-Agenda-Item"
                    });
                    calDayCell.jqyObj.bind("drop", {
                        cal: this
                    }, this.agendaDropHandler)
                }
                calWeekHeaderObj.appendCalendarWeekHeaderCell(calWeekHeaderCellObj);
                calWeekObj.appendCalendarDayCell(calDayCell);
                this.dayHash.put((calDayCell.getDate().getFullYear() + "") + (calDayCell.getDate().getMonth() + "") + (calDayCell.getDate().getDate() + ""), calDayCell)
            }
            this.addWeekHeader(calWeekHeaderObj);
            this.addWeek(calWeekObj);
            for (var weekIndex = 2; weekIndex < numberWeekRows; weekIndex++) {
                calWeekObj = this.buildCalendarWeek();
                calWeekHeaderObj = this.buildCalendarWeekHeader();
                for (var dayIndex = 0; dayIndex < Calendar.dayNames.length; dayIndex++) {
                    calDayCell = this.buildCalendarDayCell();
                    calWeekHeaderCellObj = this.buildCalendarWeekHeaderCell();
                    dt = new Date(currentYearNum, currentMonthNum, dayNum, 0, 0, 0, 0);
                    var weekend = dt.getDay() == 0 || dt.getDay() == 6;
                    if(weekend)
                    {
                    	calWeekHeaderCellObj.addClass("myweekend");
                    }
                    calDayCell.setDate(dt);
                    calWeekHeaderCellObj.setDate(dt);
                    calWeekHeaderCellObj.setHtml(dayNum + "&nbsp;");
                    if (this.clickEvent_dayCell != null) {
                        calDayCell.addClickHandler(this.clickEvent_dayCell);
                        calWeekHeaderCellObj.addClickHandler(this.clickEvent_dayCell)
                    }
                    calDayCell.jqyObj.data("dayDate", dt);
                    if (this.dragAndDropEnabled) {
                        calDayCell.jqyObj.droppable({
                            hoverClass: "JFrontierCal-Day-Cell-Droppable",
                            tolerance: "pointer",
                            accept: ".JFrontierCal-Agenda-Item"
                        });
                        calDayCell.jqyObj.bind("drop", {
                            cal: this
                        }, this.agendaDropHandler)
                    }
                    if (dayIndex == 6) {
                        calDayCell.addClass("JFrontierCal-Day-Cell-Last");
                        calWeekHeaderCellObj.addClass("JFrontierCal-Week-Header-Cell-Last")
                    }
                    if (showTodayStyle && dayNum == currentDayNum) {
                        calDayCell.addClass("JFrontierCal-Day-Cell-Today");
                        calWeekHeaderCellObj.setHtml(dayNum + "&nbsp;")
                    }
                    calWeekHeaderObj.appendCalendarWeekHeaderCell(calWeekHeaderCellObj);
                    calWeekObj.appendCalendarDayCell(calDayCell);
                    this.dayHash.put((calDayCell.getDate().getFullYear() + "") + (calDayCell.getDate().getMonth() + "") + (calDayCell.getDate().getDate() + ""), calDayCell);
                    dayNum += 1
                }
                this.addWeekHeader(calWeekHeaderObj);
                this.addWeek(calWeekObj)
            }
            var nextMonthDisplayDayNum = 1;
            calWeekObj = this.buildCalendarWeek();
            calWeekHeaderObj = this.buildCalendarWeekHeader();
            for (var dayIndex = 0; dayIndex < Calendar.dayNames.length; dayIndex++) {
                calDayCell = this.buildCalendarDayCell();
                calWeekHeaderCellObj = this.buildCalendarWeekHeaderCell();
                if (dayNum <= daysInCurrentMonth) {
                    dt = new Date(currentYearNum, currentMonthNum, dayNum, 0, 0, 0, 0);
                    var weekend = dt.getDay() == 0 || dt.getDay() == 6;
                    if(weekend)
                    {
                    	calWeekHeaderCellObj.addClass("myweekend");
                    }
                    calDayCell.setDate(dt);
                    calWeekHeaderCellObj.setDate(dt);
                    calWeekHeaderCellObj.setHtml(dayNum + "&nbsp;")
                } else {
                    dt = new Date(currentYearNum, (currentMonthNum + 1), nextMonthDisplayDayNum, 0, 0, 0, 0);
                    calDayCell.setDate(dt);
                    calWeekHeaderCellObj.setDate(dt);
                    calWeekHeaderCellObj.setHtml(nextMonthDisplayDayNum + "&nbsp;");
                    calDayCell.addClass("JFrontierCal-NextMonth-Day-Cell");
                    calWeekHeaderCellObj.addClass("JFrontierCal-NextMonth-Week-Header-Cell");
                    nextMonthDisplayDayNum += 1
                } if (dayIndex == 6 && dayNum <= daysInCurrentMonth) {
                    calDayCell.addClass("JFrontierCal-Day-Cell-Last");
                    calWeekHeaderCellObj.addClass("JFrontierCal-Week-Header-Cell-Last")
                } else {
                    if (dayIndex == 6 && dayNum > daysInCurrentMonth) {
                        calDayCell.addClass("JFrontierCal-NextMonth-Day-Cell-Last");
                        calWeekHeaderCellObj.addClass("JFrontierCal-NextMonth-Week-Header-Cell-Last")
                    }
                } if (showTodayStyle && dayNum == currentDayNum) {
                    calDayCell.addClass("JFrontierCal-Day-Cell-Today");
                    calWeekHeaderCellObj.setHtml(dayNum + "&nbsp;")
                }
                dayNum += 1;
                if (this.clickEvent_dayCell != null) {
                    calDayCell.addClickHandler(this.clickEvent_dayCell);
                    calWeekHeaderCellObj.addClickHandler(this.clickEvent_dayCell)
                }
                calDayCell.jqyObj.data("dayDate", dt);
                if (this.dragAndDropEnabled) {
                    calDayCell.jqyObj.droppable({
                        hoverClass: "JFrontierCal-Day-Cell-Droppable",
                        tolerance: "pointer",
                        accept: ".JFrontierCal-Agenda-Item"
                    });
                    calDayCell.jqyObj.bind("drop", {
                        cal: this
                    }, this.agendaDropHandler)
                }
                calWeekHeaderObj.appendCalendarWeekHeaderCell(calWeekHeaderCellObj);
                calWeekObj.appendCalendarDayCell(calDayCell);
                this.dayHash.put((calDayCell.getDate().getFullYear() + "") + (calDayCell.getDate().getMonth() + "") + (calDayCell.getDate().getDate() + ""), calDayCell)
            }
            this.addWeekHeader(calWeekHeaderObj);
            this.addWeek(calWeekObj);
            var headerCellTotalHeight = parseInt(calHeaderCell.jqyObj.outerHeight(true));
            var dayCellTotalHeight = parseInt(calDayCell.jqyObj.outerHeight(true) * numberWeekRows);
            var weekHeaderCellTotalHeight = parseInt(calWeekHeaderCellObj.jqyObj.outerHeight(true));
            var totalCalendarHeight = dayCellTotalHeight + headerCellTotalHeight + weekHeaderCellTotalHeight;
            this.setCss("height", totalCalendarHeight + "px");
            this.jqyObj.addClass("JFrontierCal");
            this.renderAgendaItems()
        };
        this.getAgendaItemsForDay = function (date) {
            if (this.agendaItems == null || this.agendaItems.size() == 0) {
                return
            }
            var itemArray = this.agendaItems.values();
            var startDt = null;
            var endDt = null;
            var itemsForDay = new Array();
            for (var itemIndex = 0; itemIndex < this.agendaItems.size(); itemIndex++) {
                var agi = itemArray[itemIndex];
		//alert(agi);
                startDt = agi.getStartDate();
                endDt = agi.getEndDate();
                if (DateUtil.isDateBetween(date, startDt, endDt)) {
                    itemsForDay.push(agi)
                }
            }
            return itemsForDay
        };
        this.renderAgendaItems = function () {
            if (this.agendaItems == null || this.agendaItems.size() == 0) {
                return
            }
            var itemArray = this.agendaItems.values();
            itemArray.sort(Calendar.sortAgendaItemsByStartDate);
            for (var itemIndex = 0; itemIndex < this.agendaItems.size(); itemIndex++) {
                var agi = itemArray[itemIndex];
                this.renderSingleAgendaItem(agi)
            }
        };
        this.renderSingleAgendaItem = function (agi) {
            var now = new Date();
            LogUtil.log("Calendar.renderSingleAgendaItem() called.");
            if (agi == null) {
                return
            }
            if (this.weeks == null || this.weeks.length == 0) {
                return
            }
            var isEnd;
            var isBegining;
            var displayMessage = null;
            var agendaId = agi.getAgendaId();
            var agendaStartDate = agi.getStartDate();
           // var agendaDateChange = agendaStartDate;
            var agendaDate = $.datepicker.formatDate('dd-mm-yy',agendaStartDate);
           // var nowDate = now;
            var nowDateChange = $.datepicker.formatDate('dd-mm-yy',now);
            /* For now me written wrong condition to validation proper*/
            /*if(agendaDate < nowDateChange)
            {
            	alert("Sorry, You have selected invalid Start Date...");
            	return;
            }*/
            var agendaEndDate = agi.getEndDate();
            if (agendaStartDate == null || agendaEndDate == null) {
                return
            }
            var firstVisibleDay = null;
            var firstWeekDayArray = this.weeks[0].getDays();
            if (firstWeekDayArray != null && firstWeekDayArray.length > 0) {
                firstVisibleDay = firstWeekDayArray[0]
            }
            var lastVisibleDay = null;
            var lastWeekDayArray = this.weeks[this.weeks.length - 1].getDays();
            if (lastWeekDayArray != null && lastWeekDayArray.length > 0) {
                lastVisibleDay = lastWeekDayArray[lastWeekDayArray.length - 1]
            }
            if (firstVisibleDay == null || lastVisibleDay == null) {
                return
            }
            var firstVisDt = firstVisibleDay.getDate();
            
            var lastVisDt = lastVisibleDay.getDate();
            
            if (DateUtil.daysDifferenceDirection(firstVisDt, agendaEndDate) < 0) {
                return
            }
            if (DateUtil.daysDifferenceDirection(lastVisDt, agendaStartDate) > 0) {
                return
            }
            var firstRenderDate = null;
            var lastRenderDate = null;
            if (DateUtil.daysDifferenceDirection(firstVisDt, agendaStartDate) < 0) {
                firstRenderDate = firstVisDt
            } else {
                if (DateUtil.daysDifferenceDirection(firstVisDt, agendaStartDate) == 0) {
                    firstRenderDate = firstVisDt
                } else {
                    firstRenderDate = agendaStartDate
                }
            } if (DateUtil.daysDifferenceDirection(lastVisDt, agendaEndDate) > 0) {
                lastRenderDate = lastVisDt
            } else {
                if (DateUtil.daysDifferenceDirection(lastVisDt, agendaEndDate) == 0) {
                    lastRenderDate = lastVisDt
                } else {
                    lastRenderDate = agendaEndDate
                }
            }
            var firstDtIndex = firstRenderDate.getDay();
            var lastDtIndex = lastRenderDate.getDay();
            //alert("firstRenderDate-----"+firstRenderDate+"lastRenderDate------"+lastRenderDate+"firstDtIndex----"+firstDtIndex)
            if ((DateUtil.daysDifference(firstRenderDate, lastRenderDate) + firstDtIndex) > 6) {
		//alert("1"+"greater than 6")
                if (agi.isAllDay()) {
                    displayMessage = agi.getTitle()
                } else {
                    displayMessage = DateUtil.getAgendaDisplayTime(agi.getStartDate()) + " " + agi.getTitle()
                }
                var lastDaySameWeekDate = DateUtil.getLastDayInSameWeek(firstRenderDate);
                var FirstDaySameWeekDate = DateUtil.getFirstDayInSameWeek(firstRenderDate);
                
                isBegining = ((DateUtil.daysDifferenceDirection(agendaStartDate, firstRenderDate) == 0) ? true : false);
                isEnd = ((DateUtil.daysDifferenceDirection(agendaEndDate, lastDaySameWeekDate) == 0) ? true : false);
               // alert(firstRenderDate.getDay())
                this.renderAgendaDivElement(agi, displayMessage, this.getCalendarDayObjByDate(firstRenderDate), this.getCalendarDayObjByDate(lastDaySameWeekDate), isBegining, isEnd);
                displayMessage = agi.getTitle();
                while (DateUtil.daysDifferenceDirection(lastRenderDate, lastDaySameWeekDate) < 0) {
                    var firstDayNextWeekDate = DateUtil.getFirstDayNextWeek(lastDaySameWeekDate);
                    lastDaySameWeekDate = DateUtil.getLastDayInSameWeek(firstDayNextWeekDate);
                    if (DateUtil.daysDifferenceDirection(lastRenderDate, lastDaySameWeekDate) < 0) {
                        this.renderAgendaDivElement(agi, displayMessage, this.getCalendarDayObjByDate(firstDayNextWeekDate), this.getCalendarDayObjByDate(lastDaySameWeekDate), false, false)
                    } else {
                        isBegining = ((DateUtil.daysDifferenceDirection(agendaStartDate, firstDayNextWeekDate) == 0) ? true : false);
                        isEnd = ((DateUtil.daysDifferenceDirection(agendaEndDate, lastRenderDate) == 0) ? true : false);
                        this.renderAgendaDivElement(agi, displayMessage, this.getCalendarDayObjByDate(firstDayNextWeekDate), this.getCalendarDayObjByDate(lastRenderDate), isBegining, isEnd)
                    }
                }
            } else {
//alert("2"+" in else of greater than 6")
                var startDayObj = this.getCalendarDayObjByDate(firstRenderDate);
                var endDayObj = this.getCalendarDayObjByDate(lastRenderDate);
                var FirstDaySameWeekDate = DateUtil.getFirstDayInSameWeek(firstRenderDate);
                //alert(FirstDaySameWeekDate)
                if (agi.isAllDay()) {
                    displayMessage = agi.getTitle()
                } else {
			 if(agi.getButtonValue()=="holiday")
			{
                    		displayMessage = agi.getTitle()
			}
			else
			{
			    displayMessage = DateUtil.getAgendaDisplayTime(agi.getStartDate()) + " " + agi.getTitle()
			}
                }
                isBegining = ((DateUtil.daysDifferenceDirection(agendaStartDate, firstRenderDate) == 0) ? true : false);
                isEnd = ((DateUtil.daysDifferenceDirection(agendaEndDate, lastRenderDate) == 0) ? true : false);
                this.renderAgendaDivElement(agi, displayMessage, startDayObj, endDayObj, isBegining, isEnd)
            }
            var then = new Date();
            LogUtil.log("Calendar.renderSingleAgendaItem() end. Elapsed time in ms = " + Math.abs(then - now))
            
            
            
            /**
             * startDate(agendaStartDate) and enddate(agendaEndDate)
             * StartTime and Endtime
             */
            
           /* $.ajax({
                
                url: "ScheduleAppointment",
                data:{"StartTime" : diseaseName,"LocalName" : data.disease[i].local_name,"activityId":3,"crop_id":data.disease[i].crop_id,"regionID":0,"stage_id":stageId},
                dataType: 'json',
                async: false,
                success: function(data){
                //alert(data.diseaseName);
           $.each(data.diseaseName, function(j,imagename){
                 var ajax = $({});
                 ajax.queue(function(next){
                 	
                             	
                   next();
                   });
           			});    
                }
                });*/
            
        };
        this.renderAgendaDivElement = function (agi, displayMessage, startDayObject, endDayObject, leftEnd, rightEnd) {
            if (displayMessage == null || startDayObject == null || endDayObject == null) {
                return
            }
            var startX = startDayObject.getX() + 1;
            var endX = endDayObject.getX() + endDayObject.getWidth() - 1;
            var width = endX - startX;
            var spacerBetweenAgendaDivs = 1;
            var agendaDivHeight = this.agendaItemHeight;
            var moreDivHeight = agendaDivHeight;
            var nextY = this.getNextAgendaYPosition(startDayObject, endDayObject, agendaDivHeight, moreDivHeight);
            if (nextY > 0) {
                var d = $("<div/>");
                d.data("agendaId", agi.getAgendaId());
               /* if (this.dragAndDropEnabled) {
                    //d.bind("drag", function (event, ui) {});
                   d.bind("dragstart", {
                        agendaDivElement: d,
                        agendaId: agi.getAgendaId(),
                        agendaItem: Calendar.buildUserAgendaObject(agi),
                        callBack: this.dragStart_agendaCell
                    }, function (event, ui) {
                        var callBack = event.data.callBack;
                        if (callBack != null) {
                            callBack(event, event.data.agendaDivElement, event.data.agendaItem)
                        }
                    });
                    d.bind("dragstop", {
                        agendaDivElement: d,
                        agendaId: agi.getAgendaId(),
                        agendaItem: Calendar.buildUserAgendaObject(agi),
                        callBack: this.dragStop_agendaCell
                    }, function (event, ui) {
                        var callBack = event.data.callBack;
                        if (callBack != null) {
                            callBack(event, event.data.agendaDivElement, event.data.agendaItem)
                        }
                    });
                    d.draggable("enable");
                    d.data("agendaDivElement", d);
                    d.data("agendaId", agi.getAgendaId());
                    d.data("agendaItem", Calendar.buildUserAgendaObject(agi));
                    d.data("revertCallBack", this.callBack_agendaTooltip);
                    d.draggable({
                        revert: function (event, ui) {
                            var callBack = $(this).data("revertCallBack");
                            var agendaDiv = $(this).data("agendaDivElement");
                            var agendaItem = $(this).data("agendaItem");
                            if (callBack != null) {
                                callBack(agendaDiv, agendaItem)
                            }
                            return true
                        },
                        scroll: true
                    })
                }*/
                d.addClass("JFrontierCal-Agenda-Item");
		//alert(agi.getButtonValue()+"-------------"+$('input[name="event"]:checked').val())
               
                if (agi.getButtonValue() == "holiday") {
                	$(this).unbind( "click");
                    d.css("background-color", "#FF0000");
		    d.css("color","#FFFFFF");
		    d.css("font-size","13px");
                }
                else
                {
			//alert("in");
                	d.css("background-color",agi.getBackgroundColor());
                	d.css("color","#000000");
                	d.css("font-size","12px");
                }
                
		
                /*if (agi.getForegroundColor() != null) {
                    d.css("color", agi.getForegroundColor())
                }*/
                d.css("position", "absolute");
                d.css("left", startX + "px");
                d.css("top", nextY + "px");
		d.css("bottom", nextY + "px");
                d.css("width", width + "px");
                d.css("white-space", "nowrap");
		//d.css("font-size","12px");
		
                if (leftEnd) {
                    d.css("-moz-border-radius-bottomleft", "3px");
                    d.css("-moz-border-radius-topleft", "3px");
                    d.css("-webkit-border-bottom-left-radius", "3px");
                    d.css("-webkit-border-top-left-radius", "3px")
                } else {
                    var triangle = $("<span/>");
                    triangle.css("float", "left");
                    triangle.addClass("ui-icon ui-icon-circle-triangle-w");
                    d.append(triangle)
                }
                
                var mesg = $("<span/>");
                mesg.css("float", "left");
                mesg.html(displayMessage);
                d.append(mesg);
                
                var buttonSpan = $("<span id='buttonSpan' style='visibility:hidden;'/>");
                buttonSpan.html(agi.getButtonValue());
                d.append(buttonSpan);
                
                
                if (rightEnd) {
                    d.css("-moz-border-radius-topright", "3px");
                    d.css("-moz-border-radius-bottomright", "3px");
                    d.css("-webkit-border-top-right-radius", "3px");
                    d.css("-webkit-border-bottom-right-radius", "3px")
                } else {
                    var triangle = $("<span/>");
                    triangle.css("float", "right");
                    triangle.addClass("ui-icon ui-icon-circle-triangle-e");
                    d.append(triangle)
                } if (this.clickEvent_agendaCell != null) {
                    d.bind("click", {
                        agendaId: agi.getAgendaId(),
                        callBack: this.clickEvent_agendaCell
                    }, this.clickAgendaFromCalendarHandler)
                }
                if (this.mouseOverEvent_agendaCell != null) {
                    d.bind("mouseover", {
                        agendaId: agi.getAgendaId(),
                        callBack: this.mouseOverEvent_agendaCell
                    }, this.clickAgendaFromCalendarHandler)
                }
                d.hover(function () {
                    $(this).css("cursor", "pointer")
                }, function () {
                    $(this).css("cursor", "auto")
                });
                if (this.callBack_agendaTooltip) {
                    this.callBack_agendaTooltip(d, Calendar.buildUserAgendaObject(agi))
                }
                this.addAgendaDivToDays(startDayObject, endDayObject, d, agi.getAgendaId());
                startDayObject.appendHtml(d)
            } else {
                this.addMoreDivToDays(startDayObject, endDayObject, moreDivHeight)
            }
        };
        this.clickAgendaFromCalendarHandler = function (eventObj) {
            eventObj.stopPropagation();
            var callBack = eventObj.data.callBack;
            if (callBack != null) {
                callBack(eventObj)
            }
        };
        this.mouseOverAgendaFromCalendarHandler = function (eventObj) {
            var callBack = eventObj.data.callBack;
            if (callBack != null) {
                callBack(eventObj)
            }
        };
        this.clickAgendaFromCalendarMoreModalDialogHandler = function (eventObj) {
            var modalDialog = eventObj.data.dialog;
            if (modalDialog != null) {
                modalDialog.dialog("close")
            }
            var callBack = eventObj.data.callBack;
            if (callBack != null) {
                callBack(eventObj)
            }
            eventObj.stopPropagation()
        };
        this.agendaDropHandler = function (event, ui) {
            var calObj = event.data.cal;
            if (calObj == null) {
                alert("Drop Error: Calendar object is null.")
            }
            //var agendaDiv = ui.draggable;
            var agendaId = parseInt(agendaDiv.data("agendaId"));
            if (agendaId == null) {
                alert("Drop Error: Agenda id is null.")
            }
            var agendaItemObj = calObj.getAgendaItemById(agendaId);
            if (agendaItemObj == null) {
                alert("Drop Error: Agenda item object is null.")
            }
            var toStartDate = $(this).data("dayDate");
            agendaDiv.fadeOut(function () {
                //agendaDiv.draggable("destroy");
                agendaDiv == null;
                calObj.deleteAgendaItemById(agendaId);
                var fromStartDate = agendaItemObj.getStartDate();
                var fromEndDate = agendaItemObj.getEndDate();
                var daysDiffDirection = DateUtil.daysDifferenceDirection(fromStartDate, toStartDate);
                var newStartDt = DateUtil.addDays(fromStartDate, daysDiffDirection);
                var newEndDt = DateUtil.addDays(fromEndDate, daysDiffDirection);
                agendaItemObj.setStartDate(newStartDt);
                agendaItemObj.setEndDate(newEndDt);
                calObj.addAgendaItem(agendaItemObj);
                event.data.agendaId = agendaId;
                event.data.calDayDate = toStartDate;
                if (calObj.dropEvent_agendaCell != null) {
                    calObj.dropEvent_agendaCell(event)
                }
            });
            event.stopPropagation()
        };
        this.addMoreDivToDays = function (startDayObj, endDayObj, moreDivHeight) {
            if (startDayObj == null || endDayObj == null || moreDivHeight == null) {
                return
            }
            var startDt = startDayObj.getDate();
            var endDt = endDayObj.getDate();
            var nextDt = DateUtil.getNextDay(startDt);
            var d = $("<div/>");
            d.addClass("JFrontierCal-Agenda-More-Link");
            d.css("position", "absolute");
            var items = this.getAgendaItemsForDay(startDt);
            d.html("+ more (" + items.length + ")");
            d.bind("click", {
                cal: this,
                calDayDate: startDt,
                agendaItems: items
            }, function (eventObj) {
                eventObj.stopPropagation();
                Calendar.showMoreAgendaModal(eventObj.data.cal, eventObj.data.calDayDate, eventObj.data.agendaItems)
            });
            d.hover(function () {
                $(this).css("cursor", "pointer")
            }, function () {
                $(this).css("cursor", "auto")
            });
            var startY = (startDayObj.getY() + startDayObj.getHeight()) - moreDivHeight - 1;
            var startX = startDayObj.getX();
            var width = startDayObj.getWidth();
            d.css("top", startY + "px");
            d.css("left", startX + "px");
            d.css("width", width + "px");
            d.css("height", moreDivHeight + "px");
            startDayObj.addMoreDiv(d);
            while (DateUtil.daysDifferenceDirection(nextDt, endDt) >= 0) {
                var nextDatObj = this.getCalendarDayObjByDate(nextDt);
                startDt = nextDatObj.getDate();
                d = $("<div/>");
                d.addClass("JFrontierCal-Agenda-More-Link");
                d.css("position", "absolute");
                items = this.getAgendaItemsForDay(startDt);
                d.html("+ more (" + items.length + ")");
                d.bind("click", {
                    cal: this,
                    calDayDate: startDt,
                    agendaItems: items
                }, function (eventObj) {
                    eventObj.stopPropagation();
                    Calendar.showMoreAgendaModal(eventObj.data.cal, eventObj.data.calDayDate, eventObj.data.agendaItems)
                });
                d.hover(function () {
                    $(this).css("cursor", "pointer")
                }, function () {
                    $(this).css("cursor", "auto")
                });
                startY = (nextDatObj.getY() + nextDatObj.getHeight()) - moreDivHeight - 1;
                startX = nextDatObj.getX();
                width = nextDatObj.getWidth();
                d.css("top", startY + "px");
                d.css("left", startX + "px");
                d.css("width", width + "px");
                d.css("height", moreDivHeight + "px");
                nextDatObj.addMoreDiv(d);
                nextDt = DateUtil.getNextDay(nextDt)
            }
        };
        this.addAgendaDivToDays = function (startDayObj, endDayObj, agendaDiv, agendaId) {
            if (startDayObj == null || endDayObj == null || agendaDiv == null || agendaId == null) {
                return
            }
            startDayObj.addAgendaDivElement(agendaId, agendaDiv);
            var startDt = startDayObj.getDate();
            var endDt = endDayObj.getDate();
            var nextDt = DateUtil.getNextDay(startDt);
            while (DateUtil.daysDifferenceDirection(nextDt, endDt) >= 0) {
                var nextDatObj = this.getCalendarDayObjByDate(nextDt);
                nextDatObj.addAgendaDivElement(agendaId, agendaDiv);
                nextDt = DateUtil.getNextDay(nextDt)
            }
        };
        this.getNextAgendaYPosition = function (startDayObj, endDayObj, agendaDivHeight, moreDivHeight) {
            if (startDayObj == null || endDayObj == null || agendaDivHeight == null || moreDivHeight == null) {
                return -1
            }
            var maxY = 0;
            var nextY = startDayObj.getY();
            maxY = nextY;
            var nextDatObj = null;
            var found = false;
            var nextYArray = null;
            var startDt;
            var endDt;
            var nextDt;
            var itrIndex = 1;
            var maxIterations = 100;
            while (!found) {
                nextYArray = new Array();
                nextY = startDayObj.getNextAgendaYstartY(nextY, agendaDivHeight, moreDivHeight);
                if (nextY > maxY) {
                    maxY = nextY
                }
                nextYArray.push(nextY);
                startDt = startDayObj.getDate();
                endDt = endDayObj.getDate();
                nextDt = DateUtil.getNextDay(startDt);
                while (DateUtil.daysDifferenceDirection(nextDt, endDt) >= 0) {
                    nextDatObj = this.getCalendarDayObjByDate(nextDt);
                    nextY = nextDatObj.getNextAgendaYstartY(nextY, agendaDivHeight, moreDivHeight);
                    if (nextY > maxY) {
                        maxY = nextY
                    }
                    nextYArray.push(nextY);
                    nextDt = DateUtil.getNextDay(nextDt)
                }
                nextY = nextYArray[0];
                if (nextY < 0) {
                    return -1
                } else {
                    if (nextYArray.length == 1) {
                        return nextY
                    }
                }
                var allEqual = true;
                for (var i = 1; i < nextYArray.length; i++) {
                    if (nextYArray[i] < 0) {
                        return -1
                    } else {
                        if (Math.abs(nextY - nextYArray[i]) > 1) {
                            allEqual = false
                        }
                    }
                }
                if (allEqual) {
                    return nextY
                }
                nextY = maxY;
                itrIndex += 1
            }
            return nextY
        };
        this.getCalendarDayObjByDate = function (date) {
            if (date == null || this.dayHash == null) {
                return null
            }
            var key = (date.getFullYear() + "") + (date.getMonth() + "") + (date.getDate() + "");
            return this.dayHash.get(key)
        };
        this.setDisplayDate = function (date) {
            this.displayDate = date;
            this.do_init();
            this.resize()
        };
        this.getDisplayDate = function () {
            var dt = new Date(this.getCurrentYear(), this.getCurrentMonth(), this.getCurrentDay(), 0, 0, 0, 0);
            return dt
        };
        this.nextMonth = function () {
            var dt = new Date(0, 0, 1, 0, 0, 0, 0);
            if (this.displayDate.getMonth() == 11) {
                dt.setFullYear(this.displayDate.getFullYear() + 1);
                dt.setMonth(0)
            } else {
                dt.setFullYear(this.displayDate.getFullYear());
                dt.setMonth(this.displayDate.getMonth() + 1)
            }
            this.setDisplayDate(dt)
        };
        this.previousMonth = function () {
            var dt = new Date(0, 0, 1, 0, 0, 0, 0);
            if (this.displayDate.getMonth() == 0) {
                dt.setFullYear(this.displayDate.getFullYear() - 1);
                dt.setMonth(11)
            } else {
                dt.setFullYear(this.displayDate.getFullYear());
                dt.setMonth(this.displayDate.getMonth() - 1)
            }
            this.setDisplayDate(dt)
        };
        this.buildCalendarHeader = function () {
            var jqyHeaderObj = $("<div/>");
            jqyHeaderObj.css("width", this.getWidth() + "px");
            var calHeaderObj = new CalendarHeader(jqyHeaderObj);
            return calHeaderObj
        };
        this.buildCalendarWeek = function () {
            var weekCell = $("<div/>");
            weekCell.css("width", this.getWidth() + "px");
            var calWeek = new CalendarWeek(weekCell);
            return calWeek
        };
        this.buildCalendarWeekHeader = function () {
            var weekHeaderCell = $("<div/>");
            weekHeaderCell.css("width", this.getWidth() + "px");
            var calWeekHeader = new CalendarWeekHeader(weekHeaderCell);
            return calWeekHeader
        };
        this.buildCalendarHeaderCell = function () {
            var headCell = $("<div/>");
            headCell.addClass("JFrontierCal-Header-Cell");
            var calHeadCell = new CalendarHeaderCell(headCell);
            return calHeadCell
        };
        this.buildCalendarWeekHeaderCell = function () {
            var weekHeaderCell = $("<div/>");   
            weekHeaderCell.addClass("JFrontierCal-Week-Header-Cell");
            var calWeekHeadCell = new CalendarWeekHeaderCell(weekHeaderCell);
            return calWeekHeadCell
        };
        this.buildCalendarDayCell = function () {
            var dayCell = $("<div/>");
            dayCell.addClass("JFrontierCal-Day-Cell");
            var calDay = new CalendarDayCell(dayCell);
            countingDaysInDisplayingCalender++;
            return calDay
        };
        this.getCurrentYear = function () {
            return parseInt(this.displayDate.getFullYear())
        };
        this.getCurrentMonth = function () {
            return parseInt(this.displayDate.getMonth())
        };
        this.getCurrentDay = function () {
            return parseInt(this.displayDate.getDate())
        };
        this.getNextMonth = function () {
            var dt = new Date(0, 0, 1, 0, 0, 0, 0);
            if (this.getCurrentMonth() == 11) {
                dt.setFullYear(this.getCurrentYear() + 1);
                dt.setMonth(0)
            } else {
                dt.setFullYear(this.getCurrentYear());
                dt.setMonth(this.getCurrentMonth() + 1)
            }
            return dt
        };
        this.getPreviousMonth = function () {
            var dt = new Date(0, 0, 1, 0, 0, 0, 0);
            if (this.getCurrentMonth() == 0) {
                dt.setFullYear(this.getCurrentYear() - 1);
                dt.setMonth(11)
            } else {
                dt.setFullYear(this.getCurrentYear());
                dt.setMonth(this.getCurrentMonth() - 1)
            }
            return dt
        };
        this.getDaysCurrentMonth = function () {
            return parseInt(DateUtil.getDaysInMonth(this.displayDate))
        };
        this.getDaysPreviousMonth = function () {
            var prevDt = this.getPreviousMonth();
            return parseInt(DateUtil.getDaysInMonth(prevDt))
        };
        this.getDaysNextMonth = function () {
            var nextDt = this.getNextMonth();
            return parseInt(DateUtil.getDaysInMonth(nextDt))
        };
        this.setHtml = function (htmlData) {
            this.jqyObj.html(htmlData)
        };
        this.getHtml = function () {
            return this.jqyObj.html()
        };
        this.setCss = function (attr, value) {
            this.jqyObj.css(attr, value)
        };
        this.getCss = function (attr) {
            return this.jqyObj.css(attr)
        };
        this.setAttr = function (id, value) {
            this.jqyObj.attr(id, value)
        };
        this.getAttr = function (id) {
            return this.jqyObj.attr(id)
        };
        this.clear = function (clearAgenda) {
            this.jqyObj.html("");
            this.calHeaderObj = null;
            this.weeks = new Array();
            this.weekHeaders = new Array();
            this.dayHash = new Hashtable();
            if (clearAgenda) {
                this.agendaItems = new Hashtable()
            }
        };
        this.getHeight = function () {
            return this.jqyObj.height()
        };
        this.getWidth = function () {
            return this.jqyObj.width()
        };
        this.setWidth = function (w) {
            this.jqyObj.width(w);
            this.resize()
        };
        this.getInnerWidth = function () {
            return this.jqyObj.innerWidth()
        };
        this.addHeader = function (calHeader) {
            if (this.calHeaderObj != null) {
                var headerDiv = this.jqyObj.children("div").first();
                headerDiv.remove();
                this.calHeaderObj = calHeader;
                this.jqyObj.prepend(calHeader.jqyObj)
            } else {
                this.calHeaderObj = calHeader;
                this.jqyObj.prepend(calHeader.jqyObj)
            }
        };
        this.addWeek = function (calWeek) {
            this.weeks.push(calWeek);
            this.jqyObj.append(calWeek.jqyObj)
        };
        this.addWeekHeader = function (calWeekHeader) {
            this.weekHeaders.push(calWeekHeader);
            this.jqyObj.append(calWeekHeader.jqyObj)
        };
        this.getWeeks = function () {
            return this.weeks
        };
        this.getWeekHeaders = function () {
            return this.weekHeaders
        };
        this.getNumberWeeks = function () {
            return this.weeks.length
        };
        this.addAgendaItem = function (item) {
            if (item.getAgendaId() == 0) {
                item.setAgendaId(this.agendaId);
                this.agendaId++
            }
            this.agendaItems.put(item.getAgendaId(), item);
            this.renderSingleAgendaItem(item)
            /**
             * item.getStartDate() and item.getEndDate()
             * */
           var startmilliseconds  = Date.parse(item.getStartDate());
            var endmilliseconds  = Date.parse(item.getEndDate());
          // alert(item.getSlotType())
            if(item.getButtonValue()!=undefined)
            {
            	if(item.getSlotType()!="gen")
            	{
		            if(item.getButtonValue()=="holiday")
		            {
		            	if(xmlhttp) { 
		                    xmlhttp.open("POST","scheduleholiday.action?startDate="+startmilliseconds+"&endDate="+endmilliseconds+"&reason="+item.getTitle(),true); //used as url for matching in the web.xml
		              	  
		              	    xmlhttp.send(null); //Posting txtname to Servlet
		              	  }
		              	  else alert("the xmlhttp object not found");
		                
		            }
		            else
		            {
		            if(xmlhttp) { 
		                xmlhttp.open("POST","scheduleappointment.action?startDate="+startmilliseconds+"&endDate="+endmilliseconds+"&slotType="+item.getSlotType(),true); //used as url for matching in the web.xml
		          	  
		          	    xmlhttp.send(null); //Posting txtname to Servlet
		          	  }
		          	  else alert("the xmlhttp object not found");
		            }
            	}
            }
            /*else // in this else we are sending default values for time slots and holidays to DB
            {
            	alert("in else")
            	if(xmlhttp) { 
                    xmlhttp.open("POST","scheduleappointment.action?startDate="+startmilliseconds+"&endDate="+endmilliseconds+"&slotType="+item.getSlotType(),true); //used as url for matching in the web.xml
              	  
              	    xmlhttp.send(null); //Posting txtname to Servlet
              	  }
              	  else alert("the xmlhttp object not found");
            	
            	
               
            }*/
            
        };
        this.getAgendaItemsCount = function () {
            return this.agendaItems.size()
        };
        this.getAgendaItems = function () {
            return this.agendaItems
        };
        this.getAgendaItemById = function (id) {
            return this.agendaItems.get(id)
        };
        this.getAgendaItemByDataAttr = function (attrName, attrValue) {
            if (this.agendaItems != null && this.agendaItems.size() > 0) {
                var agi = null;
                var val = null;
                var pattern = null;
                var itemsToReturn = new Array();
                var itemArray = this.agendaItems.values();
                for (var itemIndex = 0; itemIndex < itemArray.length; itemIndex++) {
                    agi = itemArray[itemIndex];
                    val = agi.getAgendaData(attrName);
                    if (val != null) {
                        if (val == attrValue) {
                            itemsToReturn.push(agi)
                        }
                    }
                }
                return itemsToReturn
            }
            return null
        };
        this.deleteAgendaItemById = function (id) {
        	var agi = null;
        	var itemArray = this.agendaItems;
        	agi = itemArray;
            if (this.agendaItems != null && this.agendaItems.size() > 0) {
            	//agi.setButtonValue(" ");
                this.agendaItems.remove(id);
                this.clearDayCellData();
                this.renderAgendaItems()
                              
            }
        };
        this.deleteAgendaItemByDataAttr = function (attrName, attrValue) {
            if (this.agendaItems != null && this.agendaItems.size() > 0) {
                var agi = null;
                var val = null;
                var pattern = null;
                var itemsToDelete = new Array();
                var itemArray = this.agendaItems.values();
                for (var itemIndex = 0; itemIndex < itemArray.length; itemIndex++) {
                    agi = itemArray[itemIndex];
                    val = agi.getAgendaData(attrName);
                    if (val != null) {
                        if (val == attrValue) {
                            itemsToDelete.push(agi)
                        }
                    }
                }
                if (itemsToDelete.length > 0) {
                    for (var i = 0; i < itemsToDelete.length; i++) {
                        this.deleteAgendaItemById(itemsToDelete[i].getAgendaId())
                    }
                    this.clearDayCellData();
                    this.renderAgendaItems()
                }
            }
        };
        this.deleteAllAgendaItems = function () {
            if (this.agendaItems != null && this.agendaItems.size() > 0) {
                this.agendaItems = new Hashtable();
                this.clearDayCellData();
                this.renderAgendaItems()
            }
        };
        this.appendJqyObj = function (obj) {
            this.jqyObj.append(obj)
        };
        this.shoutOut = function () {
            alert("You have a calendar object!")
        };
        this.clearDayCellData = function () {
            var weekCount = 0;
            var weekCellsArray = this.getWeeks();
            if (weekCellsArray != null && weekCellsArray.length > 0) {
                weekCount = weekCellsArray.length;
                for (var weekIndex = 0; weekIndex < weekCellsArray.length; weekIndex++) {
                    var dayCellsArray = weekCellsArray[weekIndex].getDays();
                    if (dayCellsArray != null && dayCellsArray.length > 0) {
                        for (var dayIndex = 0; dayIndex < dayCellsArray.length; dayIndex++) {
                            dayCellsArray[dayIndex].clearAgendaDivElements()
                        }
                    }
                }
            }
        };
        this.setRenderRatio = function (ratio) {
            if (ratio != null && ratio <= 1 && ratio > 0) {
                this.aspectRatio = ratio;
                this.resize()
            }
        };
        this.resize = function () {
            var firstDayCell = null;
            var firstWeekHeaderCell = null;
            var lastDayCell = null;
            var lastHeaderCell = null;
            var lastWeekHeaderCell = null;
            var calWidth = this.getWidth();
            var weekArray = this.getWeeks();
            if (weekArray != null && weekArray.length > 0) {
                var dayArray = weekArray[0].getDays();
                if (dayArray != null && dayArray.length > 0) {
                    firstDayCell = dayArray[0]
                }
            }
            var weekHeadArray = this.getWeekHeaders();
            if (weekHeadArray != null && weekHeadArray.length > 0) {
                var weekHeadCellArray = weekHeadArray[0].getHeaderCells();
                if (weekHeadCellArray != null && weekHeadCellArray.length > 0) {
                    firstWeekHeaderCell = weekHeadCellArray[0]
                }
            }
            var headerCellHeight = firstWeekHeaderCell.jqyObj.outerHeight(true);
            var borderSize = (firstDayCell.jqyObj.outerWidth(true) - firstDayCell.jqyObj.width()) * Calendar.dayNames.length;
            var cellWidth = Math.floor(calWidth / Calendar.dayNames.length) - (firstDayCell.jqyObj.outerWidth(true) - firstDayCell.jqyObj.width());
            var cellWidthLast = cellWidth + (calWidth - (cellWidth * Calendar.dayNames.length)) - (firstDayCell.jqyObj.outerWidth(true) - firstDayCell.jqyObj.width()) - borderSize;
            var cellHeight = parseInt((cellWidth - headerCellHeight) * this.aspectRatio);
            var totalHeaderWidth = ((cellWidth * 6) + cellWidthLast) + ((firstDayCell.jqyObj.outerWidth(true) - firstDayCell.jqyObj.width()) * Calendar.dayNames.length) + 1;
            this.calHeaderObj.setWidth(totalHeaderWidth);
            var headerCellsArray = this.calHeaderObj.getHeaderCells();
            if (headerCellsArray != null && headerCellsArray.length > 0) {
                for (var headIndex = 0; headIndex < headerCellsArray.length; headIndex++) {
                    if (headIndex == (headerCellsArray.length - 1)) {
                        headerCellsArray[headIndex].setCss("width", cellWidthLast + "px")
                    } else {
                        headerCellsArray[headIndex].setCss("width", cellWidth + "px");
                        lastHeaderCell = headerCellsArray[headIndex]
                    }
                }
            }
            var weekCount = 0;
            var weekCellsArray = this.getWeeks();
            var weekHeadersArray = this.getWeekHeaders();
            if (weekCellsArray != null && weekCellsArray.length > 0) {
                weekCount = weekCellsArray.length;
                for (var weekIndex = 0; weekIndex < weekCellsArray.length; weekIndex++) {
                    weekCellsArray[weekIndex].setWidth(totalHeaderWidth);
                    weekHeadersArray[weekIndex].setWidth(totalHeaderWidth);
                    var dayCellsArray = weekCellsArray[weekIndex].getDays();
                    var weekHeaderCellsArray = weekHeadersArray[weekIndex].getHeaderCells();
                    if (dayCellsArray != null && dayCellsArray.length > 0) {
                        for (var dayIndex = 0; dayIndex < dayCellsArray.length; dayIndex++) {
                            if (dayIndex == (dayCellsArray.length - 1)) {
                                dayCellsArray[dayIndex].setCss("width", cellWidthLast + "px");
                                weekHeaderCellsArray[dayIndex].setCss("width", cellWidthLast + "px");
                                dayCellsArray[dayIndex].setCss("height", cellHeight + "px");
                                dayCellsArray[dayIndex].clearAgendaDivElements()
                            } else {
                                dayCellsArray[dayIndex].setCss("width", cellWidth + "px");
                                weekHeaderCellsArray[dayIndex].setCss("width", cellWidth + "px");
                                dayCellsArray[dayIndex].setCss("height", cellHeight + "px");
                                dayCellsArray[dayIndex].clearAgendaDivElements();
                                lastDayCell = dayCellsArray[dayIndex];
                                lastWeekHeaderCell = weekHeaderCellsArray[dayIndex]
                            }
                        }
                    }
                }
            }
            var headerCellTotalHeight = parseInt(lastHeaderCell.jqyObj.outerHeight(true));
            var dayCellTotalHeight = parseInt(lastDayCell.jqyObj.outerHeight(true) * weekCount);
            var weekHeaderCellTotalHeight = parseInt(lastWeekHeaderCell.jqyObj.outerHeight(true) * weekCount);
            var totalCalendarHeight = headerCellTotalHeight + dayCellTotalHeight + weekHeaderCellTotalHeight;
            this.setCss("height", totalCalendarHeight + "px");
            this.renderAgendaItems()
        };
        this.getWeekIndex = function (dayName) {
            if (dayName.toUpperCase() == "SUN" || dayName.toUpperCase() == "SUNDAY") {
                return 0
            } else {
                if (dayName.toUpperCase() == "MON" || dayName.toUpperCase() == "MONDAY") {
                    return 1
                } else {
                    if (dayName.toUpperCase() == "TUE" || dayName.toUpperCase() == "TUESDAY") {
                        return 2
                    } else {
                        if (dayName.toUpperCase() == "WED" || dayName.toUpperCase() == "WEDNESDAY") {
                            return 3
                        } else {
                            if (dayName.toUpperCase() == "THU" || dayName.toUpperCase() == "THURSDAY") {
                                return 4
                            } else {
                                if (dayName.toUpperCase() == "FRI" || dayName.toUpperCase() == "FRIDAY") {
                                    return 5
                                } else {
                                    if (dayName.toUpperCase() == "SAT" || dayName.toUpperCase() == "SATURDAY") {
                                        return 6
                                    } else {
                                        return -1
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Calendar.dayNames = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
    Calendar.sortAgendaItemsByStartDate = function (agi1, agi2) {
        var start1 = agi1.getStartDate();
        var start2 = agi2.getStartDate();
        //alert(agi1.getStartDate()+"---------"+agi2.getStartDate());
        var s = DateUtil.secondsDifferenceDirection(start1, start2);
        if (s > 0) {
            return -1
        } else {
            if (s < 0) {
                return 1
            } else {
                return 0
            }
        }
    };
    Calendar.buildUserAgendaObject = function (agendaObject) {
        if (agendaObject == null) {
            return null
        }
        var dataObj = null;
        var agendaItemHashData = agendaObject.getAgendaDataHash();
        if (agendaItemHashData != null && agendaItemHashData.size() > 0) {
            dataObj = new Object();
            var key = null;
            var val = null;
            var keyArray = agendaItemHashData.keys();
            for (var keyIndex = 0; keyIndex < keyArray.length; keyIndex++) {
                key = keyArray[keyIndex];
                val = agendaItemHashData.get(key);
                dataObj[key] = val
            }
        }
        var displayPropObj = new Object();
        displayPropObj.backgroundColor = agendaObject.getBackgroundColor();
        displayPropObj.foregroundColor = agendaObject.getForegroundColor();
        var agendaData = {
            agendaId: agendaObject.getAgendaId(),
            title: agendaObject.getTitle(),
            buttonType: agendaObject.getButtonValue(),
            slotType:agendaObject.getSlotType(),
            startDate: agendaObject.getStartDate(),
            endDate: agendaObject.getEndDate(),
            allDay: ((agendaObject.isAllDay()) ? true : false),
            data: dataObj,
            displayProp: displayPropObj
        };
        return agendaData
    };
    Calendar.showMoreAgendaModal = function (cal, date, agendaItems) {
        if (cal == null || date == null || agendaItems == null) {
            alert("Can't open dialog. One ore more of Calendar/Date/agendaItems parameters are null.")
        }
        var modalId = cal.jqyObj.attr("id") + "-more-agenda-modal";
        var haveModel = (($("#" + modalId).length == 0) ? false : true);
        if (haveModel) {
            $("#" + modalId).dialog("destroy");
            $("#" + modalId).remove()
        }
        var modal = $("<div/>");
        modal.attr("id", modalId);
        modal.attr("title", "Agenda Items for " + date.toDateString());
        modal.dialog({
            autoOpen: false,
            height: 350,
            width: 400,
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close")
                }
            },
            open: function (event, ui) {},
            close: function () {}
        });
        var agi = null;
        var agendaDiv = null;
        modal.append("<br>");
        agendaItems.sort(Calendar.sortAgendaItemsByStartDate);
        var isBegining = false;
        var isEnd = false;
        var agendaStartDt = null;
        var agendaEndDt = null;
        for (var i = 0; i < agendaItems.length; i++) {
            agi = agendaItems[i];
            agendaStartDt = agi.getStartDate();
            agendaEndDt = agi.getEndDate();
            agendaDiv = $("<div/>");
            agendaDiv.addClass("JFrontierCal-Modal-Agenda-Item");
            if (agi.getBackgroundColor() != null) {
                agendaDiv.css("background-color", agi.getBackgroundColor())
            }
            if (agi.getForegroundColor() != null) {
                agendaDiv.css("color", agi.getForegroundColor())
            }
            agendaDiv.css("width", "100%");
            agendaDiv.css("height", "30px");
            agendaDiv.css("margin-bottom", "2px");
            isBegining = ((DateUtil.daysDifferenceDirection(agendaStartDt, date) == 0) ? true : false);
            isEnd = ((DateUtil.daysDifferenceDirection(agendaEndDt, date) == 0) ? true : false);
            if (isBegining) {
                agendaDiv.css("-moz-border-radius-bottomleft", "3px");
                agendaDiv.css("-moz-border-radius-topleft", "3px");
                agendaDiv.css("-webkit-border-bottom-left-radius", "3px");
                agendaDiv.css("-webkit-border-top-left-radius", "3px")
            } else {
                var triangle = $("<span/>");
                triangle.css("float", "left");
                triangle.addClass("ui-icon ui-icon-circle-triangle-w");
                agendaDiv.append(triangle)
            } if (isEnd) {
                agendaDiv.css("-moz-border-radius-topright", "3px");
                agendaDiv.css("-moz-border-radius-bottomright", "3px");
                agendaDiv.css("-webkit-border-top-right-radius", "3px");
                agendaDiv.css("-webkit-border-bottom-right-radius", "3px")
            } else {
                var triangle = $("<span/>");
                triangle.css("float", "right");
                triangle.addClass("ui-icon ui-icon-circle-triangle-e");
                agendaDiv.append(triangle)
            }
            agendaDiv.append(agi.getTitle() + "<br>");
            if (agi.isAllDay()) {
                agendaDiv.append("(All day event)<br>")
            } else {
                agendaDiv.append("From " + DateUtil.getAgendaDisplayTime(agendaStartDt) + " on " + agendaStartDt.toDateString() + " To " + DateUtil.getAgendaDisplayTime(agendaEndDt) + " " + agendaEndDt.toDateString() + "<br>")
            } if (cal.clickEvent_agendaCell != null) {
                agendaDiv.bind("click", {
                    agendaId: agi.getAgendaId(),
                    callBack: cal.clickEvent_agendaCell,
                    dialog: modal
                }, cal.clickAgendaFromCalendarMoreModalDialogHandler)
            }
            agendaDiv.hover(function () {
                $(this).css("cursor", "pointer")
            }, function () {
                $(this).css("cursor", "auto")
            });
            modal.append(agendaDiv)
        }
        modal.dialog("open")
    };
    Calendar.loadICalSource = function (cal, iCalUrl, responseDataType) {
        if (cal == null || iCalUrl == null) {
            return
        }
        $.ajax({
            url: iCalUrl,
            type: "POST",
            data: {
                chromeFix: ""
            },
            dataType: responseDataType,
            success: function (data) {
                if (data == null || data == "") {
                    alert("iCal load error: Returned data was null or empty string.\n\nSource, " + iCalUrl);
                    return
                }
                icalParser.clear();
                icalParser.parseIcal(data);
                if (icalParser.ical.events.length > 0) {
                    var event;
                    var summary;
                    var startYear;
                    var startMonth;
                    var startDay;
                    var startHour;
                    var startMin;
                    var startSec;
                    var endYear;
                    var endMonth;
                    var endDay;
                    var endHour;
                    var endMin;
                    var endSec;
                    var startDt;
                    var endDt;
                    for (var i = 0; i < icalParser.ical.events.length; i++) {
                        event = icalParser.ical.events[i];
                        summary = ((event.summary != null) ? event.summary.value : "");
                        startYear = ((event.dtstart != null) ? event.dtstart.value : "").substring(0, 4);
                        startMonth = ((event.dtstart != null) ? event.dtstart.value : "").substring(4, 6).replace(/^[0]+/g, "");
                        startDay = ((event.dtstart != null) ? event.dtstart.value : "").substring(6, 8).replace(/^[0]+/g, "");
                        startHour = ((event.dtstart != null) ? event.dtstart.value : "").substring(9, 11).replace(/^[0]+/g, "");
                        startMin = ((event.dtstart != null) ? event.dtstart.value : "").substring(11, 13).replace(/^[0]+/g, "");
                        startSec = ((event.dtstart != null) ? event.dtstart.value : "").substring(13, 15).replace(/^[0]+/g, "");
                        if (startHour == "") {
                            startHour = "0"
                        }
                        if (startMin == "") {
                            startMin = "0"
                        }
                        if (startSec == "") {
                            startSec = "0"
                        }
                        endYear = ((event.dtend != null) ? event.dtend.value : "").substring(0, 4);
                        endMonth = ((event.dtend != null) ? event.dtend.value : "").substring(4, 6).replace(/^[0]+/g, "");
                        endDay = ((event.dtend != null) ? event.dtend.value : "").substring(6, 8).replace(/^[0]+/g, "");
                        endHour = ((event.dtend != null) ? event.dtend.value : "").substring(9, 11).replace(/^[0]+/g, "");
                        endMin = ((event.dtend != null) ? event.dtend.value : "").substring(11, 13).replace(/^[0]+/g, "");
                        endSec = ((event.dtend != null) ? event.dtend.value : "").substring(13, 15).replace(/^[0]+/g, "");
                        if (endHour == "") {
                            endHour = "0"
                        }
                        if (endMin == "") {
                            endMin = "0"
                        }
                        if (endSec == "") {
                            endSec = "0"
                        }
                        startDt = new Date(parseInt(startYear), parseInt(startMonth) - 1, parseInt(startDay), parseInt(startHour) - 1, parseInt(startMin), parseInt(startSec), 0);
                        endDt = new Date(parseInt(endYear), parseInt(endMonth) - 1, parseInt(endDay), parseInt(endHour) - 1, parseInt(endMin), parseInt(endSec), 0);
                        if (DateUtil.secondsDifferenceDirection(startDt, endDt) >= 0) {
                            var hashData = new Hashtable();
                            hashData.put("UID", ((event.uid != null) ? event.uid.value : ""));
                            hashData.put("SUMMARY", ((event.summary != null) ? event.summary.value : ""));
                            hashData.put("DTSTART", ((event.dtstart != null) ? event.dtstart.value : ""));
                            hashData.put("DTEND", ((event.dtend != null) ? event.dtend.value : ""));
                            hashData.put("CLASS", ((event.classification != null) ? event.classification.value : ""));
                            hashData.put("CREATED", ((event.created != null) ? event.created.value : ""));
                            hashData.put("DESCRIPTION", ((event.description != null) ? event.description.value : ""));
                            hashData.put("GEO", ((event.geo != null) ? event.geo.value : ""));
                            hashData.put("LAST-MODIFIED", ((event.lastmod != null) ? event.lastmod.value : ""));
                            hashData.put("LOCATION", ((event.location != null) ? event.location.value : ""));
                            hashData.put("ORGANIZER", ((event.organizer != null) ? event.organizer.value : ""));
                            hashData.put("PRIORITY", ((event.priority != null) ? event.priority.value : ""));
                            hashData.put("DTSTAMP", ((event.dtstamp != null) ? event.dtstamp.value : ""));
                            hashData.put("SEQUENCE", ((event.seq != null) ? event.seq.value : ""));
                            hashData.put("STATUS", ((event.status != null) ? event.status.value : ""));
                            hashData.put("TRANSP", ((event.transp != null) ? event.transp.value : ""));
                            hashData.put("URL", ((event.url != null) ? event.url.value : ""));
                            hashData.put("RECURRENCE-ID", ((event.recurid != null) ? event.recurid.value : ""));
                            hashData.put("DURATION", ((event.duration != null) ? event.duration.value : ""));
                            hashData.put("ATTACH", ((event.attach != null) ? event.attach.value : ""));
                            hashData.put("ATTENDEE", ((event.attendee != null) ? event.attendee.value : ""));
                            hashData.put("CATEGORIES", ((event.categories != null) ? event.categories.value : ""));
                            hashData.put("COMMENT", ((event.comment != null) ? event.comment.value : ""));
                            hashData.put("CONTACT", ((event.contact != null) ? event.contact.value : ""));
                            hashData.put("EXDATE", ((event.exdate != null) ? event.exdate.value : ""));
                            hashData.put("EXRULE", ((event.exrule != null) ? event.exrule.value : ""));
                            hashData.put("REQUEST-STATUS", ((event.rstatus != null) ? event.rstatus.value : ""));
                            hashData.put("RELATED", ((event.related != null) ? event.related.value : ""));
                            hashData.put("RESOURCES", ((event.resources != null) ? event.resources.value : ""));
                            hashData.put("RDATE", ((event.rdate != null) ? event.rdate.value : ""));
                            hashData.put("RRULE", ((event.rrule != null) ? event.rrule.value : ""));
                            hashData.put("X-", ((event.xprop != null) ? event.xprop.value : ""));
                            var agi = new CalendarAgendaItem(summary,null, startDt, endDt, false, hashData);
                            cal.addAgendaItem(agi)
                        }
                    }
                }
            },
            error: function (request, status, errorThrown) {
                alert("iCal load error: Failure in requesting " + iCalUrl + ": " + errorThrown)
            }
        })
    };

    function DateUtil() {}
    DateUtil.getDaysInMonth = function (date) {
        return 32 - new Date(date.getFullYear(), date.getMonth(), 32).getDate()
    };
    DateUtil.isDateBetween = function (date1, date2, date3) {
        if (date1 == null || date2 == null || date3 == null) {
            return false
        }
        if (DateUtil.daysDifferenceDirection(date1, date2) <= 0 && DateUtil.daysDifferenceDirection(date1, date3) >= 0) {
            return true
        }
        return false
    };
    DateUtil.daysDifference = function (date1, date2) {
        var ONE_DAY = 1000 * 60 * 60 * 24;
        var dt1 = new Date(date1.getFullYear(), date1.getMonth(), date1.getDate(), 0, 0, 0, 0);
        var dt2 = new Date(date2.getFullYear(), date2.getMonth(), date2.getDate(), 0, 0, 0, 0);
        var date1_ms = dt1.getTime();
        var date2_ms = dt2.getTime();
        var difference_ms = Math.abs(date2_ms - date1_ms);
        var diff_day = difference_ms / ONE_DAY;
        return diff_day
    };
    DateUtil.daysDifferenceDirection = function (date1, date2) {
        var dt1 = new Date(date1.getFullYear(), date1.getMonth(), date1.getDate(), 0, 0, 0, 0);
        var dt2 = new Date(date2.getFullYear(), date2.getMonth(), date2.getDate(), 0, 0, 0, 0);
        return (dt2.getTime() - dt1.getTime()) / (1000 * 60 * 60 * 24)
    };
    DateUtil.secondsDifferenceDirection = function (date1, date2) {
        return Math.round((date2.getTime() - date1.getTime()) / 1000)
    };
    DateUtil.getNextDay = function (date) {
    	//alert(date)
        var dayIndex = date.getDay();
        var dayNum = date.getDate();
        var monthNum = date.getMonth();
        var yearNum = date.getFullYear();
        var daysInMonth = DateUtil.getDaysInMonth(date);
        if (dayNum == daysInMonth) {
            if (yearNum == 11) {
                return new Date(yearNum + 1, monthNum + 1, 1, 0, 0, 0, 0)
            } else {
                return new Date(yearNum, monthNum + 1, 1, 0, 0, 0, 0)
            }
        } else {
            return new Date(yearNum, monthNum, dayNum + 1, 0, 0, 0, 0)
        }
    };
    DateUtil.addDays = function (date, days) {
        return new Date(date.getTime() + (days * 24 * 60 * 60 * 1000))
    };
    DateUtil.getPreviousMonth = function (date) {
        var dt = new Date(0, 0, 1, 0, 0, 0, 0);
        if (dt.getMonth() == 0) {
            dt.setFullYear(date.getFullYear() - 1);
            dt.setMonth(11)
        } else {
            dt.setFullYear(date.getFullYear());
            dt.setMonth(date.getMonth() - 1)
        }
        return dt
    };
    DateUtil.getFirstDayInSameWeek = function (date) {
    	//alert(date);
        var dayIndex = date.getDay();
        var dayNum = date.getDate();
        var monthNum = date.getMonth();
        var yearNum = date.getFullYear();
        var daysInMonth = DateUtil.getDaysInMonth(date);
        if (dayIndex == 0) {
            return new Date(yearNum, monthNum, dayNum, 0, 0, 0, 0)
        }
        var backDayNum = dayNum - dayIndex;
        if (backDayNum < 1) {
            var prevMonthDt = DateUtil.getPreviousMonth(date);
            var daysPrevMonth = DateUtil.getDaysInMonth(prevMonthDt);
            var newDay = daysPrevMonth + backDayNum;
            if (monthNum == 0) {
                return new Date(yearNum - 1, 11, newDay, 0, 0, 0, 0)
            } else {
                return new Date(yearNum, monthNum - 1, newDay, 0, 0, 0, 0)
            }
        } else {
            return new Date(yearNum, monthNum, backDayNum, 0, 0, 0, 0)
        }
    };
    DateUtil.getLastDayInSameWeek = function (date) {
        var dayIndex = date.getDay();
        var dayNum = date.getDate();
        var monthNum = date.getMonth();
        var yearNum = date.getFullYear();
        var daysInMonth = DateUtil.getDaysInMonth(date);
        if (dayIndex == 6) {
            return new Date(yearNum, monthNum, dayNum, 0, 0, 0, 0)
        }
        var daysTillEndWeek = 6 - dayIndex;
        if ((dayNum + daysTillEndWeek) > daysInMonth) {
            var nextSunday = daysTillEndWeek - (daysInMonth - dayNum);
            if (yearNum == 11) {
                return new Date(yearNum + 1, monthNum + 1, nextSunday, 0, 0, 0, 0)
            } else {
                return new Date(yearNum, monthNum + 1, nextSunday, 0, 0, 0, 0)
            }
        } else {
            return new Date(yearNum, monthNum, dayNum + daysTillEndWeek, 0, 0, 0, 0)
        }
    };
    DateUtil.getFirstDayNextWeek = function (date) {
        var dayIndex = date.getDay();
        var dayNum = date.getDate();
        var monthNum = date.getMonth();
        var yearNum = date.getFullYear();
        var daysInMonth = DateUtil.getDaysInMonth(date);
        if (dayIndex == 0) {
            return new Date(yearNum, monthNum, dayNum, 0, 0, 0, 0)
        }
        var daysTillEndWeek = 6 - dayIndex;
        var nextMonday = dayNum + daysTillEndWeek + 1;
        if (nextMonday > daysInMonth) {
            var newDay = daysTillEndWeek - (daysInMonth - dayNum) + 1;
            if (yearNum == 11) {
                return new Date(yearNum + 1, monthNum + 1, newDay, 0, 0, 0, 0)
            } else {
                return new Date(yearNum, monthNum + 1, newDay, 0, 0, 0, 0)
            }
        } else {
            return new Date(yearNum, monthNum, nextMonday, 0, 0, 0, 0)
        }
    };
    DateUtil.getAgendaDisplayTime = function (date) {
        if (date == null) {
            return ""
        }
        var c = ":";
        var h = date.getHours();
        var m = date.getMinutes();
        var ampm = "am";
        if (m == 0) {
            m = "";
            c = ""
        } else {
            if (m < 10) {
                m = "0" + m
            }
        } if (h == 0) {
            h = 12
        } else {
            if (h > 12) {
                h = h - 12;
                ampm = "pm"
            }
        }
        return h + c + m + ampm
    };

    function LogUtil() {}
    LogUtil.log = function (s) {};
    $.fn.jFrontierCal = function (attr, options) {
        var elmId = $(this).attr("id");
        var opts;
        var defaults = {
            foo: "bar",
            date: new Date(),
            dayClickCallback: function (eventObj) {},
            agendaClickCallback: function (eventObj) {
                eventObj.stopPropagation()
            },
            agendaDropCallback: function (eventObj) {},
            agendaMouseoverCallback: function (eventObj) {},
            applyAgendaTooltipCallback: function (agendaDivElement, agendaItem) {},
           // agendaDragStartCallback: function (eventObj, agendaDivElement, agendaItem) {},
            //agendaDragStopCallback: function (eventObj, agendaDivElement, agendaItem) {},
            //dragAndDropEnabled: true
        };
        if ($.isPlainObject(attr)) {
            var options = attr;
            opts = $.extend(defaults, options);
            allOptions[elmId] = opts
        } else {
            opts = $.extend(defaults, options);
            allOptions[elmId] = opts
        }
        return this.each(function () {
            var calElm = $(this);
            if (calElm.data("plugin")) {
                return
            }
            var thisCalOpts = allOptions[elmId];
            var myplugin = new jFrontierCalPlugin(calElm, thisCalOpts.dayClickCallback, thisCalOpts.agendaClickCallback, thisCalOpts.agendaDropCallback,  thisCalOpts.agendaMouseoverCallback, thisCalOpts.applyAgendaTooltipCallback);
            myplugin.init();
            calElm.data("plugin", myplugin)
        })
    };
    var jFrontierCalPlugin = function (calElm, dayClickCallback, agendaClickCallback, agendaDropCallback, agendaMouseoverCallback, applyAgendaTooltipCallback) {
        var obj = this;
        var calId = calElm.attr("id");
        var clickEvent_dayCell = dayClickCallback;
        var clickEvent_agendaCell = agendaClickCallback;
        var dropEvent_agendaCell = agendaDropCallback;
        var mouseOverEvent_agendaCell = agendaMouseoverCallback;
        var callBack_agendaTooltip = applyAgendaTooltipCallback;
        //var dragStart_agendaCell = agendaDragStartCallback;
        //var dragDrop_agendaCell = agendaDragStopCallback;
        this.init = function () {
            var dtNow = new Date();
            var calObj = new Calendar();
            calObj.initialize(calElm, dtNow, clickEvent_dayCell, clickEvent_agendaCell, dropEvent_agendaCell,  mouseOverEvent_agendaCell, callBack_agendaTooltip);
            myCalendars.put(calId, calObj);
            $(window).wresize(this.doResizeAll);
            this.doResizeAll();
            this.doResizeAll();
            return calObj
        };
        this.addAgendaItem = function (calId, title,buttonType,slotType, startDate, endDate, allDay, data, displayProp) {
            if (calId != null && title != null && startDate != null && endDate != null && allDay != null) {
                if (DateUtil.secondsDifferenceDirection(startDate, endDate) < 0) {
                	alert("Sorry, you can't create an event that ends before it starts");
                    return 1;
                }
                calId = stripNumberSign(calId);
                var hashData = new Hashtable();
                if (data != null) {
                    for (var key in data) {
                        hashData.put(key, data[key])
                    }
                }
                var agi = new CalendarAgendaItem(title,buttonType,slotType, startDate, endDate, allDay, hashData);
                if (displayProp != null) {
                    if (displayProp.backgroundColor != null) {
                        agi.setBackgroundColor(displayProp.backgroundColor)
                    }
                    if (displayProp.foregroundColor != null) {
                        agi.setForegroundColor(displayProp.foregroundColor)
                    }
                }
                var calObj = myCalendars.get(calId);
                calObj.addAgendaItem(agi)
            }
            
        };
        this.getAllAgendaItems = function (calId) {
            var itemsToReturn = new Array();
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                var items = calObj.getAgendaItems();
                if (items != null && items.size() > 0) {
                    var agendObj = null;
                    var itemArray = items.values();
                    for (var itemIndex = 0; itemIndex < itemArray.length; itemIndex++) {
                        var agi = itemArray[itemIndex];
                        agendObj = Calendar.buildUserAgendaObject(agi);
                        itemsToReturn.push(agendObj)
                    }
                }
            }
            return itemsToReturn
        };
        this.getAgendaItemById = function (calId, agendaId) {
            if (calId != null && agendaId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                var calAgendaItem = calObj.getAgendaItemById(parseInt(agendaId));
                if (calAgendaItem == null) {
                    return null
                }
                return Calendar.buildUserAgendaObject(calAgendaItem)
            }
        };
        this.getAgendaItemByDataAttr = function (calId, attrName, attrValue) {
            if (calId != null && attrName != null && attrValue != null) {
                var itemsToReturn = new Array();
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                var itemArray = calObj.getAgendaItemByDataAttr(attrName, attrValue);
                if (itemArray != null && itemArray.length > 0) {
                    var agendObj = null;
                    for (var itemIndex = 0; itemIndex < itemArray.length; itemIndex++) {
                        var agi = itemArray[itemIndex];
                        agendObj = Calendar.buildUserAgendaObject(agi);
                        itemsToReturn.push(agendObj)
                    }
                }
                return itemsToReturn
            }
            return null
        };
        this.deleteAgendaItemById = function (calId, agi) {
        	var agendaId = agi.agendaId;
        	//alert(calId+"------"+agi.agendaId);
            if (calId != null && agendaId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.deleteAgendaItemById(agendaId)
                
               // alert(agi.buttonType+"-----"+agi.title+"----"+agi.startDate+"------"+agi.endDate)
                var startmilliseconds  = Date.parse(agi.startDate);
            var endmilliseconds  = Date.parse(agi.endDate);
                if(xmlhttp) { 
                    xmlhttp.open("POST","deleteappointment.action?startDate="+startmilliseconds+"&endDate="+endmilliseconds+"&reason="+agi.title+"&buttonType="+agi.buttonType+"&slotType="+agi.getSlotType,true); //used as url for matching in the web.xml
              	  
              	    xmlhttp.send(null); //Posting txtname to Servlet
              	  }
              	  else alert("the xmlhttp object not found");
                
            }
        };
        this.deleteAgendaItemByDataAttr = function (calId, attrName, attrValue) {
            if (calId != null && attrName != null && attrValue != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.deleteAgendaItemByDataAttr(attrName, attrValue)
            }
        };
        this.deleteAllAgendaItems = function (calId) {
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.deleteAllAgendaItems()
            }
        };
        this.getAgendaItemsCount = function (calId) {
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                return calObj.getAgendaItemsCount()
            }
        };
        this.showPreviousMonth = function (calId) {
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.previousMonth()
            }
        };
        this.showNextMonth = function (calId) {
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.nextMonth()
            }
        };
        this.showMonth = function (calId, year, month) {
            if (calId != null && year != null && month != null && year.length == 4 && (month.length == 1 || month.length == 2)) {
                calId = stripNumberSign(calId);
                month = month.replace(/^[0]+/g, "");
                var yearInt = parseInt(year);
                var monthInt = parseInt(month);
                var dateToShow = new Date(yearInt, monthInt, 1, 0, 0, 0, 0);
                var calObj = myCalendars.get(calId);
                calObj.setDisplayDate(dateToShow)
            }
        };
        this.getCurrentDate = function (calId) {
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                return calObj.getDisplayDate()
            }
        };
        this.reRenderAgendaItems = function (calId) {
            if (calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.clearDayCellData();
                calObj.renderAgendaItems()
            }
        };
        this.doResizeAll = function () {
            if (myCalendars != null && myCalendars.size() > 0) {
                var cals = myCalendars.values();
                for (var i = 0; i < cals.length; i++) {
                    cals[i].resize()
                }
            }
        };
        this.doResize = function (calId) {
            if (myCalendars != null && myCalendars.size() > 0 && calId != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                calObj.resize()
            }
        };
        this.setAspectRatio = function (calId, ratio) {
            if (calId != null && ratio != null) {
                if (ratio > 1 || ratio <= 0) {
                    alert("Ratio is out of range. Ratio must be less than or equal to 1, and greater than 0.")
                } else {
                    calId = stripNumberSign(calId);
                    var calObj = myCalendars.get(calId);
                    calObj.setRenderRatio(ratio)
                }
            }
        };
        this.loadICalSource = function (calId, iCalUrl, responseDataType) {
            if (calId != null && iCalUrl != null) {
                calId = stripNumberSign(calId);
                var calObj = myCalendars.get(calId);
                Calendar.loadICalSource(calObj, iCalUrl, responseDataType)
            }
        };

        function stripNumberSign(s) {
            if (s != null) {
                if (s.startsWith("#")) {
                    return s.substring(1, s.length)
                }
            }
            return s
        }
    };
    var icalParser = {
        ical: {
            version: "",
            prodid: "",
            events: [],
            todos: [],
            journals: [],
            freebusys: []
        },
        test: function () {
            alert("icalParser test is good!")
        },
        clear: function () {
            this.ical.version = "";
            this.ical.prodid = "";
            this.ical.events = [];
            this.ical.todos = [];
            this.ical.journals = [];
            this.ical.freebusys = []
        },
        parseIcal: function (icsString) {
            this.ical.version = this.getValue("VERSION", icsString, false);
            this.ical.prodid = this.getValue("PRODID", icsString, false);
            var reg = /BEGIN:VEVENT(\r?\n[^B].*)+/g;
            var matches = icsString.match(reg);
            if (matches) {
                for (i = 0; i < matches.length; i++) {
                    this.parseVevent(matches[i])
                }
            }
            reg = /BEGIN:VTODO(\r?\n[^B].*)+/g;
            matches = icsString.match(reg);
            if (matches) {
                for (i = 0; i < matches.length; i++) {
                    this.parseVtodo(matches[i])
                }
            }
            reg = /BEGIN:VJOURNAL(\r?\n[^B].*)+/g;
            matches = icsString.match(reg);
            if (matches) {
                for (i = 0; i < matches.length; i++) {
                    this.parseVjournal(matches[i])
                }
            }
            reg = /BEGIN:VFREEBUSY(\r?\n[^B].*)+/g;
            matches = icsString.match(reg);
            if (matches) {
                for (i = 0; i < matches.length; i++) {
                    this.parseVfreebusy(matches[i])
                }
            }
        },
        parseVfreebusy: function (vfreeString) {
            var freebusy = {
                contact: this.getValue("CONTACT", vfreeString, false),
                dtstart: this.getValue("DTSTART", veventString, false),
                dtend: this.getValue("DTEND", veventString, false),
                duration: this.getValue("DURATION", vfreeString, false),
                description: this.getValue("DESCRIPTION", vfreeString, false),
                dtstamp: this.getValue("DTSTAMP", vfreeString, false),
                organizer: this.getValue("ORGANIZER", vfreeString, false),
                uid: this.getValue("UID", vfreeString, false),
                url: this.getValue("URL", vfreeString, false),
                attendee: this.getValue("ATTENDEE", vfreeString, true),
                comment: this.getValue("COMMENT", vfreeString, true),
                freebusy: this.getValue("FREEBUSY", vfreeString, true),
                rstatus: this.getValue("REQUEST-STATUS", vfreeString, true),
                xprop: this.getValue("X-", vfreeString, true)
            };
            this.ical.freebusys[this.ical.freebusys.length] = freebusy
        },
        parseVjournal: function (vjournalString) {
            var journal = {
                classification: this.getValue("CLASS", vjournalString, false),
                created: this.getValue("CREATED", vjournalString, false),
                description: this.getValue("DESCRIPTION", vjournalString, false),
                dtstart: this.getValue("DTSTART", veventString, false),
                dtstamp: this.getValue("DTSTAMP", vjournalString, false),
                lastmod: this.getValue("LAST-MODIFIED", vjournalString, false),
                organizer: this.getValue("ORGANIZER", vjournalString, false),
                recurid: this.getValue("RECURRENCE-ID", vjournalString, false),
                seq: this.getValue("SEQUENCE", vjournalString, false),
                status: this.getValue("STATUS", vjournalString, false),
                summary: this.getValue("SUMMARY", vjournalString, false),
                uid: this.getValue("UID", vjournalString, false),
                url: this.getValue("URL", vjournalString, false),
                attach: this.getValue("ATTACH", vjournalString, true),
                attendee: this.getValue("ATTENDEE", vjournalString, true),
                categories: this.getValue("CATEGORIES", vjournalString, true),
                comment: this.getValue("COMMENT", vjournalString, true),
                contact: this.getValue("CONTACT", vjournalString, true),
                exdate: this.getValue("EXDATE", vjournalString, true),
                exrule: this.getValue("EXRULE", vjournalString, true),
                related: this.getValue("RELATED", vjournalString, true),
                rdate: this.getValue("RDATE", vjournalString, true),
                rrule: this.getValue("RRULE", vjournalString, true),
                rstatus: this.getValue("REQUEST-STATUS", vjournalString, true),
                xprop: this.getValue("X-", vjournalString, true)
            };
            this.ical.journals[this.ical.journals.length] = journal
        },
        parseVtodo: function (vtodoString) {
            var todo = {
                classification: this.getValue("CLASS", vtodoString, false),
                completed: this.getValue("COMPLETED", vtodoString, false),
                created: this.getValue("CREATED", vtodoString),
                description: this.getValue("DESCRIPTION", vtodoString, false),
                dtstamp: this.getValue("DTSTAMP", vtodoString, false),
                geo: this.getValue("GEO", vtodoString, false),
                lastmod: this.getValue("LAST-MODIFIED", vtodoString, false),
                location: this.getValue("LOCATION", vtodoString, false),
                organizer: this.getValue("ORGANIZER", vtodoString, false),
                percent: this.getValue("PERCENT-COMPLETE", vtodoString, false),
                priority: this.getValue("PRIORITY", vtodoString, false),
                recurid: this.getValue("RECURRENCE-ID", vtodoString, false),
                seq: this.getValue("SEQUENCE", vtodoString, false),
                status: this.getValue("STATUS", vtodoString, false),
                summary: this.getValue("SUMMARY", vtodoString, false),
                uid: this.getValue("UID", vtodoString, false),
                url: this.getValue("URL", vtodoString, false),
                due: this.getValue("DUE", vtodoString, false),
                duration: this.getValue("DURATION", vtodoString, false),
                attach: this.getValue("ATTACH", vtodoString, true),
                attendee: this.getValue("ATTENDEE", vtodoString, true),
                categories: this.getValue("CATEGORIES", vtodoString, true),
                comment: this.getValue("COMMENT", vtodoString, true),
                contact: this.getValue("CONTACT", vtodoString, true),
                exdate: this.getValue("EXDATE", vtodoString, true),
                exrule: this.getValue("EXRULE", vtodoString, true),
                rstatus: this.getValue("REQUEST-STATUS", vtodoString, true),
                related: this.getValue("RELATED", vtodoString, true),
                resources: this.getValue("RESOURCES", vtodoString, true),
                rdate: this.getValue("RDATE", vtodoString, true),
                rrule: this.getValue("RRULE", vtodoString, true),
                xprop: this.getValue("X-", vtodoString, true)
            };
            this.ical.todos[this.ical.todos.length] = todo
        },
        parseVevent: function (veventString) {
            var event = {
                classification: this.getValue("CLASS", veventString, false),
                created: this.getValue("CREATED", veventString, false),
                description: this.getValue("DESCRIPTION", veventString, false),
                geo: this.getValue("GEO", veventString, false),
                lastmod: this.getValue("LAST-MODIFIED", veventString, false),
                location: this.getValue("LOCATION", veventString, false),
                organizer: this.getValue("ORGANIZER", veventString, false),
                priority: this.getValue("PRIORITY", veventString, false),
                dtstamp: this.getValue("DTSTAMP", veventString, false),
                seq: this.getValue("SEQUENCE", veventString, false),
                status: this.getValue("STATUS", veventString, false),
                transp: this.getValue("TRANSP", veventString, false),
                url: this.getValue("URL", veventString, false),
                recurid: this.getValue("RECURRENCE-ID", veventString, false),
                duration: this.getValue("DURATION", veventString, false),
                attach: this.getValue("ATTACH", veventString, true),
                attendee: this.getValue("ATTENDEE", veventString, true),
                categories: this.getValue("CATEGORIES", veventString, true),
                comment: this.getValue("COMMENT", veventString, true),
                contact: this.getValue("CONTACT", veventString, true),
                exdate: this.getValue("EXDATE", veventString, true),
                exrule: this.getValue("EXRULE", veventString, true),
                rstatus: this.getValue("REQUEST-STATUS", veventString, true),
                related: this.getValue("RELATED", veventString, true),
                resources: this.getValue("RESOURCES", veventString, true),
                rdate: this.getValue("RDATE", veventString, true),
                rrule: this.getValue("RRULE", veventString, true),
                xprop: this.getValue("X-", veventString, true),
                uid: this.getValue("UID", veventString, false),
                summary: this.getValue("SUMMARY", veventString, false),
                dtstart: this.getValue("DTSTART", veventString, false),
                dtend: this.getValue("DTEND", veventString, false)
            };
            this.ical.events[this.ical.events.length] = event
        },
        getValue: function (propName, txt, multiple) {
            if (multiple) {
                eval("var matches=txt.match(/\\n" + propName + "[^:]*/g)");
                var props = [];
                if (matches) {
                    for (l = 0; l < matches.length; l++) {
                        matches[l] = matches[l].replace(/;.*/, "");
                        props[props.length] = this.getValue(matches[l], txt)
                    }
                    return props
                }
            } else {
                var reg = new RegExp("(" + propName + ")(;[^=]*=[^;:\n]*)*:([^\n]*)", "g");
                var matches = reg.exec(txt);
                if (matches) {
                    var valeur = RegExp.$3;
                    var tab_params;
                    if (RegExp.$2.length > 0) {
                        var params = RegExp.$2.substr(1).split(";");
                        var pair;
                        var code = "";
                        for (k = 0; k < params.length; k++) {
                            pair = params[k].split("=");
                            if (!pair[1]) {
                                pair[1] = pair[0]
                            }
                            code += pair[0].replace(/-/, "") + ' : "' + pair[1] + '", '
                        }
                        eval("tab_params=( { " + code.substr(0, code.length - 2) + " } );")
                    }
                    return {
                        value: valeur,
                        params: tab_params
                    }
                } else {
                    return null
                }
            }
        }
    }
})(jQuery);
(function (a) {
    a.fn.wresize = function (c) {
        version = "1.1";
        wresize = {
            fired: false,
            width: 0
        };

        function b() {
            if (a.browser.msie) {
                if (!wresize.fired) {
                    wresize.fired = true
                } else {
                    var e = parseInt(a.browser.version, 10);
                    wresize.fired = false;
                    if (e < 7) {
                        return false
                    } else {
                        if (e == 7) {
                            var f = a(window).width();
                            if (f != wresize.width) {
                                wresize.width = f;
                                return false
                            }
                        }
                    }
                }
            }
            return true
        }

        function d(f) {
            if (b()) {
                return c.apply(this, [f])
            }
        }
        this.each(function () {
            if (this == window) {
                a(this).resize(d)
            } else {
                a(this).resize(c)
            }
        });
        return this
    }
    
    function convertToJquiDateFormat(localFormatString){
    	 
        //Year
        if(localFormatString.search(/y{3,}/g) >=0){                 /* YYYY */
            localFormatString = localFormatString.replace(/y{3,}/g,     "yy");
        }else if(localFormatString.search(/y{2}/g) >=0){            /* YY   */
            localFormatString = localFormatString.replace(/y{2}/g,      "y");
        }
     
        //Month
        if(localFormatString.search(/M{4,}/g) >=0){                 /* MMMM */
            localFormatString = localFormatString.replace(/M{4,}/g,     "MM");
        }else if(localFormatString.search(/M{3}/g) >=0){            /* MMM  */
            localFormatString = localFormatString.replace(/M{3}/g,      "M");
        }else if(localFormatString.search(/M{2}/g) >=0){            /* MM   */
            localFormatString = localFormatString.replace(/M{2}/g,      "mm");
        }else if(localFormatString.search(/M{1}/g) >=0){            /* M    */
            localFormatString = localFormatString.replace(/M{1}/g,      "m");
        }
     
        //Day
        if(localFormatString.search(/D{2,}/g) >=0){                 /* DD   */
            localFormatString = localFormatString.replace(/D{2,}/g,     "oo");
        }else if(localFormatString.search(/D{1}/g) >=0){            /* D    */
            localFormatString = localFormatString.replace(/D{1}/g,      "o");
        }
     
        //Day of month
        if(localFormatString.search(/E{4,}/g) >=0){                 /* EEEE */
            localFormatString = localFormatString.replace(/E{4,}/g,     "DD");
        }else if(localFormatString.search(/E{2,3}/g) >=0){          /* EEE  */
            localFormatString = localFormatString.replace(/E{2,3}/g,    "D");
        }
        console.log(localFormatString);
        return localFormatString;
    }

   
})(jQuery);
