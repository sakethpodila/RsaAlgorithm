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
String s1=request.getParameter("name");
String s2=request.getParameter("pwd");
try
{

 Connection con=DBCon.getConnection();
 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery("select * from  admin where user='"+s1+"' and pwd='"+s2+"'");
 if(rs.next()){
	 response.sendRedirect("Admin.jsp");
	 
 }
}
catch(Exception e){
  out.println(e);	

}
%>
</body>
</html>