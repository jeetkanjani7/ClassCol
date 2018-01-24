<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posts</title>
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
	
	
	



	if(cnn!=null)
	{	
		str=request.getParameter("email");
		%><p>Welcome</p><%=str%>
		<%
	
		ResultSet rs=stat.executeQuery("select e.course_id,c.course_name from enrolled e join course c on e.course_id=c.course_id where e.user_id='"+str+"'");  
		while(rs.next()) { 
			System.out.println(rs.getString(1)+"  "+rs.getString(2));  
			%><button type="button"> Button <%= 1 %> </button><%  } 
			//step5 close the connection object  
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