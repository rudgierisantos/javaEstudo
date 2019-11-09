<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

</body>
<script type="text/javascript">
	function uploadFile() {

		var target = document.querySelector("img");
		var file = document.querySelector("input[type=file]").files[0];

		var reader = new FileReader();

		reader.onloadend = function() {
			target.src = reader.result;
		};

		if (file) {
			reader.readAsDataURL(file);

			///----- upload ajax ---------

			$.ajax({
				method : "POST",
				url : "fileUpload",
				data : {
					fileUpload : target.src
				}
			}).done(function(response) {
				alert("sucesso" + response);
				
			}).fail(function(xhr, status, errorThrown) {
				
				alert("Error: " + xhr.responseText);
			});

			///---------------------------
		} else {
			target.src = "";
		}
	}
</script>
</html>