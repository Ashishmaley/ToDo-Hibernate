<%@page import="com.entity.Note"%>
<%@page import="com.entity.FactoryHelper"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
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
<h2>_______Update Task_______</h2>
    <div class="container"> <%@include file = "NavBar.jsp" %></div>
    <%
    int note_id=Integer.parseInt(request.getParameter("note_id").trim());
    Session s = FactoryHelper.getFactory().openSession();
    Note note = (Note) s.get(Note.class, note_id);
    %>
    <form action ="UpdateServelet" method= "post">
    <input  value = "<%=note_id %>" name = "noteId" type="hidden" />
  <div class="mb-3">
    <label for="Title" class="form-label">Title</label>
    <input 
    name = "title"
    required type="text" 
    class="form-control" 
    id="Title" 
    aria-describedby="title"
    value = "<%= note.getTitle()%>"/>
    <div id="title" class="form-text"></div>
  </div>
  <div class="mb-3" >
    <label for="Content" class="form-label">Content</label>
    <textarea
    name = "content"
     required style="height:200px" type="text" class="form-control" id="Title" aria-describedby="Title"
     id="Title" class="form-text"
     ><%= note.getContent()%></textarea>
  </div>
  <div class="text-center"><button type="Add" class="btn btn-primary">Update</button></div>
  
</form>
</body>
</html>