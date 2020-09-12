<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Cliente</title>
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
			
			
		    <h3>Lista de Clientes</h3>
		    <p>Clientes cadastrados no sistema</p>	
			
			<div id="list" class="row">
	 
			    <div class="table-responsive col-md-12">
			        <table class="table table-striped">
			            <thead>
			                <tr>
						        <th>ID</th>
						        <th>Nome</th>
						        <th>CPF</th>
						        <th>Nascimento</th>
						        <th>Celular</th>
			                    <th class="actions">Ações</th>
			                 </tr>
			            </thead>
			            <tbody>
			 				<c:forEach var="c" items="${listaCliente}">
		  		
					  		  <fmt:parseDate value="${c.nascimento}" pattern="yyyy-MM-dd" var="dataFormatada" type="date"/>
						      <tr>
						        <td>${c.id}</td>
						        <td>${c.nome}</td>
						        <td>${c.cpf}</td>
						         <td><fmt:formatDate value="${dataFormatada}" type="date" pattern="dd/MM/yyyy"/></td>
						        <td>${c.celular}</td>
						        <td class="actions">			                    
			                        <a class="btn btn-danger btn-xs" href="/contato/excluir/${c.id}">Excluir</a>
			                   </td>
						     </tr>
						  </c:forEach>			 
			          </tbody>
			       </table>
			 	   <c:import url="/WEB-INF/jsp/footer.jsp"/>	
			   </div>			 
		  </div>
	  </div>
  </div>
</body>
</html>