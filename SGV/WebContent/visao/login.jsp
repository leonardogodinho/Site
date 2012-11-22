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
Faça o seu login abaixo para acessar a sua área exclusiva
<br><br>
Usuário <input type="text" name="usuario" onkeypress="return numbersonly(event);"/>
<br>
Senha <input type="password" name="senha" />
<br><br>
<input type="submit" name="comando" value="Entrar" />
<input type="hidden" name="tela" value="Login" />
</form>
</body>
</html>