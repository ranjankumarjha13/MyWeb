<!DOCTYPE html>
<html>
<script>

  var data = [
    {
      id:"id0",
      title: 'topNode',
      source : "null",
      children: [
        {
          id:"id1",
          title: 'node1',
          source : "id0",
          children: [
            {
              id:"id2",
              title: 'randomNode_1',
              source : "id1"
            },
            {
              id:"id3",
              title: 'node2',
              source : "id0",
              children: [
                {
                  id:"id4",
                  title: 'randomNode_2',
                  source : "id3"

                }]
            }]
        }
      ]
    }];


  var currChild = data[0];
  function getNodes(currChild){

    if(currChild.children){
      for(i=0; i < currChild.children.length; i++){
        var val = currChild.children[i];
        document.write(val.title+" : "+val.id+" : "+val.source);
        document.write("<br>");

        getNodes(currChild.children[i]);
      }

    }

  }

  var element = data[0];

  document.write(element.title+" : "+element.id+" : "+element.source);
  document.write("<br>");

  var result = getNodes(element);

</script>
<body>

</body>
</html>
