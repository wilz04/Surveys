<? include "Cx.cpp" ?>
<html>
	<head>
		<?
			$link = open();
			if ($radioGroup == "") {
				if ($tTitle == "") {
					$tTitle = getName($link);
				}
				addSurvey($link, $tTitle);
			} else {
				switch ($radioGroup) {
					case "one":
						$options = $tAnswersOne;
						break;
					case "plus":
						$options = $tAnswersPlus;
						break;
					case "develop":
						$options = "";
						break;
				}
				addQuestion($link, $tTitle, $tQuestion, $radioGroup, $options);
			}
		?>
		<script language="JavaScript" type="text/JavaScript">
		<!--
			function check() {
				switch (true) {
					case fMain.radioGroup[0].checked:
						textOptions = fMain.tAnswersOne.value;
						break;
					case fMain.radioGroup[1].checked:
						textOptions = fMain.tAnswersPlus.value;
						break;
					case fMain.radioGroup[2].checked:
						textOptions = null;
						break;
				}
				if ((fMain.tQuestion.value == "") || (textOptions == "")){
					alert("Deves llenar los espacios!");
					return false;
				} else {
					return true;
				}
			}
		-->
		</script>
	  <style type="text/css">
			<!--
			body {
				border: 1px solid #000000;
			}
			input, label, fieldSet {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 12px;
			}
			.title {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 24px;
				font-weight: bold;
			}
			.nota {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 10px;
			}
			.button {
				border-right: buttonShadow 1px solid;
				border-top: buttonHighLight 1px solid;
				border-left: buttonHighLight 1px solid;
				border-bottom: buttonShadow 1px solid;
				backGround-color: buttonFace;
				text-align: center;
				margin: 2px;
				padding: 2px;
			}
			a {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 12px;
				color: #000000;
			}
			a:link {
				text-decoration: none;
			}
			a:visited {
				text-decoration: none;
				color: #000000;
			}
			a:hover {
				text-decoration: none;
				color: #000000;
			}
			a:active {
				text-decoration: none;
				color: #000000;
			}
			-->
    </style>
	</head>
	<body bgColor="buttonFace">
		<form name="fMain" method="POST" action="Form.php?tTitle=<?=$tTitle?>" onSubmit="JavaScript: alert('Tu pregunta ha sido agregada');">
			<center>
				<span class="title">
					Formulación de preguntas
				</span>
				<br>
				<span class="nota">
					<u>
						<?=$tTitle?>
					</u>
				</span>
				<br><br>
			</center>
			<fieldset class="2Dcomponent">
				<legend>
					Pregunta ?
				</legend>
				<br>
				<label class="text">
					&nbsp;
					Digita aquí tu pregunta:
					&nbsp;
				</label>
				<input class="2Dcomponent" id="tQuestion" type="text" size="60" name="tQuestion">
				<br><br>
			</fieldset>
			<br>
			<fieldset class="2Dcomponent">
				<legend>
					Respuesta !
				</legend>
				<br>
				&nbsp;
				<table>
					<tr>
						<td>
              <input id="radioGroup" type="radio" checked name="radioGroup" value="one">							
              <label class="text">
								única
						</label>
						</td>
						<td>
							<label class="text">
								Posibles respuestas:
								&nbsp;
							</label>
							<input class="2Dcomponent" id="tAnswersOne" type="text" size="60" name="tAnswersOne">
						</td>
					</tr>
					<tr>
						<td>
							<input id="radioGroup" type="radio" name="radioGroup" value="plus">
							<label class="text">
								múltiple
							</label>
						</td>
						<td>
							<label class="text">
								Posibles respuestas:
								&nbsp;
							</label>
							<input class="2Dcomponent" id="tAnswersPlus" type="text" size="60" name="tAnswersPlus">
						</td>
					</tr>
					<tr>
						<td>
							<input id="radioGroup" type="radio" name="radioGroup" value="develop">
							<label class="text">
								de desarrollo
							</label>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
				<br>
			</fieldset>
			<br>
			<span class="nota">
				Nota: deves escribir "," despues de cada posible respuesta.
			</span>
			<br><br>
			<center>
				<input type="submit" value="Enviar" onClick="JavaScript: return check();">
				<br><br><br><br>
				<a class="button" href="http://localhost:8080/wilz04pages/Surveys/Index.jsp" onClick="JavaScript: alert('Tu encuesta ha sido finalizada exitosamente!');">
					&nbsp;
					Terminar
					&nbsp;
				</a>
			</center>
		</form>
	</body>
</html>
