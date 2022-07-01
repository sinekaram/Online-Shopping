<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<%
String msg=request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%} %>
<%
if("delivered".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%} %>
<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
 <%
 try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from (((product inner join productorder on product.id = productorder.id) inner join orders on productorder.order_id = orders.order_id) inner join users on users.email = orders.email) where orders.status = 'processing'");
	while(rs.next())
	{		
 %>            
          <tr>
          <td><%=rs.getString(22) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(10) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(11) %>  </td>
                <td><%=rs.getString(26) %></td>
               <td><%=rs.getString(27) %></td>
                <td><%=rs.getString(28) %></td>
                 <td><%=rs.getString(29) %></td>
             <td><%=rs.getString(13) %></td>
              <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(16) %></td>
               <td><%=rs.getString(17) %></td>
               <td><%=rs.getString(18) %></td>
               <td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(12)%>&email=<%=rs.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveredOrdersAction.jsp?id=<%=rs.getString(12)%>&email=<%=rs.getString(1)%>">Delivered <i class='fas fa-dolly'></i></i></a></td>
            </tr>
        <% 
	}
	}
 catch(Exception e)
 {
	 System.out.println(e);
 }
 %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>