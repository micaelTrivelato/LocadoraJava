<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"></link>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="../JS/ajax.min.js"></script>
        <title>Pagamento</title>
        <style>
            .espacamento{
                padding: 50px;
            }
            .imagem{
                max-width: 300px;
                max-height: 400px;
                display: flex;
                margin-left: 25%;
            }
            .card{
                box-shadow: inset 0 0 1em blue, 0 0 1em blue;
                border-radius: 30px;
            }
            .link{
                color:white;
            }
        </style>
        <script>
            $(function () {
                $('#pagamento').submit(function () {
                    $.ajax({
                        url: 'FinalizarLocacaoAtendente.jsp',
                        type: 'POST',
                        data: $('#pagamento').serialize(),
                        success: function (data) {
                            alert("Pagamento Realizado!");
                        }
                    });
                    return false;
                });
            });
        </script>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";

                con = DriverManager.getConnection(url, "root", "1234");
                st = con.createStatement();

                String query = "SELECT * FROM locacao WHERE codLocacao=" + request.getParameter("codLocacao");

                rs = st.executeQuery(query);

                if (rs.next()) {
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="PaginaInicialAtendente.jsp">LocaDoraVentureira</a>
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
                            <a class="dropdown-item" href="VisualizarClientesAtendente.jsp">Visualizar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filmes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="VisualizarFilmesAtendente.jsp">Visualizar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Locações
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="locacoesAtendente.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="VisualizarLocacoesAtendente.jsp">Visualizar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Opções
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../logout.jsp">Sair</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="espacamento" align='center'>
            <div class="card col-6">
                <h1 class="mt-3">Edição de Cliente</h1>
                <form action="FinalizarLocacaoAtendente.jsp" id="pagamento">
                    <input type="hidden" name="codLocacao" value="<%=request.getParameter("codLocacao")%>"/>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3" >Filme Alugado:</label>
                        <div class="col-sm-9">
                            <input type="text" readonly="true" class="form-control" id="staticEmail" value="<%=rs.getString("nomeFilme")%>" required="true" name="nomeCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Valor</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" readonly="true" id="staticEmail" value="<%=rs.getString("valor")%>" required="true" name="rgCliente">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Forma de Pagamento:</label>
                        <div class="col-sm-9 mb-4">
                            <select class='form-control' name="formaPagamento">
                                <option selected>
                                    Selecione uma opção
                                </option>
                                <option value="C">
                                    Cartão de Crédito
                                </option>
                                <option value="D">
                                    Cartão de Débito
                                </option>
                                <option value="S">
                                    Dinheiro
                                </option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class='btn btn-primary mb-3 mt-4 btnCadastrar'>Finalizar Pagamento</button>                    
                </form>
            </div>
        </div>
        <%
                }
            } catch (ClassNotFoundException e) {
                out.println("<p>Nao foi possivel carregar o driver do banco de dados!</p>");
            } catch (SQLException e) {
                out.println("<p>Nao foi possivel conectar ou executar consulta com banco de dados. " + e.getMessage() + "</p>");
            } catch (Exception e) {
                out.println("<p>Erro " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (st != null) {
                        st.close();
                        st = null;
                    }
                    if (con != null) {
                        con.close();
                        con = null;
                    }
                } catch (Exception e) {
                    out.println("<p>Erro " + e.getMessage() + "</p>");
                }

            }

        %>
    </body>
</html>
