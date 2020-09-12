<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="<c:url value='\css\style.css' />">
</head>
<body>
		
	<div class="container">
	
		<div class="container-fluid" style="margin-top:80px">

			<c:import url="/WEB-INF/jsp/header.jsp"/>
			
		    <h3>Projeto Locação</h3>
		    <p>Sistema de Locação</p>				
			
			<div class="col-md-3">
			    <h2>Locações</h2>
			</div>
			
			<div class="col-md-3">
			    <a href="/locacao" class="btn btn-primary pull-right h2">Nova Locação</a>
			</div>
					
			<c:import url="/WEB-INF/jsp/locacao/lista.jsp"/>
			
		</div>	
	</div>
</body>
</html>