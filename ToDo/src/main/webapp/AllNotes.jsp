<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.FactoryHelper"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
</head>
<body>

<h1 class = "text-uppercase">All Notes</h1>
<%@include file = "NavBar.jsp" %>

<div class= "row m-4">
<div class = "col-12">
<% Session s = FactoryHelper.getFactory().openSession();
Query q = s.createQuery("from Note");
List<Note> notes = q.list();
for(Note note:notes){
%>
<div class="card p-5">
  <img style="max-width:100px" src="images/notes.png" class="card-img-top" alt="">
  <div class="card-body">
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text"><%= note.getContent() %></p>
    <div class="text-center">
  <a href="DeleteServelet?note_id=<%= note.getId()%>"class="btn btn-primary">Delete</a>
    <a href="update.jsp?note_id=<%= note.getId()%>"class="btn btn-primary">Update</a>
  </div>
    
  </div>
</div>
<%
}
s.close(); 

%>

</div>
</div>


</body>
</html>