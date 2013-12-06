<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/img/favicon.png" />">

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
          <li class="active"><a href="<c:url value="/application/infraction/list" />">Infractions</a></li>
          <li><a href="<c:url value="/application/home/disconnected" />">Logout</a></li>
        </ul>
        <h3 class="text-muted"><a href="<c:url value="/application/home" />">Police application</a></h3>
      </div>
      
    <c:choose>  
		<c:when test="${!authOK}">
			<div class="alert alert-danger fade in">
		        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		         <h4>Oh snap! You got an error!</h4>
		         <p>You need to sign in with an <strong>admin account</strong> to create infractions.</p>
		         <p>
		         	<a href="<c:url value="/application/infraction/list" />">
		         	    <button type="button" class="btn btn-danger">Go back to infractions List</button>
		         	</a>
		          	<a href="<c:url value="/application/home/disconnected" />">
		          		<button type="button" class="btn btn-default" >Or Sign in again</button>
		          	</a>
		         </p>
		    </div>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
	        	<h3 class="textbold">Create a new Infraction</h3>
	      	</div>
	      	<div>
	      		<form id="infractionForm" method="POST"  action="add" role="form">
		        	<div class="form-group">
			            <label for="level" class="col-xs-2 control-label">Level</label>
			            <input type="number" class="form-control" id="level" name="level" placeholder="0" min="0">
			        </div>
			        <div class="form-group">
			            <label for="description" class="col-lg-2 control-label">Description</label>
			            <textarea class="form-control" rows="5" id="description" name="description" placeholder="Description" maxlength="300"></textarea>
			        </div>
			        <button type="submit" class="btn btn-primary" >Create</button>
			    </form>
		    </div>
		</c:otherwise>
	</c:choose>
     <br>
     <div class="footer">
       <p>&copy; 2013 equipe04-log720-A13-lab3</p>
     </div>

    </div> <!-- /container -->
    <script src="<c:url value="/js/jquery.js" />"></script>
    <script src="<c:url value="/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/js/jquery.tablesorter.js" />"></script>
    <script src="<c:url value="/js/alert.js" />"></script>
    <script type="text/javascript">
	$(document).ready(function() 
		{ 
		    $("#infractionTable").tablesorter(); 
		    $(".alert").alert();
		    
		} 
	); 
	</script> 
  </body>
</html>
  