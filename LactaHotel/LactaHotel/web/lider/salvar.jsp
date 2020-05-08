<%-- 
    Document   : salvar
    Created on : 21/04/2020, 18:14:37
    Author     : leandro
--%>

<%@page import="persistencia.LiderBD"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Lider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro efetuado com sucesso</title>
    </head>
    <body>
        <%
            Lider lider;
            
            if (request.getParameter("cpf") == "null") {// Se houver um id atribua Lider  
                lider = LiderBD.getId(request.getParameter("cpf"));
            } else {
                lider = new Lider();
            }
            SimpleDateFormat faz = new SimpleDateFormat("dd/MM/yyyy");
            lider.setDtNasc(faz.parse(request.getParameter("dtNascimento")));
            lider.setNome(request.getParameter("nome"));
            lider.setCpf(request.getParameter("cpf"));
            lider.setTelefone(request.getParameter("telefone"));
            lider.setEstado(request.getParameter("estado"));
            lider.setCidade(request.getParameter("cidade"));

            if (request.getParameter("cpf") != "null") {
                LiderBD.alterar(lider);
                out.println(lider.getCpf() + " Alterado com sucesso!");

            } else {
                LiderBD.inserir(lider);
                out.println(lider.getCpf() + " Cadastrado com sucesso!");
            }
        %>

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <!-- http://www.jquery2dotnet.com -->
        <!--<div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                            ×</button>
                       <span class="glyphicon glyphicon-ok"></span> <strong>Successo!!</strong>
                        <hr class="message-inner-separator">
                        <p>
                            Cadastro efetuado !!!</p>
        <%response.sendRedirect("listar.jsp");%>
    </div>

</div>-->
        <!--</div>-->
    </body>
</html>
