<%@page import="java.sql.ResultSet"%>
<%@page import="Action.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Action.RSA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="well">
<div class="h3 text-center text-uppercase">Check</div>
<form action="Encptd.jsp" method="post">

<div class="form-group">
<label>Message</label>
<input type=text name=name class="form-control" placeholder="Enter Username"  required>
</div>


<input type="submit" value="REGISTER" class="btn btn-primary btn-block">
<div class="form-group">



<%

try {
	String name=request.getParameter("name");            

	Connection con=null;
	Statement st=null;
RSA s=new RSA();
 String e=s.encrypt(name);
System.out.println(e);
 String d=s.decrypt(e);
	con=DBCon.getConnection();
	 st=con.createStatement();
	int x=st.executeUpdate("insert into encpt(enc,dc) values('"+e+"','"+d+"') ");
	if(x>0)
	{ 
		

		
		ResultSet rs=st.executeQuery("select * from encpt where dc='"+d+"' ");
		 if(rs.next()){
		 String ep=rs.getString("enc");

		 System.out.println(ep+"yyyyyyyyyy");
		 String ds=s.decrypt(ep);
		 System.out.println(ds+"jkkkkkkkkkkkk");
		 }
	}
}

catch(Exception e){
	
	e.printStackTrace();
}


%>


<%-- <label>Password</label>
<input type="text" name=names class="form-control" value="<%=d %>" required>
</div>
 --%>
</form>
</body>
</html>