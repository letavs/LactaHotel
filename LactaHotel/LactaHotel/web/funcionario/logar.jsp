<%@page import="dominio.Funcionario"%>
<%@page import="persistencia.FuncionarioBD"%>
<%
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("passw");
    
    Funcionario usuarioEcontrado = FuncionarioBD.buscarUsuarioSenha(usuario, senha);

    if (usuarioEcontrado != null) {
        session.setAttribute("funcionario", usuarioEcontrado);
        response.sendRedirect("/LactaHotel/lider/listar.jsp");
    } else {
        response.sendRedirect("/LactaHotel/index.jsp?erro=USUARIO_NAO_ENCONTRADO");
    }
%>
 