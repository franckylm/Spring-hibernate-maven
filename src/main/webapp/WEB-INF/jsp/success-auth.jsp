<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Police application</title>

	<link href="<c:url value="/css/application.css" />" rel="stylesheet">
	<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/css/jumbotron-narrow.css" />" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="<c:url value="/application/folder/list" />">Folders</a></li>
          <li><a href="<c:url value="/application/infraction/list" />">Infractions</a></li>
          <li><a href="<c:url value="/application/home/disconnected" />">Logout</a></li>
        </ul>
        <h3 class="text-muted"><a href="<c:url value="/application/home" />">Police application</a></h3>
      </div>

      <div class="jumbotron">
        <h1>Welcome</h1>
        <p class="lead">Please, Choose a category.</p>
      </div>


      <div class="footer">
        <p>&copy; 2013 equipe04-log720-A13-lab3</p>
      </div>

    </div> <!-- /container -->
    <script src="<c:url value="/js/jquery.js" />"></script>
    <script src="<c:url value="/js/bootstrap.min.js" />"></script>
  </body>
</html>