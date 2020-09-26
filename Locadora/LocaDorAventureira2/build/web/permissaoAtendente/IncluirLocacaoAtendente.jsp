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
            if (session.getAttribute("susuario") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            Connection con = null;
            Statement statement = null;
            Statement st2 = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String nomeCliente = request.getParameter("nome");
                String codFilme = request.getParameter("codFilme");
                String valor = request.getParameter("valor");
                String dataEntrega = request.getParameter("dataEntrega");

                String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";

                //banco de dados sem senha
                con = DriverManager.getConnection(url, "root", "1234");
                statement = con.createStatement();
                st2 = con.createStatement();

                String query3 = "SELECT nomeFilme FROM filme where codFilme=" + codFilme;
                rs = st2.executeQuery(query3);

                while (rs.next()) {
                    String nomeFilme = rs.getString("nomeFilme").toString();
                    String query = "INSERT INTO locacao(nomeCliente, nomeFilme, valor, entregue, dataEntrega) VALUES('"
                            + nomeCliente + "','" + nomeFilme + "','" + valor + "','" + "" + "','" + dataEntrega + "')";
                    int ok = statement.executeUpdate(query);

                    String query2 = "update filme set qtdAlugado = qtdAlugado + 1 where codFilme = " + request.getParameter("codFilme");
                    statement.executeUpdate(query2);
                    
                    String query4 = "update filme set qtdDisponivel = qtdDisponivel - 1 where codFilme = " + request.getParameter("codFilme");
                    statement.executeUpdate(query4);

                    if (ok > 0) {
                        out.println("Dados gravados.");
                    } else {
                        out.println("Erro ao gravar.");
                    }
                    
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
                    if (st2 != null) {
                        st2.close();
                        st2 = null;
                    }
                    if (con != null) {
                        con.close();
                        con = null;
                    }
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                } catch (Exception e) {
                    out.println("<p>Erro " + e.getMessage() + "</p>");
                }
            }
        %>
    </body>
</html>
