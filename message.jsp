<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Reply</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String messageid = request.getParameter("id");
session.setAttribute("messageid",messageid);
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from message where id='"+messageid+"'");
	while(rs.next()){
		
%>
<form action="messageReceivedAction.jsp" method="post">
<input class="input-style" name="email" type="text" value="<%=rs.getString(2) %>" placeholder="customerQuery" required>
<hr>
<input class="input-style" name="subject" type="text" value="<%=rs.getString(3) %>" placeholder="customerQuery" required>
<hr>
<input class="input-style" name="body" type="text" value="<%=rs.getString(4) %>" placeholder="customerQuery" required>
<hr>
<textarea class="input-style" name="response"  placeholder="Enter Your Message" required></textarea>
<hr>
<button class="button" type="submit">Send<i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
<%
}
}
catch(Exception e){
System.out.println(e);
}%>
</body>
</html>