<%-- 
    Document   : sair
    Created on : 18/05/2020, 21:14:57
    Author     : leandro
--%>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>