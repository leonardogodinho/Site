<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8080/SGV/Controle" method="GET">
	<fieldset id="dados">
	<legend>Dados</legend>
	<br>
	Nome do Requisito&nbsp;&nbsp;&nbsp;
	<input type="text" name="nome" size="60	"/>
	<br><br>
	Descrição&nbsp;&nbsp;&nbsp;
	<input type="text" name="descricao" size="90"/>
	<br><br>	
	</fieldset>
	<input type="submit" name="comando" value="Cadastrar" />
	<input type="hidden" name="tela" value="TelaRequisito" />
	</form>
</body>
</html>