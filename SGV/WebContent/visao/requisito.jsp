<%@ include file="header.jsp" %>

<%@page import="modelo.*" %>
<%! Requisito r; %>
<% r = (Requisito)request.getAttribute("r");
	if(r==null)
	{
		r = new Requisito();
		r.setIdRequisito(0);
		r.setNome("");
		r.setDescricao("");
	}%>

<form action="http://localhost:8080/SGV/Controle" class="formee" method="get">
	<fieldset id="dados">
		<legend>Novo</legend>
			<div class="grid-1-12">
				<label for="id" class="bold">ID <em class="formee-req">*</em></label>
				<input type="text" name="id" id="id" value="<%=r.getIdRequisito() %>" class="no-margin">
			</div>
			<div class="grid-6-12">
            	<label for="nome-requisito" class="bold">Nome do Requisito</label>
                <input type="text" name="nome" id="nome-requisito" value="<%=r.getNome() %>" class="no-margin">
            </div>
            <!-- <input type="text" name="descricao" size="90" value="<%=r.getDescricao() %>" /> -->
            <div class="grid-5-12">
            
			<input type=hidden name="tela" value="TelaRequisito"> 
                <input type="submit" name="comando" value="Cadastrar" class="formee-small align_center last" >
				<input type="submit" name="comando" value="Alterar" class="formee-small align_center last"/>
				<input type="submit" name="comando" value="Excluir" class="formee-small align_center last"/>
				<input type="submit" name="comando" value="Consultar" class="formee-small align_center last"/>
			</div>
	</fieldset>
</form>
<div class="grid-12-12">
    <table class="grid-12-12" id="table-req">
        <caption class="grid-12-12"><h2>Requisitos Cadastrados</h2></caption>
        <thead class="grid-12-12">
            <tr class="grid-12-12">
                <th class="grid-1-12">ID</th>
                <th class="grid-10-12">Titulo</th>
            </tr>
        </thead>
        <tbody class="grid-12-12">
            <tr class="grid-12-12">
                <td class="grid-1-12"><div><p>R01</p></div></td>
                <td class="grid-10-12"><div><p>Tempo de Casa</p></div></td>
            </tr>
            <tr class="grid-12-12">
                <td class="grid-1-12"><div><p>R02</p></div></td>
                <td class="grid-10-12"><div><p>Número de Faltas</p></div></td>
            </tr>
                            
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>