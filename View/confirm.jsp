<%@ include file="header.jsp" %>
<body>
<div id="pnlOnlyCenter">
	<h3>Seleziona <b>continua</b> per uscire dal programma</h3>
	<div style="text-align:center">
	<form action="../Controller/controller.jsp" method="post">
            <button type="submit" name="uscita" class="btn btn-primary btn-lg">Continua</button>  
    </form>
    </div>

    <br/>

	
   <h3>Seleziona <b>indietro</b> per tornare alla pannello</h3>
   <div style="text-align:center">
    <form action="panel.jsp" method="post">
            <button type="submit" class="btn btn-primary btn-lg">&nbsp;Indietro&nbsp;&nbsp;</button> 
    </form>
    </div>
   
</div>
</body>
</html>
