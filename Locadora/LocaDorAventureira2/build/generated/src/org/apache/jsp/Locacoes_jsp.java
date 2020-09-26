package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Locacoes_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\"></link>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <title>Locações</title>\n");
      out.write("        <style>\n");
      out.write("            .card{\n");
      out.write("                display: flex;\n");
      out.write("                justify-content:center;\n");
      out.write("                align-itens:center;\n");
      out.write("            }\n");
      out.write("            .espacamento{\n");
      out.write("                padding: 50px;\n");
      out.write("            }\n");
      out.write("            .btnCadastrar{\n");
      out.write("                display:flex;\n");
      out.write("            }\n");
      out.write("            .btnAdFilme{\n");
      out.write("                display:flex;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            if(session.getAttribute("susuario")==null){
                response.sendRedirect("index.jsp");
            }
        
      out.write("\n");
      out.write("        ");

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
                

        
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"PaginaInicial.jsp\">LocaDoraVentureira</a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("                <ul class=\"navbar-nav mr-auto\">\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Cadastro de Clientes\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"CadastroCliente.jsp\">Cadastrar</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"./View/VisualizarClientes.jsp\">Visualizar</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Filmes\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"CadastroFilmes.jsp\">Cadastrar</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"./View/VisualizarFilmes.jsp\">Visualizar</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Locações\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"Locacoes.jsp\">Cadastrar</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"./View/VisualizarLocacoes.jsp\">Visualizar</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Opções\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"logout.jsp\">Sair</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"espacamento\" align='center'>\n");
      out.write("            <div class=\"card col-7\">\n");
      out.write("                <h1 class=\"mt-3\">Nova Locação</h1>\n");
      out.write("                <form action=\"conexaoBD/IncluirLocacao.jsp\">\n");
      out.write("                    <div class=\"form-group row mt-4\">\n");
      out.write("                        <label for=\"staticEmail\" class=\"col-sm-2 col-form-label ml-3\">Selecione o cliente:</label>\n");
      out.write("                        <div class=\"col-sm-9 mb-4\">\n");
      out.write("                            <select class='form-control' name=\"nome\">\n");
      out.write("                                <option>\n");
      out.write("                                    Selecione uma opção\n");
      out.write("                                </option>\n");
      out.write("                                ");
                                    while (rs2.next()) {
                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rs2.getString("nome"));
      out.write("\">\n");
      out.write("                                    ");
      out.print(rs2.getString("nome"));
      out.write("\n");
      out.write("                                </option>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row mt-4\">\n");
      out.write("                        <label for=\"staticEmail\" class=\"col-sm-2 col-form-label ml-3\">Selecione o Filme:</label>\n");
      out.write("                        <div class=\"col-sm-9 mb-4\">\n");
      out.write("                            <select class='form-control' name=\"nomeFilme\">\n");
      out.write("                                <option>\n");
      out.write("                                    Selecione uma opção\n");
      out.write("                                </option>\n");
      out.write("                                ");

                                    while (rs.next()) {
                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rs.getString("nomeFilme"));
      out.write("\">\n");
      out.write("                                    ");
      out.print(rs.getString("nomeFilme"));
      out.write("\n");
      out.write("                                </option>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                        <!--<div>\n");
      out.write("                            <button class='btn btn-primary btnAdFilme'>Confirmar Filme</button>                                    \n");
      out.write("                        </div>-->\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class='btn btn-primary mb-3 mt-4 btnCadastrar'>Finalizar Locação</button>                    \n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
