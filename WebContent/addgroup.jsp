<%@page import="java.sql.*"%>
<%@page import="Action.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .form-control{
        width: 200px;
        height: 40px;
        border-radius: 10px;
       
    }
    </style>
</head>
<body>
<%
String u=null;int u2=0,u1=0;
try
{
	Connection connection=DBCon.getConnection();
PreparedStatement ps=connection.prepareStatement("select * from rgroup");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
u=rs.getString("gid");
}
if(u==null)
{
 u2=u1+1;
}
else
{
u1=Integer.parseInt(u);
u2=u1+1;
}
String u3=Integer.toString(u2);

%>

<body>
<h3  align="center">ADD ROOM</h3>
    <form action="addgroups.jsp" method="post" enctype="multipart/form-data" target="_parent">
        <body class="container" style="background: url(gg.jpg);background-size: cover"><br><br>
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-2"><label>ROOM-Id</label></div>
                    <div class="col-sm-2"><input type="number" placeholder="Group Id" name="gid" value="<%=u3%>" readonly="readonly" class="form-control" ></div>
                    <div class="col-sm-4"></div>
                </div><br>
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-2"><label>ROOM Name</label></div>
                    <div class="col-sm-2"><input type="text" placeholder="Group Name" name="gname"  class="form-control" ></div>
                    <div class="col-sm-4"></div>
                </div><br>
               
               
           <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">ROOM Image</label></div>
       <div class="col-sm-3"><input type="file" placeholder="Image" name="gimage"  class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
                <div class="row">
                 <div class="col-sm-4"></div>
                    <div class="col-sm-2"><button type="submit" class="btn btn-primary">Submit</button></div>
                    <div class="col-sm-2"><button type="reset" class="btn btn-primary">Cancel</button></div>
                     <div class="col-sm-4"></div>
                </div>
            </form>
             <%
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%> 

</body>
</html>
