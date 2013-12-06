<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      
    <c:if test="${successAdd}">
		<div class="alert alert-success fade in">
	    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	     <p>New Infraction created, see the bottom of the list.</p>
		</div>
	</c:if>
	<div class="jumbotron">
    	<h3 class="textbold">List of infractions</h3>
  	</div>
  	<div>
  		<a  href="<c:url value="/application/infraction/add" />" class="btn btn-info">Add infraction</a>	
  	</div> 
	<table id="infractionTable" class="table table-striped table-hover tablesorter table-bordered">
		<thead>
	     <tr>
	     	<th id="sortbyid" title="Sort by id" class="sortheader">Identifier</th>
	     	<th id="sortbylevel" title="Sort by level" class="sortheader">Level</th>
	     	<th id="sortbydescription" title="Sort by description" class="sortheader">Description</th>
	     	<!-- <th>Action</th> -->
	   </tr>
	</thead>
	<tbody> 
	   	<c:forEach var="infraction" items="${infractions}">
	<tr> 
	<td>${infraction.id}</td>
	<td>${infraction.level}</td>
	<td>${infraction.description}</td>
	<!-- <td><a href="#">Edit</a></td> -->
	</tr>
	</c:forEach>
	   </tbody>  	
	</table>
      
      
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
  