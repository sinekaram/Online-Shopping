<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
            <th scope="col">Status</th>
            <th scope="col">Response</th>
          </tr>
        </thead>
        <tbody>
<%
String msg = request.getParameter("msg");
if("replied".equals(msg))
{
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent.</h3>

<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("select *from message");
	
	while(rs.next())
	{
%>      
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><form action="message.jsp" method = "post">
                <input type="hidden" value="<%=rs.getString(1)%>" name="id">
            	<input type="submit" value="response">
            <!--  <a href="message.jsp?id=<%=rs.getString(5) %>">Response <i class='fas fa-comment-alt'></i></a>-->
            	</form></td>
          </tr>
          
          <%
          session.setAttribute("messageid",rs.getString(1));
	}
}        
catch(Exception e){
	System.out.println(e);
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>