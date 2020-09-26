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

                String nomeCliente = request.getParameter("nomeCliente");
                String rgCliente = request.getParameter("rgCliente");
                String cpfCliente = request.getParameter("cpfCliente");
                String emailCliente = request.getParameter("emailCliente");
                String enderecoCliente = request.getParameter("enderecoCliente");
                String telefoneCliente = request.getParameter("telefoneCliente");
                int idadeCliente = Integer.parseInt(request.getParameter("idadeCliente"));
                String sexoCliente = request.getParameter("sexoCliente");

                String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";

                //banco de dados com senha
                con = DriverManager.getConnection(url, "root", "1234");
                statement = con.createStatement();

                String query = "INSERT INTO cliente(nome, rg, cpf, email, endereco, telefone, idade, sexo) VALUES('"
                        + nomeCliente + "','" + rgCliente + "','" + cpfCliente + "','" + emailCliente + "','" 
                        + enderecoCliente + "','" + telefoneCliente + "','" + idadeCliente + "','" + sexoCliente + "')";
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
