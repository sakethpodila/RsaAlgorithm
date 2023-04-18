<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="Action.Ftpcon"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="Action.RSA"%>
<%@page import="java.util.Random"%>
<%@page import="Action.DBCon"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>        
            <%!
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            String fmsg,dtype,message,data;
            %>
            <%
            
            try{
            
            String name=session.getAttribute("name").toString();
            Random r = new Random();
            int ii = r.nextInt(100000 - 5000) + 5000;
            String k = String.valueOf(ii);
             
            
            Random MKkey = new SecureRandom();
            int PASSWORD_LENGTH = 10;
            String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
            String skey = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (MKkey.nextDouble() * letters.length());
                skey += letters.substring(index, index + 1);
            }
            
            
            String st="0";
            dtype=request.getParameter("un");
	    SimpleDateFormat formatter = new SimpleDateFormat(" dd MM yyyy, hh:mm:ss a");
	    String s4 = formatter.format(new Date());
	    System.out.println("Today : " + s4);

            message=request.getParameter("message");
            RSA s=new RSA();
            String msg = s.encrypt(message);
        System.out.println(msg);
        
        String fname=k+".txt";
    	
    	File file=new File(fname);
    	FileWriter fr;
    	fr = new FileWriter(file);
		fr.write(msg);
		fr.flush();
        boolean status = new Ftpcon().upload(file);
        if (status) {
        Connection con=DBCon.getConnection();
            pst=con.prepareStatement("insert into message(fmsg,dtype,emsg,data,date,skey,status) values(?,?,?,?,?,?,?)");
            pst.setString(1,name);
            pst.setString(2,dtype);
            pst.setString(3,msg);
            pst.setString(4,message);
            pst.setString(5, s4);
            pst.setString(6,skey);
            pst.setString(7, st);
            int i=pst.executeUpdate();
        }
            
    
} catch (Exception e) {
    out.println(e);
} finally {
    out.close();
}
            
            
            
            %>
            <jsp:include page="sendmsg.jsp"></jsp:include>
        <div style="position: absolute; width: 312px; height: 22px; z-index: 2; left: 320px; top: 406px" id="layer2">
            <font size=4 color="#008000">
                <h2><font size="2" face="Verdana">Message Submitted successfully</font></h2>
            </font>  
        </div>
           
    </body>
</html>
