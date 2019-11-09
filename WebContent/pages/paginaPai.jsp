<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Página pai Load jQuery</h1>
<input type="button" value="Carregar página" onclick= "carregar();">

<div id = "mostrarPaginaFilha" ></div> <!-- Local de carregamento da pagina filha -->
</body>
<script type="text/javascript">

function carregar(){
	$("#mostrarPaginaFilha").load('paginaFilha.jsp'); //Load em pagina em JQuery
}
</script>
</html>