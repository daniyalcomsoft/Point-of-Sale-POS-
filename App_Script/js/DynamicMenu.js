//Role{'Administrator','Employee','Regional','Sales','Dispatch','Client','Super Admin'}

function JSON_Menu() {
    var jsonMenu = JSON.parse($("[id$=hdnMenu]").val());
    var MenuUrl = $("[id$=hdnMenuLink]").val();
    for (var i = 0; i < jsonMenu.length; i++) {

        var MID = jsonMenu[i].MenuID; //MenuID
        var MName = jsonMenu[i].MenuName; //MenuName
        var MIcon = jsonMenu[i].MenuIcon; //MenuIcon
        var PName = PName = jsonMenu[i].PageName;
        var Url = MenuUrl + jsonMenu[i].PageUrl; //PageUrl
        var PIcon = jsonMenu[i].PageIcon; //PageIcon 
        var MenuDup = jsonMenu[i].MenuCount; //MenuDupCount 

        MenuSwitch("IMS_" + MID, MName, MIcon, PName, Url, PIcon, MenuDup);
    }
}

function MenuSwitch(MenuID, MenuName, MenuIcon, PageName, PageUrl, Pageicon, MenuCount) {
    if (parseInt(MenuCount) > 1) //Parent With Child Create
    {
        //var Dashboard = 'Dashboard/' + UpperCase(MenuName.trim().split('_')[0]) + '.aspx';
        if (MenuName != "OTHERS") {
            var ID = $("[Id$=" + MenuID + "]").length;
            if (parseInt(ID) == 0) { // Parent One Time Create 
                $("#MainID").append(
                $('<li id="' + MenuID + '" runat="server">').attr('class', 'site-menu-item has-sub').append(
                $('<a href="javascript:void(0)">').attr('class', 'waves-effect waves-classic').append(
                $('<i aria-hidden="true">').attr('class', MenuIcon.trim())).append(
                $('<span>').attr('class', 'site-menu-title').append(MenuName.replace(" ","<br/>")))).append(
                $('<ul>').attr('class', 'site-menu-sub').append(
                $('<li>').attr('class', 'site-menu-item').append(
                $('<a>').attr('class', 'animsition-link waves-effect waves-classic').attr('href', PageUrl.trim()).append(
                $('<span>').attr('class', 'site-menu-title').append(
                $('<i>').attr('class', Pageicon)).append(PageName))))));
            }
            else { // Parent One Time Create Cild Muil Time Create
                $("[Id$=" + MenuID + "] > ul").append($('<li>').attr('class', 'site-menu-item').append(
                $('<a>').attr('href', PageUrl.trim()).attr('class', 'animsition-link waves-effect waves-classic').append(
                $('<span>').attr('class', 'site-menu-title').append(
                $('<i>').attr('class', Pageicon)).append(PageName))))
            }
        }
        else {
            //$("#MainID").append(
            //$('<li id="' + MenuID + '">').append(
            //$('<a>').attr('href', PageUrl.trim()).append(
            //$('<i>').attr('class', Pageicon.trim()).append(
            //$('<b>').attr('class', 'bg-success').append(
            //))).append($('<span>').append(PageName))));
            $("#MainID").append(
            $('<li id="' + MenuID + '" runat="server">').attr('class', 'site-menu-item').append(
            $('<a>').attr('class', 'animsition-link waves-effect waves-classic').attr('href', PageUrl.trim()).append(
            $('<i aria-hidden="true">').attr('class', Pageicon.trim())).append($('<span>').append(PageName).attr('class', 'site-menu-title'))));
        }
    }
    else { //ParentCreate
        $("#MainID").append(
        $('<li id="' + MenuID + '" runat="server">').attr('class', 'site-menu-item').append(
        $('<a>').attr('class', 'animsition-link waves-effect waves-classic').attr('href', PageUrl.trim()).append(
        $('<i aria-hidden="true">').attr('class', Pageicon.trim())).append($('<span>').append(PageName).attr('class', 'site-menu-title'))));
    }
}


function UpperCase(str) {
    str = str.toLowerCase().replace(/\b[a-z]/g, function (letter) {
        return letter.toUpperCase();
    });
    return str;
}

$("li .searchterm").on('click', function () {
    console.log('testing');
});