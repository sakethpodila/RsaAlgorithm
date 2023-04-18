
<%@page import="Action.DBCon"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        
     <script language="javascript">    
        function ismaxlength(obj)
        {
                var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
                if (obj.getAttribute && obj.value.length>mlength)
                obj.value=obj.value.substring(0,mlength)
        }
        </script>
    </head>
    <body>
        <form action="sendmsg1.jsp" method="post">        
            <%!
            Connection con;
            Statement st,st1;
            PreparedStatement pst;
            ResultSet rs,rs1;
            String gname;
            int i;
            %>
            <%
            String name=session.getAttribute("name").toString();
            try
            {
 
            Connection con = DBCon.getConnection();
             st=con.createStatement();
            rs=st.executeQuery("select * from members   where user='"+name+"'");
            %>
            
            
                 <p align="center"><b>
                <font face="Trebuchet MS" size="6">Send Message</font></b></div>
                
                <div style="position: absolute; width: 683px; height: 182px; z-index: 4; left: 42px; top: 62px" id="layer9">
                    <font size="2"></font>
                    
                    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-8"><label style="margin-top:5px;">Select User:</label>
      <select size="1" name="un">

                                  <!--   <option value="All">All</option> -->
                                    <%
                                    
                                    while(rs.next())
                                    {
                                        gname=rs.getString("gname");
                                    %>
                                    <option value="<%=gname%>" ><%=gname%></option>
                                    <%
                                    } }
                                catch(Exception e){
                                  out.println(e);	

                                }
                                    %>
                            </select><font size="1" face="Tahoma">(*Please enter below 450 characters only)</font>
                      </div>
       
    </div><br>
                    
                    
                    
        <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-6"><label style="margin-top:5px;">Type your Message:</label><b></b>
       <textarea rows="7" name="message" cols="56" onkeypress="return ismaxlength(this)" onBlur="return ismaxlength(this)" maxlength="450" required> </textarea></div>
        <div class="col-sm-1"></div>
    </div><br> 
   <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><input  type="submit"  class="btn btn-primary" value="Send"></div>
        <div class="col-sm-3"></div>
    </div><br>
                    </div>
        </form>
    </body>
</html>