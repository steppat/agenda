<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Agenda de Contato</title>
</head>

<body>
	<h2>Listar contatos</h2>
	<ul>
	<c:forEach items="${contatoList}" var="contato">
		<li>
		${contato.nome} - ${contato.telefone} - 
		<a href="/agenda/contato/${contato.id}/editar">editar</a> - 
		<a href="/agenda/contato/${contato.id}">exibir</a> - 
		<a href="#" id="${contato.id}" class="delete">deletar</a> 
		</li>
	</c:forEach>
	</ul>
	<a href="/agenda/contato/novo">Novo</a> 
	<br><br>
</body>

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.delete').click(function(){
				var link = $(this);
				var id = link.attr('id');
				$.ajax({
					type: 'POST',
					url:"/agenda/contato/" + id,
					data: {
						_method:'DELETE'
					},
					success: function(){
						link.parent().remove();
					}
				});
			});
		});
	</script>

</html>