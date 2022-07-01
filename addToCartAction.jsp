<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int  quantity =1;
int product_price=100;
int product_total=0;
int cart_total =0;
int prodcount = 0;
int z=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next())
	{
	product_price=rs.getInt(4);
	product_total=product_price;
	}
	ResultSet rs1=st.executeQuery("select * from cart where id='"+product_id+"' and email='"+email+"' ");
	while(rs1.next())
	{
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		product_total = product_price*quantity;
		
		z=1;
	}
	
	if(z==0){
		ResultSet rs2=st.executeQuery("select count from product where id='"+product_id+"'");
		if(rs2.next()){
			prodcount = rs2.getInt(1);
			try{
			if(quantity<=prodcount){
			PreparedStatement ps = con.prepareStatement("insert into cart(email,id,quantity,product_total) values (?,?,?,?) ");
			ps.setString(1,email);
			ps.setString(2,product_id);
			ps.setInt(3,quantity);
			ps.setInt(4,product_price);
			ps.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
			}
			else{
				response.sendRedirect("home.jsp?msg=insufficient");
			}
			}
			catch(Exception e){
				System.out.println(e);
			}
		}
			
		
	}
	if(z==1)
	{
		ResultSet rs2=st.executeQuery("select count from product where id='"+product_id+"'");
		if(rs2.next()){
			prodcount = rs2.getInt(1);
		try{
		if(quantity<=prodcount){
		st.executeUpdate("update cart set product_total='"+product_total+"', quantity='"+quantity+"' where id='"+product_id+"' and email='"+email+"' ");
		response.sendRedirect("home.jsp?msg=exist");
		}
		else{
			response.sendRedirect("home.jsp?msg=insufficient");
		}
		}
		catch(Exception e){
			System.out.println(e);
		}
		}
	}
	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>