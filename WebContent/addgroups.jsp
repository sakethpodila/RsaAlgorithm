<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.Random"%>
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

String gname=null;

try {
	DiskFileItemFactory factory=new DiskFileItemFactory();
	ServletFileUpload sfu=new ServletFileUpload(factory);
if(!ServletFileUpload.isMultipartContent(request))
{
	System.out.println("Sorry. No Image Uploaded");
	return;
}
List items = sfu.parseRequest(request);
FileItem fc1 = (FileItem) items.get(1);
 gname= fc1.getString();
 FileItem fc2 = (FileItem) items.get(2);

    Connection conn=DBCon.getConnection();
    PreparedStatement ps2 = conn.prepareStatement("insert into rgroup(gname,gimage) values(?,?)");
 	System.out.println(ps2);
 	ps2.setString(1, gname);
	ps2.setBinaryStream(2, fc2.getInputStream(), (int) fc2.getSize());
	int i=ps2.executeUpdate();
	if(i>0)
	{
	out.print("INSERT SUCCESS");
	response.sendRedirect("User.html");
	}
	else{
		out.print("try once more");
	}
}
catch(Exception e){
  out.println(e);	

}
%>

</body>
</html>
