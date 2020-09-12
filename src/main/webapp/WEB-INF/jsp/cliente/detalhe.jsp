<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link rel="stylesheet" href="<c:url value='\css\style1.css' />">  
</head>
<body>
	<div class="container">
		
		<div class="container-fluid" style="margin-top:80px">

			<c:import url="/WEB-INF/jsp/header.jsp"/>	
			
			
		    <h3>Cadastro de Cliente</h3>
			<p class="help-block"><h11>*</h11> Campo Obrigatório </p>

		  	<form class="form-horizontal" role="form" action="/cliente" method="post">
		  	
			  	<div class="col-md-8 mb-8">
				      <label for="usr">Nome:</label><h11>*</h11>
				      <input type="text" class="form-control" name="nome">
			    </div>
			    
			    <div class="form-row col-md-10">
				   <div class="col-md-3 mb-3">
				      <label for="usr">CPF:</label><h11>*</h11>
				  <input type="text" class="form-control" name="cpf">
				   </div>
				   <div class="col-md-3 mb-3">
				      <label for="data">Nascimento:</label><h11>*</h11>
			      <input type="date" class="form-control" name="nascimento">
				    </div>
				  </div>
			    	
				<div class="col-md-6 mb-6">
			      <label for="uname">E-mail:</label><h11>*</h11>
			      <div class="input-group">
			        <div class="input-group-prepend">
			          <span class="input-group-text" id="inputGroupPrepend">
			          <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-envelope-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					    <path fill-rule="evenodd" d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
					  </svg>
					  </span>
			        </div>
			        <input type="text" class="form-control" placeholder="Entre com o e-mail" name="email">
			      </div>	
			    </div>
				
				 <div class="form-row col-md-10">
				   <div class="col-md-3 mb-3">
				      <label for="inputCEP">CEP:</label><h11>*</h11>
				      <input type="text" class="form-control" name="cep" id="inputCEP">
				   </div>
				   <div class="col-md-2 mb-2">
				      <label for="usr">Nº:</label><h11>*</h11>
				      <input type="text" class="form-control" name="num">
				    </div>
				  </div>
			  
			    <div class="col-md-3 mb-3">
				  <label for="usr">Nº Celular:</label><h11>*</h11>
					  <div class="input-group">
					  	<div class="input-group-prepend">
				          <span class="input-group-text" id="inputGroupPrepend">
				          <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-telephone-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  						<path fill-rule="evenodd" d="M2.267.98a1.636 1.636 0 0 1 2.448.152l1.681 2.162c.309.396.418.913.296 1.4l-.513 2.053a.636.636 0 0 0 .167.604L8.65 9.654a.636.636 0 0 0 .604.167l2.052-.513a1.636 1.636 0 0 1 1.401.296l2.162 1.681c.777.604.849 1.753.153 2.448l-.97.97c-.693.693-1.73.998-2.697.658a17.47 17.47 0 0 1-6.571-4.144A17.47 17.47 0 0 1 .639 4.646c-.34-.967-.035-2.004.658-2.698l.97-.969z"/>
						  </svg>
						  </span>
				        </div>
					    <input type="tel" class="form-control" placeholder="(DDD)xxxxx-xxxx" name="celular">	  
					  </div>
				</div>
				  
		  		  <button type="submit" class="btn btn-primary">Salvar</button>
		  	</form>
		  	<c:import url="/WEB-INF/jsp/footer.jsp"/>
	  	</div>
	 </div>
</body>
</html>