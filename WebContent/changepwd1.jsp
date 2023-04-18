
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
String s1=request.getParameter("name");
String s2=request.getParameter("npwd");
String s3=request.getParameter("repwd");
try
{

 Connection con=DBCon.getConnection();
 Statement st=con.createStatement();
 st.executeUpdate("update register set pwd='"+s2+"'' where name=('"+s1+"')");
out.println("changed Sucessfully");
}
catch(Exception e){
  out.println(e);	

}
%>
</body>
</html>