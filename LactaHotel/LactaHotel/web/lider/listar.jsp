<%-- 
    Document   : listar
    Created on : 29/04/2020, 20:00:52
    Author     : leandro
--%>

<%@page import="persistencia.FuncionarioBD"%>
<%@page import="dominio.Funcionario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Lider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.LiderBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../validarFuncionario.jsp"%>


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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <div>
        <h1 style="align-content: flex-end"><jsp:include page="/menu.jsp" flush="false"/></h1>
      
    </div> 
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Lacta Hotelx</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<c:url value=" /inicial "/>">Home</a>
                    </li>
                    <li><a href="/menu.jsp" data-toggle="modal" data-target="#myModal">Sair</a>
                    </li>

                </ul>
                <form class="navbar-form navbar-right">
                    <input type="text" class="form-control" placeholder="Search...">
                </form>
            </div>
        </div>
    </nav>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Atenção</h4>
                </div>
                <div class="modal-body">
                    Deseja sair do Sistema ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                    <a class="btn btn-primary" href="<c:url value=" /logout "/>">Sim</a>
                </div>
            </div>
        </div>
    </div>
    
        <input type="submit" onclick="window.location.href = 'http://localhost:8080/LactaHotel/lider/cadastro.jsp'"
               name="cadastro" value="Nova Cadastro">

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
