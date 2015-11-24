<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="chrome=1">
  <meta name="viewport" content="width=device-width">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

  <link rel="stylesheet" type="text/css" href="<%= relativeRoot %>/docs/css/bootstrap-light.css">
  <link rel="stylesheet" type="text/css" href="<%= relativeRoot %>/docs/css/syntaxHighlight.css">
  <link rel="stylesheet" type="text/css" href="<%= relativeRoot %>/dist/react-datum.css">
  <link rel="stylesheet" type="text/css" href="<%= relativeRoot %>/docs/css/docs.css">
  <link rel="stylesheet" type="text/css" href="<%= relativeRoot %>/docs/css/example.css">

  <title>react-datum <%= simpleName %> example</title>
</head>

<!--  This file is automatically generated by scripts/buildExamples (`grunt examples`)  -->

<body data-exampleFile="<%=relativeFile%>">
  <script src= "<%= relativeRoot %>/dist/vendor/jquery.js"></script>
  <div class="demo-pane">
    <button class="more btn btn-primary" data-which="demo">Show More Demo!</button>
    <h3>The Demo:</h3> 
    <div id="demo">
      <!--  Example code uses this to render output -->
    </div>
  </div>
  <div class='code-pane'>
    <button class="more btn btn-primary" data-which="code">Show More Code!</button>
    <h3>The Code:</h3> 
    <%= sourceCode %>
  </div>
  <script src="<%= relativeRoot %>/dist/vendor/react.js"></script>
  <script src="<%= relativeRoot %>/dist/vendor/react-dom.js"></script>
  <script src="<%= relativeRoot %>/dist/vendor/underscore.js"></script>
  <script src="<%= relativeRoot %>/dist/vendor/backbone.js"></script>
  <script src="<%= relativeRoot %>/dist/react-datum.js"></script>
  
  <script src="<%= relativeRoot %>/test/lib/kittenData.js"></script>
  
  <script src="<%= sourceFile %>"></script>
  
  <script>
    $(function() {
      // window.Demo expected to be set by by sourceFile
      ReactDOM.render(React.createElement(window.Demo), document.getElementById('demo'))
      
      $('button.more').click(function(evt) { 
        $('body').attr("data-showmore", $(evt.target).attr('data-which')); 
      });
    });
  </script>
    

</body>
