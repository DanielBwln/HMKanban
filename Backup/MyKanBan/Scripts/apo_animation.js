/**
  *@class: ApoJS.Base
  *@author:  Apo
  *@Desc: UI Animation
 **/
ApoJS.Animation = {
    'Animate': function (nStart, nEnd, nStep, nCurStep, nPowr) {
        var nDelta = nEnd - nStart;
        var nValue = nStart + (Math.pow(((1 / nStep) * nCurStep), nPowr) * nDelta);
        return Math.ceil(nValue);
    },
    'SetMarginLeft': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoMarginLeftAnimationTimer)
            clearInterval(obj.apoMarginLeftAnimationTimer);

        var nCurStep = 0;
        obj.style.marginLeft = nStart + "px";
        obj.curMLeft = nStart;
        obj.apoMarginLeftAnimationTimer = setInterval(
		function () {
		    obj.curMLeft = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr);
		    obj.style.marginLeft = obj.curMLeft + "px";
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.curMLeft = nEnd;
		        obj.style.marginLeft = obj.curMLeft + "px";
		        clearInterval(obj.apoMarginLeftAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetWidth': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoWidthAnimationTimer)
            clearInterval(obj.apoWidthAnimationTimer);

        var nCurStep = 0;
        obj.apoWidthAnimationTimer = setInterval(
		function () {
		    obj.currentWidth = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr);
		    obj.style.width = obj.currentWidth + "px";
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.currentWidth = nEnd;
		        obj.style.width = obj.currentWidth + "px";
		        clearInterval(obj.apoWidthAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetHeight': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoHeightAnimationTimer)
            clearInterval(obj.apoHeightAnimationTimer);

        var nCurStep = 0;
        obj.apoHeightAnimationTimer = setInterval(
		function () {
		    obj.currentHeight = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr);
		    obj.style.height = obj.currentHeight + "px";
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.currentHeight = nEnd;
		        obj.style.height = obj.currentHeight + "px";
		        clearInterval(obj.apoHeightAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetLeft': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoLeftAnimationTimer)
            clearInterval(obj.apoLeftAnimationTimer);

        var nCurStep = 0;
        obj.apoLeftAnimationTimer = setInterval(
		function () {
		    obj.style.left = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr) + "px";
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.style.left = nEnd;
		        clearInterval(obj.apoLeftAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetTop': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoTopAnimationTimer)
            clearInterval(obj.apoTopAnimationTimer);

        var nCurStep = 0;
        obj.apoTopAnimationTimer = setInterval(
		function () {
		    obj.style.top = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr) + "px";
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.style.top = nEnd;
		        clearInterval(obj.apoTopAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetScrollLeft': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoScrollLeftAnimationTimer)
            clearInterval(obj.apoScrollLeftAnimationTimer);

        var nCurStep = 0;
        obj.apoScrollLeftAnimationTimer = setInterval(
		    function () {
		        obj.scrollLeft = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr);
		        nCurStep++;
		        if (nCurStep > nStep) {
		            obj.scrollLeft = nEnd;
		            clearInterval(obj.apoScrollLeftAnimationTimer);
		            if (funcCall) funcCall();
		        }
		    }, nInterval);
    },
    'SetScrollTop': function (obj, nStart, nEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoScrollTopAnimationTimer)
            clearInterval(obj.apoScrollTopAnimationTimer);

        var nCurStep = 0;
        obj.apoScrollTopAnimationTimer = setInterval(
		    function () {
		        obj.scrollTop = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr);
		        nCurStep++;
		        if (nCurStep > nStep) {
		            obj.scrollTop = nEnd;
		            clearInterval(obj.apoScrollTopAnimationTimer);
		            if (funcCall) funcCall();
		        }
		    }, nInterval);
    },
    'SetColor': function (obj, aryStartRGB, aryEndRGB, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoColorAnimationTimer)
            clearInterval(obj.apoColorAnimationTimer);

        var nCurStep = 0;
        obj.apoColorAnimationTimer = setInterval(
		function () {
		    obj.style.color = "rgb(" + ApoJS.Animation.Animate(aryStartRGB[0], aryEndRGB[0], nStep, nCurStep, nPowr) + "," +
				ApoJS.Animation.Animate(aryStartRGB[1], aryEndRGB[1], nStep, nCurStep, nPowr) + "," +
				ApoJS.Animation.Animate(aryStartRGB[2], aryEndRGB[2], nStep, nCurStep, nPowr) + ")";
		    obj.curColor = [ApoJS.Animation.Animate(aryStartRGB[0], aryEndRGB[0], nStep, nCurStep, nPowr),
				ApoJS.Animation.Animate(aryStartRGB[1], aryEndRGB[1], nStep, nCurStep, nPowr),
				ApoJS.Animation.Animate(aryStartRGB[2], aryEndRGB[2], nStep, nCurStep, nPowr)];
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.style.color = "rgb(" + aryEndRGB[0] + "," +
					aryEndRGB[1] + "," +
					aryEndRGB[2] + ")";
		        obj.curColor = aryEndRGB;
		        clearInterval(obj.apoColorAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetBGColor': function (obj, aryStartRGB, aryEndRGB, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoBGColorAnimationTimer)
            clearInterval(obj.apoBGColorAnimationTimer);

        var nCurStep = 0;
        obj.apoBGColorAnimationTimer = setInterval(
		function () {
		    obj.style.backgroundColor = "rgb(" +
				ApoJS.Animation.Animate(aryStartRGB[0], aryEndRGB[0], nStep, nCurStep, nPowr) + "," +
				ApoJS.Animation.Animate(aryStartRGB[1], aryEndRGB[1], nStep, nCurStep, nPowr) + "," +
				ApoJS.Animation.Animate(aryStartRGB[2], aryEndRGB[2], nStep, nCurStep, nPowr) + ")";
		    obj.curBGColor = [ApoJS.Animation.Animate(aryStartRGB[0], aryEndRGB[0], nStep, nCurStep, nPowr),
				ApoJS.Animation.Animate(aryStartRGB[1], aryEndRGB[1], nStep, nCurStep, nPowr),
				ApoJS.Animation.Animate(aryStartRGB[2], aryEndRGB[2], nStep, nCurStep, nPowr)];
		    nCurStep++;
		    if (nCurStep > nStep) {
		        obj.style.backgroundColor = "rgb(" + aryEndRGB[0] + "," +
					aryEndRGB[1] + "," +
					aryEndRGB[2] + ")";
		        obj.curBGColor = aryEndRGB;
		        clearInterval(obj.apoBGColorAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetOpacity': function (obj, dStart, dEnd, nStep, nInterval, nPowr, funcCall) {
        if (obj.apoOpacityAnimationTimer)
            clearInterval(obj.apoOpacityAnimationTimer);

        var nCurStep = 0;
        var nRate = 1000;
        var nStart = Math.ceil(dStart * nRate);
        var nEnd = Math.ceil(dEnd * nRate);
        obj.apoOpacityAnimationTimer = setInterval(
		function () {
		    ApoJS.Base.SetOpacity(obj, ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr) / nRate);
		    obj.curOpacity = ApoJS.Animation.Animate(nStart, nEnd, nStep, nCurStep, nPowr) / nRate;
		    nCurStep++;
		    if (nCurStep > nStep) {
		        if (obj.curOpacity != dEnd) {
		            obj.curOpacity = dEnd;
		            ApoJS.Base.SetOpacity(obj, dEnd);
		        }
		        clearInterval(obj.apoOpacityAnimationTimer);
		        if (funcCall) funcCall();
		    }
		}, nInterval);
    },
    'SetImgRotate': function (objImg, objCanvas, nDegree, nStep, nInterval, nPowr, funcCall) {
        if (objImg.apoRotateAnimationTimer)
            clearInterval(objImg.apoRotateAnimationTimer);

        var nCurStep = 0;
        var nCurDegree = 0;
        if (objImg.APO_CUR_DEGREE) {
            nCurDegree = objImg.APO_CUR_DEGREE;
        } else {
            objImg.APO_CUR_DEGREE = 0;
        }

        objImg.apoRotateAnimationTimer = setInterval(
        function () {
            var nCurDegreeOffset = ApoJS.Animation.Animate(0, nDegree, nStep, nCurStep, nPowr);
            ApoJS.Base.SetCanvasImgRotate(objImg, objCanvas, nCurDegree + nCurDegreeOffset);
            nCurStep++;
            if (nCurStep > nStep) {
                objImg.APO_CUR_DEGREE += nDegree;
                ApoJS.Base.SetCanvasImgRotate(objImg, objCanvas, objImg.APO_CUR_DEGREE);
                clearInterval(objImg.apoRotateAnimationTimer);
                if (funcCall) funcCall();
            }
        }, nInterval);
    }
}
