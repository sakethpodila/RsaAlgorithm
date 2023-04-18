<%@page import="Action.Email"%>
<%@page import="Action.DBCon"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% 
try
{
   
String name=request.getParameter("name");
String pass=request.getParameter("pwd");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
Random randomno = new Random();
int skey=randomno.nextInt(10000);
 
 String url=null;

Connection con=DBCon.getConnection();
Statement st=con.createStatement();
int x=st.executeUpdate("insert into register(user,pwd,phone,email,address,status) values('"+name+"','"+pass+"','"+phone+"','"+email+"','"+address+"','0')");
if(x>0)
{  String msg="You are registered Your Secreate key   "+pass;
	Email.sendMail("RSA ALGORITHM PROJECT", msg, email);
	

response.sendRedirect("index.html");
}
else{
	out.print("try once more");
	response.sendRedirect("register.jsp");
}

}catch
(Exception e)
{
e.printStackTrace();
}

%>
</body>
</html>