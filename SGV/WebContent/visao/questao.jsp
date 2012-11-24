<%@page import="modelo.Questao,java.util.ArrayList"%>
<%@ include file="header.jsp" %>

<%! Questao q; %>
<% q = (Questao)request.getAttribute("questaoEditar");
   if(q==null)
   {
	   q = new Questao();
	   q.setIdQuestao(0);
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

<% ArrayList listaQuestoes; %>
<% listaQuestoes = (ArrayList) session.getAttribute("listaQuestoes");

   if(listaQuestoes == null)
	   listaQuestoes = new ArrayList();
%>

<form action="http://localhost:8080/SGV/Controle" class="formee" method="get">
	<fieldset>
		<legend>Banco de Questões</legend>
			<div class="grid-1-12">
				<label for="id" class="bold">ID <em class="formee-req">*</em></label>
				<input type="text" name="id" id="id" class="no-margin">
			</div>
            <div class="grid-6-12">
                <label for="enunciado" class="bold">Enunciado <em class="formee-req">*</em></label>
                <input type="text" name="enunciado" id="enunciado" placeholder="Informe o enunciado da questão" class="no-margin" value='<%=q.getEnunciado() %>'>
            </div>
            <div class="grid-2-12">
				<label for="tipo-questao" class="bold">Tipo <em class="formee-req">*</em></label>
                <select name="tipo-questao" id="tipo-questao" class="no-margin">
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
            </div>
            <div class="grid-3-12">
            	<label class="bold">Status</label>
                <select class="no-margin" name="status">
                	<%
						String aux = "", aux1 = "";
						if(q.getStatus().equals("A"))
							aux = "selected";
						if(q.getStatus().equals("C"))
							aux1 = "selected";
						out.write("<option value='A' id='ativo' "  + aux + " >Habilitada</option>");
						out.write("<option value='C' id='inativo' " + aux1 + ">Desabilitada</option>");								
					%>
                </select>
            </div>
            <div class="grid-12-12">
            	<label for="alternativa-a" class="bold">Alternativa A</label>
                <input type="text" class="no-margin" name="respostaA" id="alternativa-a" value='<%=q.getRespostaA() %>'>
			</div>
            <div class="grid-12-12">
            	<label for="alternativa-b" class="bold">Alternativa B</label>
                <input type="text" class="no-margin" name="respostaB" id="alternativa-b"  value='<%=q.getRespostaB() %>'>
			</div>
            <div class="grid-12-12">
            	<label for="alternativa-c" class="bold">Alternativa C</label>
                <input type="text" class="no-margin" name="respostaC" id="alternativa-c"  value='<%=q.getRespostaC() %>'>
			</div>
            <div class="grid-12-12">
            	<label for="alternativa-d" class="bold">Alternativa D</label>
                <input type="text" class="no-margin" name="respostaD" id="alternativa-d"  value='<%=q.getRespostaD() %>'>
			</div>
			<div class="grid-2-12">
                <label for="resposta">Alternativa Correta <em class="formee-req">*</em></label>
                <input  type="text" list="respCerta" id="resposta" name="respCerta" placeholder="Digite ou Escolha" class="no-margin formee-list" required>
                <datalist id="respCerta">
                    <option value="A" id="resp-a"></option>
                    <option value="B" id="resp-b"></option>
                    <option value="C" id="resp-c"></option>
                    <option value="D" id="resp-d"></option>
                </datalist>
            </div>
            <div class="grid-6-12"></div>
            <div class="grid-4-12">
            	<input type="hidden" name="tela" value="TelaQuestao" />
                <input type="submit" value="Cadastrar" name="comando" class="formee-medium align_center last" >
			</div>
	</fieldset>
</form>
<div class="grid-12-12">
    <table class="grid-12-12" id="table-questoes">
        <caption class="grid-12-12"><h2>Questões Cadastradas</h2></caption>
        <thead class="grid-12-12">
            <tr class="grid-12-12">
                <th class="grid-1-12">ID</th>
                <th class="grid-10-12">Titulo</th>
                <th class="grid-1-12">Status</th>
            </tr>
        </thead>
        <tbody class="grid-12-12">
        <% for(Object o:listaQuestoes)
				   {
						out.write("<tr class='grid-12-12'>");
						Questao q = (Questao)o;
							out.write("<td class='grid-1-12'><div><p>" + q.getIdQuestao() + "</p></div></td>");
							out.write("<td class='grid-10-12'><div><p>" + q.getEnunciado() + "</p></div></td>");
						//out.write("<td>" + q.getRespostaA() + "</td>");
						//out.write("<td>" + q.getRespostaB() + "</td>");
						//out.write("<td>" + q.getRespostaC() + "</td>");
						//out.write("<td>" + q.getRespostaD() + "</td>");
						//out.write("<td>" + q.getRespCerta() + "</td>");
							out.write("<td class='grid-1-12'>" + q.getStatus() + "</td>");
						//out.write("<td>" + (q.getTipo().equals("G") ? "Geral" : "Específica") + "</td>");
						request.setAttribute("questaoEditar",q);
						//out.write("<td><input type='submit' name='comando' value='Editar " + q.getIdQuestao() + "' /></td>");
						out.write("<input type='hidden' name='tela' value='TelaQuestao' />");
						out.write("<td><a href='http://localhost:8080/SGV/Controle?tela=TelaQuestao&comando=Editar&id=" + q.getIdQuestao() + "' />Editar</a></td>");
						out.write("</tr>");
						
				   }	
					%>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>