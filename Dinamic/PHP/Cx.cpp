<?
	function open() {
		if ($link = @mssql_connect("mipc", "sa", "")) {
			@mssql_select_db("SurveyBase", $link);
			return $link;
		} else {
			printf("</head>\n");
			printf("<body bgColor='buttonFace'>\n");
			printf("<font face='Verdana' size='1'>\n");
			printf("Hubo un error en la conexión!\n");
			printf("</font>\n");
			printf("</body>\n");
			printf("</html>\n");
			exit(0);
		}
	}
	
	function getName($link) {
		$result = @mssql_query("Select Count(Nombre) From Encuestas;", $link);
		$row = @mssql_fetch_array($result);
		return "Survey-".++$row[0];
	}
	
	function addSurvey($link, $name) {
		$result = @mssql_query("Select Count(Nombre) From Encuestas Where Nombre = '$name';", $link);
		$row = @mssql_fetch_array($result);
		if ($row[0] == 0) {
			@mssql_query("Insert Into Encuestas(Nombre) Values('$name');", $link);
		}
		@mssql_close($link);
	}
	
	function addQuestion($link, $tTitle, $tQuestion, $type, $options) {
		@mssql_query("Insert Into Preguntas(Encuesta, Pregunta, Tipo, Opciones) Values('$tTitle', '$tQuestion', '$type', '$options');", $link);
		@mssql_close($link);
	}
?>
