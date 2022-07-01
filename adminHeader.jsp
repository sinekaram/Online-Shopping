<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
.notification {
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: absolute;
  top: -5px;
  right: -5px;
  padding: 3px 8px;
  border-radius: 50%;
  background-color: red;
  color: white;
}
</style>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
    <!--Header-->
    <%
   String email=session.getAttribute("email").toString();
   try{
   	Connection con = ConnectionProvider.getCon();
   	Statement st=con.createStatement();
   	ResultSet rs = st.executeQuery("select count(*) from message where response='will reach soon'");
   	%>
    <br>
    <div class="topnav sticky">
            <center><h2>Online shopping</h2></center>
            <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
            <a href="messagesReceived.jsp" class="notification"><span>Message Received</span>
  <span class="badge"><%out.println((rs.next())?rs.getString(1):0); %></span><i class='fas fa-comment-alt'></i></a>
  <%ResultSet rs2 = st.executeQuery("select count(*) from orders where status='processing'");
 %>
            <a href="ordersReceived.jsp" class="notification"><span>Orders Received</span><span class="badge"><%out.println((rs2.next())?rs2.getString(1):0); %></span><i class="fas fa-archive"></i></a>
            <a href="cancelOrders.jsp">Cancelled Orders <i class='fas fa-window-close'></i></a>
            <a href="deliveredOrders.jsp">Delivered Orders <i class='fas fa-dolly'></i></a>
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
          <%}
   catch(Exception e){
	   System.out.println(e);
   }
   %>
           <br>
           <!--table-->
           </body>
           