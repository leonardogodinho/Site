<!DOCTYPE HTML>
<html>
    <head>
    <meta charset=utf-8>
    <title>Login | Sistema de Gerenciamento de Vagas</title>
    
    <script src="<%=request.getContextPath() %>/visao/js/52/modernizr-1.1.min.js"></script><!-- this is the javascript allowing html5 to run in older browsers -->
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/reset.css" media="screen" title="html5doctor.com Reset Stylesheet" />
    
    <!--Formee js call-->
	<script type="text/javascript" src="<%=request.getContextPath() %>/visao/js/formee/jquery-1.6.4.min.js"></script>
    
    <!--Formee Framework-->
	<script type="text/javascript" src="j<%=request.getContextPath() %>/visao/s/formee/formee.js"></script>
    
    <!--Formee stylesheet structure-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/visao/css/formee/formee-structure.css" type="text/css" media="screen" />
	
    <!--Formee style-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/visao/css/formee/formee-style.css" type="text/css" media="screen" />
    
    <!--Formee basic style page-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/visao/css/formee/formee/style-page.css" type="text/css" media="screen" />
    
    <!--52Framework basic style page-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/visao/css/52/style-page.css" type="text/css" media="screen" />
    
    <!--Custom Stylesheet-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/visao/css/custom.css" type="text/css" media="screen" />

    
    <!-- in the CSS3 stylesheet you will find examples of some great new features CSS has to offer -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/css3.css" media="screen" />
    
    <!-- general stylesheet contains some default styles, you do not need this, but it helps you keep a uniform style -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/general.css" media="screen" />
    
    <!-- grid's will help you keep your website appealing to your users, view 52framework.com website for documentation -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/grid.css" media="screen" />
    
    <!--[if IE]> <style> .report_bugs {left:0px;} </style>	<![endif]-->
    </head>
    
<body>
<div class="row">
	<header class="no-border">
    	
        <div class="logo col_16 col align_center"><img src="<%=request.getContextPath() %>/visao/images/svg-logo.png" title="Sistema de Gerenciamento de Vagas"></div><!-- logo col_7 -->
        
        <div class="clear"></div><!-- clear -->
    </header>
</div><!-- row -->

<!-- this section shows you most of the styled elements from the general stylesheet -->
<section class="row" id="styled">
    <div class="col_16 col align_center">
    	<h1 class="fontface">Sistema de Gerenciamento de Vagas</h1>
        
        <h2 class="no-border">Faça o Login abaixo para acessar a área restrita</h2>
        
        <section id="login">
        	<form action="http://localhost:8080/SGV/Controle" method="GET" class="formee">
            	<fieldset>
                    <div class="grid-6-12">
                        <input type="hidden" name="tela" value="Login" />
                    	<input type="text" placeholder="Login" id="login" name="usuario" class="formee-req" required autofocus>
                        <input type="password" placeholder="Senha" id="passw" name="senha" required>
                        <input type="submit" name="comando" value="Entrar" class="grid-12-12">
                        <a href="" class="right">Esqueci minha senha</a>
                    </div>
                </fieldset>
            </form>
        </section>
        
        
    </div><!-- col_16 -->
</section><!-- row -->

<footer class="row">

	<div class="col_16 col box_shadow"><span class="align_left left">S.G.V. - Versão 1.0</span> <span class="right">Todos os direitos reservados</span></div>

</footer>
</body>
</html>