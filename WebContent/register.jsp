<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function uservalidate()
{

	if(document.form1.name.value==""||document.form1.pwd.value==""||document.form1.address.value==""||document.form1.email.value==""||document.form1.mobile.value=="")
	{
		alert("All The Fields Muste Be Entered");
		return false;
	}
	else if(document.form1.pwd.value.length<6)
	{
		alert("Password Field Should Contain atleast 6 characters");
		return false;
	}
	else
	{
		return true;
	}
	
}

</script>
</head>


<body>
<%
String u=null;int u2=0,u1=0;
try
{
Connection con=DBCon.getConnection();
PreparedStatement ps=con.prepareStatement("select * from register");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
u=rs.getString("id");
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
            <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6">
                <h1> USER REGISTER</h1>
            </div>
            <div class="col-sm-2"></div>
        </div>
 <form name="form1" action="register_action.jsp" method="post" target="_parent">

	<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">ID:</label></div>
     <div class="col-sm-3"><input type="text" placeholder="ID" name="id" value="<%=u3%>" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
	
	
	
	
	<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">Name</label></div>
     <div class="col-sm-3"><input type="text" placeholder="Name" name="name" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
	<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">Password</label></div>
     <div class="col-sm-3"><input type="password" placeholder="password" name="pwd" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
 <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">MobileNo</label></div>
       <div class="col-sm-3"><input type="number" placeholder="Mobile No" name="phone"  class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
	   <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">Email-Id</label></div>
     <div class="col-sm-3"> <input type="email" placeholder="Email" name="email"  class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
	 <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">Address</label></div>
       <div class="col-sm-6">   <textarea name="address" rows=3 cols=15> </textarea></div>
        <div class="col-sm-1"></div>
    </div><br>
	 
	 <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><input type="submit"  class="btn btn-primary" value="Register" onclick="return uservalidate()"> <input type="reset"  class="btn btn-primary" value="Cancel"></div>
        <div class="col-sm-3"></div>
    </div><br>
	
  
<%
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>  


</form>
</body>
</html>