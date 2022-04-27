<%@page contentType="text/html"  language="java"  import="java.sql.*"%>
<html>
<head>
<title>Online Exam Server</title>
<style type="text/css">
 body{background-color:white;font-family:courier;color:blue}
</style>
</head>
<body>
<h2 style="text-align:center">ONLINE EXAMINATION</h2>
<p>
<a href="Index.html">Back To Main Page</a>
</p>
<hr/>
<%
String answer1=request.getParameter("answer1");
String answer2=request.getParameter("answer2");
String answer3=request.getParameter("answer3");
int mark=0;
Class.forName("com.mysql.jdbc.Driver");
Connection
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AppDevLabWeek2","root","mysql");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM examTab");
while(rs.next())
{
 String correctanswer1=rs.getString(1);
 String correctanswer2=rs.getString(2);
 String correctanswer3=rs.getString(3);
 if(answer1.equals(correctanswer1))
 {
 mark=mark+5;
 }
 else{
 mark = mark-1;
 }
 if(answer2.equals(correctanswer2))
 {
 mark=mark+5;
 }
 else{
	 mark = mark-1;
 }
 if(answer3.equals(correctanswer3))
 {
 mark=mark+5;
 }
 else{
	 mark = mark-1;
 }
}
if(mark>=10)
{
 out.println("<h4>Total : "+mark+"</h4>");
 out.println("<h3>You passed</h3>");
}
else
{
 out.println("<h4>Total : "+mark+"</h4>");
 out.println("<h3>You failed</h3>");
}
%>
</body>
</html>