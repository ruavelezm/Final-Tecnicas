<%-- 
    Document   : Consultar
    Created on : 27/04/2019, 02:02:52 AM
    Author     : Aguila0017
--%>

<%@page import="java.awt.TrayIcon.MessageType"%>
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
    
        
        <div class="container">
            <h1>Consultar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 200px">
                Nombres:
                <input type="text" name="txtNom" class="form-control"/><br>
                <input type="submit" value="Consultar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Regresar</a>
            </form>
            
            <div class="container">
            <h1>Lista de registro</h1>
            
            <a class="btn btn-success btn-lg" href="Permisos.jsp">Nuevo Registro</a>
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Propiedad</th>
                    <th class="text-center">Tipo de arbol</th>
                    <th class="text-center">Altura</th>
                    <th class="text-center">Cantidad</th>
                    <th class="text-center">Destinados</th>
                    <th class="text-center">Acciones</th>
                </tr>
                  <%
            //CONECTANDO A LA BASE DE DATOS
            
            Connection con;
            String url = "jdbc:mysql://localhost:3306/cornare";
            String Driver= "com.mysql.jdbc.Driver";
            String user="root";
            String clave="";
            Class.forName(Driver);
            con=DriverManager.getConnection(url, user, clave);
            
             String Nombre=String.valueOf(request.getParameter("txtNom"));
              int id=2;
             PreparedStatement ps;          
             ResultSet rs;
             ps=con.prepareStatement("select * from aprovechamientos as p where p.nombre= '"+Nombre+"'");
             rs = ps.executeQuery();
           

        %>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("Id")%></td>
                    <td class="text-center"><%= rs.getString("nombre")%></td>
                    <td class="text-center"><%= rs.getString("propiedad")%></td>
                    <td class="text-center"><%= rs.getString("tarbol")%></td>
                    <td class="text-center"><%= rs.getString("altura")%></td>
                    <td class="text-center"><%= rs.getString("cantidad")%></td>
                    <td class="text-center"><%= rs.getString("destinados")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger btn-sm">Eliminar</a>
                        <a href="ver.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-info btn-sm">Ver Licencia</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
        </div>
        
        
    </body>
</html>
