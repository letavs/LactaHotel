<%-- 
    Document   : listar
    Created on : 16/05/2020, 23:46:06
    Author     : leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="persistencia.FuncionarioBD"%>
<%@page import="dominio.Funcionario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Lider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.LiderBD"%>
<!DOCTYPE html>

<%
Funcionario funcionario = (Funcionario)session.getAttribute("funcionario");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Lista de Funcionarios</title>
    </head>
    
    <body>
        <h1>Lista de Funcionarios</h1>
        <%=funcionario.getLogin()%>
        <div>
        </div> 
        <input type="submit" onclick="window.location.href = 'http://localhost:8080/LactaHotel/Funcionario/cadastro.jsp'"
               name="novo" value="Novo Funcionario">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Nickname</th>
                    <th scope="col"> </th>
                </tr>
            </thead>
            <tbody>
                <%
                ArrayList<Funcionario> lista = FuncionarioBD.listar();
                for (int i = 0; i < lista.size(); i++) {
                    Funcionario cadaLider = lista.get(i);
                %>}
                    <td> <%=cadaLider.getId()%></td>
                    <td> <%=cadaLider.getLogin()%>  </td>
                    <td> <%=cadaLider.getNickname()%></td>
                    <td>
                        <a href="cadastro.jsp?cpf=<%=cadaLider.getId()%>">Alterar</a>
                        <a href="excluir.jsp?cpf=<%=cadaLider.getId()%>" 
                           onclick="return confirm('Deseja realmente excluir? <%=cadaLider.getId()%>')">Excluir</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
