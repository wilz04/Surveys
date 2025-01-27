<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.io.*, java.util.StringTokenizer" errorPage=""%>
<html>
	<head>
	  <style type="text/css">
			<!--
			body {
				font-family: Verdana, Geneva, Arial, helvetica, sans-serif;
				background-image: url(BackGround.jpg);
			}
			
			th {
				background-color: #FED99A;
				border: 1px solid #FF9933;
			}
			
			td {
				font-size: 10px;
			}
			
			.square_1 {
				background-color: #FFEFCD;
				border: 1px solid #FFCC99;
			}
			
			.square_2 {
				background-color: #FFF3DB;
				border: 1px solid #FFCC99;
			}
			
			.title {
				font-size: 24px;
				color: #FF9933;
				text-decoration: underline;				
			}
			
			.2DText {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 10px;
				width: 500px;
				border: 1px solid #FF9933;
			}
			
			.2DButton {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 10px;
				background-color: #FED99A;
				border: 1px solid #FF9933;
			}
			-->
    </style>
	</head>
	<body>
		<form name="fQuestions" method="POST" action="Index.jsp" onSubmit="JavaScript: alert('Tus respuestas han sido agregadas');">
			<center>
				<table width="100%" border="0" cellspacing="4" cellpadding="4">
					<tr>
						<td scope="col">
						</th>
						<th scope="col" height="50">
						<span class="title">
							<%=request.getParameter("survey")%>
						</span>
						</th>
						<td scope="col">
						</th>
					</tr>
					<%
						Connection cx = null;
						
						try {
							Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
							cx = DriverManager.getConnection("jdbc:odbc:SurveyBase", "sa", "");
							
							PreparedStatement query = cx.prepareStatement("Select * From Preguntas Where Encuesta = '" + request.getParameter("survey") + "';");
							ResultSet result = query.executeQuery();
							
							String type = "";
							StringTokenizer options;
							int j = 0;
							int k = 0;
							while (result.next()) {
								%>
									<tr>
										<td class="<%=k%2==0?"square_1":"square_2"%>" width="10%">&nbsp;
											
										</td>
										<td class="<%=k%2==0?"square_2":"square_1"%>" height="100">
											<label>
												<%=result.getString(2)%>
											</label>
											<br>
											<%
												//out.println(result.getString(2));
												type = result.getString(3);
												if (type.equals("one")) {
													options = new StringTokenizer(result.getString(4), ",");
													while (options.hasMoreTokens()) {
														%>
															<input name="<%="rb"+k%>" type="Radio" value="<%=j++%>" checked>
															<label>
														<%
														out.print(options.nextToken());
														%>
															</label>
															<br>
														<%
													}
													j = 0;
													k++;
													%>
														</label>
													<%
												} else if (type.equals("plus")) {
													%>
														<br><br>
														<input type="CheckBox" name="cb" value="checkbox">
														<br>
														<input type="CheckBox" name="cb" value="checkbox">
														<br>
														<input type="CheckBox" name="cb" value="checkbox">
														<br>
														<input type="CheckBox" name="cb" value="checkbox">
													<%
												} else if (type.equals("develop")) {
													%>
														<br><br>
														<input class="2DText" type="Text" name="tf">
													<%
												}
											%>
										</td>
										<td class="<%=(k-1)%2==0?"square_1":"square_2"%>" width="10%">&nbsp;
											
										</td>
									</tr>
								<%
							}
						} catch (Exception e) {}
						cx.close();
					%>
				</table>
				<br>
				<input class="2DButton" name="bSubmit" type="Submit" value="Enviar">
			</center>
		</form>
	</body>
</html>
