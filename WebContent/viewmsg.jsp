<%@page import="Action.DBCon"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %> 
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
<body>




        <%
        String name=session.getAttribute("name").toString();
        String fmsg,emsg,dtype,date,skey,status,data,id;
      
try {
       

     
        Connection con =DBCon.getConnection();
        Statement  st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from message  where fmsg='"+name+"' ");
        %>
        
          <div style="position: absolute; width: 660px; height: 89px; z-index: 4; left: 91px; top: 162px" id="layer4">
            <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr style="background-color:rgb(44, 126, 194);color:white;">
                            <th><b><font face="Tahoma" color="#303030">ID</font></b></th>
                            <th><b><font face="Tahoma" color="#303030">From</font></b></th>
                           <th><b><font face="Tahoma" color="#303030">TYPE </font></b></th>
                            <th><b><font face="Tahoma" color="#303030">Message</font></b></th>
                             <th><b><font face="Tahoma" color="#303030">Data</font></b></th>
                            <th><b><font face="Tahoma" color="#303030">Date</font></b></th>
                             <th><b><font face="Tahoma" color="#303030">SKey</font></b></th>
                    </tr>
                    </thead>
                    <%while(rs.next())
                      {
                    	id=rs.getString(1);
                      fmsg=rs.getString(2);
                      dtype=rs.getString(3);
                      emsg=rs.getString(4);
                      data=rs.getString(5);
                      date=rs.getString(6);
                      skey=rs.getString(7);
                    %>
                    <tbody>
                    <tr>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=id%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=fmsg%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=dtype%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=emsg%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=data%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=date%></font></b></td>
                             <td><b><font face="Tahoma" color="#996633" size="2"><%=skey%></font></b></td>
                                         
                                                </tr>
              <%       
                      }  }
catch(Exception e){
  out.println(e);	

}
%>
</tbody>
            </table>
	 </div>
    </body>
</html>