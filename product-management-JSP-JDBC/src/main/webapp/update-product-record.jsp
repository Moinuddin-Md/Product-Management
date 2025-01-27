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
		PreparedStatement ps1=con.prepareStatement("update productinfo set name=?, brand=?, price=? where pid=?");
		ps1.setString(1,request.getParameter("name"));
		ps1.setString(2,request.getParameter("brand"));
		ps1.setInt(3,Integer.parseInt(request.getParameter("price")));
		ps1.setInt(4,Integer.parseInt(request.getParameter("pid")));
		ps1.executeUpdate();
		%>
		<div class="dv center">
		<h2 class="msg" style="color:green">Product Record has been updated successfully!..</h2>
		</div>
</body>
</html>