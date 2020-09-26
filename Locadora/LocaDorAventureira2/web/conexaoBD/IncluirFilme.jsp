<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("susuario")==null){
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            Connection con = null;
            Statement statement = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String nomeFilme = request.getParameter("nomeFilme");
                int classificacao = Integer.parseInt(request.getParameter("classificacao"));
                int qtdDisponivel = Integer.parseInt(request.getParameter("qtdDisponível"));
                String sinopse = request.getParameter("sinopse");
                String genero = request.getParameter("genero");

                String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";

                //banco de dados sem senha
                con = DriverManager.getConnection(url, "root", "1234");
                statement = con.createStatement();

                String query = "INSERT INTO filme(nomeFilme, classificacaoIndicativa, sinopse, genero, qtdAlugado, qtdDisponivel) VALUES('"
                        + nomeFilme + "','" + classificacao + "','" + sinopse + "','" + genero + "','" + 0 + "','" + qtdDisponivel + "')";
                int ok = statement.executeUpdate(query);

                if (ok > 0) {
                    out.println("Dados gravados.");
                } else {
                    out.println("Erro ao gravar.");
                }
            } catch (ClassNotFoundException e) {
                out.println("<p>Nao foi possivel carregar o driver do banco de dados!</p>");
            } catch (SQLException e) {
                out.println("<p>Nao foi possivel conectar ou executar consulta com banco de dados. " + e.getMessage() + "</p>");
            } catch (Exception e) {
                out.println("<p>Erro " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (statement != null) {
                        statement.close();
                        statement = null;
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
