package classcol;
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%!


%>
<%@ page import="classcol.DBFileDownloadServlet" %>
<html>
<head>
<title>testDatabse</title>
</head>
<body> 
	<p>Attempting to open JDBC connection to:... </p> 
	<%
 	String driver,url,name,pass;
	String str=null;
	try
	{
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost/classcol";
		name = "root";
		pass = "jeet";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection( url, name, pass );
		Statement stat = con.createStatement();
		Connection cnn=DriverManager.getConnection("jdbc:mysql://localhost:3306/classcol", "root", "jeet");
		System.out.println("Connection Done.....");
		DBFileDownloadServlet db=new DBFileDownloadServlet();
		
	
	



	if(cnn!=null)
	{	
		str=request.getParameter("email");
		%><p>Welcome</p><%%>
		<%
	
		ResultSet rs=stat.executeQuery("select contact_id,first_name from contacts"); 
		%><form NAME="form1" METHOD="POST"><% 
		int counter=0;
		while(rs.next()) { 
			counter++;
			System.out.println(rs.getInt(1)+"  "+rs.getString(2)+counter);  
			%><INPUT TYPE="BUTTON" VALUE="Button" ONCLICK="db.doGet()"><% 
			%><INPUT TYPE="NUMBER" NAME="text1" VALUE=counter> <% } 
			//step5 close the connection object  
			%></FORM><% 
			cnn.close();  
		 }
		

		%>

		<p> success.... </p>

		<%
// close connection
		cnn.close();
		}

	catch (SQLException sqle)
	{ 	out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }

	catch(ClassNotFoundException cnfe)
	{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>"); }

		%>
</body>
</html>