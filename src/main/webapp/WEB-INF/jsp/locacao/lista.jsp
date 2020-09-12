<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

		<div id="list" class="row">
	 
			    <div class="table-responsive col-md-12">
			        <table class="table table-striped">
			            <thead>
			                <tr>
			                    <th>ID</th>
			                    <th>Cliente</th>
			                    <th>Data de Locação</th>
			                    <th>Data de Devolução</th>
			                    <th class="actions">Ações</th>
			                 </tr>
			            </thead>
			            <tbody>
			 				<c:forEach var="l" items="${listaLocacao}">
		  		
					  		  <fmt:parseDate value="${l.dtLocacao}" pattern="yyyy-MM-dd'T'HH:mm" var="dataFormatada" type="date"/>
					    	  <fmt:parseDate value="${l.dtDevolucao}" pattern="yyyy-MM-dd'T'HH:mm" var="dataFormatada1" type="date"/>
					  		
						      <tr>
						        <td>${l.id}</td>
						        <td>${l.cliente}</td>
						        <td><fmt:formatDate value="${dataFormatada}" type="date" pattern="dd/MM/yyyy HH:mm"/></td>
						        <td><fmt:formatDate value="${dataFormatada1}" type="date" pattern="dd/MM/yyyy HH:mm"/></td>
						        <td class="actions">			                    
			                        <a class="btn btn-danger btn-xs"  href="/locacao/excluir/${l.id}">Excluir</a>
			                    </td>
						      </tr>
							</c:forEach>			 
			            </tbody>
			         </table>
			 
			     </div>
			</div>	