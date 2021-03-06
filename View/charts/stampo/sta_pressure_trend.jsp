	<%@page language="java"%>
	
	<%@ page import="java.io.*" %>
	<%@ page import="java.util.*" %>

	// import per DB
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	
	// import per JFreeChart
	<%@ page import= "java.awt.Color" %>
	<%@ page import="org.jfree.data.category.CategoryDataset"  %>
	<%@ page import="org.jfree.data.category.DefaultCategoryDataset"  %>
	<%@ page import="org.jfree.chart.plot.CategoryPlot" %>
	<%@ page import="org.jfree.chart.ChartFactory"        %>
    <%@ page import="org.jfree.chart.ChartFrame"          %>
    <%@ page import="org.jfree.chart.JFreeChart"          %>
    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>
    <%@ page import="org.jfree.chart.ChartUtilities"      %>
	<%@ page import = "org.jfree.chart.axis.NumberAxis" %>
	<%@ page import = "org.jfree.chart.renderer.category.LineAndShapeRenderer" %>
	<%@ page import = "org.jfree.chart.plot.ValueMarker" %>
	<%@ page import = "org.jfree.ui.Layer" %>
	
	<%
	
	// Imposta frequenza aggiornamento del grafico
	response.setIntHeader("Refresh", 3);
	
	// Apertura connessione col db
	ArrayList<String> pressures = new ArrayList<String>();
	ArrayList<String> dates = new ArrayList<String>();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Select al db per ottenere i valori di interesse
	String query = "SELECT * FROM stampo ORDER BY data DESC LIMIT 0,10";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		pressures.add(sqlResult.getString("pressione"));
		dates.add(sqlResult.getString("data"));
	}

	// Creazione e popolamento del dataset
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();   
    for (int i=(pressures.size()-1); i>=0; --i)
		dataset.addValue(Integer.parseInt(pressures.get(i)), "Classes", dates.get(i).substring(14));

	// Creazione del grafico
	JFreeChart chart = ChartFactory.createLineChart(
		"Andamento recente", // chart title
		"Minuti e secondi ora corrente", // domain axis label
		"Bar", // range axis label
		dataset, // data
		PlotOrientation.VERTICAL, // orientation
		false, // include legend
		true, // tooltips
		false // urls
	);
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	
	// Impostazioni plot
	CategoryPlot plot = (CategoryPlot) chart.getPlot();
	plot.setBackgroundPaint(Color.lightGray);
	plot.setRangeGridlinePaint(Color.white);

	// Estrazione soglia dalle variabili d'ambiente
	int thresh_value = Integer.parseInt((String)session.getAttribute("s32"));

	// Aggiunta della soglia sul grafico
	ValueMarker thresh_marker = new ValueMarker(thresh_value);
	thresh_marker.setPaint(Color.black);
	plot.addRangeMarker(thresh_marker, Layer.BACKGROUND);
	
	// Impostazioni degli assi
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(0,500);

	// Impostazioni di rendering
	LineAndShapeRenderer renderer	= (LineAndShapeRenderer) plot.getRenderer();
	renderer.setShapesVisible(true);
	renderer.setDrawOutlines(true);
	renderer.setUseFillPaint(true);
	renderer.setFillPaint(Color.white);

	// Chiudi le connessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
    // Creazione dello stream in output
    response.setContentType("image/png");
    ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,740,340);



 %>

