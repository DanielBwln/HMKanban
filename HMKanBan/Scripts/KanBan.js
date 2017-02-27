var KanBan = {
    'AutoScrollRightTimer': null,
    'AutoScrollLeftTimer': null,
    'AutoScrollWidth': 200,
    'AutoScrollSpeed': 20,
    'IsTouch': false,
    'FadeOut': function (func) {
        var divFrame = document.getElementById("divFrame");
        var divPage = document.getElementById("divPage");
        if (divFrame && divPage) {
            divPage.style.overflow = "hidden";
            ApoJS.Animation.SetOpacity(divFrame, 1, 0, 15, 25, 0.6, null);
            ApoJS.Animation.SetScrollLeft(divPage, divPage.scrollLeft, divPage.scrollLeft + 1500, 15, 25, 0.6, function () {
                if (func) func();
            });
        }
    },
    'FadeIn': function (func) {
        var divFrame = document.getElementById("divFrame");
        var divPage = document.getElementById("divPage");
        divFrame.style.marginLeft = divPage.offsetWidth + "px";
        ApoJS.Animation.SetMarginLeft(divFrame, divPage.offsetWidth, 0, 15, 25, 0.6, null);
        ApoJS.Animation.SetOpacity(divFrame, 0, 1, 16, 25, 0.7, function () {
            var divPage = document.getElementById("divPage");
            divPage.style.overflow = "auto";
            if (func) func();
        });
        setTimeout("document.getElementById(\"divPage\").style.visibility = \"visible\"", 50);
    },
    'Init': function (func) {
        var divFrame = document.getElementById("divFrame");
        if (divFrame) {
            ApoJS.Base.SetOpacity(divFrame, 0);
            setTimeout("KanBan.FadeIn(" + func + ");", 400);
        }
    },
    'InitPos': function () {
        KanBan.CalStepPos();
        KanBan.CalStoryPos();

        var list = KanBan.StepList.split(",");
        for (var i = 0; i < list.length; ++i) {
            if (list[i]) KanBan.InitStep(list[i]);
        }
        list = KanBan.StoryList.split(",");
        for (var i = 0; i < list.length; ++i) {
            if (list[i]) KanBan.InitStory(list[i]);
        }
    },
    'StoryOnAir': null,
    'StoryOnLand': null,
    'StepOnLand': null,
    'StepTimerTmp': null,
    'StepTimer': null,
    'HoverTimer': null,
    'HoverEvt': null,
    'IsHover': false,
    'IsMoving': false,
    'StoryList': "",
    'StepList': "",
    'ColumnList': "",
    'StepListAdd': function (laneID) {
        var lst = document.getElementById("row_" + laneID).getElementsByTagName("td");
        for (var i = 0; i < lst.length; i++) {
            if (lst[i].id) {
                if (KanBan.StepList.length > 0) KanBan.StepList += ",";
                KanBan.StepList += lst[i].id;
            }
        }
    },
    'StepListRemove': function (laneID) {
        var newList = "";
        var lstAll = KanBan.StepList.split(",");
        var lst = document.getElementById("row_" + laneID).getElementsByTagName("td");
        var fire = false;
        for (var i = 0; i < lstAll.length; ++i) {
            fire = false;
            for (var j = 0; j < lst.length; ++j) {
                if (lst[j] == lstAll[i]) {
                    fire = true;
                    break;
                }
            }
            if (!fire) {
                if (newList.length > 0) newList += ",";
                newList += lstAll[i];
            }
        }
        KanBan.StepList = newList;
    },
    'StoryListAdd': function (storyID) {
        if (KanBan.StoryList.length > 0) KanBan.StoryList += ",";
        KanBan.StoryList += ("divStory_" + storyID);
    },
    'StoryListRemove': function (storyID) {
        var newList = "";
        var list = KanBan.StoryList.split(",");
        for (var i = 0; i < list.length; ++i) {
            if (list[i] != ("divStory_" + storyID)) {
                if (newList.length > 0) newList += ",";
                newList += list[i];
            }
        }
        KanBan.StoryList = newList;
    },
    'CalStepPos': function () {
        var list = KanBan.StepList.split(",");
        for (var i = 0; i < list.length; ++i) {
            var tempNode = document.getElementById(list[i]);
            if (tempNode) {
                tempNode.setAttribute("posTop", ApoJS.Base.FindOffsetTop(tempNode));
                tempNode.setAttribute("posLeft", ApoJS.Base.FindOffsetLeft(tempNode));
            }
        }
    },
    'CalStoryPos': function () {
        var list = KanBan.StoryList.split(",");
        for (var i = 0; i < list.length; ++i) {
            var tempNode = document.getElementById(list[i]);
            if (tempNode) {
                tempNode.setAttribute("posTop", ApoJS.Base.FindOffsetTop(tempNode));
                tempNode.setAttribute("posLeft", ApoJS.Base.FindOffsetLeft(tempNode));
            }
        }
    },
    'CalSingleStoryPos': function (id) {
        var tempNode = document.getElementById(id);
        tempNode.setAttribute("posTop", ApoJS.Base.FindOffsetTop(tempNode));
        tempNode.setAttribute("posLeft", ApoJS.Base.FindOffsetLeft(tempNode));
    },
    'InitStory': function (id) {
        var objStory = document.getElementById(id);

        objStory.setAttribute("rowID", objStory.parentNode.parentNode.id);

        objStory.onselectstart = function () {
            return false;
        };

        objStory.onmousedown = function (evt, handler) {
            var objContainer = document.getElementById("divPage");
            if (evt) {
                if (evt.preventDefault) evt.preventDefault();
                if (evt.preventMouseEvent) evt.preventMouseEvent();
                if (evt.preventManipulation) evt.preventManipulation();
            }
            else {
                evt = window.event;
            }

            if (ApoJS.Base.GetOS() == 1) {
                if (evt.button != 1 && evt.button != 0) return;
            }
            else if (!evt.touches) {
                if (evt.button != 0) return;
            }

            // disable hover
            KanBan.StopHoverOver();

            if (KanBan.IsMoving) return;
            KanBan.IsMoving = true;
            KanBan.StoryOnAir = document.getElementById(id);
            KanBan.StoryOnAir.style.position = "absolute";

            ApoJS.Base.SetOpacity(KanBan.StoryOnAir, 0.8);
            KanBan.StoryOnAir.orginClass = KanBan.StoryOnAir.className;
            KanBan.StoryOnAir.className = KanBan.StoryOnAir.className + "_shadow";
            document.onmouseup = KanBan.StoryOnAir.onmouseup;
            document.onmousemove = KanBan.StoryOnAir.onmousemove;

            KanBan.CalStepPos();
            KanBan.CalSingleStoryPos(KanBan.StoryOnAir.id);

            if (KanBan.IsTouch) {
                KanBan.StoryOnAir.style.left = (evt.pageX - KanBan.StoryOnAir.offsetWidth / 2) + "px";
                KanBan.StoryOnAir.style.top = (evt.pageY - 25) + "px";
            } else {
                KanBan.StoryOnAir.style.left = (evt.clientX - KanBan.StoryOnAir.offsetWidth / 2) + "px";
                KanBan.StoryOnAir.style.top = (evt.clientY - 25) + "px";
            }
            KanBan.RefreshLandStep((ApoJS.Base.FindOffsetLeft(KanBan.StoryOnAir) + objContainer.scrollLeft + KanBan.StoryOnAir.offsetWidth / 2), (ApoJS.Base.FindOffsetTop(KanBan.StoryOnAir) + objContainer.scrollTop + KanBan.StoryOnAir.offsetHeight / 2));
            return false;
        };

        objStory.onmouseup = function (evt, handler) {
            if (evt) {
                if (evt.preventDefault) evt.preventDefault();
                if (evt.preventMouseEvent) evt.preventMouseEvent();
                if (evt.preventManipulation) evt.preventManipulation();
            }
            else {
                evt = window.event;
            }

            if (ApoJS.Base.GetOS() == 1) {
                if (evt.button != 1 && evt.button != 0) return;
            }
            else if (!evt.touches) {
                if (evt.button != 0) return;
            }
            if (!KanBan.StoryOnAir) return;

            document.onmouseup = null;
            document.onmousemove = null;
            if (!KanBan.IsMoving) return;
            KanBan.IsMoving = false;

            if (KanBan.StepOnLand) {
                KanBan.StepOnLand.MoveOut();
                KanBan.StoryLand();
            }
            if (KanBan.StoryOnAir) {
                KanBan.StoryOnAir.className = KanBan.StoryOnAir.orginClass;
                KanBan.StoryOnAir.style.position = "static";
                KanBan.StoryOnAir.style.top = "auto";
                KanBan.StoryOnAir.style.left = "auto";
                ApoJS.Base.SetOpacity(KanBan.StoryOnAir, 1);
            }
            if (typeof KanBan_FixedHeader != "undefined") KanBan_FixedHeader.ResizeFloating();

            KanBan.StoryOnAir = null;
            KanBan.StepOnLand = null;

            KanBan.ClearPrevStep();
            KanBan.StopHoverOver();

            return false;
        };

        objStory.onmousemove = function (evt, handler) {
            var objContainer = document.getElementById("divPage");
            var objTable = document.getElementById("tblKanban");
            if (evt) {
                if (evt.preventDefault) evt.preventDefault();
                if (evt.preventMouseEvent) evt.preventMouseEvent();
                if (evt.preventManipulation) evt.preventManipulation();
            }
            else {
                evt = window.event;
            }

            KanBan.HoverEvt = evt;

            if (KanBan.IsHover) {
                if (KanBan.IsMoving) {
                    KanBan.StopHoverOver();
                } else {
                    KanBan.MoveHoverOver();
                }
                return;
            }
            if (!KanBan.StoryOnAir || !KanBan.IsMoving) return;
            if (KanBan.IsTouch) {
                KanBan.StoryOnAir.style.left = (evt.pageX - KanBan.StoryOnAir.offsetWidth / 2) + "px";
                KanBan.StoryOnAir.style.top = (evt.pageY - 15) + "px";
            } else {
                KanBan.StoryOnAir.style.left = (evt.clientX - KanBan.StoryOnAir.offsetWidth / 2) + "px";
                KanBan.StoryOnAir.style.top = (evt.clientY - 15) + "px";
            }

            var nLeft = ApoJS.Base.FindOffsetLeft(KanBan.StoryOnAir);
            var nTop = ApoJS.Base.FindOffsetTop(KanBan.StoryOnAir);

            // scroll right
            if (objContainer.clientWidth > KanBan.AutoScrollWidth
                && nLeft > (objContainer.clientWidth - KanBan.AutoScrollWidth)
                && objTable.offsetWidth > (nLeft - KanBan.AutoScrollWidth + objContainer.scrollLeft)) {
                if (!KanBan.AutoScrollRightTimer) {
                    KanBan.AutoScrollRightTimer = setInterval(function () {
                        if (KanBan.StoryOnAir && KanBan.IsMoving) {
                            var objContainer = document.getElementById("divPage");
                            var objTable = document.getElementById("tblKanban");
                            var nLeft = ApoJS.Base.FindOffsetLeft(KanBan.StoryOnAir);

                            if (objContainer.clientWidth > KanBan.AutoScrollWidth
                                && nLeft > (objContainer.clientWidth - KanBan.AutoScrollWidth)
                                && objTable.offsetWidth > (nLeft - KanBan.AutoScrollWidth + objContainer.scrollLeft)) {
                                objContainer.scrollLeft += KanBan.AutoScrollSpeed;
                                return;
                            }
                        }
                        clearInterval(KanBan.AutoScrollRightTimer);
                        KanBan.AutoScrollRightTimer = null;
                    }, 25);
                }
            } else {
                if (KanBan.AutoScrollRightTimer) {
                    clearInterval(KanBan.AutoScrollRightTimer);
                    KanBan.AutoScrollRightTimer = null;
                }
            }
            // scroll left
            if (nLeft < KanBan.AutoScrollWidth
                && objContainer.scrollLeft > 0) {
                if (!KanBan.AutoScrollLeftTimer) {
                    KanBan.AutoScrollLeftTimer = setInterval(function () {
                        if (KanBan.StoryOnAir && KanBan.IsMoving) {
                            var objContainer = document.getElementById("divPage");
                            var nLeft = ApoJS.Base.FindOffsetLeft(KanBan.StoryOnAir);

                            if (nLeft < KanBan.AutoScrollWidth
                                && objContainer.scrollLeft > 0) {
                                if (objContainer.scrollLeft > KanBan.AutoScrollSpeed)
                                    objContainer.scrollLeft -= KanBan.AutoScrollSpeed;
                                else
                                    objContainer.scrollLeft = 0;
                                return;
                            }
                        }
                        clearInterval(KanBan.AutoScrollLeftTimer)
                        KanBan.AutoScrollLeftTimer = null;
                    }, 25);
                }
            } else {
                if (KanBan.AutoScrollLeftTimer) {
                    clearInterval(KanBan.AutoScrollLeftTimer);
                    KanBan.AutoScrollLeftTimer = null;
                }
            }


            KanBan.RefreshLandStep((nLeft + objContainer.scrollLeft + KanBan.StoryOnAir.offsetWidth / 2), (nTop + objContainer.scrollTop + KanBan.StoryOnAir.offsetHeight / 2));
            return false;
        };

        objStory.onmouseover = function (evt, handler) {
            if (KanBan.IsTouch) return;
            if (ApoJS.Base.IsMouseHover(evt, document.getElementById(id))) {
                KanBan.StoryOnLand = document.getElementById(id);
                KanBan.HoverTimer = setTimeout(function () { KanBan.ShowHoverOver(); }, 300);
            }
        };

        objStory.onmouseout = function (evt, handler) {
            if (ApoJS.Base.IsMouseHover(evt, document.getElementById(id))) {
                KanBan.IsHover = false;
                KanBan.StoryOnLand = null;
                clearTimeout(KanBan.HoverTimer);
                KanBan.HideHoverOver();
            }
        };

        objStory.onMSPointerDown = function (evt) {
            KanBan.IsTouch = true;
            this.touch_evt = evt;
            this.touch_timer = setTimeout("document.getElementById('" + this.id + "').onmousedown(document.getElementById('" + this.id + "').touch_evt);", 400);
            return false;
        }
        objStory.ontouchstart = function (evt) {
            KanBan.IsTouch = true;
            this.touch_evt = evt;
            this.touch_timer = setTimeout("document.getElementById('" + this.id + "').onmousedown(document.getElementById('" + this.id + "').touch_evt);", 400);
            return false;
        };
        objStory.ontouchend = function (evt) {
            clearTimeout(this.touch_timer);
            this.onmouseup(evt);
            KanBan.IsTouch = false;
        };
        objStory.ontouchmove = objStory.onmousemove;
    },
    'InitStep': function (id) {
        var objStep = document.getElementById(id);
        objStep.setAttribute("rowID", objStep.parentNode.id);

        objStep.MoveOn = function () {
            if (!KanBan.StoryOnAir) return;

            KanBan.StepTimerTmp = setTimeout("ApoJS.Animation.SetBGColor(document.getElementById('" + KanBan.StepOnLand.id + "'), [255, 255, 255], [107, 241, 226], 25, 20, 0.5, function(){ ApoJS.Animation.SetBGColor(document.getElementById('" + KanBan.StepOnLand.id + "'), [107, 241, 226], [255, 255, 255], 25, 20, 0.5, null);});", 200);
            KanBan.StepTimer = setInterval("ApoJS.Animation.SetBGColor(document.getElementById('" + KanBan.StepOnLand.id + "'), [255, 255, 255], [107, 241, 226], 25, 20, 0.5, function(){ ApoJS.Animation.SetBGColor(document.getElementById('" + KanBan.StepOnLand.id + "'), [107, 241, 226], [255, 255, 255], 25, 20, 0.5, null);});", 1500);
        };

        objStep.MoveOut = function () {
            if (!KanBan.StoryOnAir) return;

            KanBan.ClearPrevStep();
        };
    },
    'RefreshLandStep': function (x, y) {
        var list = KanBan.StepList.split(",");
        var tempNode, posTop, posLeft, posWidth, posHeight;
        for (var i = 0; i < list.length; ++i) {
            tempNode = document.getElementById(list[i]);
            if (tempNode && tempNode.getAttribute("rowID") == KanBan.StoryOnAir.getAttribute("rowID")) {
                posTop = parseInt(tempNode.getAttribute("posTop"));
                posLeft = parseInt(tempNode.getAttribute("posLeft"));
                posHeight = tempNode.offsetHeight;
                posWidth = tempNode.offsetWidth;

                if (x >= posLeft &&
                y >= posTop &&
                x <= posLeft + posWidth &&
                y <= posTop + posHeight) {
                    if (KanBan.StepOnLand) {
                        if (KanBan.StepOnLand.id != tempNode.id) {
                            KanBan.StepOnLand.MoveOut();
                            KanBan.StepOnLand = tempNode;
                            KanBan.StepOnLand.MoveOn();
                        }
                    } else {
                        KanBan.StepOnLand = tempNode;
                        KanBan.StepOnLand.MoveOn();
                    }
                }
            }
        }
    },
    'ClearPrevStep': function () {
        clearTimeout(KanBan.StepTimerTmp);
        clearInterval(KanBan.StepTimer);
    },
    'ViewDetail': function (id, evt) {
        var e = (evt) ? evt : window.event;
        if (window.event) {
            e.cancelBubble = true;
        } else {
            e.stopPropagation();
        }
        KanBan.CUR_FRAME = 1;
        KanBan.UpdateStory(id);
    },
    'StoryLand': function () {
        if (!KanBan.StepOnLand || !KanBan.StoryOnAir) return;
        KanBan.StoryOnAir.parentNode.removeChild(KanBan.StoryOnAir);
        KanBan.StepOnLand.appendChild(KanBan.StoryOnAir);
        KanBan.UpdateStoryStatus(KanBan.StoryOnAir.id, KanBan.StepOnLand.id);
    },
    'AddLane': function (laneID, laneTitle) {
        var objKanBan = document.getElementById("tblKanban");
        if (objKanBan) {
            var objTR = document.createElement("tr");
            var objTD, ele, objF;
            var list
            objTR.className = "StoryRow";
            objTR.id = "row_" + laneID;

            objTD = document.createElement("td");
            objTD.className = "FirstColumn";

            try {
                objF = document.createElement("<div name='FloatingColumn' ></div>");
                objF.id = "FloatingColumn";
                objF.className = "FloatingColumn";
            } catch (e) {
                objF = document.createElement("div");
                objF.id = "FloatingColumn";
                objF.setAttribute("name", "FloatingColumn");
                objF.className = "FloatingColumn";
            }

            ele = document.createElement("div");
            ele.className = "StoryRow_Title";
            ele.id = "row_title_" + laneID;
            ele.innerText = laneTitle;
            objF.appendChild(ele);
            ele = document.createElement("div");
            ele.className = "StoryRow_Conf";
            ele.innerHTML = "<img alt=\"config\" src=\"./Images/add.png\" onclick=\"KanBan.NewStoryClient(" + laneID + ");\" /><img alt=\"config\" src=\"./Images/conf.png\" onclick=\"KanBan.UpdateLane(" + laneID + ");\" />";
            objF.appendChild(ele);
            objTD.appendChild(objF);
            objTR.appendChild(objTD);
            list = KanBan.ColumnList.split(",");
            for (var i = 0; i < list.length; ++i) {
                objTD = document.createElement("td");
                objTD.id = "cell_" + list[i] + "_" + laneID;
                objTR.appendChild(objTD);
            }

            objKanBan.appendChild(objTR);

            // refresh floating
            if (typeof KanBan_FixedHeader != "undefined")
                KanBan_FixedHeader.InitArr();

            ApoJS.Base.SetOpacity(document.getElementById("row_title_" + laneID), 0);
            ApoJS.Animation.SetOpacity(document.getElementById("row_title_" + laneID), 0, 1, 40, 25, 0.5, function () {
                var lst = document.getElementById("row_" + laneID).getElementsByTagName("td");
                KanBan.StepListAdd(laneID);
                for (var i = 0; i < lst.length; i++) {
                    if (lst[i].id) {
                        KanBan.InitStep(lst[i].id);
                    }
                }
            });
        }
    },
    'RefreshLane': function (laneID, laneTitle) {
        var ele = document.getElementById("row_title_" + laneID);
        if (ele) {
            ele.innerText = laneTitle;
        }
    },
    'RemoveLane': function (laneID) {
        var objLane = document.getElementById("row_" + laneID);
        if (objLane) {
            objLane.style.height = objLane.offsetHeight + "px";
            var lst = objLane.getElementsByTagName("td");
            for (var i = 0; i < lst.length; i++) {
                lst[i].innerHTML = "";
            }
            objLane.className = "DelStoryRow";
            ApoJS.Animation.SetHeight(objLane, objLane.offsetHeight, 0, 15, 25, 0.5, function () {
                KanBan.StepListRemove(laneID);
                var obj = document.getElementById("row_" + laneID);
                if (obj) obj.parentNode.removeChild(obj);
                // refresh floating
                if (typeof KanBan_FixedHeader != "undefined")
                    KanBan_FixedHeader.InitArr();
            });
        }
    },
    'CloseLane': function (func) {
        var objLane = document.getElementById("divLane");
        if (objLane) {
            objLane.style.display = "none";
        }
        KanBan.HideMask(func);
    },
    'ShowLane': function () {
        var objLane = document.getElementById("divLane");
        if (objLane) {
            KanBan.ShowMask(function () {
                document.getElementById("divLane").style.display = "";
            });
        }
    },
    'NewLaneClient': function () {
    },
    'UpdateLane': function (laneID) {
    },
    'ClearLane': function () {
    },
    'AddStory': function (laneID, status, storyID, cssClass, title, content, hover, tfslink, strDue) {
        var strID = "cell_" + status + "_" + laneID;
        var objStep = document.getElementById(strID);
        if (objStep) {
            var objDiv, objEle;
            try {
                objDiv = document.createElement("<div name='divStory_" + storyID + "' ></div>");
                objDiv.id = "divStory_" + storyID;
                objDiv.className = cssClass;
            } catch (e) {
                objDiv = document.createElement('div');
                objDiv.id = "divStory_" + storyID;
                objDiv.setAttribute("name", "divStory_" + storyID);
                objDiv.className = cssClass;
            }

            obj = document.createElement("div");
            obj.id = "divStory_title_" + storyID;
            obj.className = "StoryDiv_Title";
            obj.style.top = "0px";
            obj.style.left = "0px;"
            obj.innerText = title;
            objDiv.appendChild(obj);
            obj = document.createElement("div");
            obj.id = "divStory_content_" + storyID;
            obj.className = "StoryDiv_Content";
            obj.style.top = "0px";
            obj.style.left = "0px;"
            obj.innerHTML = content;
            objDiv.appendChild(obj);
            obj = document.createElement("div");
            obj.className = "StoryDiv_Footer";
            obj.style.top = "0px";
            obj.style.left = "0px;"
            obj.innerHTML = "<div id=\"divStory_due_" + storyID + "\" class=\"StoryDiv_ViewDetail_left\">" + strDue + "</div>";
            obj.innerHTML += "<a class=\"StoryDiv_ViewDetail\" href=\"#\" ontouchstart=\"KanBan.ViewDetail(" + storyID + ", event);return false;\" onmousedown=\"KanBan.ViewDetail(" + storyID + ", event);return false;\">Detail</a>";
            if (tfslink && tfslink != "#") {
                obj.innerHTML += "<a  id=\"divStory_tfslink_" + storyID + "\" class=\"StoryDiv_ViewDetail\" href=\"" + tfslink + "\" target=\"_blank\" ontouchstart=\"ApoJS.Base.StopBubble();return false;\" onmousedown=\"ApoJS.Base.StopBubble();return false;\">TFS</a>";
            } else {
                obj.innerHTML += "<a  id=\"divStory_tfslink_" + storyID + "\" class=\"StoryDiv_ViewDetail\" style=\"display:none;\" href=\"" + tfslink + "\" target=\"_blank\" ontouchstart=\"ApoJS.Base.StopBubble();return false;\" onmousedown=\"ApoJS.Base.StopBubble();return false;\">TFS</a>";
            }
            objDiv.appendChild(obj);
            obj = document.createElement("div");
            obj.id = "divStory_" + storyID + "_Hover";
            obj.className = "StoryDiv_Hover";
            obj.innerHTML = hover;
            objDiv.appendChild(obj);
            objStep.appendChild(objDiv);

            if (typeof KanBan_FixedHeader != "undefined") KanBan_FixedHeader.ResizeFloating();

            ApoJS.Base.SetOpacity(objDiv, 0);
            ApoJS.Animation.SetOpacity(objDiv, 0, 1, 35, 20, 0.5, function () {
                KanBan.StoryListAdd(storyID);
                KanBan.InitStory("divStory_" + storyID);
            });
        }
    },
    'RefreshStoryAry': function (laneID, status, storyID, cssClass, title, content, hover, tfslink, strDue) {
        var arr = document.getElementsByName("divStory_" + storyID);
        var obj;
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            obj.className = cssClass;
        }
        arr = document.getElementsByName("divStory_title_" + storyID);
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            obj.innerHTML = title;
        }
        arr = document.getElementsByName("divStory_content_" + storyID);
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            obj.innerHTML = content;
        }
        arr = document.getElementsByName("divStory_tfslink_" + storyID);
        for (var i = 0; i < arr.length; i++) {
            if (tfslink && tfslink != "#") {
                arr[i].style.display = "";
                arr[i].href = tfslink;
            } else {
                arr[i].style.display = "none";
                arr[i].href = "#";
            }
        }
        arr = document.getElementsByName("divStory_due_" + storyID);
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            obj.innerHTML = strDue;
        }

        arr = document.getElementsByName("divStory_" + storyID + "_Hover");
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            if (obj) obj.innerHTML = hover;
        }
    },
    'RefreshStory': function (laneID, status, storyID, cssClass, title, content, hover, tfslink, strDue) {
        var obj = document.getElementById("divStory_" + storyID);
        if (!obj) return;
        obj.className = cssClass;
        obj = document.getElementById("divStory_title_" + storyID);
        obj.innerHTML = title;
        obj = document.getElementById("divStory_content_" + storyID);
        obj.innerHTML = content;
        obj = document.getElementById("divStory_tfslink_" + storyID);
        if (tfslink && tfslink != "#") {
            obj.style.display = "";
            obj.href = tfslink;
        } else {
            obj.style.display = "none";
            obj.href = "#";
        }
        obj = document.getElementById("divStory_due_" + storyID);
        obj.innerHTML = strDue;

        obj = document.getElementById("divStory_" + storyID + "_Hover");
        if (obj) obj.innerHTML = hover;
    },
    'RefreshStoryFloating': function (storyID, nStay, nLife) {
        var obj = document.getElementById("divStory_StayDay_" + storyID);
        if (obj)
            obj.innerHTML = nStay;
        obj = document.getElementById("divStory_LifeDay_" + storyID);
        if (obj)
            obj.innerHTML = nLife;

    },
    'RemoveStoryAry': function (storyID) {
        var arr = document.getElementsByName("divStory_" + storyID);
        for (var i = 0; i < arr.length; i++) {
            ApoJS.Animation.SetOpacity(arr[i], 1, 0, 35, 20, 0.5, function () {
                var ary = document.getElementsByName("divStory_" + storyID);
                for (var j = 0; j < ary.length; j++) {
                    ary[j].parentNode.removeChild(ary[j]);
                }
            });
        }
        KanBan.StoryListRemove(storyID);
    },
    'RemoveStory': function (storyID) {
        var obj = document.getElementById("divStory_" + storyID);
        if (!obj) return;

        ApoJS.Animation.SetOpacity(obj, 1, 0, 35, 20, 0.5, function () {
            KanBan.StoryListRemove(storyID);
            var obj = document.getElementById("divStory_" + storyID);
            if (obj) obj.parentNode.removeChild(obj);
        });
    },
    'UpdateStoryStatus': function (storyClientID, setpClientID) {
    },
    'UpdateStory': function (storyID) {
    },
    'CloseStory': function (func) {
        var objStory = document.getElementById("divStory");
        if (objStory) {
            objStory.style.display = "none";
        }
        KanBan.HideMask(func);
    },
    'ShowStory': function () {
        var objStory = document.getElementById("divStory");
        if (objStory) {
            KanBan.ShowMask(function () {
                document.getElementById("divStory").style.display = "";
            });
        }
    },
    'NewStoryClient': function (laneID) {
    },
    'UpdateStory': function (storyID) {
    },
    'ClearStory': function () {
    },
    'UpdateKanBan': function (kanbanID) {
    },
    'ClearKanBan': function () {
    },
    'RefreshKanBan': function (kanbanID, title) {
        var objKanBanTitle = document.getElementById("kanban_Title_" + kanbanID);
        if (objKanBanTitle) {
            objKanBanTitle.innerText = title;
        }
    },
    'CloseKanBan': function (func) {
        var objStory = document.getElementById("divKanBan");
        if (objStory) {
            objStory.style.display = "none";
        }
        KanBan.HideMask(func);
    },
    'ShowKanBan': function () {
        var objKanBan = document.getElementById("divKanBan");
        if (objKanBan) {
            KanBan.ShowMask(function () {
                document.getElementById("divKanBan").style.display = "";
            });
        }
    },
    'ShowMask': function (callback) {
        var objMask = document.getElementById("KanBanMask");
        if (objMask) {
            objMask.style.display = "";
            ApoJS.Animation.SetOpacity(objMask, 0, 0.6, 15, 20, 0.5, callback);

        }
    },
    'HideMask': function (callback) {
        var objMask = document.getElementById("KanBanMask");
        if (objMask) {
            ApoJS.Animation.SetOpacity(objMask, 0.6, 0, 15, 20, 0.5, function () {
                document.getElementById("KanBanMask").style.display = "none";
                if (callback) callback();
            });
        }
    },
    'ShowHoverOver': function () {
        var div = document.getElementById("divHover");
        var content = document.getElementById(KanBan.StoryOnLand.id + "_Hover");
        var rate = ApoJS.Base.ZoomRate();
        var evt = KanBan.HoverEvt;
        if (div) {
            if (rate < 0.3) {
                div.className = "StoryDiv_Hover_5";
            } else if (rate < 0.5) {
                div.className = "StoryDiv_Hover_4";
            } else if (rate < 0.75) {
                div.className = "StoryDiv_Hover_3";
            } else if (rate < 0.95) {
                div.className = "StoryDiv_Hover_2";
            } else {
                div.className = "StoryDiv_Hover_1";
            }
            if (content) {
                div.innerHTML = content.innerHTML;
                KanBan.IsHover = true;
                KanBan.MoveHoverOver(evt);
            }
        }
    },
    'MoveHoverOver': function () {
        if (!KanBan.IsHover) return;

        var evt = KanBan.HoverEvt;
        var div = document.getElementById("divHover");
        var nX, nY;
        if (div) {
            if (evt.pageX) {
                nX = evt.pageX;
                nY = evt.pageY;
            } else {
                nX = evt.clientX;
                nY = evt.clientY;
            }
            nX += 10;
            nY += 10;
            div.style.left = nX + "px";
            div.style.top = nY + "px";
            div.style.display = "";
        }
    },
    'StopHoverOver': function () {
        KanBan.IsHover = false;
        KanBan.StoryOnLand = null;
        clearTimeout(KanBan.HoverTimer);
        KanBan.HideHoverOver();
    },
    'HideHoverOver': function () {
        var div = document.getElementById("divHover");
        if (div)
            div.style.display = "none";
    },
    'CUR_FRAME': 1,
    'FRAME_NUM': 0,
    'FRAME_WIDTH': 0,
    'SlideLeft': function () {
        var objBody = document.getElementById("divStory_Body");
        if (KanBan.CUR_FRAME > 1 && KanBan.FRAME_WIDTH && objBody) {
            ApoJS.Animation.SetScrollLeft(objBody,
                (KanBan.CUR_FRAME - 1) * KanBan.FRAME_WIDTH,
                (KanBan.CUR_FRAME - 2) * KanBan.FRAME_WIDTH,
                15, 20, 0.5);
            KanBan.CUR_FRAME--;
        }
    },
    'SlideRight': function () {
        var objBody = document.getElementById("divStory_Body");
        if (KanBan.CUR_FRAME < KanBan.FRAME_NUM && KanBan.FRAME_WIDTH && objBody) {
            ApoJS.Animation.SetScrollLeft(objBody,
                (KanBan.CUR_FRAME - 1) * KanBan.FRAME_WIDTH,
                (KanBan.CUR_FRAME) * KanBan.FRAME_WIDTH,
                15, 20, 0.5);
            KanBan.CUR_FRAME++;
        }
    },
    'RemoveClientEvent': function (str) {
        return confirm('Do you want to remove ' + str + '?');
    },
    'FinishClientEvent': function (str) {
        return confirm('Do you want to finish ' + str + '?');
    },
    'PinClientEvent': function (str) {
        return confirm('Do you want to pin ' + str + '?');
    }
}