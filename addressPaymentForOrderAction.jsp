<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<% 
String email=session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobileNumber = request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = request.getParameter("transactionId");



try{
	Connection con = ConnectionProvider.getCon();
	int id = 0;
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT order_id FROM orders WHERE order_id=(SELECT max(order_id) FROM orders);");
	if(rs.next()){
		id = rs.getInt(1)+1;
	}
	else{
		id = 1000;
	}
	
	int total = 0;
	ResultSet rs4=st.executeQuery("select sum(product_total) from cart where email='"+email+"'");
	while(rs4.next()){
		total=rs4.getInt(1);
	}
	
	PreparedStatement ps1 = con.prepareStatement("insert into orders(order_id,orderDate,deliveryDate,orderTotal,paymentMethod,transactionId,email) value(?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY),?,?,?,?)");
	//ps1.setString(1,now());
	//ps1.setString(2,DATE_ADD(orderDate,INTERVAL 7 DAY));
	ps1.setInt(1,id);
	ps1.setInt(2,total);
	ps1.setString(3,paymentMethod);
	ps1.setString(4,transactionId);
	ps1.setString(5,email);
	ps1.executeUpdate();
	session.setAttribute("id",id);
		
	int prodcount = 0;
	int cartquantity = 0;
	
	ResultSet rs1 = st.executeQuery("select * from cart inner join product on cart.id = product.id where email='"+email+"' ");
	
	while(rs1.next()){
		
		prodcount = rs1.getInt(11);
		cartquantity = rs1.getInt(3);
		
		if(prodcount >= cartquantity){
			
		PreparedStatement ps2 = con.prepareStatement("insert into productorder value(?,?,?,?)");
		ps2.setInt(1,id);
		ps2.setInt(2,rs1.getInt(2));
		ps2.setInt(3,rs1.getInt(3));
		ps2.setInt(4,rs1.getInt(4));
		ps2.executeUpdate();
		
		PreparedStatement ps3 = con.prepareStatement("update product set count = count- '"+cartquantity+"' where id = '"+rs1.getInt(2)+"'"); 
		ps3.executeUpdate();
		}
		else if(prodcount < cartquantity && prodcount != 0){
			PreparedStatement ps2 = con.prepareStatement("insert into productorder value(?,?,?,?)");
			ps2.setInt(1,id);
			ps2.setInt(2,rs1.getInt(2));
			ps2.setInt(3,prodcount);
			ps2.setInt(4,rs1.getInt(4));
			ps2.executeUpdate();
			
			PreparedStatement ps3 = con.prepareStatement("update product set count = 0 where id = '"+rs1.getInt(2)+"'"); 
			ps3.executeUpdate();
			
			%>
			<script>
			alert("Product quantity insufficient in store hence few removed");
			</script>
			<%
		}
	}
	
	ResultSet rs3 = st.executeQuery("select * from productorder where order_id='"+id+"'");
	
	if(rs3.next()){
	
	PreparedStatement ps = con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email='"+email+"'");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,mobileNumber);
	ps.executeUpdate();
	
	st.executeUpdate("delete from cart where email='"+email+"'"); 
	
	response.sendRedirect("bill.jsp");
	}
	else{
		PreparedStatement ps2 = con.prepareStatement("delete from orders where order_id = '"+id+"'");
		ps2.executeUpdate();
		
		response.sendRedirect("home.jsp?msg=insufficient");
	}
	
	
}
catch(Exception e){
	System.out.println(e);
}
%>