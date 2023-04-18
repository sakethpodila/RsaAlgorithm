<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><br><br>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr style="background-color:rgb(44, 126, 194);color:white;">
                
<th>NAME</th><th>PHONE</th><th>E-MAIL</th><th>ADDRESS</th><th style="width:70px">Action</th></tr>
</thead>
<%
String id=null,name=null,email=null, phone=null,address=null,status=null;
try
{
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from register");
	while(rs.next())
{
		
	   id=rs.getString("id"); 
       name=rs.getString("user");
       phone=rs.getString("phone");
	   email=rs.getString("email");
	   address=rs.getString("address");
       status=rs.getString("status");
	   String approve;
			if(status.equals("1")){
				
				approve="Accepted";
			}else{
				approve="Pending";
			}
	
%>
<tbody>
<tr><td><%=name%></td><td><%=phone%></td><td><%=email%></td><td><%=address%></td><td><a href="saccept.jsp?id=<%=id%>"><%=approve%></td></tr>

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