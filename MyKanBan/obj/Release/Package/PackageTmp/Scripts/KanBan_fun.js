var fun_timer;
var fun_head1;
var fun_head2;
var fun_head3;
var fun_head4;
var fun_body1;
var fun_body2;
var fun_body3;
var fun_body4;

function fun_init() {
    fun_head1 = document.getElementById("dwarf_head_1");
    fun_head2 = document.getElementById("dwarf_head_2");
    fun_head3 = document.getElementById("dwarf_head_3");
    fun_head4 = document.getElementById("dwarf_head_4");
    fun_body1 = document.getElementById("dwarf_body_1");
    fun_body2 = document.getElementById("dwarf_body_2");
    fun_body3 = document.getElementById("dwarf_body_3");
    fun_body4 = document.getElementById("dwarf_body_4");

    fun_head1.startBottom = -35;
    fun_body1.startBottom = -25;
    fun_head2.startBottom = -40;
    fun_body2.startBottom = -35;
    fun_head3.startBottom = -35;
    fun_body3.startBottom = -40;
    fun_head4.startBottom = -35;
    fun_body4.startBottom = -40;
    fun_head1.curBottom = -35;
    fun_body1.curBottom = -25;
    fun_head2.curBottom = -40;
    fun_body2.curBottom = -35;
    fun_head3.curBottom = -35;
    fun_body3.curBottom = -40;
    fun_head4.curBottom = -35;
    fun_body4.curBottom = -40;
    fun_head1.endBottom = 0;
    fun_body1.endBottom = 5;
    fun_head2.endBottom = -10;
    fun_body2.endBottom = -5;
    fun_head3.endBottom = -5;
    fun_body3.endBottom = 2;
    fun_head4.endBottom = 0;
    fun_body4.endBottom = 5;
}
function enfun() {
    var obj = document.getElementById("dwarfs");
    if (obj) {
        if (ApoJS.Base.GetOS() != ApoJS.Base.OS.IE || document.documentMode > 9) {
            obj.className = "dwarfs";
        } else {
            if (fun_timer)
                clearInterval(fun_timer);
            var fun_step = 5;
            fun_timer = setInterval(function () {
                var needNext = false;
                var objCon = [fun_body1, fun_body2, fun_body3, fun_body4, fun_head1, fun_head2, fun_head3, fun_head4];
                var obj;
                for (var i = 0; i < 8; ++i) {
                    if (i == 6) fun_step = 8;
                    else if (i == 5) fun_step = 3;
                    else if (i < 4) fun_step = 10;
                    else fun_step = 5;
                    obj = objCon[i];
                    if (obj.curBottom < obj.endBottom) {
                        obj.curBottom += fun_step;
                        if (obj.curBottom < obj.endBottom)
                            needNext = true;
                        else
                            obj.curBottom = obj.endBottom;
                        obj.style.bottom = obj.curBottom + "px";
                    }
                }
                if (!needNext) clearInterval(fun_timer);
            }, 20);
        }
    }
}

function disfun() {
    var obj = document.getElementById("dwarfs");
    if (obj) {
        if (ApoJS.Base.GetOS() != ApoJS.Base.OS.IE || document.documentMode > 9) {
            obj.className = "";
        } else {
            if (fun_timer)
                clearInterval(fun_timer);
            var fun_step = 5;
            fun_timer = setInterval(function () {
                var needNext = false;
                var objCon = [fun_body1, fun_body2, fun_body3, fun_body4, fun_head1, fun_head2, fun_head3, fun_head4];
                var obj;
                for (var i = 0; i < 8; ++i) {
                    if (i == 6) fun_step = 8;
                    else if (i == 5) fun_step = 3;
                    else if (i < 4) fun_step = 10;
                    else fun_step = 5;
                    obj = objCon[i];
                    if (obj.curBottom > obj.startBottom) {
                        obj.curBottom -= fun_step;
                        if (obj.curBottom > obj.startBottom)
                            needNext = true;
                        else
                            obj.curBottom = obj.startBottom;
                        obj.style.bottom = obj.curBottom + "px";
                    }
                }
                if (!needNext) clearInterval(fun_timer);
            }, 20);
        }
    }
}