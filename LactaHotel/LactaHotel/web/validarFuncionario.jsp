<%-- 
    Document   : validarFuncionario
    Created on : 18/05/2020, 20:43:18
    Author     : leandro
--%>
<%@page import="dominio.Funcionario"%>

<%
    Funcionario funLogado = null;
    if (session.getAttribute("funcionario") != null) {
        funLogado = (Funcionario) session.getAttribute("funcionario");

    } else {
        response.sendRedirect("/LactaHotel/index.jsp");
    }
%>