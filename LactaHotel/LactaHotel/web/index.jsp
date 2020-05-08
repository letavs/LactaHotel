<%-- 
    Document   : index
    Created on : 20/04/2020, 14:01:47
    Author     : leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>JSP Page</title>
    </head>
    <body>
        <h1>HOTEL LACTA!</h1>
        <input type="submit" onclick="window.location.href = 'http://localhost:8080/LactaHotel/lider/cadastro.jsp'"
               name="cadastro" value="Nova Reserva">
        
        <input type="submit" onclick="window.location.href = 'http://localhost:8080/LactaHotel/lider/listar.jsp'"
               name="listar" value="Listar">
 
    </body>
</html>
