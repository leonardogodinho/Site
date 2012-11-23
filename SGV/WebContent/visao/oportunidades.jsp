<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modelo.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! Oportunidade o; %>
<% o = (Oportunidade)request.getAttribute("oportunidade");
   if(o==null)
   {
	   o = new Oportunidade();
	   o.setIdOportunidade(0);
	   o.setAreaAtuacao("");
	   o.setBeneficios("");
	   o.setCargaHoraria(0);
	   o.setDataEncerramento(null);
	   o.setDescricao("");
	   o.setSalario(0);
	   o.setTitulo("");
   }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SGV - Sistema de Gerenciamento de Vagas</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
$(function() {
	$.datepicker.regional['pt'] = {
        closeText: 'Fechar',
        prevText: '<Anterior',
        nextText: 'Seguinte',
        currentText: 'Hoje',
        monthNames: ['Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio', 'Junho',
        'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
        'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
        dayNames: ['Domingo', 'Segunda-feira', 'Ter&ccedil;a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S&aacute;bado'],
        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b'],
        dayNamesMin: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b'],
        weekHeader: 'Sem',
        dateFormat: 'dd/mm/yy',
        firstDay: 0,
        isRTL: false,
        yearSuffix: ''
    };
    
    $.datepicker.setDefaults($.datepicker.regional['pt']);
    $( "#datepicker" ).datepicker();
});
</script>
</head>
<body>
<%! ArrayList requisitos,itens; %>
<% requisitos = (ArrayList) session.getAttribute("requisitos");
   itens = (ArrayList) session.getAttribute("itens");

   if(requisitos == null)
	   requisitos = new ArrayList();
   if(itens == null)
	   itens = new ArrayList();
%>
	<form action="http://localhost:8080/SGV/Controle" method="GET">
	<fieldset id="dadosVaga">
		<legend>Dados da Vaga</legend>
		<br>
		ID <input type="text" name="id" value="<%=o.getIdOportunidade() %>" />
		<br><br>
		Título <input type="text" name="titulo" value="<%=o.getTitulo() %>" />
		<br><br>
		Carga Horária 
		<select name="cargaHoraria">
			<option value="20">20</option>
			<option value="40">40</option>
		</select>
		<br><br>
		Área de atuação
		<select name="areaAtuacao">
			<%
				String aux = "", aux1 = "", aux2 = "", aux3 = "", aux4 = "";
				if(o.getAreaAtuacao().equals("Administrativo"))
					aux = "selected";
				if(o.getAreaAtuacao().equals("Comercial"))
					aux1 = "selected";
				if(o.getAreaAtuacao().equals("Finanças"))
					aux2 = "selected";
				if(o.getAreaAtuacao().equals("TI"))
					aux3 = "selected";
				if(o.getAreaAtuacao().equals("Vendas"))
					aux4 = "selected";
				out.write("<option value='Administrativo' " + aux + ">Administrativo</option>");
				out.write("<option value='Comercial' " + aux1 + ">Comercial</option>");
				out.write("<option value='Finanças' " + aux2 + ">Finanças</option>");
				out.write("<option value='TI' " + aux3 + ">TI</option>");
				out.write("<option value='Vendas' " + aux4 + ">Vendas</option>");
			%>
			</select>
		<br><br>
		Salário <input type="text" name="salario" value="<%=o.getSalario() %>"  />
		<br><br>
		Descrição, principais atividades e detalhes
		<br><br>
		<textarea rows="10" cols="60" name="descricao" value="<%=o.getDescricao() %>" ></textarea>
		<br>
		Benefícios
		<br><br>
		<input type="checkbox" name="vt" value="vt">VT
		<input type="checkbox" name="planoSaude" value="planoSaude">Plano de Saúde
		<input type="checkbox" name="vr" value="vr">VR<br>
		<input type="checkbox" name="cesta" value="cesta">Cesta Básica
		<input type="checkbox" name="pl" value="pl">PL
		<input type="checkbox" name="planoOdonto" value="planoOdonto">Plano Odontológico
		<br><br>
		Encerramento <input type="text" id="datepicker" name="dataEncerramento" value="<%=o.getDataEncerramento() %>"  />
		<br><br>		
	</fieldset>
	<fieldset id="requisitos">
		<legend>Requisitos do candidato</legend>
		<br>		
			Requisito&nbsp;&nbsp;&nbsp;
			<select name="requisito">
				<option value="">__________________</option>
				<% for(Object obj:requisitos)
				   {
						Requisito r = (Requisito)obj;
						out.write("<option value=" + r.getIdRequisito() + ">" + 
								r.getDescricao() + "</option>");
						
				   }	
					%>
			</select>&nbsp;&nbsp;&nbsp;
			Quantidade
			<input type="text" name="quantidade" size=2 value=0 />&nbsp;&nbsp;&nbsp;
			<input type="submit" name="comando" value="Adicionar" style="width:80px;" />
			<input type="submit" name="comando" value="Remover" style="width:80px;" />
			<br><br>
			<table style="border: 1px solid;">
				<tr>
					<td></td>
				</tr>
				<tr>					
					<% for(Object o:itens)
				   {
						ItemRequisito i = (ItemRequisito)o;
						out.write("<tr>");
						out.write("<td>" + i.getR().getIdRequisito() + "    " + i.getQuantidade() + "</td>");
						out.write("</tr>");
				   }	
					%>
				</tr>
			</table>
	</fieldset>
	<div id="botoes">
			<input type="submit" name="comando" value="Cadastrar"/>
			<input type="submit" name="comando" value="Alterar"/>
			<input type="submit" name="comando" value="Excluir"/>
			<input type="submit" name="comando" value="Consultar"/>			
		</div>
	<input type="hidden" name="tela" value="TelaOportunidade" />
	</form>
</body>
</html>