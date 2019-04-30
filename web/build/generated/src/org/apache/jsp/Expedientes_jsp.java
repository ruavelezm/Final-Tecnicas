package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Expedientes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("        ");

            //CONECTANDO A LA BASE DE DATOS
            
            Connection con;
            String url = "jdbc:mysql://localhost:3306/cornare";
            String Driver= "com.mysql.jdbc.Driver";
            String user="root";
            String clave="";
            Class.forName(Driver);
            con=DriverManager.getConnection(url, user, clave);
            
             //Eempezamos listando los datos de la tabla usuario
             
             PreparedStatement ps;
             ResultSet rs;
             ps=con.prepareStatement("select * from investigacion");
             rs = ps.executeQuery();
             //Creamos la tabla

        
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1>Lista de candidatos</h1>\n");
      out.write("            \n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <table class=\"table table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\">ID</th>\n");
      out.write("                    <th class=\"text-center\">NOMBRE</th>\n");
      out.write("                    <th>TIPO</th>\n");
      out.write("                    <th class=\"text-center\">PROPIEDAD</th>\n");
      out.write("                    <th class=\"text-center\">TIPO DE ARBOL</th>\n");
      out.write("                    <th class=\"text-center\">CANTIDAD</th>\n");
      out.write("                    <th class=\"text-center\">ACCIONES</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    while(rs.next()){
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getInt("id"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("nombre"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("tipo"));
      out.write("</td>\n");
      out.write("                     <td class=\"text-center\">");
      out.print( rs.getString("ubicacion"));
      out.write("</td>\n");
      out.write("                     <td class=\"text-center\">");
      out.print( rs.getString("tarbol"));
      out.write("</td>\n");
      out.write("                     <td class=\"text-center\">");
      out.print( rs.getString("cantidad"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">\n");
      out.write("                        <a href=\"Editar.jsp?id=");
      out.print( rs.getInt("id"));
      out.write("\" class=\"btn btn-warning btn-sm\">Editar</a>\n");
      out.write("                        <a href=\"Delete.jsp?id=");
      out.print( rs.getInt("id"));
      out.write("\" class=\"btn btn-danger btn-sm\">Eliminar</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
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
