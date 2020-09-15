<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
		      Locações
		    </button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="/locacao">Novo</a>
		    </div>
		  </div>	
		<br>
		<h4>Locações: ${fn:length(locacoes)}</h4>
		<br>
		<c:if test="${not empty msgError}">
			<div class="alert alert-danger">
			  <strong>Erro!!</strong> ${msgError}
			</div>		
		</c:if>

		<c:if test="${not empty locacoes}">
			        <table class="table table-striped">
			            <thead>
			                <tr>
			                    <th>ID</th>
			                    <th>CLIENTE</th>
			                    <th>DATA DE LOCAÇÃO</th>
			                    <th>DATA DE DEVOLUÇÃO</th>
			                    <th>VEICULOS</th>
			                    <th>DIAS</th>
			                    <th>VALOR</th>
			                    <th class="actions">Ações</th>
			                 </tr>
			            </thead>
			            <tbody>
			 				<c:forEach var="l" items="${locacoes}">
					  		  <fmt:parseDate value="${l.dtLocacao}" pattern="yyyy-MM-dd'T'HH:mm" var="dataFormatada" type="date"/>
					    	  <fmt:parseDate value="${l.dtDevolucao}" pattern="yyyy-MM-dd'T'HH:mm" var="dataFormatada1" type="date"/>
					  		
						      <tr>
						        <td>${l.id}</td>
						        <td>${l.cliente}</td>
						        <td><fmt:formatDate value="${dataFormatada}" type="date" pattern="dd/MM/yyyy HH:mm"/></td>
						        <td><fmt:formatDate value="${dataFormatada1}" type="date" pattern="dd/MM/yyyy HH:mm"/></td>
						        <td>${l.veiculos}</td>
						        <td>${l.daysBetween}</td>
<%-- 						        <td><fmt:setLocale value="pt_BR"/><fmt:formatNumber currencySymbol="R$ " type="currency" value="${valorTotal}"/></td> --%>
						        <td class="actions">			                    
			                        <a class="btn btn-danger btn-xs"  href="/locacao/${l.id}/excluir">Excluir</a>
			                        <a class="btn btn-danger btn-xs"  href="/locacao/${l.id}/consultar">Consultar</a>
			                    </td>
						      </tr>
							</c:forEach>			 
			            </tbody>
			         </table>
			     </c:if>
		<c:if test="${empty locacoes}">
			<div class="alert alert-warning">
				<strong>Sem registros cadastrados!!</strong>
			</div>
		</c:if>
	</div>
</body>
</html>