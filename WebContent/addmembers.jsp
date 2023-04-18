<%@page import="java.sql.ResultSet"%>
<%@page import="Action.DBCon"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String user=session.getAttribute("name").toString();
String gname=request.getParameter("gname");
String us;

try
{
 Connection con=DBCon.getConnection();
 Statement st=con.createStatement();
 int x=st.executeUpdate("insert into members(gname,user,status) values('"+gname+"','"+user+"','0')");
out.println("Add Sucessfully");
}
catch(Exception e){
  out.println(e);	
}
%>
</body>
</html>