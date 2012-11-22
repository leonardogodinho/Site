<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="modelo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! Colaborador c; %>
<% c = (Colaborador)request.getAttribute("c");
   if(c==null)
   {
	   c = new Colaborador();
	   c.setIdUsuario(0);
	   c.setCpf(0);
	   c.setNome("");
	   c.setDepto("");
	   c.setEmail("");
	   c.setSenha("");
	   c.setTipo("");
	   c.setStatus("");
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
			ID <input type="text" name="id" value="<%=c.getIdUsuario() %>" />
			<br><br>
			CPF <input type="text" name="cpf" value="<%=c.getCpf() %>" />
			<br><br>
			Nome <input type="text" name="nome" value="<%=c.getNome() %>"/>
			<br><br>
			Departamento			
			<select name="departamento">
			<%
				String aux = "", aux1 = "", aux2 = "", aux3 = "", aux4 = "";
				if(c.getDepto().equals("Administrativo"))
					aux = "selected";
				if(c.getDepto().equals("Comercial"))
					aux1 = "selected";
				if(c.getDepto().equals("Finanças"))
					aux2 = "selected";
				if(c.getDepto().equals("TI"))
					aux3 = "selected";
				if(c.getDepto().equals("Vendas"))
					aux4 = "selected";
				out.write("<option value='Administrativo' " + aux + ">Administrativo</option>");
				out.write("<option value='Comercial' " + aux1 + ">Comercial</option>");
				out.write("<option value='Finanças' " + aux2 + ">Finanças</option>");
				out.write("<option value='TI' " + aux3 + ">TI</option>");
				out.write("<option value='Vendas' " + aux4 + ">Vendas</option>");
			%>
			</select>
			<br><br>
			E-mail <input type="text" name="email" value="<%=c.getEmail() %>"/>
			<br><br>
			Senha de acesso <input type="text" name="senha" value="<%=c.getSenha() %>"/>
			<br><br>
			Tipo de usuário
			<select name="tipoUsuario">
				<option value="Colaborador">Colaborador</option>
			</select>
			<br><br>
			Status
			<select name="status">
				<option value="Sem Candidatura">Sem Candidatura</option>
			</select>
			<br>
		</fieldset>
		<br>
		<div id="botoes">
			<input type="submit" name="comando" value="Cadastrar"/>
			<input type="submit" name="comando" value="Alterar"/>
			<input type="submit" name="comando" value="Excluir"/>
			<input type="submit" name="comando" value="Consultar"/>
			<input type=hidden name="tela" value="TelaColaborador">				
		</div>
	</form>
</body>
</html>