<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select * from message where email = '"+email+"'");
	
	if(rs1.next()){
		String body = "Question : \n"+rs1.getString(4)+"\nResponse : \n"+rs1.getString(5)+'\n';
		String subject = rs1.getString(3);
%>

<input class="input-style" name="subject" type="text" value = "<%= subject %>" required>
<hr>
<textarea class="input-style" name="body"  placeholder="<%=body %>" required></textarea>
<hr>
<%}
	else{%>
	<input class="input-style" name="subject" type="text" placeholder ="subject" required>
<hr>
<textarea class="input-style" name="body"  placeholder="body" required></textarea>
<hr>
	<%
	}%>
<button class="button" type="submit">Send<i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
<%	
  st.executeUpdate("delete from message where email = '"+email+"' and response <> 'will reach soon'");
}
catch(Exception e){
	System.out.println(e);
}%>
</body>
</html>