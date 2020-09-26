<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Usuario" %>
<jsp:useBean id="usu" class="beans.Usuario" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando...</title>
    </head>
    <body>
        <% 
                if(session.getAttribute("susuario")==null){
                    //aqui pode ser consultado o BD e verificado se o usuário existe
                    usu.setIdentificacao(request.getParameter("usuario"));
                    usu.setSenha(request.getParameter("senha"));
                    session.setAttribute("susuario", usu);
                }
                if(usu.getIdentificacao().equalsIgnoreCase("Admin")){
                    response.sendRedirect("PaginaInicial.jsp");
                }else{
                    if(usu.getIdentificacao().equalsIgnoreCase("Balcao")){
                        response.sendRedirect("permissaoAtendente/PaginaInicialAtendente.jsp");
                    }else{
                        session.removeAttribute("susuario");
                        response.sendRedirect("index.jsp");
                    }
                }
                
         %>
    </body>
</html>