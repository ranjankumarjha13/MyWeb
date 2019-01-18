function initialize(){
    alert();
}

var tapTable = new function() {
    this.addRow=function() {
        var clTable = new sTable("myTable");
        clTable.addRow();
    }
    this.deleteRow = function() {
        var myTable = new sTable("myTable");
        var iRows = myTable.getRowCount();
        if(iRows > 2)
            myTable.deleteRow(myTable.getCurrentRow(),true,false);
    }
    this.addval = function() {

        var myTable = new sTable("myTable");
        //myTable.setValueAt(1,2,10);
        var iCols = myTable.getColCount();
        var iRows = myTable.getRowCount();
        //alert(iCols + " : " + iRows);
        var val=0;
        for (var iRowIndex = 1; iRowIndex < iRows; iRowIndex++) {
            for (var iColIndex = 0; iColIndex < iCols-1; iColIndex++) {

                // alert("[" + iRowIndex + " , " + iColIndex + "]");

                if(iColIndex != iCols-2)
                {
                    var v = myTable.getElementAt(iRowIndex,iColIndex).value;
                    var f = myTable.getElementAt(iRowIndex,iColIndex).value;
                    var s = myTable.getElementAt(iRowIndex,iColIndex+1).value;
                    if (v != "")
                        val = val + parseInt(myTable.getElementAt(iRowIndex,iColIndex).value);
                }
                if(f !="" && s != "")
                    myTable.setValueAt(iRowIndex,2,val);
            }

        }
    }
    this.f1 =  function(){
        alert();
    }
};
