<%-- 
    Document   : VisualizarLocacoes
    Created on : 16/04/2020, 18:23:45
    Author     : Micael Trivelato
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"></link>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <title>Visualizar os Mais Alugados</title>
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
    </head>
    <body>
        <%
            if (session.getAttribute("susuario") == null) {
                response.sendRedirect("../index.jsp");
            }
        %>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";

                //banco de dados sem senha
                con = DriverManager.getConnection(url, "root", "1234");
                st = con.createStatement();

                String query = "SELECT * FROM filme ORDER BY qtdAlugado desc";
                rs = st.executeQuery(query);

        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="../PaginaInicial.jsp">LocaDoraVentureira</a>
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
                            <a class="dropdown-item" href="../CadastroCliente.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="VisualizarClientes.jsp">Visualizar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="VisualizarClientesAtrasados.jsp">Já atrasaram</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filmes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../CadastroFilmes.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="VisualizarFilmes.jsp">Visualizar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="VisualizarMaisAlugados.jsp">Mais Alugados</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Locações
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../Locacoes.jsp">Cadastrar</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="VisualizarLocacoes.jsp">Visualizar</a>
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
        <section class="espacamento">
            <div class="row col-12">
                <%while (rs.next()) {%>
                <div class='card col-4 mt-4'>
                    <div class='card-body'>
                        <h5 class="card-title"><p align="center"><B>Nome do Filme</B>:  <%=rs.getString("nomeFilme")%></p></h5>
                        <h6 class="card-title"><B>Classificação indicativa:</B>  <%=rs.getString("classificacaoIndicativa")%> anos; <B>Gênero:</B> 
                                    <%
                                        if (rs.getString("genero").equalsIgnoreCase("C")) {
                                            out.print("Comédia");
                                        } else {
                                            if (rs.getString("genero").equalsIgnoreCase("A")) {
                                                out.print("Ação");
                                            } else {
                                                if (rs.getString("genero").equalsIgnoreCase("V")) {
                                                    out.print("Aventura");
                                                } else {
                                                    if (rs.getString("genero").equalsIgnoreCase("T")) {
                                                        out.print("Terror");
                                                    } else {
                                                        if (rs.getString("genero").equalsIgnoreCase("R")) {
                                                            out.print("Românce");
                                                        } else {
                                                            if (rs.getString("genero").equalsIgnoreCase("F")) {
                                                                out.print("Ficção Científica");
                                                            } else {
                                                                if (rs.getString("genero").equalsIgnoreCase("S")) {
                                                                    out.print("Suspense");
                                                                } else {
                                                                    if (rs.getString("genero").equalsIgnoreCase("D")) {
                                                                        out.print("Documentário");
                                                                    } else {
                                                                        if (rs.getString("genero").equalsIgnoreCase("N")) {
                                                                            out.print("Animação");
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        %>
                        </h6>
                        <h7 class="card-title"><B>Sinopse:</B>  <%=rs.getString("sinopse")%></h7>
                            <div class="mt-4">
                                <B>Este filme foi alugado  <%=rs.getString("qtdAlugado")%> Vezes</B>
                            </div>
                    </div>
                </div>
                <%}%>             
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
        </section>
    </body>
</html>
