<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"></link>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="../JS/ajax.min.js"></script>
        <title>Locações</title>
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
            .btnAdFilme{
                display:flex;
            }
        </style>
        <script>
            $(function () {
                $('#cadastroLocacao').submit(function () {
                    $.ajax({
                        url: 'IncluirLocacaoAtendente.jsp',
                        type: 'POST',
                        data: $('#cadastroLocacao').serialize(),
                        success: function (data) {
                            alert("Locação Cadastrada!!");
                        }
                    });
                    return false;
                });
            });
        </script>
    </head>
    <body>
        <%
            if (session.getAttribute("susuario") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            Connection con = null;
            Statement st = null;
            Statement st2 = null;
            ResultSet rs = null;
            ResultSet rs2 = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/locadoraventureira?useTimezone=true&serverTimezone=UTC&useSSL=false";

                //banco de dados sem senha
                con = DriverManager.getConnection(url, "root", "1234");
                st = con.createStatement();
                st2 = con.createStatement();

                String query = "SELECT * FROM filme ORDER BY codFilme";
                rs = st.executeQuery(query);

                String query2 = "SELECT * FROM cliente ORDER BY codCliente";
                rs2 = st2.executeQuery(query2);


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
            <div class="card col-7">
                <h1 class="mt-3">Nova Locação</h1>
                <form action="IncluirLocacaoAtendente.jsp" id="cadastroLocacao">
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Selecione o cliente:</label>
                        <div class="col-sm-9 mb-4">
                            <select class='form-control' name="nome">
                                <option>
                                    Selecione uma opção
                                </option >
                                <% 
                                    while (rs2.next()) {
                                       
                                %>
                                <option value="<%=rs2.getString("nome")%>">
                                    <%=rs2.getString("nome")%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Selecione o Filme:</label>
                        <div class="col-sm-9 mb-4">
                            <select class='form-control' name="codFilme">
                                <option>
                                    Selecione uma opção
                                </option>
                                <%
                                    while (rs.next()) {
                                        if(Integer.parseInt(rs.getString("qtdDisponivel")) > 0){
                                %>
                                <option value="<%=rs.getString("codFilme")%>">
                                    <%=rs.getString("nomeFilme")%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Data de Entrega:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="staticEmail" maxlength="300"  name='dataEntrega' required="true">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Insira o Valor:</label>
                        <div class="col-sm-9">
                            <input type="number" step="any" class="form-control" id="staticEmail" name='valor' required="true">
                        </div>
                    </div>        
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Multa diária por atraso:</label>
                        <div class="col-sm-9">
                            <input type="number" readonly="true" step="any" class="form-control" id="staticEmail" name='multa' placeholder="R$2,00" required="true">
                        </div>
                    </div> 
                    <button type="submit" class='btn btn-primary mb-3 mt-4 btnCadastrar'>Finalizar Locação</button>                   
                </form>
            </div>
        </div>
        <%
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
                    if (rs2 != null) {
                        rs2.close();
                        rs2 = null;
                    }
                    if (st != null) {
                        st.close();
                        st = null;
                    }
                    if (st2 != null) {
                        st2.close();
                        st2 = null;
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