<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.Timer"%>
<%@ page import="java.util.TimerTask"%>
<% 
class SayHello extends TimerTask {
    public void run() {
       System.out.println("Hello World!"); 
    }
}

// And From your main() method or any other method
Timer timer = new Timer();
timer.schedule(new SayHello(), 0, 5000);
%>
</body>
</html>