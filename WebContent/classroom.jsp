<%@page import="com.sun.corba.se.spi.orbutil.fsm.Action"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%!


%>

<html>

<html>
	<head>

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
	ResultSet rs=null;
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
		Connection cnn=DriverManager.getConnection("jdbc:mysql://localhost:3306/classcol", "root", "jeet");
		System.out.println("Connection Done.....");
	
	
	



	if(cnn!=null)
	{	
		
		str=request.getParameter("email");
		%><p>Welcome</p><%=str%>
		
		<%
		System.out.println("email:"+str);
		rs=stat.executeQuery("select e.course_id,c.course_name,c.teacher,c.photo,c.course_name from enrolled e join course c on e.course_id=c.course_id where e.user_id='"+str+"'");  
			if(rs==null)
			{
				System.out.println("heya");
			}
		%>
			<% 
			stat2.executeUpdate("truncate table online");
			int i=stat1.executeUpdate("insert into online"+" values('"+request.getParameter("email")+"',0)"); 
			System.out.print("i: "+i);
			cnn.close();  
		%>

		<p> success.... </p>

		<%
// close connection
		cnn.close();
		}
	}	
	catch (SQLException sqle)
	{ 	out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }

	catch(ClassNotFoundException cnfe)
	{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>"); }

	
		%>
		<div id="header" class="col-sm-12"></div>

		<div id="selectClass">
			<h1> SELECT YOUR CLASSROOM </h1>
		</div>

		<div id="classroomList">
			<ul>
			 <form action="home.jsp">
				<% while(rs.next())
					{
					System.out.println(rs.getString(4));	%>
				<li>
					<span>
						<h1><%=rs.getString(5) %></h1>
						
						<img src="css/<%=rs.getString(4)%>_small.png"></img>
						<h6><%=rs.getString(3) %></h6>
						<input id="enter" type="submit"  name=<%=rs.getString(1)%> value=<%=rs.getString(2)%>>
					
					<span>

				</li>
			<% 	}	%>

				
			<ul>
		</div>
	</body>
</html>