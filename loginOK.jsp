<%@ page import="java.sql.DriverManager" %> <%@ page import="java.sql.Statement" %> <%@ page import="java.sql.ResultSet" %> <html> <head> <title>JDBC test with Connector/J</title> </head> <body>

<%
String unita;
%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT * FROM sensoreA";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
unita = sqlResult.getString("unita");
out.println("<b>" + unita + "</b>" + "<br />"); 
}

sqlResult.close(); sqlStatement.close(); conn.close(); %> </body> </html> 



