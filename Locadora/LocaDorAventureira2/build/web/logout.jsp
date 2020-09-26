<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            if(session.getAttribute("susuario")!=null){
                session.removeAttribute("susuario");
            }
           response.sendRedirect("index.jsp");
        %>
    </body>
</html>
