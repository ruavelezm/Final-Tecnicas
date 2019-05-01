<%-- 
    Document   : costos
    Created on : 29/04/2019, 04:18:10 PM
    Author     : Aguila0017
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
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
                         %>
        <div class="container">
            <h1>LICENCIA </h1>
            <hr>
            <form action="" method="post" class="form-conttxtCantidadrol" style="width: 500px; height: 700px">
                LICENCIA
                <input type="text" readonly="" class="form-control"   value="LICENCIA DE APROVECHAMIENTO" />
                 Concedida al cliente:
                <input type="text" readonly="" name="txtNom"  class="form-control" value="<%= rs.getString("nombre")%>"/><br>
                Para el aprovechamiento de recursos de arboles de la especie:
                <input type="text" readonly="" name="txtArb"  class="form-control" value="<%= rs.getString("tarbol")%>"/>
                 <br>
                De medida:
                 <input type="text" readonly=""  name="txtTama" class="form-control" value="<%= rs.getString("altura")%>"/>
                 <br>
                 De la cantidad:
                 <input type="text" readonly=""   name="txtCantidad" class="form-control" value="<%= rs.getString("destinados")%>"/>
                 <br>
                 De un total de:
                 <input type="text" readonly=""  class="form-control" value="<%= rs.getString("cantidad")%>"/>
                 <br>
                 En la propiedad:
                 <input type="text" readonly=""  class="form-control" value="<%= rs.getString("propiedad")%>"/>
                 <br>
                  <input type="submit" value="Calcular" class="btn btn-primary btn-lg"/>
                
            
            <%  //can = rs.getString("destinados");
                
                tama=String.valueOf(request.getParameter("txtTama"));
                    
                   can=String.valueOf(request.getParameter("txtCantidad"));}%>

   <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">extincion</th>
                    <th class="text-center">Hasta 5</th>
                    <th class="text-center">de 5 a 10</th>
                    <th class="text-center">de 10 a 15</th>
                    <th class="text-center">mas de 15</th>
                    <th class="text-center">Acciones</th>
                </tr>
                  <%
             String Nombre=String.valueOf(request.getParameter("txtArb"));
             
             ps=con.prepareStatement("select * from arboles as p where p.nombre= '"+Nombre+"'");
             rs = ps.executeQuery();
           

        %>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("Id")%></td>
                    <td class="text-center"><%= rs.getString("nombre")%></td>
                    <td class="text-center"><%= rs.getString("extincion")%></td>
                    <td class="text-center"><%= rs.getString("hasta5")%></td>
                    <td class="text-center"><%= rs.getString("de5a10")%></td>
                    <td class="text-center"><%= rs.getString("de10a15")%></td>
                    <td class="text-center"><%= rs.getString("masde15")%></td>
                    <td class="text-center">
                        <a href="ver.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-info btn-sm">Ver Licencia</a>
                    </td>
                </tr>
                <%
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
                       PreparedStatement psa;
       String dni, nom;
       nom=request.getParameter("txtNom");
       dni=request.getParameter("txtDNI");      
       if(nom!=null ){
           ps=con.prepareStatement("insert into arqueo(id, nombre, costoTotal)values('"+id+"','"+nom+"','"+total+"')");
           ps.executeUpdate();
                     
          // response.sendRedirect("index.jsp");
           
       }%>
                    
                    <br>   Total a pagar:
                     <input type="text" readonly=""  class="form-control" value="<%= total%>"/>
                 <br>
                        Total sin cargos administrativos:
                        <input type="text" readonly=""  class="form-control" value="<%= totala%>"/>
                        <br>
                        Total de cargos administrativos:
                        <input type="text" readonly=""  class="form-control" value="<%= totalc%>"/>
                        <br>
                        <a href="Licencia.jsp">Regresar</a>
                 </form>
            </table>
                         </div>
    </body>
</html>