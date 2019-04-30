<%-- 
    Document   : index
    Created on : 25/04/2019, 03:33:37 PM
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
             ps=con.prepareStatement("select * from arboles");
             rs = ps.executeQuery();
             //Creamos la tabla

        %>
        
        <div class="container">
            <h1>Lista de registro</h1>
            
            
            
             <a class="btn btn-success btn-lg" href="Consultar.jsp"> Consultar</a>
             
              <a class="btn btn-success btn-lg" href="Permisos.jsp"> Gestionar Permisos</a>
              <a class="btn btn-success btn-lg" href="Expedientes.jsp"> Expedientes de investigación</a>
              <a class="btn btn-success btn-lg" href="Informes.jsp"> Informes</a>
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">TIPO</th>
                    <th>PELIGRO</th>
                    <th class="text-center">HASTA 5 </th>
                    <th class="text-center">DE 5 A 10 </th>
                    <th class="text-center">DE 10 A 15 </th>
                    <th class="text-center">MÁS DE 15 </th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"> <%= rs.getInt("Id")%></td>
                    <td class="text-center"> <%= rs.getString("nombre")%></td>
                    <td><%= rs.getString("extincion")%></td>
                    <td class="text-center">$ <%= rs.getString("hasta5")%></td>
                    <td class="text-center">$ <%= rs.getString("de5a10")%></td>
                    <td class="text-center">$ <%= rs.getString("de10a15")%></td>
                    <td class="text-center">$ <%= rs.getString("masde15")%></td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
