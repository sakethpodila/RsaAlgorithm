
<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
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
String s=request.getParameter("id");
 String status=null;
int i=1;
try{

Connection con=DBCon.getConnection();
Statement st=con.createStatement();
int j=st.executeUpdate("update message set status='2' where id='"+s+"'");
if(j==1)
{
out.println("update succes");
}
}
catch(Exception e)
{
System.out.println(e);
}

%>
</body>
</html>