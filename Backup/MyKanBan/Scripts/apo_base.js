/**
  *@class: ApoJS.Base
  *@author:  Apo
  *@Desc: Base functions
 **/

ApoJS.Base = {
    '$': function (id) {
        return document.getElementById(id);
    },
    'OS': {
        'IE': 1,
        'Firefox': 2,
        'Opera': 3,
        'Netscape': 4,
        'Safari': 5,
        'Camino': 6,
        'Gecko': 7,
        'Chrome': 8,
        'Unknown': 0
    },
    'GetOS': function () {
        if (navigator.userAgent.indexOf("MSIE") > 0) return 1;
        if (navigator.userAgent.indexOf("Firefox") > 0) return 2;
        if (navigator.userAgent.indexOf("Chrome") > 0) return 8;
        if (navigator.userAgent.indexOf("Opera") > 0) return 3;
        if (navigator.userAgent.indexOf("Netscape") > 0) return 4;
        if (navigator.userAgent.indexOf("Safari") > 0) return 5;
        if (navigator.userAgent.indexOf("Camino") > 0) return 6;
        if (navigator.userAgent.indexOf("Gecko") > 0) return 7;
        return 0;
    },
    'Trim': function (str) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    },
    'FindOffsetTop': function (o) {
        var t = 0;
        if (o.offsetParent) {
            while (o.offsetParent) {
                t += o.offsetTop;
                o = o.offsetParent;
            }
        }
        return t;
    },
    'FindOffsetLeft': function (o) {
        var t = 0;
        if (o.offsetParent) {
            while (o.offsetParent) {
                t += o.offsetLeft;
                o = o.offsetParent;
            }
        }
        return t;
    },
    'GetAllChildTags': function (obj, tagName) {
        if (!obj) return;
        return obj.getElementsByTagName(tagName);
    },
    'HideAllChildTags': function (obj, tagList) {
        if (!obj) return;
        //get all specific child tag objects
        var tags = null;
        var tagArray = tagList.split(",");
        var tagName = "";
        var tnTotal = tagArray.length;

        for (var count1 = 0; count1 < tnTotal; count1++) {
            tagName = tagArray[count1];
            tags = getAllChildTags(obj, tagName);

            if (tags && tags.length > 0) {
                var tagObj = null;
                var tagTotal = tags.length;
                for (var count = 0; count < tagTotal; count++) {
                    tagObj = tags[count];
                    tagObj.setAttribute("apo_tag_visibility", tagObj.style.visibility);
                    tagObj.style.visibility = "hidden";
                }
            }
        }
    },
    'ShowAllChildTags': function (obj, tagList) {
        if (!obj) return;
        //get all specific child tag objects
        var tags = null;
        var tagArray = tagList.split(",");
        var tagName = "";
        var tnTotal = tagArray.length;

        for (var count1 = 0; count1 < tnTotal; count1++) {
            tagName = tagArray[count1];
            tags = getAllChildTags(obj, tagName);

            if (tags && tags.length > 0) {
                var tagObj = null;
                var tagTotal = tags.length;
                var tagVis = null;
                for (var count = 0; count < tagTotal; count++) {
                    tagObj = tags[count];
                    tagVis = tagObj.getAttribute("apo_tag_visibility");
                    tagObj.style.visibility = tagVis ? tagVis : "inherit";
                }
            }
        }
    },
    'SetOpacity': function (element, alpha) {
        var style = element.style;
        if (style.MozOpacity != undefined) {
            style.MozOpacity = alpha;
        } else if (style.opacity != undefined) {
            style.opacity = alpha;
        } else if (style.filter != undefined) {
            if (element.filters) {
                style.filter = "alpha(opacity=0)";
                element.filters.alpha.opacity = alpha * 100;
            } else {
                style.filter = "alpha(opacity=" + (alpha * 100) + ")";
            }
        }
    },
    'SetCanvasImgRotate': function (img, cvs, degree) {
        if (!cvs || !cvs.getContext) return;

        var objContext = cvs.getContext('2d');
        var nWidth = img.width;
        var nHeight = img.height;
        var nCircle = Math.sqrt(nWidth * nWidth / 4 + nHeight * nHeight / 4);
        var nDegree = Math.atan(nHeight / nWidth);
        var nY = nCircle * Math.cos(degree * Math.PI / 180 + nDegree) - nWidth / 2;
        var nX = nCircle * Math.sin(degree * Math.PI / 180 + nDegree) - nHeight / 2;

        cvs.setAttribute('width', nWidth);
        cvs.setAttribute('height', nHeight);
        objContext.rotate(degree * Math.PI / 180);
        objContext.drawImage(img, nX, nY);

    },
    'StopBubble': function (evt) {
        var e = (evt) ? evt : window.event;
        if (window.event) {
            e.cancelBubble = true;
        } else {
            e.stopPropagation();
        }
    },
    'ZoomRate': function () {
        var i = 1;
        if (window.screen.deviceXDPI) {
            i = parseInt(Math.round(window.screen.deviceXDPI / window.screen.logicalXDPI * 100)) / 100;
        }
        return i;
    },
    'IsMouseHover': function (e, handler) {
        if (e.type && e.type != "mouseout" && e.type != "mouseover") return false;
        var target = e.relatedTarget ? e.relatedTarget : e.type == 'mouseout' ? e.toElement : e.fromElement;
        while (target && target != handler) {
            target = target.parentNode;
        }
        return (target != handler);
    },
    'CheckCSS3Transition': function() {
        var obj = document.body || document.documentElement;
        var objStyle = obj.style;
        var strTransition = 'transition';
        if (typeof objStyle[strTransition] == 'string') { return true; }

        var aryPrefix = ['Moz', 'Webkit', 'Khtml', 'O', 'ms'],
        strTransition = 'Transition';
        for (var i = 0; i < aryPrefix.length; i++) {
            if (typeof objStyle[aryPrefix[i] + strTransition] == 'string') { return true; }
        }
        return false;
    }
}
