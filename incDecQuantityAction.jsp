<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from cart inner join product on cart.id=product.id where email='"+email+"' and product.id = '"+id+"'");
	
	while(rs.next()){
		price = rs.getInt(8);
		total=rs.getInt(4);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notpossible");
	}
	else if(quantity!=1 && incdec.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		//st.executeUpdate("update cart inner join product on cart.id = product.id set cart.quantity = '"+quantity+"', product.count = product.count +  '"+quantity+"',cart.product_total='"+total+"' where product.count >= '"+quantity+"' and cart.email='"+email+"' and product.id='"+id+"'");
		st.executeUpdate("update cart inner join product on cart.id = product.id set cart.quantity = '"+quantity+"',cart.product_total='"+total+"' where product.count >= '"+quantity+"' and cart.email='"+email+"' and product.id='"+id+"'");
		//st.executeUpdate("update cart set product_total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and id='"+id+"' ");
		response.sendRedirect("myCart.jsp?msg=dec");
	}
	else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update cart inner join product on cart.id = product.id set cart.quantity = '"+quantity+"', cart.product_total='"+total+"' where product.count >= '"+quantity+"' and cart.email='"+email+"' and product.id='"+id+"'");
		//st.executeUpdate("update cart set product_total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and id='"+id+"' ");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
	
}
catch(Exception e){
	System.out.println(e);
	
}
%>