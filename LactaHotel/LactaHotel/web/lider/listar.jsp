<%-- 
    Document   : listar
    Created on : 29/04/2020, 20:00:52
    Author     : leandro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Lider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.LiderBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <title>Lista de Lideres</title>


    </head>
    <body>
        <h1>Lista de Lideres</h1>
        <input type="submit" onclick="window.location.href = 'http://localhost:8080/LactaHotel/lider/cadastro.jsp'"
               name="cadastro" value="Nova Reserva">

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">CPF</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Data de Nascimento</th>
                    <th scope="col">Cidade</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Agir</th>
                </tr>

            </thead>
            <tbody>
                <%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

                    ArrayList<Lider> listaLideres = LiderBD.listar();

                    for (int idx = 0; idx < listaLideres.size(); idx++) {
                        Lider cadaLider = listaLideres.get(idx);
                        String dtNascimento = "";

                        if (cadaLider.getDtNasc() != null) {
                            dtNascimento = formato.format(cadaLider.getDtNasc());
                        }%>

                <tr>
                    <td> <%=cadaLider.getCpf()%>   </td>
                    <td> <%=cadaLider.getNome()%>  </td>
                    <td> <%=dtNascimento%></td>    
                    <td> <%=cadaLider.getCidade()%></td>   
                    <td> <%=cadaLider.getEstado()%></td>   
                    <td>
                        <a href="cadastro.jsp?cpf=<%=cadaLider.getCpf()%>">Alterar</a>
                        <a href="excluir.jsp?cpf=<%=cadaLider.getCpf()%>" 
                           onclick="return confirm('Deseja realmente excluir? <%=cadaLider.getCpf()%>')">Excluir</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>

    </body>
</html>
