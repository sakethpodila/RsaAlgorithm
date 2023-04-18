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
try
{	
//mid,user,fmsg,status
String user=session.getAttribute("name").toString();
String mid=request.getParameter("id");
String fmsg=request.getParameter("fmsg");
Connection con=DBCon.getConnection();
Statement st=con.createStatement();
int x=st.executeUpdate("insert into trequest(mid,user,fmsg,status) values('"+mid+"','"+user+"','"+fmsg+"','0')");
if(x>0)
{ 
response.sendRedirect("User.html");
}
else{
	out.print("try once more");
	response.sendRedirect("viewallmsg.jsp");
}

}catch
(Exception e)
{
e.printStackTrace();
}

%>

</body>
</html>