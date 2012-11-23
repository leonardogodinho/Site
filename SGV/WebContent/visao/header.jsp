<%@page import="com.sun.tools.javac.util.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelo.*,java.util.*" %>
    
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
	<script type="text/javascript" src="<%=request.getContextPath() %>/visao/js/formee/formee.js"></script>
    
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

    <!--Custom Font-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/visao/font/stylesheet.css" media="all" type="text/css">
    
    <!-- in the CSS3 stylesheet you will find examples of some great new features CSS has to offer -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/css3.css" media="screen" />
    
    <!-- general stylesheet contains some default styles, you do not need this, but it helps you keep a uniform style -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/general.css" media="screen" />
    
    <!-- grid's will help you keep your website appealing to your users, view 52framework.com website for documentation -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/visao/css/52/grid.css" media="screen" />
    
    <!--[if IE]> <style> .report_bugs {left:0px;} </style>	<![endif]-->
    
    <!-- OF COURSE YOU NEED TO ADAPT NEXT LINE TO YOUR tiny_mce.js PATH -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/visao/tiny_mce/tiny_mce.js"></script>

<script type="text/javascript">
tinyMCE.init({
        theme: "advanced",
		mode : "textareas",
		theme_advanced_buttons1 : "bold, italic, underline, left, right, justify, separator, numlist, bullist, separator, undo, redo"

});
</script>

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
	<nav>
        <ul>
           <li class='has-sub '><a href='#'><span>Cadastrar</span></a>
              <ul>
                 <li><a href='http://localhost:8080/SGV/Controle?tela=principal&comando=TelaOportunidades'><span>Oportunidade</span></a></li>
                 <li><a href='http://localhost:8080/SGV/Controle?tela=principal&comando=TelaQuestoes'><span>Questões</span></a></li>
                 <li><a href="http://localhost:8080/SGV/Controle?tela=principal&comando=TelaRequisitos"><span>Requisitos</span></a></li>
               </ul>
            </li>
            <li><a href="#"><span>Relatórios</span></a></li>
            <li><a href='http://localhost:8080/SGV/Controle?tela=principal&comando=TelaListaOportunidade'><span>Em Aberto</span></a></li>
         </ul>
    </nav>    
<div class="row">

	<header class="no-border col_16">
    
    	<div class="col_10">
        
        </div>
    	
        <div class="logo float_right"><img src="<%=request.getContextPath() %>/visao/images/svg-logo300.png" alt="Sistema de Gerenciamento de Vagas"></div>
        
        <div class="clear"></div><!-- clear -->
    </header>
</div><!-- row -->

