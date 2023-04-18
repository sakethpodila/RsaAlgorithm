<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@page import="Action.RSA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>RSA</title>
</head>
<h1 align="center">View Message</h1>
<br><br>
   <div style="position: absolute; width: 660px; height: 89px; z-index: 4; left: 91px; top: 162px" id="layer4">
   <div class="container">
  <table class="table table-bordered"><thead>
 <th>ID</th><th>USER</th><th>FROM MESSAGE</th><th>ACTION</th>
<%

String res=request.getParameter("result"); 
String id=null,user=null,mid=null,status=null,fmsg=null;
try
{
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from trequest");
	while(rs.next())
{
		id=rs.getString("id");
		mid=rs.getString("mid");
		user=rs.getString("user");
		fmsg=rs.getString("fmsg");
		status=rs.getString("status");
		String approve;
		if(status.equals("1")){	
					approve="Accepted";
				}else{
					approve="Pending";
				}
%>
<tbody>
<tr><td><%=id%></td><td><%=user%></td><td><%=fmsg%></td><td><a href="acceptk.jsp?id=<%=id%>&mid=<%=mid%>&user=<%=user%>"><%=approve%></td></tr>
<%
}
}	
catch(Exception e){
	out.println(e);
}
%>
</tbody>
            </table>
	 </div>
    </body>
</html>