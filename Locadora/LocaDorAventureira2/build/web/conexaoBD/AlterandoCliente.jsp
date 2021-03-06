<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterando...</title>
    </head>
    <body>
        <h4>Alterando aluno...</h4>
        <%
        Connection con = null;
        Statement st = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";
            
            con = DriverManager.getConnection(url, "root", "1234");
            st = con.createStatement();
            
            String query = "UPDATE cliente SET nome = '" + request.getParameter("nomeCliente") 
                    + "', rg = '" + request.getParameter("rgCliente") 
                    + "', cpf = '" + request.getParameter("cpfCliente") 
                    + "', email = '" + request.getParameter("emailCliente") 
                    + "', endereco = '" + request.getParameter("enderecoCliente") 
                    + "', telefone = '" + request.getParameter("telefoneCliente") 
                    + "', idade = '" + request.getParameter("idadeCliente") 
                    + "', sexo = '" + request.getParameter("sexoCliente") 
                    + "' WHERE codCliente = " + request.getParameter("codCliente");
            
            int ok = st.executeUpdate(query);
            
            if(ok > 0) 
                response.sendRedirect("../View/VisualizarClientes.jsp");
            else 
                out.println("Erro ao gravar.");
        }
        catch (ClassNotFoundException e) {  out.println("<p>Nao foi possivel carregar o driver do banco de dados!</p>");       }
        catch (SQLException e) { 
            out.println("<p>Nao foi possivel conectar ou executar consulta com banco de dados. " + e.getMessage() +"</p>");
        }
        catch (Exception e) {   out.println("<p>Erro " + e.getMessage() + "</p>");  }
        finally {
            try { 
                    if(st!=null){
                        st.close(); 
                        st=null;
                    }
                    if(con!=null){
                            con.close(); 
                            con=null;
                    }
            }
            catch (Exception e) {   out.println("<p>Erro " + e.getMessage() + "</p>");   }
            
        }
        %>
        <a href="listar.jsp">Voltar</a>
    </body>
</html>
