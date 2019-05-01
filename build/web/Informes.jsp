<%-- 
    Document   : Informes
    Created on : 30/04/2019, 04:31:54 PM
    Author     : Aguila0017
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
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

        %>
        
        <div class="container">
            <h1>Informes</h1>
            
          
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">Cuantas licencias fueron otorgadas</th>
                    <th class="text-center">Cuales</th>
                    <th class="text-center">Arqueo de caja</th>
                    <th class="text-center">Cuantos expedientes de investigación</th>
                    <th class="text-center">Cuales</th>
                    <th class="text-center">Cuantos arboles se autorizo a extraer</th>
                </tr>
                <% 
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
             double acumulado=0, costototal=0;
             String costo = "";
             ps3=con.prepareStatement("select * from arqueo");
             rs3 = ps3.executeQuery();
             while(rs3.next()){
                      
                        costo = rs3.getString("costoTotal");
                        costototal = Double.parseDouble(costo); 
                        acumulado = costototal + acumulado;
                       
                    }
            
             
                %>
               
             
                 <tr>
                    <td class="text-center"><%= contador%></td>
                    <td class="text-center"><a class="btn btn-success btn-lg" href="Licencia.jsp">Licencias</a></td>
                    <td class="text-center"><%= acumulado%></td>
                    <td class="text-center"><%= contador2%></td>
                     <td class="text-center"><a class="btn btn-success btn-lg" href="Expedientes.jsp"> Expedientes</a></td>
                     <td class="text-center"><%= acumulador%></td>
                   
                </tr>
            </table>
        </div>
    </body>
</html>