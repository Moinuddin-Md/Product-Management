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
		PreparedStatement ps1=con.prepareStatement("delete from productinfo where pid=?");
		ps1.setInt(1, Integer.parseInt(request.getParameter("pid")));
		
		ps1.executeUpdate();
		%>
		<div class="dv center">
		<h2 class="msg" style="color:red">Product Record has been deleted successfully!..</h2>
		</div>
		<%
		
		
	%>
</body>
</html>