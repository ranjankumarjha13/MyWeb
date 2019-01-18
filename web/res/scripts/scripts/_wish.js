/**
 * Created by admin on 19-04-2018.
 */
var clWish = new function(){
    this.goodMorning = function(){
        var isValid = true;
        if(document.getElementById("t1").value == ""){
            isValid=false;
            document.getElementById("t1").style.border="1px solid red";
        }
        return isValid;
    };
    this.goodAfternoon = function(){
        var isValid = true;
        if(document.getElementById("t2").value == ""){
            isValid=false;
            document.getElementById("t2").style.border="1px solid red";
        }
        return isValid;
    };
    this.goodEvening = function(){
        var isValid = true;
        if(document.getElementById("t3").value == ""){
            isValid=false;
            document.getElementById("t3").style.border="1px solid red";
        }
        return isValid;
    };
    this.goodNight = function(){
        var isValid = true;
        if(document.getElementById("t4").value == ""){
            isValid=false;
            document.getElementById("t4").style.border="1px solid red";
        }
        return isValid;
    };
};