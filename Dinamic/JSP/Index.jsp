<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.io.*" errorPage=""%>
<html>
	<head>
		<style type="text/css">
		<!--
			input {
				background-color: #E8E2D4;
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-weight: bold;
				font-size: 12px;
				color: #735930;
				border: 0px;
			}
			.link {
				border: 1px solid #D1C4A8;
			}
			.text {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 12px;
			}
			a {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-weight: bold;
				font-size: 12px;
				color: #735930;
			}
			a:link {
				text-decoration: none;
			}
			a:visited {
				text-decoration: none;
				color: #735930;
			}
			a:hover {
				text-decoration: none;
				color: #735930;
			}
			a:active {
				text-decoration: none;
				color: #735930;
			}
		-->
		</style>
	</head>
	<body bgcolor="#E8E2D4">
		<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td colspan="3">
					<span class="text">
						Gracias por responder nuestras encuestas, tu opinion es muy valiosa para nosotros!
						<br>
						<br>
					</span>
				</td>
			</tr>
			<%
				Connection cx = null;
				
				try {
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					cx = DriverManager.getConnection("jdbc:odbc:SurveyBase", "sa", "");
					
					PreparedStatement query = cx.prepareStatement("Select * From Encuestas");
					ResultSet result = query.executeQuery();
					
					boolean end = false;
					String survey = "";
					while (!end) {
						%>
							<tr>
								<%
									for (int i=0; i<3; i++) {
										if (result.next()) {
											survey = result.getString(1);
											%>
												<td class="link" width="33%" align="center">
													<a href="Questions.jsp?survey=<%=survey%>" target="subWindow"><%=survey%></a>
												</td>
											<%
										} else {
											end = true;
											break;
										}
									}
								%>
							</tr>
						<%
					}
				} catch (Exception e) {}
				cx.close();
			%>
		</table>
	</body>
</html>
