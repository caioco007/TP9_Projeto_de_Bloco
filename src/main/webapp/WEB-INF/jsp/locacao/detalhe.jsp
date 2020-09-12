<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Locacao de Veiculo</title>
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
			
			
		    <h3>Cadastro de Locação</h3>
	
			<form action="/locacao/incluir" method="post">
			
			  <div class="form-group">
			    <label for="usr">Cliente:</label>
				<select name="cliente.id" class="form-control">
					<c:forEach var="c" items="${listaCliente}">
						<option value="${c.id}">${c}</option>
					</c:forEach>
				</select>
			  </div>
				
			  <div class="form-row col-md-10">	
				  <div class="col-md-3 mb-3">
				    <label for="dtLoc" class="mr-sm-2">Data de Locação:</label>
				  	<input type="datetime-local" class="form-control mb-2 mr-sm-2" name="dtLoc">
				  </div>
				  
				  <div class="col-md-3 mb-3">
				    <label for="dtDev" class="mr-sm-2">Data de Devolução:</label>
				  	<input type="datetime-local" class="form-control mb-2 mr-sm-2" name="dtDev">
				  </div>
			  </div>
					
			  <button type="submit" class="btn btn-primary">Salvar</button>
			</form>
			<c:import url="/WEB-INF/jsp/footer.jsp"/>		
		</div>
	</div>
	
</body>
</html>