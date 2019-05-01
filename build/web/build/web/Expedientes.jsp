<%-- 
    Document   : Expedientes
    Created on : 30/04/2019, 04:32:48 PM
    Author     : Aguila0017
--%>

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
             ps=con.prepareStatement("select * from investigacion");
             rs = ps.executeQuery();
             //Creamos la tabla

        %>
        
        <div class="container">
            <h1>Expedientes de investigación</h1>
            
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">NOMBRE</th>
                 
                    <th class="text-center">PROPIEDAD</th>
                    <th class="text-center">TIPO DE ARBOL</th>
                    <th class="text-center">CANTIDAD</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("id")%></td>
                    <td class="text-center"><%= rs.getString("nombre")%></td>
       
                     <td class="text-center"><%= rs.getString("ubicacion")%></td>
                     <td class="text-center"><%= rs.getString("tarbol")%></td>
                     <td class="text-center"><%= rs.getString("cantidad")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>