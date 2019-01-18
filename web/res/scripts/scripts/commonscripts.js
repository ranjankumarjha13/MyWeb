
/*
  function checkInput(oTxt,iType) // Allows only specified type of values to be entered.
  function checkDateFormat(oTxt) // Allows values to be entered in date format.
  function RollOver(oRow) // Changes the row style when mouse is over
  function RollOut(oRow) // Changes the row style when mouse is moved out
  function Select(oRow) // Changes the row style when mouse is clicked
  function MoveToNext(oRow) // Changes the style when arrow keys are pressed  
*/

var TYPE_DISPLAY = 0;
var TYPE_STRING = 1;
var TYPE_NUMERIC = 2;
var TYPE_FLOAT = 3;
var TYPE_DATE = 4;
var TYPE_COMBOBOX = 5;//TYPE_COMBOBOX
var TYPE_CHECKBOX = 6;
var TYPE_RADIO = 7;
var TYPE_IMAGE = 8;
var TYPE_HIDDEN = 9;
var TYPE_SIMPLECOMBO = 10;
var TYPE_SPINFIELD = 11;
var TYPE_BUTTON = 12;
var TYPE_COMBOBOX2 = 13;
var TYPE_ACTIONS = 14;
var TYPE_SNOs = 15;
var TYPE_LONG = 16;
var TYPE_BYTE = 17;
var TYPE_SHORT = 18;
var TYPE_DATE_PICKER = 19;
var TYPE_TIME_PICKER = 20;
var TYPE_UPLOAD_FILE = 21;

//var TYPE_NUMERIC=2,TYPE_FLOAT=3,TYPE_DATE=4;



/**
  Allows values of type specified in parameter to be entered.
  @param objTxt -- TextField object
  @param iType -- Field type -- Default - 'string'
  values: string=1,numeric=2,float=3,date=4
**/
function checkInput(objTxt,iType,isAllowNegative,evt)
{
    var keycode;
    evt=evt?evt:window.event;
    
    /*if(window.event)
        evt = window.event;
    else
        evt = window.Event;*/

    keycode = evt.keyCode;
    var sValue;

    if(objTxt.getAttribute("cdatatype")!=null)
        iType=objTxt.getAttribute("cdatatype");    

    if (keycode != 9 && keycode != 16)
    {  //9-tab,16-shift+tab
        if (keycode != 37 && keycode != 39 && keycode != 8 && keycode != 46 && keycode != 36 && keycode != 35)
        {               // left arrow,right arrow, backspace, delete , Home , End
            if (iType == TYPE_STRING)
            {
                if(objTxt.getAttribute("maxlength")>0)
                {
                    if(objTxt.value.length == objTxt.getAttribute("maxlength"))
                    {
                        /*var sValue=objTxt.value;
                        objTxt.value = sValue.substring(0, objTxt.getAttribute("maxlength"));//sValue.length-1);*/
                        Validation.showMessage("Value reaches maximum limit",Validation.ERROR_MSG,objTxt);
                        setTimeout(cross.createCallbackFunc(null,clearValidationMessage,[objTxt]),2000);                           
                    }
                }
            }
            else if (iType == TYPE_NUMERIC || iType == TYPE_LONG || iType == TYPE_BYTE || iType == TYPE_SHORT )//Numeric
            {
                var sValue=objTxt.value;
                if(isAllowNegative)
                    sValue = sValue.replace(/([^\-0-9])/g, ""); //objTxt.value = objTxt.value.replace(/([^/\d])/g,"");
                else
                    sValue = sValue.replace(/([^0-9])/g, "");

                if (sValue.lastIndexOf("-") > 0)
                    sValue = sValue.substring(0, sValue.lastIndexOf("-"));

                var MIN,MAX;
                if(iType == TYPE_BYTE)
                {
                    MIN=-128;
                    MAX=127;
                }
                else if(iType == TYPE_SHORT)
                {
                    MIN=-32768;
                    MAX=32767;
                }
                else if(iType == TYPE_NUMERIC)
                {
                    MIN=-2147483648;
                    MAX=2147483647;
                }
                else if(iType == TYPE_LONG)
                {
                    MIN=-9223372036854775808;
                    MAX=9223372036854775807;
                }

                var iValue=parseInt(sValue,10);
                if(iValue < MIN || iValue > MAX)
                    sValue = sValue.substring(0, sValue.length-1);

                objTxt.value = sValue;

                    /*Validation.setValidationStatus(false,objTxt,null,true,false,Validation.ERROR_INVALID,Constants.CONTROLTYPE_TXTBOX);
                else
                    Validation.clearMessage(objTxt,false);*/
            }
            else if (iType == TYPE_FLOAT)//Float
            {
                sValue=util.parseNumberValue(objTxt.value);
                if(isAllowNegative)
                    sValue = sValue.replace(/([^.\-0-9])/g, "");
                else
                    sValue = sValue.replace(/([^.0-9])/g, "");

                if (sValue.lastIndexOf("-") > 0)
                    sValue = sValue.substring(0, sValue.lastIndexOf("-"));
                if (sValue.indexOf(".") != sValue.lastIndexOf("."))
                    sValue= sValue.substring(0, sValue.lastIndexOf("."));

                if(sValue > Number.MAX_SAFE_INTEGER)
                    sValue= sValue.substring(0, sValue.length-1);
                objTxt.value = sValue;

                //checkNoOfDecimals(objTxt,0);

            }
            else if (iType == TYPE_DATE)//date
            {
                //checkDateFormat(objTxt);
            }
        }
    }

    var isFormatNumber=objTxt.getAttribute("isFormatNumber")==1;

    if(isFormatNumber)
    {
        if (objTxt.value && (iType == TYPE_NUMERIC || iType == TYPE_FLOAT || iType == TYPE_LONG || iType == TYPE_BYTE || iType == TYPE_SHORT ))//Numeric
        {
            /*if(iType == TYPE_FLOAT)
            {
                if(objTxt.value!="-" && objTxt.value!=".")
                    objTxt.value = util.formatNumberToString(objTxt.value);
            }
            else*/
            if(!isNaN(objTxt.value))
                objTxt.value = util.formatNumberToString(objTxt.value);
        }
    }


    if(objTxt.nodeName!="TEXTAREA" && keycode==13) //enter key
    {
        
        if(typeof checkInput.fnCallback=="object")
        {
            //alert("calling.....");
            var fnCallback=checkInput.fnCallback[0];
            //var fnCallbackParams=checkInput.fnCallback[1];            
            fnCallback.apply(this, [objTxt,evt]);
            //fnCallback(objTxt,evt);
        }
        //cross.fireEvent2(objTxt, 'blur');
    }
}



function clearValidationMessage(objField)
{
    Validation.clearMessage(objField);
}

function checkNoOfDecimals(objInput,iNoOfDecimals)
{
    //alert(objInput.value+"-----------"+iNoOfDecimals+"-----------"+util.roundValue(objInput.value,iNoOfDecimals))
    var sValue=objInput.value.toString();
    sValue=util.parseNumberValue(sValue);

    if(!isNaN(sValue))// && !isNaN(objInput.value))
    {
        if(iNoOfDecimals <= 0)
            iNoOfDecimals=clAppBuffer.getNumOfDecimals();

        var isFormatNumber=objInput.getAttribute("isFormatNumber")==1;
        objInput.value=util.roundValue(sValue,iNoOfDecimals,isFormatNumber);
    }
}

function formatNumber(objInput)
{
    objInput.value=util.formatNumberToString(objInput.value);
}

