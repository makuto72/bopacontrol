
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%
//leggo i valori delle soglie attuali
String s21 = (String)session.getAttribute("s21");
String s22 = (String)session.getAttribute("s22");
String s23 = (String)session.getAttribute("s23");
String query = "";
String sT = "";
String sP = "";
String sE = "";

//creo connessione con il db
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

//verifico quale sia la soglia aggiornata; trovata, aggiorno il valore attuale su db e variabile sessione
sT = request.getParameter("soglia_temp_estr");
if( sT != null){
    query = "UPDATE soglie_estr SET temp_estr='"+sT+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s21", sT);
    }
    
    sP = request.getParameter("soglia_press_estr");
if( sP != null){
    query = "UPDATE soglie_estr SET press_estr='"+sP+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s22", sP);
    }
    
    sE = request.getParameter("soglia_pot_estr");
if( sE != null){
    query = "UPDATE soglie_estr SET ene_estr='"+sE+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s23", sE);
    } 
    
    response.sendRedirect("../View/settings_estr.jsp"); 
%>



