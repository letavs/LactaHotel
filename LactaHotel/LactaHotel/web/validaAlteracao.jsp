<%-- 
    Document   : validaAlteracao
    Created on : 19/05/2020, 16:36:07
    Author     : leandro
--%>

<%@page import="persistencia.LiderBD"%>
<%@page import="dominio.Lider"%>
<%
        // Metodo respos�vel para validar se e uma altera��o ou se um novo cadastro
        Lider lider = null;
        System.out.println(request.getParameter("cpf"));

        if (request.getParameter("cpf") == null) {// Se houver um cpf fa�a
            lider = new Lider(); //Sen�o, crie um novo Lider. 

        } else {
            lider = LiderBD.getId(request.getParameter("cpf"));// recebe o cpf e inicia uma altera��o. 
        }
    %>