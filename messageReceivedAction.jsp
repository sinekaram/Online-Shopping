<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String messageid = session.getAttribute("messageid").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
String res=request.getParameter("response");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update message set response='"+res+"' where id='"+messageid+"'");
	response.sendRedirect("messagesReceived.jsp?msg=replied");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messagesReceived.jsp?msg=invalid");
}
%>