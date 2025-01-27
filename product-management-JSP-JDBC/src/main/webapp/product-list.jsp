<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="menu.jsp" %>
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
					Statement st=con.createStatement();
					ResultSet rst=st.executeQuery("select * from productinfo");
					%>
	<table class="tal" border="1" cellpadding="10px">
			<tr>
				<th class="tb th">Product Id</th><th class="tb th">Product Name</th><th class="tb th">Product Brand</th><th class="tb th">Product Price</th>
			</tr>
			<%
			while(rst.next()){
				
				%>
					<tr>
							<td class="center"><%=rst.getInt(1) %></td>
							<td class="center"><%=rst.getString(2) %></td>
							<td class="center"><%=rst.getString(3) %></td>
							<td class="center"><%=rst.getInt(4) %></td>
						
					</tr>
				<%
				
			}			
			%>
		</table>
</body>
</html>