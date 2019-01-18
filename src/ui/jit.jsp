<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 14-01-2019
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
</style>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link type="text/css" href="//philogb.github.io/jit/static/v20/Jit/Examples/css/base.css" rel="stylesheet" />
  <link type="text/css" href="//philogb.github.io/jit/static/v20/Jit/Examples/css/Spacetree.css" rel="stylesheet" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script language="javascript" type="text/javascript" src="//philogb.github.io/jit/static/v20/Jit/jit.js"></script>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <script language="javascript" type="text/javascript" src="//philogb.github.io/jit/static/v20/Jit/jit.js"></script>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <title></title>
</head>
<!-- Example File -->
<script language="javascript" type="text/javascript">
  var labelType, useGradients, nativeTextSupport, animate;
 /* (function() {
    var ua = navigator.userAgent,
            iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
            typeOfCanvas = typeof HTMLCanvasElement,
            nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
            textSupport = nativeCanvasSupport
                    && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
    //I'm setting this based on the fact that ExCanvas provides text support for IE
    //and that as of today iPhone/iPad current text support is lame
    labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
    nativeTextSupport = labelType == 'Native';
    useGradients = nativeCanvasSupport;
    animate = !(iStuff || !nativeCanvasSupport);
  })();*/
  var Log = {
    elem: false,
    write: function(text){
      if (!this.elem)
        this.elem = document.getElementById('log');
      this.elem.innerHTML = text;
      this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
    }
  };
 /* var globallabel;
  var globalnode;*/
  function getNodeDetails()
  {
   alert("Node Name:-" +globalnode.name +"Node Id:"+ globalnode.id +"Node Data:-"+globalnode.data["datakey"])
  }
  function init() {
    // The JSON here would need to be adapted to a swagmap (or vice-versa), of course...
    var json = {
      id: "node0",
      name: "Focus Softnet pvt Ltd",
      data: {
        "datakey":"This is Company name"
      },
      children: [{
        id: "node01",
        name: "Project Manager1",
        data: {
          "datakey":"This is Project Manager1 "
        },
        children: [{
          id: "node011",
          name: "Team Leader1",
          data: {
            "datakey":"This is Team Leader1 "
          },
          children: [{
            id: "node0111",
            name: "Developer",
            data: {
              "datakey":"This is Developer"
            },
          },
          ]
        },{
          id: "node012",
          name: "Team Leader2",
          data: {
            "datakey":"This is Team Leader2"
          },
          children: [{
            id: "node0121",
            name: "Developer",
            data: {
              "datakey":"This is Developer"
            },
          }],
        },{
          id: "node013",
          name: "Team Leader3",
          data: {
            "datakey":"This is Team Leader3"
          },
          children: [{
            id: "node0131",
            name: "Developer",
            data: {
              "datakey":"This is Developer"
            },
          }],
        }],
      }, {
        id: "node02",
        name: "Project Manager2",
        data: {
          "datakey":"This is Project Manager2"
        },
        children: [{
          id: "node021",
          name: "Team Leader1",
          data: {
            "datakey":"This is Teal Leader1"
          },
          children: [{
            id: "node0211",
            name: "Developer",
            data: {
              "datakey":"This is Developer"
            },
          }],
        },{
          id: "node022",
          name: "Team Leader2",
          data: {
            "datakey":"This is Team Leader2"
          },
          children: [{
            id: "node0221",
            name: "Developer",
            data: {
              "datakey":"This is Developer"
            },
          }],
        },{
          id: "node023",
          name: "Team Leader3",
          data: {
            "datakey":"This is Team Leader3"
          },
          children: [{
            id: "node0231",
            name: "Developer",
            data: {
            "datakey":"This is Developer"
            },
          }],
        }],
      }],
    };
    var st = new $jit.ST({
      //id of viz container element
      injectInto: 'infovis',
      //set duration for the animation
      duration: 800,
      //set animation transition type
      transition: $jit.Trans.Quart.easeInOut,
      //set distance between node and its children
      levelDistance: 50,
      //enable panning
      Navigation: {
        enable:true,
        panning:true
      },
      /*offsetX: -30,*/
      //set node and edge styles
      //set overridable=true for styling individual
      //nodes or edges
      Node: {
        height: 60,
        width: 60,
        //autoHeight: true,
        //autoWidth: true,
        type: 'rectangle',
        color: '#aaa',
        overridable: true
      },
      Edge: {
        type: 'bezier',
        overridable: true
      },
      onBeforeCompute: function(node){
        Log.write(node.name);
      },
      onAfterCompute: function(){
        //Log.write("done");
      },
      //This method is called on DOM label creation.
      //Use this method to add event handlers and styles to
      //your node.
      onCreateLabel: function(label, node){
        label.id = node.id;
        label.innerHTML = node.name;
        label.onclick = function(){
          alert("Node Name:-" +node.name +"Node Id:"+ node.id +"Node Data:-"+node.data["datakey"])
          st.onClick(node.id);
        };
        label.onmouseover = function() {
          /*globalnode=node;
          globallabel=label;*/
         /* console.log("Mouse over " + node.name);
          console.log(typeof(node.data.instructions));*/

          // Remove old tooltips, just in case...
          $(".node_tooltip").each(function() {
            if ($(this).attr("id") == "label-" + label.id) {
              return;
            }
            $(this).mouseout();
          });
          // Display tooltip
          var pos = $(label).position();
          var tooltip  = $("<div>")
                  .attr("id", "label-" + label.id)
                  .attr("class", "node_tooltip")
                  .css({
                    position: "absolute",
                    top: pos.top + 30,
                    left: pos.left- 30,
                    background: "white",
                    color: "black"
                  })
                  .mouseover(function() {
                    // Set a flag so that mouseout on the parent label
                    // no longer closes this
                    $(this).data("claimed",true);
                  })
                  .mouseout(function() {
                    $(this).fadeOut({
                      complete: function() {
                        this.remove();
                      }
                    });
                  })
                 /* .html("<h3>Instructions for " + node.name + "</h3>" + (typeof(node.data.instructions) === "undefined" ? "Everything but the root node has this default text for now, but you get the idea..." : node.data.instructions))*/
                 /* .html("<button onclick='getNodeDetails()' class='btn btn-primary btn-sm'>GetNodeDetails</button>")*/
                  .hide()
                  .appendTo($("#infovis")
          ).fadeIn();
        }
        var style = label.style;
        style.width = 60 + 'px';
        style.height = 17 + 'px';
        style.cursor = 'pointer';
        style.color = '#333';
        style.fontSize = '0.8em';
        style.textAlign= 'center';
        style.paddingTop = '3px';
      },
      //This method is called right before plotting
      //a node. It's useful for changing an individual node
      //style properties before plotting it.
      //The data properties prefixed with a dollar
      //sign will override the global node style properties.
      onBeforePlotNode: function(node){
        //add some color to the nodes in the path between the
        //root node and the selected node.
        if (node.selected) {
          node.data.$color = "#ff7";
        }
        else {
          delete node.data.$color;
          //if the node belongs to the last plotted level
          if(!node.anySubnode("exist")) {
            //count children number
            var count = 0;
            node.eachSubnode(function(n) { count++; });
            //assign a node color based on
            //how many children it has
            node.data.$color = ['#aaa', '#baa', '#caa', '#daa', '#eaa', '#faa'][count];
          }
        }
      },
      //This method is called right before plotting
      //an edge. It's useful for changing an individual edge
      //style properties before plotting it.
      //Edge data proprties prefixed with a dollar sign will
      //override the Edge global style properties.
      onBeforePlotLine: function(adj){
        if (adj.nodeFrom.selected && adj.nodeTo.selected) {
          adj.data.$color = "#eed";
          adj.data.$lineWidth = 3;
        }
        else {
          delete adj.data.$color;
          delete adj.data.$lineWidth;
        }
      }
    });
    st.loadJSON(json);
    st.compute();
    st.plot();
    st.onClick(st.root);
  }
</script>
<body onload="init();">
<div id="container">
  <div id="center-container">
    <div id="infovis"></div>
    <div id="log">LOG</div>
  </div>
</div>
</body>
</html>
