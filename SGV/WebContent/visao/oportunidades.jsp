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
	   o.setId_oportunidade(0);	   
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
<%! ArrayList requisitos; %>
<% requisitos = (ArrayList) session.getAttribute("requisitos");

   if(requisitos == null)
	   requisitos = new ArrayList();
%>
	<form action="http://localhost:8080/SGV/Controle" method="GET">
	<fieldset id="dadosVaga">
		<legend>Dados da Vaga</legend>
		<br>
		Título <input type="text" name="titulo" />
		<br><br>
		Carga Horária 
		<select name="cargaHoraria">
			<option value="20">20</option>
			<option value="40">40</option>
		</select>
		<br><br>
		Área de atuação
		<select name="areaAtuacao">
			<option value="desenvolvimento">Desenvolvimento</option>
			<option value="financeiro">Financeiro</option>
			<option value="dp">Dpto. Pessoal</option>
			<option value="adm">Administrativo</option>
		</select>
		<br><br>
		Salário <input type="text" name="salario" />
		<br><br>
		Descrição, principais atividades e detalhes
		<br><br>
		<textarea rows="10" cols="60" name="descricao"></textarea>
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
		Encerramento <input type="text" id="datepicker" name="dataEncerramento" />
		<br><br>		
	</fieldset>
	<fieldset id="requisitos">
		<legend>Requisitos do candidato</legend>
		<br>		
			Requisito&nbsp;&nbsp;&nbsp;
			<select name="requisito">
				<option value="">__________________</option>
				<% String aux = "";
					for(Object obj:requisitos)
				   {
						Requisito r = (Requisito)obj;
						if(o.getR().getId_requisito() == r.getId_requisito())
							aux = " selected";
						
						out.write("<option value=" + r.getId_requisito() + aux + ">" + 
								"Experiência: " + r.getTempoExperiencia() + " meses, Contratação: " + 
								r.getTempoContratacao() + " mes(es), Faltas: " + r.getFaltas() + "</option>");
						
				   }	
					%>
			</select>
			<br><br>
	</fieldset>
	<%--
	<fieldset id="prova">
		<legend>Prova</legend>
		<br>
		Questões gerais&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="questoesGerais">
			<option value="3">3</option>
			<option value="5">5</option>
			<option value="10">10</option>
		</select>
		<br><br>
		Questões específicas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="questoesEspecificas">
			<option value="3">3</option>
			<option value="5">5</option>
			<option value="10">10</option>
		</select>
		<br><br>
		Peso 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="peso">
			<option value="gerais">Gerais</option>
			<option value="especificas">Específicas</option>
		</select>
		<br><br>
	</fieldset> --%>
	<input type="submit" name="comando" value="Publicar Vaga" />
	<input type="hidden" name="tela" value="TelaOportunidade" />
	</form>
</body>
</html>