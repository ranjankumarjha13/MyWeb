/**
 * Created by admin on 18-12-2018.
 */
function myfunction()
{
    alert("ranjanhjhjhjhjhjhjhjhjhjhjhjhjhj")
    alert("ranjan")
    Validation.checkMandatory(document.getElementById('name'),"Name",false);
    Validation.checkMandatory(document.getElementById('age'),"Name",false);
    Validation.checkMandatory(document.getElementById('weight'),"Name",false);
    Validation.checkMandatory(document.getElementById('combo'),"Name",false);
    Validation.checkMandatory(document.getElementById('date'),"Name",true);

    var submitData = con.formData2QueryString(document.forms["myform"]);
    alert(submitData);
}
