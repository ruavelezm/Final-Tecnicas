package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.swing.JOptionPane;
import java.sql.*;

public final class costos_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/cornare";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       String tama="";
       String can="";
       double total =0,totala=0, totalc=0 ;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from aprovechamientos where id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1>LICENCIA </h1>\n");
      out.write("            <hr>\n");
      out.write("            <form action=\"\" method=\"post\" class=\"form-conttxtCantidadrol\" style=\"width: 500px; height: 700px\">\n");
      out.write("                LICENCIA\n");
      out.write("                <input type=\"text\" readonly=\"\" class=\"form-control\"   value=\"LICENCIA DE APROVECHAMIENTO\" />\n");
      out.write("                 Concedida al cliente:\n");
      out.write("                <input type=\"text\" readonly=\"\" name=\"txtNom\"  class=\"form-control\" value=\"");
      out.print( rs.getString("nombre"));
      out.write("\"/><br>\n");
      out.write("                Para el aprovechamiento de recursos de arboles de la especie:\n");
      out.write("                <input type=\"text\" readonly=\"\" name=\"txtArb\"  class=\"form-control\" value=\"");
      out.print( rs.getString("tarbol"));
      out.write("\"/>\n");
      out.write("                 <br>\n");
      out.write("                De medida:\n");
      out.write("                 <input type=\"text\" readonly=\"\"  name=\"txtTama\" class=\"form-control\" value=\"");
      out.print( rs.getString("altura"));
      out.write("\"/>\n");
      out.write("                 <br>\n");
      out.write("                 De la cantidad:\n");
      out.write("                 <input type=\"text\" readonly=\"\"   name=\"txtCantidad\" class=\"form-control\" value=\"");
      out.print( rs.getString("destinados"));
      out.write("\"/>\n");
      out.write("                 <br>\n");
      out.write("                 De un total de:\n");
      out.write("                 <input type=\"text\" readonly=\"\"  class=\"form-control\" value=\"");
      out.print( rs.getString("cantidad"));
      out.write("\"/>\n");
      out.write("                 <br>\n");
      out.write("                 En la propiedad:\n");
      out.write("                 <input type=\"text\" readonly=\"\"  class=\"form-control\" value=\"");
      out.print( rs.getString("propiedad"));
      out.write("\"/>\n");
      out.write("                 <br>\n");
      out.write("                  <input type=\"submit\" value=\"Calcular\" class=\"btn btn-primary btn-lg\"/>\n");
      out.write("                \n");
      out.write("            \n");
      out.write("            ");
  //can = rs.getString("destinados");
                
                tama=String.valueOf(request.getParameter("txtTama"));
                    
                   can=String.valueOf(request.getParameter("txtCantidad"));}
      out.write("\n");
      out.write("\n");
      out.write("   <table class=\"table table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\">ID</th>\n");
      out.write("                    <th class=\"text-center\">Nombre</th>\n");
      out.write("                    <th class=\"text-center\">extincion</th>\n");
      out.write("                    <th class=\"text-center\">Hasta 5</th>\n");
      out.write("                    <th class=\"text-center\">de 5 a 10</th>\n");
      out.write("                    <th class=\"text-center\">de 10 a 15</th>\n");
      out.write("                    <th class=\"text-center\">mas de 15</th>\n");
      out.write("                    <th class=\"text-center\">Acciones</th>\n");
      out.write("                </tr>\n");
      out.write("                  ");

             String Nombre=String.valueOf(request.getParameter("txtArb"));
             
             ps=con.prepareStatement("select * from arboles as p where p.nombre= '"+Nombre+"'");
             rs = ps.executeQuery();
           

        
      out.write("\n");
      out.write("                ");

                    while(rs.next()){
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getInt("Id"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("nombre"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("extincion"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("hasta5"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("de5a10"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("de10a15"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("masde15"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">\n");
      out.write("                        <a href=\"ver.jsp?id=");
      out.print( rs.getInt("Id"));
      out.write("\" class=\"btn btn-info btn-sm\">Ver Licencia</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                     int cA = 0;
                    int a =0;
                    int b = 3;
                    
                   
                    b = Integer.parseInt(tama);
                    
                     a = Integer.parseInt(can);
                 
                    total = a+b;
                     
                      if(tama != null && can !=null)
                    {
                         cA = Integer.parseInt(can);
                     a = Integer.parseInt(tama);
                     b = 3;
                     total =0 ;
                     totala= 0;
                     totalc= 0;
                    
                    
                  
                    
                    if(a<=5)
                    {
                        String precio = rs.getString("hasta5");
                        int p = Integer.parseInt(precio);
                        
                        total = ((p * cA)*0.3)+(p*cA);
                        totala= (p*cA);       
                        totalc = ((p * cA)*0.3);
                    }
                    else
                    {
                        if(a>5 && a<=10)
                        {
                             String precio = rs.getString("de5a10");
                             int p = Integer.parseInt(precio);
                             total = ((p * cA)*0.3)+(p*cA);
                             totala= (p*cA);
                             totalc = ((p * cA)*0.3);
                             
                        }
                        else
                        {
                            if(a>10 && a<=15)
                            {
                                 String precio = rs.getString("de10a15");
                                 int p = Integer.parseInt(precio);
                                 total = ((p * cA)*0.3)+(p*cA);
                                 totala= (p*cA);
                                 totalc = ((p * cA)*0.3);
                            }
                            else if(a>15)
                            {
                                 String precio = rs.getString("masde15");
                                 int p = Integer.parseInt(precio);
                                 total = ((p * cA)*0.3)+(p*cA);
                                 totala= (p*cA);
                                 totalc = ((p * cA)*0.3);
                            }
                        }
                    }
                    }
                       //JOptionPane.showMessageDialog(null,total); 
                       
                       
//CONECTANOD A LA BASE DE DATOS:
     

       
       
                    }
    
      out.write("\n");
      out.write("                    \n");
      out.write("                    <br>   Total a pagar:\n");
      out.write("                     <input type=\"text\" readonly=\"\"  class=\"form-control\" value=\"");
      out.print( total);
      out.write("\"/>\n");
      out.write("                 <br>\n");
      out.write("                        Total sin cargos administrativos:\n");
      out.write("                        <input type=\"text\" readonly=\"\"  class=\"form-control\" value=\"");
      out.print( totala);
      out.write("\"/>\n");
      out.write("                        <br>\n");
      out.write("                        Total de cargos administrativos:\n");
      out.write("                        <input type=\"text\" readonly=\"\"  class=\"form-control\" value=\"");
      out.print( totalc);
      out.write("\"/>\n");
      out.write("                        <br>\n");
      out.write("                        <a href=\"Licencia.jsp\">Regresar</a>\n");
      out.write("                 </form>\n");
      out.write("            </table>\n");
      out.write("                         </div>\n");
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
