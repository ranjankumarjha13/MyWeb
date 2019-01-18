/**
 * Created by admin on 10-12-2018.
 */


var  CLTablejs = new function()
{

    this.addRow=function() {
        var s = new sTable("table1");
        console.log("Table id",+s.toString());
        s.addRow();

        var x=s.getCurrentRow();
        var y= s.getLastRow();
        console.log("Current Row",+x);
        console.log("Last Row",+y);
        var n= s.getElementAt(this,this,this);
        console.log("value of th position is",+n);
        var crow= s.getCurrentRow();
         var exitsedvalue=document.getElementById("value3").value;
         var firstvalue=document.getElementById("value1").value;
         var secondtvalue=document.getElementById("value2").value;
         var result=Number(exitsedvalue)+Number(firstvalue)+Number(secondtvalue);
         if (!isNaN(result)) {
         document.getElementById('value3').value = result;
         }

    }

    this.deleteRow=function()
    {
        var s=new sTable("table1");
        s.deleteRow(1,1,true);
    }

    this.addValue=function()
    {
        var firstvalue=document.getElementById("value1").value;

        var secondtvalue=document.getElementById("value2").value;

        var result=Number(firstvalue)+Number(secondtvalue);

        if (!isNaN(result)) {
            document.getElementById('value3').value = result;
        }
    }
};