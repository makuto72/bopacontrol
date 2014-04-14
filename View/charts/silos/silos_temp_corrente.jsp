<%@ page language = "java" %>

<%@ page import ="org.jfree.chart.ChartPanel" %>
<%@ page import ="org.jfree.chart.JFreeChart" %>
<%@ page import ="org.jfree.chart.plot.ThermometerPlot" %>
<%@ page import ="org.jfree.data.general.DefaultValueDataset" %>
<%@ page import ="org.jfree.ui.ApplicationFrame" %>
<%@ page import ="java.awt.BasicStroke" %>
<%@ page import ="java.awt.Color" %>
<%@ page import="org.jfree.chart.ChartUtilities"%>

// import per DB
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%

	response.setIntHeader("Refresh", 3);
	
	// QUERY
	String cur_temp = new String();
	String cur_date = new String();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Inserire qui la tabella del db giusta a seconda della macchina
	String query = "SELECT temperatura, data FROM silos ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		cur_temp = sqlResult.getString("temperatura");
		cur_date = sqlResult.getString("data");
	}

	sqlResult.close();
	sqlStatement.close();
	conn.close();

	DefaultValueDataset dataset = new DefaultValueDataset(Double.parseDouble(cur_temp));

	// create the chart...
	final ThermometerPlot plot = new ThermometerPlot(dataset);
	final JFreeChart chart = new JFreeChart("Silos: temperatura rilevata",  // chart title
									  JFreeChart.DEFAULT_TITLE_FONT,
									  plot,                 // plot
									  false);               // include legend
									  
									  
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));


	plot.setThermometerStroke(new BasicStroke(2.0f));
	plot.setThermometerPaint(Color.lightGray);
	
	plot.setRange(0.0, 100);

	plot.setSubrange(ThermometerPlot.NORMAL, 0.0, 40.0);
	plot.setSubrange(ThermometerPlot.WARNING, 40.0, 60.0);
	plot.setSubrange(ThermometerPlot.CRITICAL, 60.0, 100.0);
        

	//CREATE OUTPUT STREAM.
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>