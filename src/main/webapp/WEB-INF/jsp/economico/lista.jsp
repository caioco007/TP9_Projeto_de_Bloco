<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>AppLocacao</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="container-fluid" style="margin-top:80px">		
			<c:import url="/WEB-INF/jsp/header.jsp"/>
		</div>			

		<div class="dropdown">
		    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		      Veiculos Economicos
		    </button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="/economico">Novo</a>
		    </div>
		  </div>	
		<br>
		
		<c:if test="${not empty msgError}">
			<div class="alert alert-danger">
			  <strong>Erro!!</strong> ${msgError}
			</div>		
		</c:if>
		
		<c:if test="${not empty economicos}">
			<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>ID</th>
			        <th>MARCA</th>
			        <th>MODELO</th>
			        <th>PLACA</th>
			        <th>VALOR</th>
			      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="ec" items="${economicos}">
				      <tr>
				        <td>${ec.id}</td>
				        <td>${ec.marca}</td>
				        <td>${ec.modelo}</td>
				        <td>${ec.placa}</td>
				        <td>${ec.valor}</td>
				        <td><a href="/economico/${ec.id}/excluir">excluir</a></td>
				        <td><a href="/economico/${ec.id}/alterar">alterar</a></td>
				      </tr>
			      </c:forEach>
			    </tbody>
			</table>	
		</c:if>
		<c:if test="${empty economicos}">
			<div class="alert alert-warning">
				<strong>Sem registros cadastrados!!</strong>
			</div>
		</c:if>
	</div>
</body>
</html>