<html>
	<head>
	<%@page language="java"%>
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	<!-- Fogli di stile -->
	<link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
	<link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="../View/style.css">
	</head>

	<%
	String temp="";
	String ener="";
	String press="";
	String date="";
	
	response.setIntHeader("Refresh", 3);
	
	//creazione connessione db
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	String query = "SELECT * FROM estrusione ORDER BY data DESC LIMIT 0,1";
	
	//lettura valori sensori
	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
	    temp = sqlResult.getString("temperatura");
	    ener = sqlResult.getString("energia");
	    press = sqlResult.getString("pressione");
	    date = sqlResult.getString("data");
	    }
	    
	String soglia21="";
	String soglia22="";
	String soglia23="";
	 
	query = "SELECT * FROM soglie_estr";
	
	//lettura valori soglie
	sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
	    soglia21 = sqlResult.getString("temp_estr");
	    soglia22 = sqlResult.getString("press_estr");
	    soglia23 = sqlResult.getString("ene_estr");
	    }
	    
	session.setAttribute("s21", soglia21);
	session.setAttribute("s22", soglia22);
	session.setAttribute("s23", soglia23);
	
	sqlResult.close(); sqlStatement.close(); conn.close();
	%>

	<body>
		<div id="tab">
		<table class="table">
		<tbody>
		    <thead>
		    <tr>
		      <th>Sensore</th>
		      <th>Valore</th>
		      <th>Soglia</th>
		    </tr>
		    </thead>
		    <tbody>
		    <tr>
		      <td>Temperatura [C]</td>
		      <td><%=temp%></td>
		      <td><%=soglia21%></td>
		    </tr>
		    <tr>
		      <td>Pressione [Bar]</td>
		      <td><%=press%></td>
		      <td><%=soglia22%></td>
		    </tr>
		    <tr>
		      <td>Potenza [kW]</td>
		      <td><%=ener%></td>
		      <td><%=soglia23%></td>
		    </tr>
		    </tbody>
		</table>
		</div>
	
	
	</body>
</html>
