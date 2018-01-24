<%@page import="com.sun.corba.se.spi.orbutil.fsm.Action"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<!-- BOOTSTRAP CDN -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<!-- META -->
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<!-- CSS FILES-->
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">

		<!-- FONTS-->	
		<link href="https://fonts.googleapis.com/css?family=Dosis|Open+Sans:300,400,600,700,800|Oswald:300,400,700" rel="stylesheet">	
	</head>

	<body>
		<nav>
			<img src="css/logo_nav.png"></img>
			<ul>
				<li><a href="files.jsp">Files</a></li>
				<li><a href="home.jsp">Discussions</a></li>
				<li><a href="home.jsp">Announcements</a></li>
				<li><a href="classmates.jsp">Classmates</a></li>
			</ul>
		</nav>


<%
		ResultSet rs=null,rs1=null;
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
			Statement stat1=  con.createStatement();
			Connection cnn=DriverManager.getConnection("jdbc:mysql://localhost:3306/classcol", "root", "jeet");
			System.out.println("Connection Done.....");
			







		
				
	
			if(cnn!=null)
			{	String student;
				int course_id;
			 	rs=stat1.executeQuery("select o.user_id, o.course_id,c.teacher,c.photo,c.course_name from online o  join course c on o.course_id=c.course_id");
			 	rs.next();
				student=rs.getString(1);
				course_id=Integer.parseInt(rs.getString(2));
				
				rs1=stat.executeQuery("select * from enrolled where course_id="+course_id);
			}
		
	%>		
		<div id="cover">
			<h1><%=rs.getString(5)%></h1>
			<img src="css/<%=rs.getString(4)%>.png"></img>
			<p><%=rs.getString(3)%></p>
		</div>

		<div id="studentList">
			<ul>
		<% while(rs1.next())
			{System.out.println(rs1.getString(1));%>

			<li>
				<h1><%=rs1.getString(1)%></h1>		
				<p></p>	
				<hr>
			</li>
		
		<% }
		
		}catch(SQLException sqle)
			{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }	
			
			%>
				
			</ul>
		</div>
		

	</body>
</html>