<%@page import="Action.Email"%>
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
 String skey,email,s,user,mid,status;
email=session.getAttribute("email").toString();
s=request.getParameter("id");
user=request.getParameter("user");
mid=request.getParameter("mid");
int i=1;
try{
Connection con=DBCon.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from message where id='"+mid+"'");
if(rs.next())
{
	 skey=rs.getString("skey");
	 String msg="Your Message  Secreate key:"+skey;
	 Email.sendMail("RSA ALGORITHM PROJECT", msg, email);
	 Statement sts=con.createStatement();
	 int j=st.executeUpdate("update trequest set status='1' where id='"+s+"'");
	 if(j==1)
	 {
	 out.println("update succes");
	 }
}
}
catch(Exception e)
{
System.out.println(e);
}

%>
</body>
</html>