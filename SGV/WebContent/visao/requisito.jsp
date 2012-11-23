<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modelo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! Requisito r; %>
<% r = (Requisito)request.getAttribute("r");
   if(r==null)
   {
	   r = new Requisito();
	   r.setIdRequisito(0);
	   r.setNome("");
	   r.setDescricao("");
   }%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8080/SGV/Controle" method="GET">
	<fieldset id="dados">
	<legend>Dados</legend>
	<br>
	ID <input type="text" name="id" value="<%=r.getIdRequisito() %>" />
	<br><br>
	Nome do Requisito&nbsp;&nbsp;&nbsp;
	<input type="text" name="nome" size="60	" value="<%=r.getNome() %>" />
	<br><br>
	Descrição&nbsp;&nbsp;&nbsp;
	<input type="text" name="descricao" size="90" value="<%=r.getDescricao() %>" />
	<br><br>	
	</fieldset>
	<div id="botoes">
			<input type="submit" name="comando" value="Cadastrar"/>
			<input type="submit" name="comando" value="Alterar"/>
			<input type="submit" name="comando" value="Excluir"/>
			<input type="submit" name="comando" value="Consultar"/>
			<input type=hidden name="tela" value="TelaRequisito">				
		</div>
	</form>
</body>
</html>