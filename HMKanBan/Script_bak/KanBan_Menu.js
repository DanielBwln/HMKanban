var KanBan_Menu={"PIN_MENU":"","PIN_MENUGROUP":"","REMOVE_MENU":"","PinTimer":null,"RemoveTimer":null,"Pin":function(B,A){if(KanBan_Menu.RemoveTimer&&KanBan_Menu.REMOVE_MENU==A){clearTimeout(KanBan_Menu.RemoveTimer);KanBan_Menu.RemoveTimer=null;KanBan_Menu.REMOVE_MENU=""}else{if(!KanBan_Menu.PinTimer){KanBan_Menu.PIN_MENU=A;KanBan_Menu.PIN_MENUGROUP=B;KanBan_Menu.PinTimer=setTimeout(KanBan_Menu.Display,200)}}},"Remove":function(A){if(KanBan_Menu.PinTimer){clearTimeout(KanBan_Menu.PinTimer);KanBan_Menu.PinTimer=null;KanBan_Menu.PIN_MENU="";KanBan_Menu.PIN_MENUGROUP=""}else{KanBan_Menu.REMOVE_MENU=A;KanBan_Menu.RemoveTimer=setTimeout("KanBan_Menu.Hide('"+A+"');",50)}},"Display":function(){var B=document.getElementById(KanBan_Menu.PIN_MENUGROUP);var F=document.getElementById(KanBan_Menu.PIN_MENU);var D=0,E=0,C=0;var A;A=F.firstChild;while(A){if(A.nodeName=="DIV"&&A.className!="clear"){C++}A=A.nextSibling}D=ApoJS.Base.FindOffsetLeft(B);E=ApoJS.Base.FindOffsetTop(B)+B.offsetHeight;F.style.top=E+"px";F.style.left=(D-5)+"px";F.style.height="0px";F.style.display="";if(ApoJS.Base.GetOS()!=ApoJS.Base.OS.IE||document.documentMode>9){F.style.height=(C*40+3)+"px"}else{ApoJS.Animation.SetHeight(F,0,(C*40+3),10,25,0.5,null)}KanBan_Menu.PIN_MENU="";KanBan_Menu.PIN_MENUGROUP="";KanBan_Menu.PinTimer=null},"Hide":function(A){var B=document.getElementById(A);B.style.display="none";B.style.height="0px";KanBan_Menu.REMOVE_MENU="";KanBan_Menu.RemoveTimer=null}};