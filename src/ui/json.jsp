<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11-01-2019
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
  .node_tooltip {
    height: 200px;
    border-radius: 10px;
    padding: 2px;
    text-align: left;
  }
</style>
<head>
  <script>
    var Log = {
      elem: false,
      write: function(text){
        if (!this.elem)
          this.elem = document.getElementById('log');
        this.elem.innerHTML = text;
        this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
      }
    };
    function getAnimation() {
      var objJson = document.getElementById("json").innerHTML;
      var objJson = JSON.parse(objJson);
      alert(objJson)
      var json = {
        id: "node0",
        name: "RootNode",
        data: {
        },
        children: [{
          id: "node01",
          name: objJson.firstName,
          data: {
            instructions : "Ranjan"
          },
          children:[
                  <%
                    int i=1;
                    while (i<5){
                  %>
          {
            id: "node01<%=i%>",
            name: objJson.address.street,
          },

                  <%
                    i++;
                    }
                  %>
          ],
          children:[
            <%
              int j=0;
              while (j<5){
            %>
            {
              id: "node012<%=j%>",
              name: objJson.address.city,
            },
            <%
              j++;
              }
            %>
          ],
        }],
      };
      // The JSON here would need to be adapted to a swagmap (or vice-versa), of course...
      /*var json = {
        id: "node0",
        name: "Parent",
        data: {
          instructions: "Arbitrary instructions, <a href='http://tunapanda.org'>links</a>, or whatever"
        },
        children: [{
          id: "node01",
          name: "Complete Lecture 1",
          data: {

          },
          children: [{
            id: "node011",
            name: "Complete Lecture 1, Level 1",
            data: {},
            children: [{
              id: "node0111",
              name: "Bonus: Perfect score!",
              data: {},
            }],
          },{
            id: "node012",
            name: "Complete Lecture 1, Level 2",
            data: {},
            children: [{
              id: "node0121",
              name: "Bonus: Perfect score!",
              data: {},
            }],
          },{
            id: "node013",
            name: "Complete Lecture 1, Level 3",
            data: {},
            children: [{
              id: "node0111",
              name: "Bonus: Perfect score!",
              data: {},
            }],
          }],
        }, {
          id: "node02",
          name: "Complete Lecture 2",
          data: {},
          children: [{
            id: "node021",
            name: "Complete Lecture 2, Level 1",
            data: {},
            children: [{
              id: "node0221",
              name: "Bonus: Perfect score!",
              data: {},
            }],
          },{
            id: "node022",
            name: "Complete Lecture 2, Level 2",
            data: {},
            children: [{
              id: "node0221",
              name: "Bonus: Perfect score!",
              data: {},
            }],
          },{
            id: "node023",
            name: "Complete Lecture 2, Level 3",
            data: {},
            children: [{
              id: "node0231",
              name: "Bonus: Perfect score!",
              data: {},
            }],
          }],
        }],
      };*/
      var st = new $jit.ST({
        //id of viz container element
        injectInto: 'infovis',
        //set duration for the animation
        duration: 1,
        //set animation transition type
        transition: $jit.Trans.Quart.easeInOut,
        //set distance between node and its children
        levelDistance: 50,
        //enable panning
        Navigation: {
          enable:true,
          panning:true
        },
        offsetX: 200,
        //set node and edge styles
        //set overridable=true for styling individual
        //nodes or edges
        Node: {
          height: 90,
          width: 90,
          //autoHeight: true,
          //autoWidth: true,
          type: 'rectangle',
          color: '#aaa',
          overridable: true
        },

        Edge: {
          type: 'arrow',
          overridable: true
        },

        onBeforeCompute: function(node){
          Log.write(node.name);
        },

        onAfterCompute: function(){
          Log.write("done");
        },

        //This method is called on DOM label creation.
        //Use this method to add event handlers and styles to
        //your node.
        onCreateLabel: function(label, node){
          label.id = node.id;
          label.innerHTML = node.name;
          label.onclick = function(){
            st.onClick(node.id);
          };
          label.onmouseover = function() {
            console.log("Mouse over " + node.name);
            console.log(typeof(node.data.instructions));

            // Remove old tooltips, just in case...
            $(".node_tooltip").each(function() {
              if ($(this).attr("id") == "label-" + label.id) {
                return;
              }
              $(this).mouseout();
            });
            // Display tooltip
            var pos = $(label).position();
            /*var tooltip  = $("<div>")
                    .attr("id", "label-" + label.id)
                    .attr("class", "node_tooltip")
                    .css({
                      position: "absolute",
                      top: pos.top + 30,
                      left: pos.left- 30,
                      background: "green",
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
                    .html("<h3>Instructions for " + node.name + "</h3>" + (typeof(node.data.instructions) === "undefined" ? "Everything but the root node has this default text for now, but you get the idea..." : node.data.instructions))
                    .hide()
                    .appendTo($("#infovis")
            ).fadeIn();*/
          }
          //label.onmouseout  = function() {
          //        var tooltip = $("#label-" + label.id);
          //        if ( ! tooltip.data("claimed") ) {
          //                tooltip.mouseout();
          //        }
          //}
          //set label styles
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
              node.data.$color = ['#aaa', '#baa', '#caa', '#daa', '#eaa', 'red'][count];
             /* alert(count);*/
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
      //st.geom.translate(new $jit.Complex(-300, 0), "current");
      st.onClick(st.root);
      console.log("done");
    }
  </script>
  <link type="text/css" href="//philogb.github.io/jit/static/v20/Jit/Examples/css/base.css" rel="stylesheet" />
  <link type="text/css" href="//philogb.github.io/jit/static/v20/Jit/Examples/css/Spacetree.css" rel="stylesheet" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script language="javascript" type="text/javascript" src="//philogb.github.io/jit/static/v20/Jit/jit.js"></script>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <title></title>
</head>
<%
  String json=request.getAttribute("jsondata").toString();
%>
<body onload="getAnimation();">
<div id="json"><%=json%></div>

<div id="container">
  <div id="center-container">
    <div id="infovis">
    </div>
    <div id="log">LOG</div>
  </div>
</div>
</body>
</html>
