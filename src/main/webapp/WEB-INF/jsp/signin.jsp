<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/img/favicon.png" />">
    <title>Police application</title>
	<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/css/signin.css" />" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div class="container">
      <form class="form-signin" method="POST" action='<%= response.encodeURL("j_security_check") %>'>
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" name="j_username" class="form-control" placeholder="Email address" autofocus>
        <input type="password" name="j_password" class="form-control" placeholder="Password">
        <label class="checkbox">
          <!-- <input type="checkbox" value="remember-me"> Remember me -->
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    </div>
  </body>
</html>
