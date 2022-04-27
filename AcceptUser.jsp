<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
 Connection con;
 PreparedStatement query1;
 public void jspInit()
 {
 try
 {
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AppDevLabWeek2","root","mysql");
  query1 = con.prepareStatement("select count(*) from login where username = ? and password=?");
 }
 catch(Exception ex)
 {
 ex.printStackTrace();
}
 }
%>
<%

 String username = request.getParameter("username");
 String password = request.getParameter("password");
 query1.setString(1,username);
 query1.setString(2,password);
 ResultSet rs = query1.executeQuery();
 int count = 0;
 if (rs.next())
 count = rs.getInt(1);
 if(count == 0){
 out.println("<div style=\"text-align: center\">");
 out.println("<h3><font color=red>Invalid credential</fonr></h3>");
 }
 else
 {
 out.println("<html><div style=\"text-align: center\">");
 out.println("<form><fieldset style= width:50%; >");
 out.println("<b><i><a href=examclient.html><font size=6 color=blue>Go to test</font></i></a></b>");
 out.println("</fieldset></form></html>");
 }
%>
<%!
 public void jspDestroy()
 {
 try
 {
query1.close();
 con.close();
 }
 catch(Exception ex)
 {
 ex.printStackTrace();
 }
 }
%>