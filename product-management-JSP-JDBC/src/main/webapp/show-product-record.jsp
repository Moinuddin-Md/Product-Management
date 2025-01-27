<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp2","root","root");
		PreparedStatement ps=con.prepareStatement("select * from productinfo where pid=?");
		ps.setInt(1,Integer.parseInt(request.getParameter("pid")));
		ResultSet rst=ps.executeQuery();
		
		if(rst.next()){
	 %>
			 
		        <div>
		        	<%@include file="menu.jsp" %>
		        </div>
		        <form action="update-product-record.jsp" method="post">
		        <table class="tal" cellpadding="25px" style="width:45%">
		        	<tr class="th">
		        		<th colspan="2" align="center">Product details</th>
		        	</tr>
		        	<tr>
		        		<th class="thh" align="left">Product Id</th>
		        		<td class="tdd">
		        			<%=rst.getInt(1) %>
		        			<input type="hidden" value="<%=rst.getInt(1)%>" name="pid">
		        		</td>
		        	</tr>
		        	<tr>
		        		<th class="thh" align="left">Edit Product Name</th>
		        		<td class="tdd"><input type="text" value="<%=rst.getString(2)%>" name="name" class="tb" style="width:100%"></td>
		        	</tr>
		        	<tr>
		        		<th class="thh" align="left">Edit Product Brand</th>
		        		<td class="tdd"><input type="text" value="<%=rst.getString(4)%>" name="brand" class="tb" style="width:100%"></td>
		        	</tr>
		        	<tr>
		        		<th class="thh" align="left">Edit Product Price</th>
		        		<td class="tdd"><input type="text" value="<%=rst.getInt(4)%>" name="price" class="tb" style="width:100%"></td>
		        	</tr>
		        	<tr>
		        		<td colspan="2" align="right">
		        			<button class="bt" style="color:green">Update Record</button>
		        		</td>
		        	</tr>	
		        </table>
		        </form>
	  <%
		}
		else{
	  %>		
				<jsp:include page="edit-record.jsp" />
				<div class="dvv">
							<h2 class="msg center" style="color:red">Product with PID <%= request.getParameter("pid") %> not found!.. </h2>
				</div>
		<%
		}
	  %>	        
	
</body>
</html>