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
<script language="javascript" type="text/javascript">
  var renderMidArrow = function(from, to, dim, swap, canvas){
    var ctx = canvas.getCtx();
    // invert edge direction
    if (swap) {
      var tmp = from;
      from = to;
      to = tmp;
    }
    // vect represents a line from tip to tail of the arrow
    var vect = new $jit.Complex(to.x - from.x, to.y - from.y);
    // scale it
    vect.$scale(dim / vect.norm());
    // compute the midpoint of the edge line
    var midPoint = new $jit.Complex((to.x + from.x) / 2, (to.y +
            from.y) / 2);
    // move midpoint by half the "length" of the arrow so the arrow is
    midPoint.x += (vect.x / 1);
    midPoint.y += (vect.y / 1);
    // compute the tail intersection point with the edge line
    var intermediatePoint = new $jit.Complex(midPoint.x - vect.x,
            midPoint.y - vect.y);
    // vector perpendicular to vect
    var normal = new $jit.Complex(-vect.y / 1, vect.x / 1);
    var v1 = intermediatePoint.add(normal);
    var v2 = intermediatePoint.$add(normal.$scale(-1));
    ctx.beginPath();
    ctx.moveTo(from.x, from.y);
    ctx.lineTo(to.x, to.y);
    ctx.stroke();
    ctx.beginPath();
    ctx.moveTo(v1.x, v1.y);
    ctx.lineTo(midPoint.x, midPoint.y);
    ctx.lineTo(v2.x, v2.y);
    ctx.stroke();
  };
  var containsMidArrow = function(posFrom, posTo, pos, epsilon) {
    return $jit.EdgeHelper.line.contains(posFrom, posTo, pos, epsilon);
  };
  $jit.ST.Plot.EdgeTypes.implement({
    'customarrow' : {
      'render' : function(adj, canvas) {
        var from = adj.nodeFrom.pos.getc(true),
                to = adj.nodeTo.pos.getc(true),
                dim = adj.getData('dim'),
                direction = adj.data.$direction,
                inv = (direction && direction.length > 1 && direction[0] !=
                adj.nodeFrom.id);
        renderMidArrow(from, to, dim, inv, canvas);
      },
      'contains' : function(adj, pos) {
        var from = adj.nodeFrom.pos.getc(true),
                to = adj.nodeTo.pos.getc(true);
        return containsMidArrow(from, to, pos, this.edge.epsilon);
      }
    }
  });
  var labelType, useGradients, nativeTextSupport;
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
  function init() {
    // The JSON here would need to be adapted to a swagmap (or vice-versa), of course...
    var json = {
      id: "0",
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
      /* duration: 800,*/
      //set animation transition type
      /* transition: $jit.Trans.Quart.easeInOut,*/
      //set distance between node and its children
      levelDistance: 50,
      //enable panning
      Navigation: {
        enable:true,
        panning:false,
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
        type: 'customarrow',
        overridable: true,
        dim: 4,
        color:'#ccc'
      },
      onBeforeCompute: function(node){
        Log.write(node.name);
      },
      onAfterCompute: function(){
        //Log.write("done");
      },
      onCreateLabel: function(label, node){



        label.id = node.id;
        label.innerHTML = node.name;
        label.onclick = function(){
            st.addSubtree(json, 'animate', {
                onComplete: function() {
                    alert('complete!');
                }
            });
          alert("Node Name:-" +node.name +"Node Id:"+ node.id +"Node Data:-"+node.data["datakey"])
          st.onClick(node.id);
          st.select(node.id, {
            onComplete: function() {
              alert('current node selected! with id'+" "+node.id);
            }
          });
        };
        label.onmouseover = function() {
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
            /*   .html("<button onclick='getNodeDetails()' class='btn btn-primary btn-sm'>GetNodeDetails</button>")*/
                  .hide()
                  .appendTo($('infovis')
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
      onBeforePlotNode: function(node){
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
<body onload="init()" >
<div id="container">
  <div id="center-container">

    <div id="infovis">
    </div>
    <div id="log">LOG</div>
  </div>
</div>
</body>
</html>
