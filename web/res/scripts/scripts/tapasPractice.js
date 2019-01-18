/**
 * Created by admin on 13-03-2018.
 */
var clTapas=new function() {


    this.getEditDialog = function () {
        var arrActions, clDlg, sUrl;
        arrActions = new Array();
        arrActions[0] = "Ok|clBatchDetails.onClkOk";
        arrActions[1] = "Cancel";//|parent.clBatchMaster.onClkHideDlg";
        sUrl = "";//url
        sUrl += "home!editBasicInfo.do";
        clDlg = new DialogBox("editBasicInfo", "Edit", 75, 75, 400, 360, sUrl, true, null, true, false, arrActions);
        clDlg.setCenter();
        clDlg.show();
    };
    /*this.onClkSaveEdit = function () {


        var sname = document.getElementById("sname");
        var sEmail = document.getElementById("sEmail");
        var sPhone = document.getElementById("sPhone");
        var sDob = document.getElementById("sDob");

        var isValid = false;


        isValid = Validation.checkMandatory(sname, "Name", 0, false);
        isValid = Validation.checkEMail(sEmail, "Email", false);
        isValid = Validation.checkMandatory(sPhone,"Phone",0,false);
        isValid = Validation.checkMandatory(sDob,"DOB",0,true);


        //var surl = "saveEditedBasicInfo!saveEditedBasicInfo.do?name="+sName.value+"&email="+sEmail.value+"&phone="+sPhone.value+"&gender="+sGender.value+"&dob="+sDob.value;
        if (isValid) {
            //parent.getDialogBox("editdialog").hide();
            //con.sendPostRequest(surl, null, null, null);
            document.getElementById("edit").submit();
        }

    };*/

    this.onClkSaveEdit = function () {
        document.getElementById("edit").submit();

        parent.getDialogBox("editBasicInfo").hide();

    };

    this.updatePassword = function(){
      var cp = document.getElementById("scPassword").value;
      var np = document.getElementById("snPassword").value;

      var isValid = false;
        isValid = Validation.checkMandatory(document.getElementById("snPassword"),"New Password",0,true);
        if(cp==np)
            isValid=false;
        if(isValid){
            var sUrl = "home!updatePassword.do?cp="+cp+"&np="+np;
            callAJAX.sendRequestAJAX("POST",sUrl,"resPassword");
        }
        else{
            document.getElementById("resPassword").innerHTML="Your new password should not match with current password";
        }

    };

    this.registerStudent = function(){
        document.getElementById("sRes").innerHTML="";
        var isValid = false;
        var sName = document.getElementById("sName");
        var sEmail = document.getElementById("sEmail");
        var sPassword = document.getElementById("sPassword");
        var sPhone = document.getElementById("sPhone");
        var sGender = document.getElementById("sGender");
        //alert(sGender.value)
        var sDob = document.getElementById("sDob");

        isValid = Validation.checkMandatory(sName,"Name",0,false);
        isValid = Validation.checkEMail(sEmail,"E-mail",false);
        isValid = Validation.checkMandatory(sPassword,"Password",0,false);
        isValid = Validation.checkMandatory(sPhone,"Phone",0,false);
        isValid = Validation.checkMandatory(sDob,"DOB",0,true);

        var sUrl = "init!register.do?name="+sName.value+"&email="+sEmail.value+"&password="+sPassword.value+"&phone="+sPhone.value+"&gender="+sGender.value+"&dob="+sDob.value;
        if (isValid) {
                callAJAX.sendRequestAJAX("POST",sUrl,"sRes");
        }
    };

}

