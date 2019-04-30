<%-- 
    Document   : Permisos
    Created on : 27/04/2019, 01:53:47 AM
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
        <title>Permisos</title>
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
        int resultadoo=0;
        int total;
       ResultSet rs;
         int canP=0, canD=0;
       String validacion="";
       String nombre=""; %>
      
  
        
        <div class="container">
            <h1>Solicitar permiso de aprovechamiento</h1>
            <hr>
            <form name="hola" action="" method="post" class="form-control" style="width: 500px; height: 700px">
                Nombre solicitante:
                <input id="nombre" type="text" name="txtNomCli" class="form-control"/><br>
                Nombre propiedad:
                <input id="propiedad" type="text" name="txtPropiedad" class="form-control"/>
                <br>
                
                Tipo de arbol:
                <input id="tipo" type="text" name="txtNomArb" class="form-control"/>
                <br>
                De altura
                <input id="tipo" type="text" name="txtAltura" class="form-control"/>
                <br>
                
                Cantidad en la propiedad:
                <input id="canPropiedad" type="text" name="txtCantPropiedad" class="form-control"/>
                <br>
                
                 Cantidad destinada:
                <input  id="canDestinada" type="text" name="txtCanDes" class="form-control"/>
                <br>
             
                     <input type="submit" value="Guardar" class="btn btn-primary btn-lg" />
                <a href="index.jsp">Regresar</a>
          
        
      <%  
        nombre=request.getParameter("txtNomArb");
        ps=con.prepareStatement("select * from arboles where nombre='"+nombre+"'");
       rs=ps.executeQuery();
       
       
       while(rs.next()){
                         %>
                         <br>
                         <br>
         Estado del arbol:
       <input  gravity="right" type="text" readonly="" class="form-control"  value="<%= rs.getString("extincion")%> esta en extincion"/>
                    
         
           
       <%
            validacion = rs.getString("extincion");
           }

       %>

<%
       String nomCli, nomPropiedad, nomArb, cantPropiedad, canDestianda, altura;
     
       nomCli=request.getParameter("txtNomCli");
       nomPropiedad=request.getParameter("txtPropiedad");    
       nomArb=request.getParameter("txtNomArb");
       cantPropiedad=request.getParameter("txtCantPropiedad");
       canDestianda=request.getParameter("txtCanDes");
       altura=request.getParameter("txtAltura");
        if(cantPropiedad!=null && canDestianda!=null){
            canP= Integer.parseInt(cantPropiedad);
       canD =  Integer.parseInt(canDestianda);
       
        }
        
           resultadoo = (canP * 10)/100;
    total = canP - resultadoo;
    
    if(canD>=total)
    {
        %>
        <br>
        Estado de licencia:
          <input  gravity="right" type="text" readonly="" class="form-control"  value="no aprobado"/>
   <% }
        
        
     
    else{     if(nomCli!=null && nomPropiedad!=null){
          
          if(validacion.equals("no"))
          {
           ps=con.prepareStatement("insert into aprovechamientos(nombre, propiedad, tarbol, cantidad, destinados, altura)values('"+nomCli+"','"+nomPropiedad+"','"+nomArb+"','"+cantPropiedad+"','"+canDestianda+"','"+altura+"' )");
           ps.executeUpdate();
           
response.sendRedirect("Licencia.jsp");
          
           %>
    <br>
    Estado de licencia:
       <input  gravity="right" type="text" readonly="" class="form-control"  value="aprobado"/> 
       <br></form>
    
    
        </div>        

    <%
          }
          
          else
          {
              ps=con.prepareStatement("insert into investigacion(nombre, cedula, ubicacion, tarbol, cantidad)values('"+nomCli+"','"+nomCli+"','"+nomPropiedad+"','"+nomArb+"','"+cantPropiedad+"')");
           ps.executeUpdate();
           
%>
    <br>
    Estado de licencia:
       <input  gravity="right" type="text" readonly="" class="form-control"  value="no aprobado, se abrira expediente de investigación"/> </form>
        </div>        

    <%
          }
 
    }          
}  
%>

 
 
     </body>
</html>
 <script type="text/javascript">
||  
function Licencia() {
    
    var canPropiedad=document.getElementById("canPropiedad").value;
    var canDestinada=document.getElementById("canDestinada").value;
    var nombre=document.getElementById("nombre").value;
    var tipo=document.getElementById("tipo").value;
    var propiedad=document.getElementById("propiedad").value;
    var resultado;
    var total;
    
    document.write("LICENCIA DE APROVECHAMIENTO"+" <br/>"+" Concedida al cliente: "+nombre+" <br/>"+
                "Para el aprovechamiento de recursos de: "+canDestinada+" <br/>"+" arboles de la especie: "+tipo+" <br/>"+
                "En la propiedad: "+propiedad+" <br/>"+"Atentamente el equipo de cornare");
    }
}



</script>
      