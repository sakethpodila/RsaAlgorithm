<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="Action.DBCon"%>
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
String id=request.getParameter("id");
try {
	ResultSet rs=null;
	Connection connection=DBCon.getConnection();
	PreparedStatement ps=connection.prepareStatement("Select * from rgroup where gid='"+id+"'");
	rs=ps.executeQuery();
	rs.next();
	Blob b=rs.getBlob("gimage");
	response.setContentType(("image/jpg"));
	response.setContentLength( (int) b.length());
	InputStream is = b.getBinaryStream();
	OutputStream os = response.getOutputStream();
	byte buf[] = new byte[(int) b.length()];
	is.read(buf); os.write(buf);
	os.close();
	}
	catch (Exception e) {
	    System.out.println(e);
	}
	finally {   
		
	}

%>


</body>
</html>