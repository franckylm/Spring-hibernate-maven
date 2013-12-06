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
          <li class="active"><a href="<c:url value="/application/folder/list" />">Folders</a></li>
          <li><a href="<c:url value="/application/infraction/list" />">Infractions</a></li>
          <li><a href="<c:url value="/application/home/disconnected" />">Logout</a></li>
        </ul>
        <h3 class="text-muted"><a href="<c:url value="/application/home" />">Police application</a></h3>
      </div>
      
      <c:if test="${!empty folder}">
      	<c:if test="${successAddInf}">
			<div class="alert alert-success fade in">
		    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		     <p>New infraction(s) added successfullly to the Folder.</p>
			</div>
		</c:if>
		<div class="jumbotron">
	       	<h3 class="textbold">List of Folders</h3>
	       	<h5>
	       	<p>
	       		<b><u>Name</u> : ${folder.firstName} ${folder.lastName}</b> |
	       		<b><u>Licence</u> : ${folder.driverLicenceNumber}</b> |
	       		<b><u>Car plate</u> : ${folder.carPlateNumber}</b>
	       	</p>
	       	</h5>
      	</div>
      	<div class="row">
	        <div class="col-lg-10">
	        <c:if test="${newInfractionFolder}">
	        	<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add Infraction</button>
	        </c:if>
	          <h3>Infractions List</h3>
	          <table id="infractionFolderTable" class="table table-striped table-hover table-bordered">
	          	<tbody>
	          	<c:if test="${!empty infractionList}">
	          		<c:forEach var="infraction" items="${infractionList}">
	          		<tr>
	          			<td>
	          				<h4>Infraction N° ${infraction.id}</h4>
	          				<p><b>Id :</b> ${infraction.id}</p>
	          				<p><b>Level :</b> ${infraction.level}</p>
	          				<p><b>Description :</b> ${infraction.description}</p>
	          			</td>
	          		</tr>
	          		</c:forEach>
	          	</c:if>
	          	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					    <form id="addInfractionForm" method="POST"  action="addinfractions">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Choose Infraction to Add</h4>
					      </div>
					      <div class="modal-body">
					        <c:if test="${!empty infractions}">
					        	<hr>
				        		<c:forEach var="infraction" items="${infractions}">
				        		<div class="checkbox">
				        			<label>
					        			<input type="checkbox" name="${infraction.id}" value="${infraction.description}" id="inf${infraction.id}"> Id: ${infraction.id} Level: ${infraction.level} Description: ${infraction.description}
				        			</label>
				        		</div>
				        		<hr>
				        		</c:forEach>
					        </c:if>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="submit" class="btn btn-primary">Save changes</button>
					      </div>
					      </form>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
	          	</tbody>
	          </table>
	        </div>
      </div>
     </c:if>
  				
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
		    $("#folderTable").tablesorter(); 
		    $(".alert").alert();
		    
		} 
	); 
	</script> 
  </body>
</html>
  