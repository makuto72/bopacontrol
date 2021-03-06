<html>
	<head>
		<title>Impostazioni Stampo</title>
		<!-- incluse librerie bootstrap e fogli di stile -->
		<%@ include file="lib.jsp" %>
		<%@page language="java"%>
		<%@ page import="java.sql.DriverManager" %> 
		<%@ page import="java.sql.Statement" %> 
		<%@ page import="java.sql.ResultSet" %> 
		<%@ page import="java.sql.Date" %>
	</head>

	<body>
		<!-- inclusa barra di navigazione -->
		<%@ include file="header.jsp" %>
	
		<%
		String s31 = (String)session.getAttribute("s31");
		String s32 = (String)session.getAttribute("s32");
		String s33 = (String)session.getAttribute("s33");
		%>
		
		<div id="pnlTop">
		<h1>Impostazioni Macchina Stampa</h1>
		</div>

		<div id="pnlOnlyCenter">
		    <form ACTION="../Controller/controller.jsp" method="POST">
			    <p>Soglia <b>Temperatura</b>: 
			    <INPUT TYPE="text" NAME="soglia_temp_sta" STYLE="color: black"/>
			    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
			    </p>
			    Hai impostato il valore di soglia della temperatura a: <b><%=s31%> </b>C
		    </form>
		    
		    <br><br>
		    
		    <form ACTION="../Controller/controller.jsp" method="POST">
			    <p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp
			    <INPUT TYPE="text" NAME="soglia_press_sta" />
			    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
			    </p>
			    Hai impostato il valore di soglia della pressione a: <b><%=s32%> </b>kg
		    </form>
		    
		    <br><br>
		    
		    <form ACTION="../Controller/controller.jsp" method="POST">
			    <p>Soglia <b>Potenza</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			    <INPUT TYPE="text" NAME="soglia_pot_sta" />
			    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
			    </p>
			    Hai impostato il valore di soglia della potenza a: <b><%=s33%> </b>kW
		    </form>
		    
		    <br><br>
		</div>
		
		<div id="pnlError">
		    <h2>Errore:<br>Soglia non consentita.</h2>
		</div>
		
		<div id="pnlDown">
		    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
		</div>
	</body>
</html>
