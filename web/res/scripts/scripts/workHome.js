/**
 * Created by Tapas on 31-05-2018.
 */

var clNavMenu = new function(){

    this.openSideNav = function(){
        document.getElementById("menu-sidenav").style.width = "250px";
        document.getElementById("setting").style.display="block";
    }
    this.closeSideNav = function(){
        document.getElementById("menu-sidenav").style.width = "0px";
        document.getElementById("setting").style.display="none";

    }
    this.setBottomBar = function(menuName,textName,index){
        var menuClasses = document.getElementsByClassName(menuName);
        var textClasses = document.getElementsByClassName(textName);

        for(var i=0;i<menuClasses.length;i++){
            menuClasses[i].style.borderBottom="0px solid white";
        }
        menuClasses[index].style.borderBottom="3px solid white";

        for(var i=0;i<textClasses.length;i++){
            textClasses[i].style.color="#e9e9e9";
        }
        textClasses[index].style.color="white";
    }
}

var clMenu = new function(){
    this.openModal = function(){
        var sUrl="home!openModal.do";
        clModal.getModal('mdlFile','File','500','700',sUrl);
    }
    this.show = function(option){
        var sUrl = "home!showImportFile.do?option="+option;
        con.sendPostRequest(sUrl,null,null,"clMenu.ajaxHandler");
    }
    this.ajaxHandler = function(response){
        document.getElementById("importFileArea").innerHTML = response;
    }
}


$(document).ready(function(){

    var flag=true;

    $("#add-icon-area").mouseenter(function(){
        if(flag){
            $("#menus").fadeIn(300);
            document.getElementById("add-icon-area").style.paddingTop="450px";
            flag=false;
        }
    });

    $("#add-icon-area").mouseleave(function(){
        if(flag == false){
            $("#menus").fadeOut(300);

            document.getElementById("add-icon-area").style.paddingTop="0px";
            flag=true;
        }
    });

});


