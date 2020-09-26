<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apagar Cliente</title>
    </head>
    <body>
        <%
            if (session.getAttribute("susuario") == null) {
                response.sendRedirect("../index.jsp");
            }
        %>
        <h4>Excluindo Cliente...</h4>
        <%
        Connection con = null;
        Statement st = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/locadoraventureira?allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC&useSSL=false";
            
            con = DriverManager.getConnection(url, "root", "1234");
            st = con.createStatement();
            
            String query = "DELETE FROM cliente WHERE codCliente=" + request.getParameter("codCliente");
            
            st.executeUpdate(query);
            response.sendRedirect("../View/VisualizarClientes.jsp");
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
    </body>
</html>
