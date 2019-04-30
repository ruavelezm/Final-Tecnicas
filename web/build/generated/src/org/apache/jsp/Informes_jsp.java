package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.swing.JOptionPane;
import java.sql.*;

public final class Informes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
             int contador=0, arboles=0, acumulador=0;
             String arbole = "";
             ps=con.prepareStatement("select * from aprovechamientos");
             rs = ps.executeQuery();
             //Creamos la tabla

        
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1>Informes</h1>\n");
      out.write("            \n");
      out.write("          \n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <table class=\"table table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\">Cuantas licencias fueron otorgadas</th>\n");
      out.write("                    <th class=\"text-center\">Cuales</th>\n");
      out.write("                    <th class=\"text-center\">Arqueo de caja</th>\n");
      out.write("                    <th class=\"text-center\">Cuantos expedientes de investigación</th>\n");
      out.write("                    <th class=\"text-center\">Cuales</th>\n");
      out.write("                    <th class=\"text-center\">Cuantos arboles se autorizo a extraer</th>\n");
      out.write("                </tr>\n");
      out.write("                ");
 
                    while(rs.next()){
                        contador++;
                        arbole = rs.getString("destinados");
                        arboles = Integer.parseInt(arbole);
                        acumulador = arboles + acumulador;   
                    }
             PreparedStatement ps2;
             ResultSet rs2;
             int contador2=0;
             ps2=con.prepareStatement("select * from investigacion");
             rs2 = ps2.executeQuery();
             while(rs2.next()){
                        contador2++;
                    }
            PreparedStatement ps3;
             ResultSet rs3;
             int acumulado=0, costototal=0;
             String costo = "";
             ps3=con.prepareStatement("select * from arqueo");
             rs3 = ps3.executeQuery();
             while(rs3.next()){
                      
                        costo = rs.getString("costoTotal");
                        costototal = Integer.parseInt(costo);
                        acumulado = costototal + acumulado; 
                    }
            
             
                
      out.write("\n");
      out.write("               \n");
      out.write("             \n");
      out.write("                 <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( contador);
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\"><a class=\"btn btn-success btn-lg\" href=\"Licencia.jsp\">Licencias</a></td>\n");
      out.write("                    <td class=\"text-center\"></td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( contador2);
      out.write("</td>\n");
      out.write("                     <td class=\"text-center\"><a class=\"btn btn-success btn-lg\" href=\"Expedientes.jsp\"> Expedientes</a></td>\n");
      out.write("                     <td class=\"text-center\">");
      out.print( acumulador);
      out.write("</td>\n");
      out.write("                   \n");
      out.write("                </tr>\n");
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
