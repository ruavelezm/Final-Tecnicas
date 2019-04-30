<%-- 
    Document   : ver
    Created on : 29/04/2019, 03:32:43 PM
    Author     : Aguila0017
--%>

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
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from aprovechamientos where id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>LICENCIA </h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 700px">
                LICENCIA
                <input type="text" readonly="" class="form-control"   value="LICENCIA DE APROVECHAMIENTO" />
                 Concedida al cliente:
                <input type="text" readonly=""  class="form-control" value="<%= rs.getString("nombre")%>"/><br>
                Para el aprovechamiento de recursos de arboles de la especie:
                <input type="text" readonly=""  class="form-control" value="<%= rs.getString("tarbol")%>"/>
                 <br>
                De medida:
                 <input type="text" readonly=""  class="form-control" value="<%= rs.getString("altura")%>"/>
                 <br>
                 De la cantidad:
                 <input type="text" readonly=""  class="form-control" value="<%= rs.getString("destinados")%>"/>
                 <br>
                 De un total de:
                 <input type="text" readonly=""  class="form-control" value="<%= rs.getString("cantidad")%>"/>
                 <br>
                 En la propiedad:
                 <input type="text" readonly=""  class="form-control" value="<%= rs.getString("propiedad")%>"/>
                 <br>
                 Atentamente Cornare
                
                
                <a href="Licencia.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String dni, nom;
       dni=request.getParameter("txtDNI");
       nom=request.getParameter("txtNom");
       if(nom!=null && dni!=null){
           ps=con.prepareStatement("update usuario set Nombres='"+nom+"', DNI='"+dni+"'where id="+id);
           ps.executeUpdate();
           response.sendRedirect("index.jsp");
       }
       
       
%>