<%-- 
    Document   : Editar
    Created on : 29/04/2019, 03:54:47 PM
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
            <h1>Modificar Registro </h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 600px">
                ID:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("id")%>"/>
                 Nombres:
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("nombre")%>"/><br>
                Propiedad:
                <input type="text" name="txtProp" class="form-control" value="<%= rs.getString("propiedad")%>"/>
                 <br>
                 Cantidad de arboles:
                 <input type="text" name="txtCan" class="form-control" value="<%= rs.getString("cantidad")%>"/>
                 <br>
                 Tipo de arbol:
                 <input type="text" name="txtTarbol" class="form-control" value="<%= rs.getString("tarbol")%>"/>
                 <br>
                 De altura:
                 <input type="text" name="txtAlt" class="form-control" value="<%= rs.getString("altura")%>"/>
                 <br>
                 Arboles destinados
                 <input type="text" name="txtDes" class="form-control" value="<%= rs.getString("destinados")%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="Licencia.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String propiedad, nom, cantidad, destinados, tarbol, altura;
       nom=request.getParameter("txtNom");
       propiedad=request.getParameter("txtProp");
       cantidad=request.getParameter("txtCan");
       tarbol=request.getParameter("txtTarbol");
       destinados=request.getParameter("txtDes");
       altura=request.getParameter("txtAlt");
       
       if(nom!=null && cantidad!=null && propiedad!=null && tarbol!=null ){
           ps=con.prepareStatement("update aprovechamientos set nombre='"+nom+"', propiedad='"+propiedad+"', tarbol='"+tarbol+"', cantidad='"+cantidad+"', destinados='"+destinados+"', altura='"+altura+"' where id="+id);
           ps.executeUpdate();
           response.sendRedirect("Licencia.jsp");
       }
       
       
%>