<%-- 
    Document   : registrar
    Created on : 3/11/2023, 8:11:29 p. m.
    Author     : johan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String Nombre = request.getParameter("nombre");
    String Contrasena = request.getParameter("contrasena");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cx = DriverManager.getConnection("jdbc:mysql://localhost:3306/alan", "alan", "1234");
        String sql = "INSERT INTO usuarios (Nombre, Contraseña) VALUES (?, ?)";
        PreparedStatement stmt = cx.prepareStatement(sql);
        stmt.setString(1, Nombre);
        stmt.setString(2, Contrasena);
        stmt.executeUpdate();
        cx.close();

        out.println("Registro exitoso. <a href='index.html'>Iniciar sesión</a>");
    } catch (Exception e) {
        out.println("Error al registrar usuario: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

    </body>
</html>
