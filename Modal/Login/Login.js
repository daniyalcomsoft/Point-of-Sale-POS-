function OnSubmit(UserName, Password) {
    var dataValue = "{ UserName: '" + UserName + "', Password: '" + Password + "'}";
    $.ajax({
        type: "POST",
        url: "Login.aspx/LoginSubmit",
        data: dataValue,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (result) {
            ToastMsg('3', result.d, 'top-right');
        },
        success: function (result) {
            if (result.d == "Login Successfully") {
                ToastMsg('1', result.d, 'top-right');
                window.location = 'Default.aspx';
                //RedirectAfterDelayFn('Default.aspx');
            }
            else if (result.d == "User not Active") {
                ToastMsg('2', result.d, 'top-right');
            }
            else if (result.d == "Role not Active") {
                ToastMsg('2', result.d, 'top-right');
            }
            else if (result.d == "Invaild Password") {
                ToastMsg('3', result.d, 'top-right');
            }
            else if (result.d == "Invaild Username") {
                ToastMsg('3', result.d, 'top-right');
            }
            else {
                ToastMsg('4', result.d, 'top-right');
            }
        }
    });
}