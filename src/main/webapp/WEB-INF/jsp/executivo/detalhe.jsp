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
	
		<h3>Veiculo Executivo: ${operacao}</h3>
	
		<form action="/executivo/incluir" method="post">
			<input type="hidden" name="id" value="${executivo.id}">
		
		    <div class="form-group">
		      <label for="usr">Marca:</label>
		      <input type="text" class="form-control" name="marca" value="${executivo.marca}">
		    </div>
		    
			<div class="form-group">
		      <label for="usr">Modelo:</label>
		      <input type="text" class="form-control" name="modelo" value="${executivo.modelo}">
		    </div>
		    
		    <div class="form-group">
		      <label for="usr">Placa:</label>
		      <input type="text" class="form-control" name="placa" value="${executivo.placa}">
		    </div>
		    
		    <div class="form-group">
		      <label for="usr">Cor:</label>
		      <input type="text" class="form-control" name="cor" value="${executivo.cor}">
		    </div>
		    
		    <div class="form-group">
		      <label for="usr">Ano:</label>
		      <input type="text" class="form-control" name="ano" value="${executivo.ano}">
		    </div>
		    
		    <div class="form-group">
		      <label for="usr">Valor:</label>
		      <input type="text" class="form-control" name="valor" value="${executivo.valor}">
		    </div>
		    
		    <div class="form-check">
			  <input class="form-check-input" type="checkbox" name="automatico" value="true" id="defaultCheck1">
			  <label class="form-check-label" for="defaultCheck1">
			    Carro Automático
			  </label>
			</div>
			
		    <button type="submit" class="btn btn-primary">Gravar</button>
	  	</form>
	</div>
</body>
</html>