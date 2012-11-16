<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="modelo.Questao,java.util.ArrayList;"%>
<html>
<%! Questao q; %>
<% q = (Questao)request.getAttribute("questaoEditar");
   if(q==null)
   {
	   q = new Questao();
	   q.setId_questao(0);
	   q.setEnunciado("");
	   q.setRespostaA("");
	   q.setRespostaB("");
	   q.setRespostaC("");
	   q.setRespostaD("");
	   q.setRespCerta("");
	   q.setStatus("");
	   q.setTipo("");
   }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% ArrayList listaQuestoes; %>
<% listaQuestoes = (ArrayList) session.getAttribute("listaQuestoes");

   if(listaQuestoes == null)
	   listaQuestoes = new ArrayList();
%>
	<form action="http://localhost:8080/SGV/Controle" method="GET">
		<fieldset>
			<legend>Dados da questão</legend>
			<br>
			Enunciado&nbsp;&nbsp;&nbsp;
			<input type="text" name="enunciado" size="90" value="<%=q.getEnunciado() %>" />
			<br><br>
			Opção A&nbsp;&nbsp;&nbsp;
			<input type="text" name="respostaA" size="50" value="<%=q.getRespostaA() %>" />
			<br><br>
			Opção B&nbsp;&nbsp;&nbsp;
			<input type="text" name="respostaB" size="50" value="<%=q.getRespostaB() %>" />
			<br><br>
			Opção C&nbsp;&nbsp;&nbsp;
			<input type="text" name="respostaC" size="50" value="<%=q.getRespostaC() %>" />
			<br><br>
			Opção D&nbsp;&nbsp;&nbsp;
			<input type="text" name="respostaD" size="50" value="<%=q.getRespostaD() %>" />
			<br><br>
			Resposta correta&nbsp;&nbsp;&nbsp;
			<select name="respCerta">
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<option value="D">D</option>
			</select>
			<br><br>
			Status&nbsp;&nbsp;&nbsp;
			<select name="status">				
				<%
					String aux = "", aux1 = "";
					if(q.getStatus().equals("A"))
						aux = "selected";
					if(q.getStatus().equals("C"))
						aux1 = "selected";
					out.write("<option value='A' " + aux + ">Ativada</option>");
					out.write("<option value='C' " + aux1 + ">Cancelada</option>");								
				%>
			</select>
			<br><br>
			Tipo da questão&nbsp;&nbsp;&nbsp;
			<select name="status">
				<%
					String aux2 = "", aux3 = "";
					if(q.getTipo().equals("G"))
						aux2 = "selected";
					if(q.getStatus().equals("E"))
						aux3 = "selected";
					out.write("<option value='G' " + aux2 + ">Geral</option>");
					out.write("<option value='E' " + aux3 + ">Especifica</option>");								
				%>
			</select>
			<br><br>
			<input type="submit" name="comando" value="Cadastrar" />
			<input type="hidden" name="tela" value="TelaQuestao" />
			</fieldset>
			<br><br>
			<fieldset>
			<legend>Lista de questões</legend>
			<table>
				<tr>
					<td>ID</td>
					<td>Enunciado</td>
					<td>Opção A</td>
					<td>Opção B</td>
					<td>Opção C</td>
					<td>Opção D</td>
					<td>Resposta</td>
					<td>Status</td>
					<td>Tipo da questão</td>
				</tr>
									
					<% for(Object o:listaQuestoes)
				   {
						out.write("<tr>");
						Questao q = (Questao)o;
						out.write("<td>" + q.getId_questao() + "</td>");
						out.write("<td>" + q.getEnunciado() + "</td>");
						out.write("<td>" + q.getRespostaA() + "</td>");
						out.write("<td>" + q.getRespostaB() + "</td>");
						out.write("<td>" + q.getRespostaC() + "</td>");
						out.write("<td>" + q.getRespostaD() + "</td>");
						out.write("<td>" + q.getRespCerta() + "</td>");
						out.write("<td>" + q.getStatus() + "</td>");
						out.write("<td>" + (q.getTipo().equals("G") ? "Geral" : "Específica") + "</td>");
						request.setAttribute("questaoEditar",q);
						out.write("<td><input type='submit' name='comando' value='Editar' /></td>");
						out.write("</tr>");
						
				   }	
					%>
				
			</table>	
				</fieldset>
	</form>
</body>
</html>