<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="modelo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! Usuario u; %>
<% u = (Usuario)request.getAttribute("u");
   if(u==null)
   {
	   u = new Usuario();
	   u.setIdUsuario(0);
	   u.setCpf(0);
	   u.setNome("");
	   u.setDepto("");
	   u.setEmail("");
	   u.setSenha("");
	   u.setTipo("");
   }%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8080/SGV/Controle" method="GET">
		<fieldset>
			<legend>Dados do usuário</legend>
			<br>
			ID <input type="text" name="id" value="<%=u.getIdUsuario() %>" />
			<br><br>
			CPF <input type="text" name="cpf" value="<%=u.getCpf() %>" />
			<br><br>
			Nome <input type="text" name="nome" value="<%=u.getNome() %>"/>
			<br><br>
			Departamento			
			<select name="departamento">
			<%
				String aux = "", aux1 = "", aux2 = "", aux3 = "", aux4 = "";
				if(u.getDepto().equals("Administrativo"))
					aux = "selected";
				if(u.getDepto().equals("Comercial"))
					aux1 = "selected";
				if(u.getDepto().equals("Finanças"))
					aux2 = "selected";
				if(u.getDepto().equals("TI"))
					aux3 = "selected";
				if(u.getDepto().equals("Vendas"))
					aux4 = "selected";
				out.write("<option value='Administrativo' " + aux + ">Administrativo</option>");
				out.write("<option value='Comercial' " + aux1 + ">Comercial</option>");
				out.write("<option value='Finanças' " + aux2 + ">Finanças</option>");
				out.write("<option value='TI' " + aux3 + ">TI</option>");
				out.write("<option value='Vendas' " + aux4 + ">Vendas</option>");
			%>
			</select>
			<br><br>
			E-mail <input type="text" name="email" value="<%=u.getEmail() %>"/>
			<br><br>
			Senha de acesso <input type="text" name="senha" value="<%=u.getSenha() %>"/>
			<br><br>
			Tipo de usuário
			<select name="tipoUsuario">
			<%
				String aux5 = "", aux6 = "", aux7 = "";
				if(u.getTipo().equals("RH"))
					aux5 = "selected";
				if(u.getTipo().equals("Supervisor"))
					aux6 = "selected";
				if(u.getTipo().equals("Gerente"))
					aux7 = "selected";
				out.write("<option value='RH' " + aux + ">RH</option>");
				out.write("<option value='Supervisor' " + aux1 + ">Supervisor</option>");
				out.write("<option value='Gerente' " + aux2 + ">Gerente</option>");				
			%>
			</select>
			<br>
		</fieldset>
		<br>
		<div id="botoes">
			<input type="submit" name="comando" value="Cadastrar"/>
			<input type="submit" name="comando" value="Alterar"/>
			<input type="submit" name="comando" value="Excluir"/>
			<input type="submit" name="comando" value="Consultar"/>
			<input type=hidden name="tela" value="TelaUsuario">				
		</div>
	</form>
</body>
</html>