<html>
	<head>
		<!--Incluse librerie bootstrap e css -->
		<%@ include file="lib.jsp" %>
	</head>
	
	<body>	
		<!--Pulsanti di dettaglio e impostazioni del silos -->	
		<div id="btnPnl">
		    <form method="post" action="detail_sil.jsp">
		    <button type="submit" class="btn btn-primary btn-large btn-block">Dettaglio</button>
		    </form>
		    
		    <form method="post" action="settings_sil.jsp">
		    <button type="submit" class="btn btn-primary btn-large btn-block">Impostazioni</button>
		    </form>
		    <br>
		</div>
	
	</body>
</html>
