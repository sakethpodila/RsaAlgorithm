<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body><br><br>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr style="background-color:rgb(44, 126, 194);color:white;">
  
<tr><th>Group-ID</th><th>Group-NAME</th><th>IMAGE</th><th>ACTION</th></tr>
</thead>
<%

Connection con=null;
String approve=null;
Statement st,stt;
ResultSet rs,rss;
String status;
String name=session.getAttribute("name").toString();
try
{
	 con=DBCon.getConnection();
		 st=con.createStatement();
		 rs=st.executeQuery("select * from rgroup");
		while(rs.next())
	{		
	        String id=rs.getString("gid");
			String gname=rs.getString("gname");
			
					
			
	%>
	<tbody>
<tr><td><%=id%></td><td><%=gname%></td><td><img src="image.jsp?id=<%=id%>" width="100px" height="50px"></td><td><a href="addmembers.jsp?gname=<%=gname%>">ADD</a></td></tr>
	
	
	<%


	}}
		
		catch(Exception e){
	out.println(e);
}

%>
</tbody>
</table>
</div>
</body>
</html>