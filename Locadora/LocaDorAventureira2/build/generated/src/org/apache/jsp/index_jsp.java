package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\"></link>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <title>Login</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <style>\n");
      out.write("            .menu ul {\n");
      out.write("                padding-left:18%;\n");
      out.write("                margin:0px;\n");
      out.write("                background-color:#EDEDED;\n");
      out.write("                list-style:none;\n");
      out.write("            }\n");
      out.write("            .menu ul li { display: inline; }\n");
      out.write("            .menu ul li a {\n");
      out.write("                padding: 2px 5%;\n");
      out.write("                display: inline-block;\n");
      out.write("\n");
      out.write("                /* visual do link */\n");
      out.write("                background-color:#EDEDED;\n");
      out.write("                color: #333;\n");
      out.write("                text-decoration: none;\n");
      out.write("                border-bottom:3px solid #EDEDED;\n");
      out.write("            }\n");
      out.write("            .menu ul li a:hover {\n");
      out.write("                border-bottom:3px solid black;\n");
      out.write("            }\n");
      out.write("            .espacamento{\n");
      out.write("                margin-top: 10%;\n");
      out.write("            }\n");
      out.write("            .colorir{\n");
      out.write("                box-shadow: inset 0 0 1em blue, 0 0 1em blue;\n");
      out.write("                border-radius: 30px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            if (session.getAttribute("susuario") != null) {
                response.sendRedirect("PaginaInicial.jsp");
            }
        
      out.write("\n");
      out.write("        <div class=\"espacamento\" align='center'>\n");
      out.write("            <div class=\"card col-7 colorir\">\n");
      out.write("                <h1 class=\"mt-3\">Faça seu Login</h1>\n");
      out.write("                <form method=\"post\" action=\"validar.jsp\">\n");
      out.write("                    <div class=\"form-group row mt-4\">\n");
      out.write("                        <label for=\"staticEmail\" class=\"col-sm-2 col-form-label ml-3\">Usuário:</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"staticEmail\" placeholder=\"Insira seu usuário\" required=\"true\" name=\"usuario\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row mt-4\">\n");
      out.write("                        <label for=\"staticEmail\" class=\"col-sm-2 col-form-label ml-3\">Senha:</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                            <input type=\"password\" class=\"form-control\" id=\"staticEmail\" placeholder=\"Insira sua senha\" required=\"true\" name=\"senha\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <button class='btn btn-primary mb-3 mt-4 btnCadastrar' type=\"submit\">Entrar</button>                    \n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
