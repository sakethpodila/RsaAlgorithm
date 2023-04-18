<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 70%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 70%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
</style>
<script type="text/javascript">
function pvalidate()
{

	if(document.form1.pwd.value==""||document.form1.npwd.value==""||document.form1.repwd.value=="")
	{
		alert("All The Fields Muste Be Entered");
		return false;
	}
	else if(document.form1.npwd.value.length<6)
	{
		alert("Password Field Should Contain atleast 6 characters");
		return false;
	}
	else if(document.form1.repwd.value.length<6)
	{
		alert("Password Field Should Contain atleast 6 characters");
		return false;
	}
	else if(document.form1.npwd.value!=document.form1.repwd.value)
	{
		alert("Password MisMatch");
		return false;
	}
	else
	{
		return true;
	}
	
}


</script>
<body><br><br><br>

<%

String name=session.getAttribute("name").toString();

%>
<form action="changepwd1.jsp" method="post" target="ff" style="max-width:500px;margin:auto">


<div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6">
                <h3>CHANGE PASSWORD</h3>
            </div>
            <div class="col-sm-2"></div>
        </div>
<div class="input-container">
    <i class="fa fa-user icon"></i>
     <input class="input-field" type="text" placeholder="name" name="name" value="<%=name%>">
  </div>
<div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="old password" name="pwd">
  </div>
  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="new password" name="npwd">
  </div>
  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="conform password" name="repwd">
  </div>


<div>
  <button type="submit" class="btn">Login</button><br><br>
  </div>

</form>
</body>
</html>