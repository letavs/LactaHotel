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
<%@include file="../validarFuncionario.jsp"%>


        <%
            Lider lider = new Lider();
            if (!request.getParameter("id").equals("null")) {// Se houver um id atribua Lider  
                    lider = LiderBD.getId(request.getParameter("id"));
            } 
            SimpleDateFormat faz = new SimpleDateFormat("dd/MM/yyyy");
        
            lider.setDtNasc(faz.parse(request.getParameter("dtNascimento")));
            lider.setNome(request.getParameter("nome"));
            lider.setCpf(request.getParameter("cpf"));
            lider.setTelefone(request.getParameter("telefone"));
            lider.setEstado(request.getParameter("estado"));
            lider.setCidade(request.getParameter("cidade"));

            if (request.getParameter("id").equals("null")) {
                LiderBD.inserir(lider);
                response.sendRedirect("listar.jsp?msg=cadastrado com sucesso!");

            } else {
                  LiderBD.alterar(lider);
                response.sendRedirect("listar.jsp?msg=Alterado com sucesso!");
            }
        %>