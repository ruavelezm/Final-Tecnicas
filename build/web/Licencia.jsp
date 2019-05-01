<%-- 
    Document   : Licencia
    Created on : 29/04/2019, 02:44:14 PM
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
             ps=con.prepareStatement("select * from aprovechamientos");
             rs = ps.executeQuery();
             //Creamos la tabla

        %>
        
        <div class="container">
            <h1>Lista de licencias</h1>
            
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">NOMBRE</th>
                    <th>PROPIEDAD</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("Id")%></td>
                    <td class="text-center"><%= rs.getString("nombre")%></td>
                    <td><%= rs.getString("propiedad")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger btn-sm">Eliminar</a>
                         <a href="ver.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-info btn-sm">Ver licencia</a>
                          <a href="costos.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-success btn-sm">Costos</a>
                    </td>
                </tr>
                <%  } %>
            </table>
        </div>
    </body>
</html>