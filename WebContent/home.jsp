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
			Statement stat2=  con.createStatement();
			Statement stat3=  con.createStatement();
			Connection cnn=DriverManager.getConnection("jdbc:mysql://localhost:3306/classcol", "root", "jeet");
			System.out.println("Connection Done.....");
	







			int i=0,j;
			while(i<5)
			{	i++;
			System.out.println(request.getParameter(String.valueOf(i)));
		
			if(request.getParameter(String.valueOf(i))!=null)
			{%><p>Welcome <%=i %></p><%  break;}
	
			}
	
	
	
			if(cnn!=null)
			{
				j=stat.executeUpdate("UPDATE online SET course_id="+i+" WHERE course_id=0 ");
				String student;
				int course_id;
			 	rs=stat1.executeQuery("select o.user_id, o.course_id,c.teacher,c.photo,c.course_name from online o  join course c on o.course_id=c.course_id ");
			 	rs.next();
				student=rs.getString(1);
				course_id=Integer.parseInt(rs.getString(2));
				System.out.println(request.getParameter("header"));
				System.out.println("Student ::::"+student);
				if(request.getParameter("header")!=null)
				{
						System.out.println("filename"+request.getParameter("pic"));
			//	j=stat2.executeUpdate("insert into post"+ " values(6,'"+student+"',"+course_id+","+request.getParameter("header")+",' abx' ");
					j=stat2.executeUpdate("insert into posts"+" values(5,'"+student+"',"+course_id+",'"+request.getParameter("header")+"','"+request.getParameter("body")+"')");
					 j=stat3.executeUpdate("insert into files(file_name)"+" values('"+request.getParameter("pic")+"')");
				}
				
				rs1=stat.executeQuery("select Header,post_body,user_id from posts where course_id="+course_id+"");
				
			}
		
	%>
		<nav>
			<img src="css/logo_nav.png"></img>
			<ul>
				<li><a href="files.jsp">Files</a></li>
				<li><a href="home.jsp">Discussions</a></li>
				<li><a href="home.jsp">Announcements</a></li>
				<li><a href="classmates.jsp">Classmates</a></li>
			</ul>
		</nav>

		
		<div id="cover">
			<h1><%=rs.getString(5)%></h1>
			<img src="css/<%=rs.getString(4)%>.png"></img>
			<p><%=rs.getString(3)%></p>
		</div>
		

		<div id="startDiscussion">
			<form action="home.jsp">
				<input type="text" name="header" placeholder="Topic">
				
				<textarea type="text" name="body"	placeholder="Start discussion"></textarea>
				 <input type="file" name="pic" accept="image/*">
				<%-- <input type="file" name="pic" accept="image/*">--%> 
				<input type="submit" value="post" id="post">
				
			</form> 
		</div>


		<div id="discussions">
			<ul>
				<% 	
					while(rs1.next())
					{
						
						System.out.println("halllloooo"+rs1.getString(1));%>
				
				<li>
					
						<h6><%=rs1.getString(1)%></h6>
						<hr>
						<h1><%=rs1.getString(1)%></h1>
						<p><%=rs1.getString(2)%></p>
					
				</li>
				<% 
					}
		
		}catch(SQLException sqle)
			{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }	
			%>

			
			</ul>
		</div>
		

	</body>
</html>