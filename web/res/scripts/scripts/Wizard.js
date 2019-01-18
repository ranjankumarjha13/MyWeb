/**
 * Created by Tapas on 18-04-2018.
 */
var clWizard = new function(){
    var iLastIndex;
    var iStartIndex;
    var iStepCntl;
    var iPrevStep;
    var switchBtn=true;

    this.initialize = function(iStep,iLast){
        iStartIndex = iStep;
        iLastIndex = iLast;
        iStepCntl = iStep;
        iPrevStep = iStep;
    };
    this.onLoadContent = function(iStart,iLast){
        this.initialize(iStart,iLast);

        document.getElementById("content-" + iStart).style.display="block";
        document.getElementById("step-" + iStart).style.background="#006c9d";
        document.getElementById("btn-previous").style.display="none";
        document.getElementById("btn-finish").style.display="none";
    };
    this.eventHandler = function(sFnName)
    {
        var sReturn=true;
        if (util.trim(sFnName).length > 0)
        {
            var fnRef=sFnName.substring(0,sFnName.indexOf("("));
            var sParams=sFnName.substring(sFnName.indexOf("(")+1,sFnName.indexOf(")"));
            sParams = sParams.split(",");

            sReturn = cross.callFunction(window, eval(fnRef), sParams);

        }

        return sReturn;
    };

    this.onClkGetCurrentStep = function(iStep){
        switchBtn = true;
        iStepCntl = iStep;
            this.navigateSteps(iStep);
    };
    this.onClkNext = function(){
        iStepCntl = iStepCntl+1;
        switchBtn = false;
        while(true){
            if(document.getElementById("content-" + iStepCntl)==null){
                iStepCntl = iStepCntl + 1;
                break;
            }
            else{
                break;
            }
        }
        this.navigateSteps(iStepCntl);

    };
    this.onClkPrevious = function(){
        iStepCntl = iStepCntl-1;
        switchBtn = false;
        while(true){
            if(document.getElementById("content-" + iStepCntl)==null){
                iStepCntl = iStepCntl - 1;
                break;
            }
            else{
                break;
            }
        }
        this.navigateSteps(iStepCntl);

    };

    this.navigateSteps = function(iStep){

        var check = true;
        if(iStep >= iPrevStep)
            check = this.onValidate(iStep);
        else if(iStep <= iPrevStep )
            check = true;

        if(check){
            var i = iStartIndex;

            document.getElementById("content").style.display="none";
            document.getElementById("content-" + iPrevStep).style.display="none";
            document.getElementById("step-" + iPrevStep).style.background="#009de4";

            document.getElementById("content").style.display="block";
            document.getElementById("content-" + iStep).style.display="block";
            document.getElementById("step-" + iStep).style.background="#006c9d";

            if(iStep == 0)
                document.getElementById("btn-previous").style.display="none";
            else
                document.getElementById("btn-previous").style.display="block";

            if(iStep == (iLastIndex-1)){
                document.getElementById("btn-finish").style.display="block";
                document.getElementById("btn-next").style.display="none";
            }
            else{
                document.getElementById("btn-next").style.display="block";
                document.getElementById("btn-finish").style.display="none";
            }
            iPrevStep = iStep;
        }
        else{
            iStepCntl = iStepCntl - 1;
        }

    };
    this.onValidate = function(iStep){
        var isValid = true;
        var sMethodName;
        if(switchBtn){
            isValid = this.isValid(iPrevStep);
        }
        else{
            if(iStep != 0)
                iStep = iStep-1;
                isValid = this.isValid(iStep);
        }
        return isValid;
    };

    /* TODO # isValid() definition can be changed by programmer requirement ! */

    this.isValid = function(index){
        var isValid = true;
        /*sMethodName = document.getElementById("content-" + iPrevStep).getAttribute("onvalidate");
        isValid = this.eventHandler(sMethodName);*/
        return isValid;
    }

    this.onClkFinish = function(){
        if(clWish.goodNight())
        alert("Finish !");
        else
        alert("Try Again !");
    };
};