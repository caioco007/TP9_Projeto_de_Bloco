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
		</div>			

		<div class="dropdown">
		    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		      Clientes
		    </button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="cliente">Novo</a>
		    </div>
		  </div>	
		<br>
		
		<c:if test="${not empty msgError}">
			<div class="alert alert-danger">
			  <strong>Erro!!</strong> ${msgError}
			</div>		
		</c:if>

		<c:if test="${not empty clientes}">
			        <table class="table table-striped">
			            <thead>
			                <tr>
						        <th>ID</th>
						        <th>Nome</th>
						        <th>CPF</th>
						        <th>Nascimento</th>
						        <th>Celular</th>
						        <th>Endere�o</th>
			                    <th class="actions">A��es</th>
			                 </tr>
			            </thead>
			            <tbody>
			 				<c:forEach var="c" items="${clientes}">
		  		
						  		  <fmt:parseDate value="${c.nascimento}" pattern="yyyy-MM-dd" var="dataFormatada" type="date"/>
							      <tr>
							        <td>${c.id}</td>
							        <td>${c.nome}</td>
							        <td>${c.cpf}</td>
							         <td><fmt:formatDate value="${dataFormatada}" type="date" pattern="dd/MM/yyyy"/></td>
							        <td>${c.celular}</td>
							        <td class="actions">			                    
				                        <a class="btn btn-danger btn-xs" href="/cliente/${c.id}/excluir">Excluir</a>
				                   </td>
							     </tr>
							  </c:forEach>	 
			          </tbody>
			       </table>
			  </c:if>
		<c:if test="${empty solicitantes}">
			<div class="alert alert-warning">
				<strong>Sem registros cadastrados!!</strong>
			</div>
		</c:if>
	</div>
</body>
</html>