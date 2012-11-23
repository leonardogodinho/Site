<%@include file="header.jsp" %>

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
<%! ArrayList requisitos,itens; %>
<% requisitos = (ArrayList) session.getAttribute("requisitos");
   itens = (ArrayList) session.getAttribute("itens");

   if(requisitos == null)
	   requisitos = new ArrayList();
   if(itens == null)
	   itens = new ArrayList();
%>
<form action="http://localhost:8080/SGV/Controle" class="formee" method="get">
	<fieldset id="dadosVaga">
		<legend>Dados da Vaga</legend>
			<div class="grid-1-12">
				<label for="id" class="bold">ID <em class="formee-req">*</em></label>
				<input type="text" name="id" id="id" value="<%=o.getIdOportunidade() %>" class="no-margin">
			</div>
            <div class="grid-6-12">
                <label for="titulo" class="bold">TÌtulo <em class="formee-req">*</em></label>
                <input type="text" name="titulo" id="titulo" value="<%=o.getIdOportunidade() %>" class="no-margin" placeholder="TÌtulo da Vaga">
            </div>
            <div class="grid-5-12">
                <label class="bold">¡Årea de AtuaÁ„o</label>
                <input  type="text" list="areaatuacao" name="area-atuacao" placeholder="Digite ou Selecione a ¡rea na lista" class="no-margin formee-list">
                <datalist id="areaatuacao">
					<%
						String aux = "", aux1 = "", aux2 = "", aux3 = "", aux4 = "";
						if(o.getAreaAtuacao().equals("Administrativo"))
							aux = "selected";
						if(o.getAreaAtuacao().equals("Comercial"))
							aux1 = "selected";
						if(o.getAreaAtuacao().equals("FinanÁas"))
							aux2 = "selected";
						if(o.getAreaAtuacao().equals("TI"))
							aux3 = "selected";
						if(o.getAreaAtuacao().equals("Vendas"))
							aux4 = "selected";
						out.write("<option value='Administrativo' id='area-opt1' " + aux + ">Administrativo</option>");
						out.write("<option value='Comercial' id='area-opt2' " + aux1 + ">Comercial</option>");
						out.write("<option value='FinanÁas' id='area-opt3' " + aux2 + ">FinanÁas</option>");
						out.write("<option value='TI' id='area-opt4' " + aux3 + ">TI</option>");
						out.write("<option value='Vendas' id='area-opt5' " + aux4 + ">Vendas</option>");
                %>
                    
                </datalist>
			</div>
            <div class="grid-3-12">
                <label for="jornada" class="bold">Carga Hor·ria <em class="formee-req">*</em></label>
                <input type="number" class="no-margin" placeholder="0" id="cargaHoraria" name="cargaHoraria">
            </div>
            <div class="grid-3-12">
            	<label for="salario" class="bold">Sal·rio (R$)</label>
                <input type="number" name="salario" id="salario" value="<%=o.getSalario() %>">
            </div>
            <div class="grid-6-12">
                <label class="bold">BenefÌ≠cios</label>
                <ul class="formee-list">
                    <li><input type="checkbox" value="Plano de Sa˙de" id="planoSaude" name="planoSaude"><label for="plano">Plano de Sa˙de</label></li>
                    <li><input type="checkbox" value="Ticket RefeiÁ„o" id="vr" name="vr"><label for="ticket">Ticket RefeiÁ„o</label></li>
                    <li><input type="checkbox" value="Cesta B·sica" id="cesta" name="cesta"><label for="cesta-basica">Cesta B·sica</label></li>
                    <li><input type="checkbox" value="ParticipaÁ„o nos Lucros" id="pl" name="pl"><label for="pl">ParticipaÁ„o nos Lucros</label></li>
                    <li><input type="checkbox" value="Plano OdontolÛgico" id="planoOdontologico" name="planoOdontologico"><label for="dentista">Plano OdontolÛgico</label></li>
                    <li><input type="checkbox" value="vt" id="vt" name="vt"><label for="vt">Vale Transporte</label></li>
                </ul>
            </div>
            <div class="grid-12-12">
            	<label for="desc" class="bold">DescriÁ„o</label>
            	<textarea name="descricao" id="descricao" cols="20" rows="30" value="<%=o.getDescricao() %>" placeholder="Descreva e informe todos os detalhes da vaga" class="no-margin"></textarea>
            </div>        
            <div class="grid-12-12">
            	<table class="grid-12-12">
            		<caption class="grid-12-12"><h2>Requisitos DisponÌ≠veis</h2></caption>
            		<thead class="grid-12-12">
            			<tr class="grid-12-12">
            				<th class="grid-4-12">Nome</th>
            				<th class="grid-4-12">Quantidade</th>
            				<th class="grid-4-12">Ativo</th>
            			</tr>
					</thead>
                    <tbody class="grid-12-12">
                        <tr class="grid-12-12">
                            <td class="grid-4-12"><div><label for="contratacao">Tempo de ContrataÁ„o</label></div></td>
                            <td class="grid-4-12"><div><input type="number" id="contratacao" name="contratacao"></div></td>
                            <td class="grid-1-12">
                                <div>
                                    <ul class="formee-list">
                                        <li><input type="checkbox" value=""></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr class="grid-12-12">
                            <td class="grid-4-12"><div><label for="faltas">Faltas no ⁄ltimo mÍs</label></div></td>
                            <td class="grid-4-12"><div><input type="number" id="faltas" name="faltas"></div></td>
                            <td class="grid-1-12">
                                <div>
                                    <ul class="formee-list">
                                        <li><input type="checkbox" value=""></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>                
                    </tbody>
            	</table>
            </div>    
            <div class="grid-3-12">
            	<label for="dataEncerramento" class="bold">Data de Encerramento</label>
                <input type="date" id="datepiker" name="dataEncerramento" value="<%=o.getDataEncerramento() %>">
            </div>
            <div class="grid-5-12"></div>
            <div class="grid-4-12">
            	<input type="hidden" name="tela" value="TelaOportunidade" />
                <input type="submit" name="comando" value="Publicar" class="formee-medium align_center" >
			</div>
	</fieldset>
</form>
-=-=-=-==-==-=--=

		
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