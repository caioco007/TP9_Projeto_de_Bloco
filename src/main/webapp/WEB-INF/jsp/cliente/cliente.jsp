<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).on("click", "#consultarCep", function() {
            $.get("/endereco/"+$("#cep").val(), function(responseJson) {
                $.each(responseJson, function(index, item) {
                    $("#"+index).val(item);
                });
            });
        });
    </script>
</head>
<body>
    <c:import url="menu.jsp"/>

    <div class="container py-4">
        <form class="form-padrao" name="cadastroCli" id="cadCli" action="/clientes/gravar" method="post">
            <h3>
                <c:if test="${cliente != null}">Alteração de Cliente</c:if>
                <c:if test="${cliente == null}">Cadastro de Cliente</c:if>
            </h3>

            <hr class="bg-light">

            <input type="hidden" name="id" value="${cliente.id}">

            <div class="form-group">
                <label for="inputTipo">Tipo</label>
                <select class="form-control" name="tipo" id="inputTipo">
                    <option value="F" <c:if test="${cliente.tipo == 'F'}">selected</c:if>>Pessoa Física</option>
                    <option value="J" <c:if test="${cliente.tipo == 'J'}">selected</c:if>>Pessoa Jurídica</option>
                </select>
            </div>

            <div class="form-group">
                <label for="inputName">Nome completo</label>
                <input type="text" class="form-control" id="inputName" name="nome" value="${cliente.nome}" required autofocus>
            </div>

            <div class="form-group">
                <label for="inputEmail">E-mail</label>
                <input type="email" class="form-control" id="inputEmail" name="email" value="${cliente.email}">
            </div>

            <div class="form-group">
                <label for="inputPhone">Telefone</label>
                <input type="text" class="form-control" id="inputPhone" name="telefone" value="${cliente.telefone}">
            </div>

            <div class="form-group">
                <label for="inputBirthdate">Data de Nascimento</label>
                <input type="date" class="form-control" id="inputBirthdate" name="dt_nascimento" max="${data_max}" value="${cliente.getDataNascimento()}">
            </div>

            <div class="form-group">
                <label for="cep">CEP</label>
                <input type="text" class="form-control" id="cep" name="cep" value="${cliente.cep}">
                <a href="#" class="text-sm-right float-right" id="consultarCep">Consultar CEP</a>
            </div>

            <div class="form-group">
                <label for="logradouro">Logradouro</label>
                <input type="text" class="form-control" id="logradouro" name="logradouro" value="${cliente.logradouro}">
            </div>

            <div class="form-group">
                <label for="bairro">Bairro</label>
                <input type="text" class="form-control" id="bairro" name="bairro" value="${cliente.bairro}">
            </div>

            <div class="form-group">
                <label for="localidade">Município</label>
                <input type="text" class="form-control" id="localidade" name="localidade" value="${cliente.localidade}">
            </div>

            <div class="form-group">
                <label for="uf">UF</label>
                <input type="text" class="form-control" id="uf" name="uf" value="${cliente.uf}">
            </div>

            <div class="form-group">
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="inputActive" name="ativo" ${!cliente.ativo ? null : "checked"}>
                    <label class="custom-control-label" for="inputActive">Cadastro ativo</label>
                </div>
            </div>

            <div class="custom-control-inline float-right mx-0">
                <button type="button" onclick="history.back()" class="btn btn-light float-right mr-2">Cancelar</button>
                <button type="submit" class="btn btn-primary float-right">
                    <c:if test="${cliente != null}">Alterar</c:if>
                    <c:if test="${cliente == null}">Cadastrar</c:if>
                </button>
            </div>
        </form>
    </div>
</body>
</html>
