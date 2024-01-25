

function easy_numpad_close() {
    $('#easy-numpad-frame').addClass("hide");
}
function easy_numpad_open() {
    $('#easy-numpad-frame').removeClass("hide");
}
function easynum() {
    event.preventDefault();

    navigator.vibrate = navigator.vibrate || navigator.webkitVibrate || navigator.mozVibrate || navigator.msVibrate;
    if (navigator.vibrate) {
        navigator.vibrate(60);
    }

    var easy_num_button = $(event.target);
    var easy_num_value = easy_num_button.text();   
    $("[Id$=numpadoutput]").val($("[Id$=numpadoutput]").val() + easy_num_value);
   
}
function easy_numpad_del() {
    event.preventDefault();
    var easy_numpad_output_val = $("[Id$=numpadoutput]").val();
    var easy_numpad_output_val_deleted = easy_numpad_output_val.slice(0, -1);
    $("[Id$=numpadoutput]").val(easy_numpad_output_val_deleted);
}
function easy_numpad_clear() {
    event.preventDefault();
    $("[Id$=numpadoutput]").val("");
}
function easy_numpad_cancel() {
    event.preventDefault();
    $('#easy-numpad-frame').remove();

}
