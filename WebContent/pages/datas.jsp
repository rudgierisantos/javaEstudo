<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Datas</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<form action="calcularDataFinal" method="post">

		<label>Data Inicial</label> 
		<input id="data" name="data"> 
		
		<label>Tempo em horas</label> 
		<input type="text" id="tempo" name="tempo"> 
		
		<input	type="submit" value="Calcular">
	</form>
	
	<br/>
	<br/>
	
	<label>Data Final</label>
	<input type="text" id="dataFinal" name="dataFinal" readonly="readonly"
	value="${dataFinal}">
	
	<label>Total de Dias</label>
	<input type="text" id="dias" name="dias" readonly="readonly"
	value="${dias}">

</body>

<script type="text/javascript">
$(function(){
	$('#data').datepicker({dateFormat: 'dd/mm/yy'});
});


</script>
</html>