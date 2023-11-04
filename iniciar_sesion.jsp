
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String Nombre = request.getParameter("usuario");
    String Contraseña = request.getParameter("contrasena");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alan", "alan", "1234");
        String sql = "SELECT * FROM usuarios WHERE Nombre=? AND Contraseña=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, Nombre);
        stmt.setString(2, Contraseña);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            out.println("Inicio de sesión exitoso. Bienvenido, " + Nombre);
        } else {
            out.println("Inicio de sesión fallido. Por favor, verifique sus credenciales.");
        }

        // Cierra la conexión
        con.close();
    } catch (Exception e) {
        out.println("Error al iniciar sesión: " + e.getMessage());
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
