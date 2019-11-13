<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Upload files</title>
</head>
<body>
	<input type="file" id="file" name="file" onchange="uploadFile();" />
	<img alt="Imagem" src="" id="target" width="200" height="200">
	<br/>
	<br/>
	<br/>
	<br/>

	<a href="fileUpload?acao=carregar">Carregar imagens</a>
	
	<table>
	
	<c:forEach items="${listaUserImagem}" var="user">
		<tr>
		<td>${user.id}</td>
		<td>${user.login}</td>
		<td><a target="_blank" href="fileUpload?acao=download&iduser=${user.id}">Download Arquivo</a></td>
		</tr>
	</c:forEach>
	</table>
	<br/>
	<br/>
	<br/>
	<br/>
	
	
</body>
<script type="text/javascript">
	function uploadFile() {

		var target = document.querySelector("img");
		var file = document.querySelector("input[type=file]").files[0];

		var reader = new FileReader();

		reader.onloadend = function() {
			target.src = reader.result;
			
			///----- upload ajax ---------

			$.ajax({
				method : "POST",
				url : "fileUpload",
				data : {
					fileUpload : reader.result
				}
			}).done(function(response) {
				alert("sucesso" + response);
				
			}).fail(function(xhr, status, errorThrown) {
				
				alert("Error: " + xhr.responseText);
			});

			///---------------------------
		};

		if (file) {
			reader.readAsDataURL(file);

		} else {
			target.src = "";
		}
	}
</script>
</html>