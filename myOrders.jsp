<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno = 0;
try{
	
	
	Connection con = ConnectionProvider.getCon();
	
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from ((product inner join productorder on product.id = productorder.id) inner join orders on productorder.order_id = orders.order_id) where orders.email = '"+email+"'");
	while(rs.next())
	{
		sno=sno+1;
%>
          <tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td><%=rs.getString(10) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(11) %> </td>
             <td><%=rs.getString(13) %></td>
              <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(16) %></td>
               <td><%=rs.getString(18) %></td>
            </tr>
         <%
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