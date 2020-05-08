

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.LiderBD"%>
<%@page import="dominio.Lider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Lideres</title>
    </head>
    <body>
    <head>
    <h1>Cadastro de Lideres</h1>
</head>
<form name="formCadastro" action="salvar.jsp" method="post">
    <%
        Lider lider = null;
        if (request.getParameter("cpf") == null) {// Se houver um cpf faça
            lider = new Lider(); //Senão, crie um novo Lider. 

        } else {
            lider = LiderBD.getId(request.getParameter("cpf"));// recebe o cpf e inicia uma alteração. 
        }
    %>
    <table style="with: 50%">
        <tr><td>Nome</td>
            <td><input type="text" name="nome" value="<%=lider.getNome()%>"/></td></tr>
        <tr><td>CPF </td>
            <td><input type="text" name="cpf" value="<%=lider.getCpf()%>" /></td></tr>
        <tr><td>Telefone</td>
            <td><input type="text" name="telefone" value="<%=lider.getTelefone()%>"/></td>
        </tr><tr><td>Data de Nascimento</td>
            <%
                String dataFormata = "";
                if (lider.getDtNasc() != null) {
                    SimpleDateFormat formart = new SimpleDateFormat("dd/MM/yyyy");
                    dataFormata = formart.format(lider.getDtNasc());
                }
            %>
            <td><input type="text" name="dtNascimento" value="<%=dataFormata%>"/></td>
        </tr><tr><td>Cidade</td>
            <td><input type="text" name="cidade" value="<%=lider.getCidade()%>"/></td>
        </tr><tr><td>Estado</td>
            <%
                String estadoSelecionado = "SP";
                if (lider.getEstado() != null) {
                    estadoSelecionado = lider.getEstado();
                }
            %>
            <td>
                <select name="estado" style="with: 50%">
                    <option value="SP" <% if (estadoSelecionado.equals("SP")) {
                            out.println("selected");
                        } %>>Sao Paulo</option>
                    <option value="RJ" <% if (estadoSelecionado.equals("RJ")) {
                            out.println("selected");
                        } %>>Rio de Janeiro</option>
                    <option value="ES" <% if (estadoSelecionado.equals("ES")) {
                            out.println("selected");
                        }%>>Espirito Santo</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" name="salvar" value="Salvar"/></td>
        <input type="hidden" name="idAlterado" value="<%=request.getParameter("cpf")%>"/> 

        </tr>
    </table>
</form>
</body>
</html>
