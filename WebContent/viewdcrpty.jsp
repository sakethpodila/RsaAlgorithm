<%@page import="java.sql.ResultSet"%>
<%@page import="Action.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Action.RSA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<h1 align="center">View Message</h1>
<form name="form" action="viewdcrpty.jsp">
<center><label >SKey:</label>
 <input type="text"  name="result" />
<input type="submit" value="SUBMIT"> 
</center><br><br>
</form>

<br><br>
    <table>
              <thead>  <tr style="background-color:rgb(44, 126, 194);color:white;">
       <th>ID</th><th>ENCRYPTED</th><th>DECRYPTED</th></thead>

<%

String res=request.getParameter("result"); 
String id=null,message=null,dcrted=null,data=null;
try
{
    
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from message where skey='"+res+"'");
	if(rs.next())
{
		 id=rs.getString("id");
		 message=rs.getString("emsg");
		 data=rs.getString("data");
	dcrted=new RSA().decrypt(message);
	System.out.println(dcrted);
	

%>
<tbody>
<tr><td><%=id%></td><td><%=message%></td><td><%=data%></td></tr>

<%
}
}	
catch(Exception e){
	out.println(e);
}

%>
</tbody>
</table>
</body>
</html>