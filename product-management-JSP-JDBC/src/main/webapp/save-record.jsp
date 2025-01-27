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
		PreparedStatement ps=con.prepareStatement("select count(*) from productinfo where pid=?");
		ps.setInt(1,Integer.parseInt(request.getParameter("pid")));
		ResultSet rst=ps.executeQuery();
		
		if(rst.next() && rst.getInt(1) > 0){
			 %>
			 	<div>
		        	<%@include file="insert-record.jsp" %>
		        </div>
		        <div class="dv">
		            <h2 class="msg" style="color:red">Product with PID <%= request.getParameter("pid") %> already exists!</h2>
		        </div>
		    <%
		    
		}
		else{
		PreparedStatement ps1=con.prepareStatement("insert into productinfo values(?,?,?,?)");
		ps1.setInt(1,Integer.parseInt(request.getParameter("pid")));
		ps1.setString(2,request.getParameter("name"));
		ps1.setString(3,request.getParameter("brand"));
		ps1.setInt(4,Integer.parseInt(request.getParameter("price")));
		ps1.executeUpdate();
		%>
				 <div>
		        	<%@include file="menu.jsp" %>
		        </div>
		<div class="dv center">
		<h2 class="msg" style="color:green">Product Record has been saved successfully!..</h2>
		</div>
		<%
		}
		
	%>
</body>
</html>