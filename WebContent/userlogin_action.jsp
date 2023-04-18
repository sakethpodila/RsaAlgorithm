<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
 ResultSet rs=st.executeQuery("select * from  register where user='"+s1+"' and pwd='"+s2+"' and status='1'");
 if(rs.next()){
	 response.sendRedirect("User.html");
	 session.setAttribute("email", rs.getString("email"));
     session.setAttribute("name", s1);
 }
 else{
	 out.println("Waiting for Accept"); 
 }
}
catch(Exception e){
  out.println(e);	

}
%>
</body>
</html>