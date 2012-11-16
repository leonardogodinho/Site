<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function numbersonly(e) {
	var unicode= e.charCode? e.charCode : e.keyCode;
	if (unicode!=8)
	{ //if the key isn't the backspace key (which we should allow) 
		if (unicode<48||unicode>57) //if not a number return false //disable key press 
			return false;
		else
			return true;
	}
}
</script>
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