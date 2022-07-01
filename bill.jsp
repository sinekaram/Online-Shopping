<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String id = session.getAttribute("id").toString();
try{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(price) from productorder where order_id='"+id+"'");
	while(rs.next())
	{
		total=rs.getInt(1);
	}
	ResultSet rs2 = st.executeQuery("select * from users inner join orders on orders.email=users.email where orders.email='"+email+"'");
	while(rs2.next())
	{
		
%>
<h3>Online shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name:  <%=rs2.getString(1) %></h3></div>
<div class="right-div-right"><h3>Email:  <%out.println(email); %></h3></div>
<div class="right-div"><h3>Mobile Number:  <%=rs2.getString(3) %></h3></div>  

<div class="left-div"><h3>Order Date:  <%=rs2.getString(12) %></h3></div>
<div class="right-div-right"><h3>Payment Method:  <%=rs2.getString(15) %></h3></div>
<div class="right-div"><h3>Expected Delivery:  <%=rs2.getString(13) %></h3></div> 

<div class="left-div"><h3>Transaction Id:  <%=rs2.getString(16) %></h3></div>
<div class="right-div-right"><h3>City:  <%=rs2.getString(8) %></h3></div> 
<div class="right-div"><h3>Address:  <%=rs2.getString(7) %></h3></div> 

<div class="left-div"><h3>State:  <%=rs2.getString(9) %></h3></div>
<div class="right-div-right"><h3>Country:  <%=rs2.getString(10) %></h3></div>  

<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs1=st.executeQuery("select * from product inner join productorder on product.id=productorder.id where productorder.order_id ='"+id+"'");
  
  while(rs1.next())
  {	  
	  sno = sno+1;
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(2) %></td>
    <td><%=rs1.getString(3) %></td>
    <td><%=rs1.getString(4) %></td>
    <td><%=rs1.getString(10) %></td>
     <td><%=rs1.getString(11) %></td>
  </tr>
  <tr>
<%}
  %>
</table>
<h3>Total: <%out.println(total); %></h3>
<a href="home.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e){
	System.out.println(e);
}%>
</body>
</html>