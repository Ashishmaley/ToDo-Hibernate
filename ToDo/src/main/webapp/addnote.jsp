<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    
    <title>Add NOt</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
    /* Apply margin to the form */
    form {
      margin: 30px; /* You can adjust the value as needed */
    }
    form input {
      margin-bottom: 10px; /* You can adjust the value as needed */
    }
    h2{
    margin:20px
    }
  </style>
  </head>
  <body>
  <h2>_______Add New Task_______</h2>
    <div class="container"> <%@include file = "NavBar.jsp" %></div>
    <form action = "SaveNoteServelet" method= "post" >
  <div class="mb-3">
    <label for="Title" class="form-label">Title</label>
    <input 
    name = "title"
    required type="text" 
    class="form-control" 
    id="Title" 
    aria-describedby="title">
    
    <div id="title" class="form-text"></div>
  </div>
  <div class="mb-3" >
    <label for="Content" class="form-label">Content</label>
    <textarea
    name = "content"
     required style="height:200px" type="text" class="form-control" id="Title" aria-describedby="Title"
     id="Title" class="form-text"></textarea>
  </div>
  <button type="Add" class="btn btn-primary">Add</button>
</form>
  </body>
</html>