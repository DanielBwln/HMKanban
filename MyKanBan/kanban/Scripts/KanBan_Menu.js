var KanBan_Menu = {
    'PIN_MENU': '',
    'PIN_MENUGROUP': '',
    'REMOVE_MENU': '',
    'PinTimer': null,
    'RemoveTimer': null,
    'ShowConfig': function () {
        var objConfig = document.getElementById("divUserConfig");
        var btnConfig = document.getElementById("btnUserConfig");
        var x, y;

        objConfig.style.height = "0px";
        objConfig.style.display = "";
        x = ApoJS.Base.FindOffsetLeft(btnConfig) + btnConfig.offsetWidth - objConfig.offsetWidth;
        y = ApoJS.Base.FindOffsetTop(btnConfig) + btnConfig.offsetHeight + 5;
        objConfig.style.top = y + "px";
        objConfig.style.left = x + "px";

        if (ApoJS.Base.CheckCSS3Transition()) {
            objConfig.style.height = "80px";
        } else {
            objConfig.Animation.SetHeight(objConfig, 0, 80, 10, 25, 0.5, null);
        }
    },
    'HideConfig': function () {
        var objConfig = document.getElementById("divUserConfig");
        if (ApoJS.Base.CheckCSS3Transition()) {
            objConfig.style.height = "0px";
        } else {
            objConfig.Animation.SetHeight(objConfig, 80, 0, 10, 25, 0.5, null);
        }
        setTimeout(function () { document.getElementById("divUserConfig").style.display = "none"; }, 250);
    },
    'Pin': function (menu_group_id, menu_id) {
        if (KanBan_Menu.RemoveTimer && KanBan_Menu.REMOVE_MENU == menu_id) {
            clearTimeout(KanBan_Menu.RemoveTimer);
            KanBan_Menu.RemoveTimer = null;
            KanBan_Menu.REMOVE_MENU = "";
        } else {
            if (!KanBan_Menu.PinTimer) {
                KanBan_Menu.PIN_MENU = menu_id;
                KanBan_Menu.PIN_MENUGROUP = menu_group_id;
                KanBan_Menu.PinTimer = setTimeout(KanBan_Menu.Display, 200);
            }
        }
    },
    'Remove': function (menu_id) {
        if (KanBan_Menu.PinTimer) {
            clearTimeout(KanBan_Menu.PinTimer);
            KanBan_Menu.PinTimer = null;
            KanBan_Menu.PIN_MENU = "";
            KanBan_Menu.PIN_MENUGROUP = "";
        } else {
            KanBan_Menu.REMOVE_MENU = menu_id;
            KanBan_Menu.RemoveTimer = setTimeout("KanBan_Menu.Hide('" + menu_id + "');", 50);
        }
    },
    'Display': function () {
        var grp = document.getElementById(KanBan_Menu.PIN_MENUGROUP);
        var menu = document.getElementById(KanBan_Menu.PIN_MENU);
        var x = 0, y = 0, child = 0;
        var tmp;

        tmp = menu.firstChild;
        while (tmp) {
            ;
            if (tmp.nodeName == 'DIV' && tmp.className != 'clear') { child++; };
            ;
            tmp = tmp.nextSibling;
        }
        x = ApoJS.Base.FindOffsetLeft(grp);
        y = ApoJS.Base.FindOffsetTop(grp) + grp.offsetHeight;

        menu.style.top = y + "px";

        menu.style.left = (x - 5) + "px";
        menu.style.height = "0px";
        menu.style.display = "";

        if (ApoJS.Base.GetOS() != ApoJS.Base.OS.IE || document.documentMode > 9) {
            menu.style.height = (child * 40 + 3) + "px";
        } else {
            ApoJS.Animation.SetHeight(menu, 0, (child * 40 + 3), 10, 25, 0.5, null);
        }

        KanBan_Menu.PIN_MENU = "";
        KanBan_Menu.PIN_MENUGROUP = "";
        KanBan_Menu.PinTimer = null;
    },
    'Hide': function (menu_id) {
        var menu = document.getElementById(menu_id);
        menu.style.display = "none";
        menu.style.height = "0px";

        KanBan_Menu.REMOVE_MENU = "";
        KanBan_Menu.RemoveTimer = null;
    }
}