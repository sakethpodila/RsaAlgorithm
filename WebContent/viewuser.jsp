<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  
                 <th>ID</th><th>NAME</th><th>PHONE</th><th>E-MAIL</th><th>ADDRESS</th></tr>
</thead>
      
<%

String id=null,name=null,email=null, phone=null,address=null,status=null;

name=session.getAttribute("name").toString();
try
{
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from register where user='"+name+"'  ");
	while(rs.next())
{
		
	     id=rs.getString("id");
         name=rs.getString("user");
		 email=rs.getString("email");
		 phone=rs.getString("phone");
	     address=rs.getString("address");
	     status=rs.getString("status");
	
%>
<tbody>
<tr><td><%=id%></td><td><%=name%></td><td><%=address%></td><td><%=email%></td><td><%=phone%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</tbody>
</table>
</div>
</body>
</html>