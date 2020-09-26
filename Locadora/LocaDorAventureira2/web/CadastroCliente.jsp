<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"></link>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="JS/ajax.min.js"></script>
        <title>Cadastro de Clientes</title>
        <style>
            .card{
                display: flex;
                justify-content:center;
                align-itens:center;
            }
            .espacamento{
                padding: 50px;
            }
            .btnCadastrar{
                display:flex;
            }
        </style>
    </head>
    <body>
        <script>
            $(function () {
                $('#cadastroCliente').submit(function () {
                    $.ajax({
                        url: 'conexaoBD/IncluirCliente.jsp',
                        type: 'POST',
                        data: $('#cadastroCliente').serialize(),
                        success: function (data) {
                            alert("Cliente Cadastrado!");
                        }
                    });
                    return false;
                });
            });
        </script>
        <%
            if (session.getAttribute("susuario") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="PaginaInicial.jsp">LocaDoraVentureira</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cadastro de Clientes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="CadastroCliente.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="./View/VisualizarClientes.jsp">Visualizar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="./View/VisualizarClientesAtrasados.jsp">Já atrasaram</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filmes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="CadastroFilmes.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="./View/VisualizarFilmes.jsp">Visualizar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="./View/VisualizarMaisAlugados.jsp">Mais Alugados</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Locações
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="Locacoes.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="./View/VisualizarLocacoes.jsp">Visualizar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Opções
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="logout.jsp">Sair</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="espacamento" align='center'>
            <div class="card col-6">
                <h1 class="mt-3">Cadastre seu Cliente</h1>
                <form action="conexaoBD/IncluirCliente.jsp" id="cadastroCliente">
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3" >Nome:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o seu nome" required="true" name="nomeCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">RG:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o seu RG" required="true" name="rgCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">CPF:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o CPF" required="true" name="cpfCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">E-mail:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o seu e-mail" required="true" name="emailCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Endereço:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o seu endereço" required="true" name="enderecoCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Telefone:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o seu telefone" required="true" name="telefoneCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Idade:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira o sua idade:" required="true" name="idadeCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Sexo:</label>
                        <div class="col-sm-9 mb-4">
                            <select class='form-control' name="sexoCliente">
                                <option>
                                    Selecione uma opção
                                </option>
                                <option value="F">
                                    Feminino
                                </option>
                                <option value="M">
                                    Masculino
                                </option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class='btn btn-primary mb-3 mt-4 btnCadastrar'>Cadastrar</button>                    
                </form>
            </div>
        </div>
    </body>
</html>