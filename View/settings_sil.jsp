<html>
	<head>
		<title>Impostazioni Silos</title>
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
		String s11 = (String)session.getAttribute("s11");
		String s12 = (String)session.getAttribute("s12");
		String s13 = (String)session.getAttribute("s13");
		 %>
		
		<div id="pnlTop">
			<h1>Impostazioni Silos Polimeri</h1>
		</div>
		
		<div id="pnlOnlyCenter">
		    
		    <form ACTION="../Controller/controller.jsp" method="POST">
				<p>Soglia <b>Temperatura</b>: 
				<INPUT TYPE="text" NAME="soglia_temp_silos"/>
				<button type="submit" class="btn btn-primary btn-large"/>Salva</button>
				</p>
				Hai impostato il valore di soglia della temperatura a: <b><%=s11%> </b>C
		    </form>
		    
		    <br><br>
		   
		    <form ACTION="../Controller/controller.jsp" method="POST">
				<p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp
				<INPUT TYPE="text" NAME="soglia_car_silos" />
				<button type="submit" class="btn btn-primary btn-large"/>Salva</button>
				</p>
				Hai impostato il valore di soglia del carico a: <b><%=s12%> </b>kg
		    </form>
		    
		    <br><br>
		    
		    <form ACTION="../Controller/controller.jsp" method="POST">
				<p>Soglia <b>Potenza</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<INPUT TYPE="text" NAME="soglia_pot_silos" />
				<button type="submit" class="btn btn-primary btn-large"/>Salva</button>
				</p>
				Hai impostato il valore di soglia dell'energia a: <b><%=s13%> </b>kW
		    </form>
		   
		    <br><br>
		</div>
		
		<div id="pnlDown">
		    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
		</div>
	</body>
</html>
