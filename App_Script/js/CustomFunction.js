function ShowDialog(id) {
    $('#' + id).dialog("open");
    return false;
}

function CloseDialog(id) {
    $('#' + id).dialog("close");
    return false;
}

function ShowModal(id) {
    $('#' + id).modal('show');
    return false;
}

function HideModal(id) {
    $('#' + id).modal("hide");
    return false;
}


function Clear_form_elements(ele) {
    $('#' + ele).find(':input').each(function () {
        if (this.type == 'text' || this.type == 'textarea') {
            this.value = '';
        }
        else if (this.type == 'radio' || this.type == 'checkbox') {
            this.checked = false;
        }
        else if (this.type == 'select-one' || this.type == 'select-multiple') {
            $('#' + this.id).prop('selectedIndex', 0);
        }
    });
}

function ValidateNumber(evet) {
    var charCode = (evet.which) ? evet.which : event.keyCode
    if (charCode != 9) {
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
    }
    return true;
}

function RedirectAfterDelayFn(RedirectPage) {
    var seconds = 1;
    setInterval(function () {
        seconds--;
        if (seconds == 0) {
            window.location = RedirectPage;
        }
    }, 1000);
}

function NoRecordExists(GridID, Colspan, Message) {
    if ($("[Id$=" + GridID + "] td").length == 0) {
        $("[Id$=" + GridID + "] tbody").append("<tr><td colspan = '" + Colspan + "' align = 'center' style='font-size: 24px;'>" + Message + "</td></tr>")
    }
    else {
        $("[Id$=" + GridID + "] tbody").append("<tr><td colspan = '" + Colspan + "' align = 'center' style='font-size: 24px;'>" + Message + "</td></tr>")
    }
}

function StringToBoolean(string) {
    switch (string.toLowerCase().trim()) {
        case "true": case "yes": case "1": return true;
        case "false": case "no": case "0": case null: return false;
        default: return Boolean(string);
    }
}

function BooleanToInt(Int) {
    if (Int == true) {
        return 1;
    }
    else {
        return 0;
    }
}

function SearchGridData(GridID, Value, Colspan) {
    var RecordNotFound = false;
    var table = $("[Id$=" + GridID + "]");

    table.find('tr').each(function (index, row) {
        var allCells = $(row).find('td');

        if (allCells.length > 0) {
            var found = false;
            allCells.each(function (index, td) {
                var regExp = new RegExp(Value, 'i');
                if (regExp.test($(td).text())) {
                    found = true;
                    return false;
                }
            });

            if (found == true) {
                $(row).show();
                RecordNotFound = true;
            } else {
                $(row).hide();
            }
        }
    });

    if (RecordNotFound == false) {
        if ($("[Id$=" + GridID + "] tr > td:last").html() == "Record Not Found") {
            $("[Id$=" + GridID + "] tr > td:last").hide();
        }
        NoRecordExists(GridID, Colspan, 'Record Not Found');
    }
}

function ClearRecordNotFound(GridID, InputID) {
    $("[Id$=" + InputID + "]").val("");
    if ($("[Id$=" + GridID + "] tr > td:last").html() == "Record Not Found") {
        $("[Id$=" + GridID + "] tr > td:last").hide();
    }
    $("[Id$=" + GridID + "] tr").show();
}

function StatusConvertToString(Status) {
    if (Status == true) {
        return "Active";
    }
    else {
        return "Deactive";
    }
}

function MonthPicker() {

    //$('.datetimepicker').datepicker({
    //    changeMonth: true,
    //    changeYear: true,
    //    numberOfMonths: 1,
    //    showOn: "both",//button
    //    buttonImageOnly: false,
    //    showAnim: "slideDown",
    //    dateFormat: "yy-mm-dd",
    //    orientation: "top",
    //    onClose: function (selectedDate) {
    //        $("#date_to").datepicker("option", "minDate", selectedDate);
    //    }
    //});


    $(".monthpicker")
  .wrap('<div class="input-group">')
  .datepicker({
      dateFormat: "MM yy",
      changeYear: true,
      showOn: "button"
  })
  .next("button").button({
      icons: { primary: "ui-icon-calendar" },
      label: "Select a date",
      text: false
  })
  .addClass("btn btn-default")
  .wrap('<span class="input-group-btn">')
  .find('.ui-button-text')
  .css({
      'visibility': 'hidden',
      'display': 'inline'
  });

}


function DateTimePicker() {

    $('.datetimepicker').datetimepicker({

        timeFormat: "hh:mm tt"
    });

    //  $(".datetimepicker")
    //.wrap('<div class="input-group">')
    //.datepicker({

    //    changeYear: true,
    //    showOn: "button"
    //})
    //.next("button").button({
    //    icons: { primary: "ui-icon-calendar" },
    //    label: "Select a date",
    //    text: false
    //})
    //.addClass("btn btn-default")
    //.wrap('<span class="input-group-btn">')
    //.find('.ui-button-text')
    //.css({
    //    'visibility': 'hidden',
    //    'display': 'inline'
    //});

}

function DatePicker() {



    $(".datepicker")
  .datepicker({

      changeYear: true,
     
  });
  

}

//function DatePicker() {

   

//      $(".datepicker")
//    .wrap('<div class="input-group">')
//    .datepicker({

//        changeYear: true,
//        showOn: "button"
//    })
//    .next("button").button({
//        icons: { primary: "ui-icon-calendar" },
//        label: "Select a date",
//        text: false
//    })
//    .addClass("btn btn-default")
//    .wrap('<span class="input-group-btn">')
//    .find('.ui-button-text')
//    .css({
//        'visibility': 'hidden',
//        'display': 'inline'
//    });

//}



function showStatusMsg(MsgType, Msg) {
    if (MsgType == "1") {
        $("#StausMsg").removeClass().addClass("alert alert-success");

        $("#StausMsg").html("<p><b>Success!</b> " + Msg + "</p>");
    }
    else if (MsgType == "2") {
        $("#StausMsg").removeClass().addClass("alert alert-danger");
        $("#StausMsg").html("<p><b>Error!</b> " + Msg + "</p>");
    }
    else if (MsgType == "3") {
        $("#StausMsg").removeClass().addClass("alert alert-warning");
        $("#StausMsg").html("<p><b>Warning!</b> " + Msg + "</p>");
    }
    else if (MsgType == "4") {
        $("#StausMsg").removeClass().addClass("alert alert-info");
        $("#StausMsg").html("<p><b>Info!</b> " + Msg + "</p>");
    }
    $("#StausMsg").show("fade");
    setTimeout("hideStatusMsg()", 3000);
}
function hideStatusMsg() {
    $("#StausMsg").hide('fade');
}
function disabledModal(ModalName) {
    $("#" + ModalName + "").find('input,select,textarea,file').prop("disabled", true);
}
function enabledModal(ModalName) {
    $("#" + ModalName + "").find('input,select,textarea,file').prop("disabled", false);
}

function showhidecontrol(ControlID, Show) {
   
    if (Show == "False")
        $("[id$=" + ControlID + "]").hide();
    else
    $("[id$=" + ControlID + "]").show();
       
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function onlyNumbersWithDot(e) {
    var charCode;
    if (e.keyCode > 0) {
        charCode = e.which || e.keyCode;
    }
    else if (typeof (e.charCode) != "undefined") {
        charCode = e.which || e.keyCode;
    }
    if (charCode == 46)
        return true
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}


$('.number_only').bind('keyup paste', function () {
    this.value = this.value.replace(/[^0-9]/g, '');
});


function setYScrollposition(div, hdid) {
    var div = document.getElementById(div);
    var div_position = document.getElementById(hdid);
    var position = parseInt($("#" + hdid + "").val());
    if (isNaN(position) || position=="") {
        position = 0;
    }
    div.scrollTop = position;
    div.onscroll = function () {
        div_position.value = div.scrollTop;
    };
};
function setXScrollposition(div, hdid) {
    var div = document.getElementById(div);
    var div_position = document.getElementById(hdid);
    var position = parseInt($("#" + hdid + "").val());
    if (isNaN(position) || position == "") {
        position = 0;
    }
    div.scrollLeft = position;
    div.onscroll = function () {
        div_position.value = div.scrollLeft;
    };
};

function setcmdID(eid, div) {
    if (div == "div_cat") {
        $("#hdActivecat").val(eid);
        setActiveItem("hdActivecat", div);
    }
    if (div == "div_itm") {
        $("#hdActiveitm").val(eid);
        setActiveItem("hdActiveitm", div);
    }
    if (div == "div_table") {
        $("#hdActivetbl").val(eid);
        setActiveItem("hdActivetbl", div);
    }
}

function setActiveItem(hdID,div) {
   
    $('#'+div+' .setactiveele').removeClass("setactiveele");
    $('#' + div + ' a[acid=' + $("#" + hdID).val() + ']').addClass("setactiveele");

  
    
}