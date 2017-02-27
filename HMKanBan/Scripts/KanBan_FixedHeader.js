var KanBan_FixedHeader = {
    'ScrollTimer': null,
    'MenuHeight': 0,
    'OrignTop': 0,
    'HeaderName': '',
    'HeaderArr': null,
    'FloatingOffset': 0,
    'FloatingTimer': null,
    'OrignLeft': 0,
    'FloatingName': '',
    'FloatingArr': null,
    'PageObj': null,
    'MenuObj': null,
    'Pin': function () {
        if (ApoJS.Base.GetOS() != ApoJS.Base.OS.IE || document.documentMode > 9) {
            if (!KanBan_FixedHeader.ScrollTimer)
                KanBan_FixedHeader.ScrollTimer = setTimeout(KanBan_FixedHeader.Move, 250);
        } else {
            KanBan_FixedHeader.Move();
        }
    },
    'Move': function () {
        var obj;
        var y = 0;
        var scroll = 0;
        if (KanBan_FixedHeader.PageObj && KanBan_FixedHeader.PageObj.scrollTop) {
            scroll = KanBan_FixedHeader.PageObj.scrollTop;
        }

        y = scroll - KanBan_FixedHeader.OrignTop + KanBan_FixedHeader.MenuHeight;
        if (y < 0) y = 0;

        if (KanBan_FixedHeader.HeaderArr[0].style.top != (y + "px")) {
            for (var i = 0; i < KanBan_FixedHeader.HeaderArr.length; i++) {
                obj = KanBan_FixedHeader.HeaderArr[i];
                obj.style.top = y + "px";
            }
        }
        KanBan_FixedHeader.ScrollTimer = null;
    },
    'Float': function () {
        if (ApoJS.Base.GetOS() != ApoJS.Base.OS.IE || document.documentMode > 9) {
            if (!KanBan_FixedHeader.FloatingTimer)
                KanBan_FixedHeader.FloatingTimer = setTimeout(KanBan_FixedHeader.MoveLeft, 250);
        } else {
            KanBan_FixedHeader.MoveLeft();
        }

    },
    'MoveLeft': function () {
        var obj;
        var x = 0;
        var scroll = 0;
        if (KanBan_FixedHeader.PageObj && KanBan_FixedHeader.PageObj.scrollLeft) {
            scroll = KanBan_FixedHeader.PageObj.scrollLeft;
        }

        x = scroll - KanBan_FixedHeader.OrignLeft;
        if (x < 0) x = 0;
        if (KanBan_FixedHeader.FloatingArr[0].style.left != (x + "px")) {
            for (var i = 0; i < KanBan_FixedHeader.FloatingArr.length; i++) {
                obj = KanBan_FixedHeader.FloatingArr[i];
                obj.style.height = (obj.parentNode.offsetHeight - KanBan_FixedHeader.FloatingOffset) + "px";
                obj.style.left = x + "px";
                if (x == 0) {
                    obj.style["border-right"] = "0px";
                } else {
                    obj.style["border-right"] = "2px solid #1BA1E2";
                }
            }
        }
        KanBan_FixedHeader.FloatingTimer = null;
    },
    'ResizeFloating': function () {
        if (KanBan_FixedHeader.FloatingArr) {
            var obj;
            for (var i = 0; i < KanBan_FixedHeader.FloatingArr.length; i++) {
                obj = KanBan_FixedHeader.FloatingArr[i];
                obj.style.height = (obj.parentNode.offsetHeight - KanBan_FixedHeader.FloatingOffset) + "px";
            }
        }
    },
    'InitArr': function () {
        if (KanBan_FixedHeader.FloatingName)
            KanBan_FixedHeader.FloatingArr = document.getElementsByName(KanBan_FixedHeader.FloatingName);
        if (KanBan_FixedHeader.HeaderName)
            KanBan_FixedHeader.HeaderArr = document.getElementsByName(KanBan_FixedHeader.HeaderName);
        KanBan_FixedHeader.ResizeFloating();
    },
    'Init': function () {
        KanBan_FixedHeader.InitArr();
        if (KanBan_FixedHeader.PageObj && KanBan_FixedHeader.HeaderArr && KanBan_FixedHeader.HeaderArr.length > 0) {
            KanBan_FixedHeader.OrignTop = ApoJS.Base.FindOffsetTop(KanBan_FixedHeader.HeaderArr[0]);
            if (KanBan_FixedHeader.PageObj.onscroll) {
                var tmpScroll = KanBan_FixedHeader.PageObj.onscroll;
                KanBan_FixedHeader.PageObj.onscroll = function () {
                    tmpScroll();
                    KanBan_FixedHeader.Pin();
                }
            } else {
                KanBan_FixedHeader.PageObj.onscroll = function () {
                    KanBan_FixedHeader.Pin();
                }
            }
        }
        if (KanBan_FixedHeader.PageObj && KanBan_FixedHeader.FloatingArr && KanBan_FixedHeader.FloatingArr.length > 0) {
            KanBan_FixedHeader.OrignLeft = ApoJS.Base.FindOffsetLeft(KanBan_FixedHeader.FloatingArr[0]);
            if (KanBan_FixedHeader.PageObj.onscroll) {
                var tmpScroll = KanBan_FixedHeader.PageObj.onscroll;
                KanBan_FixedHeader.PageObj.onscroll = function () {
                    tmpScroll();
                    KanBan_FixedHeader.Float();
                }
            } else {
                KanBan_FixedHeader.PageObj.onscroll = function () {
                    KanBan_FixedHeader.Float();
                }
            }
        }

        if (KanBan_FixedHeader.MenuObj) {
            KanBan_FixedHeader.MenuHeight = KanBan_FixedHeader.MenuObj.offsetHeight;
        }
    }
}