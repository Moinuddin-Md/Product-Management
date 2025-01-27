<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="save-record.jsp" method="post">
		<table class="taf">
			<tr>
				<td class="pd">Enter product Id</td>
				<td><input type="text" name="pid" class="tb" required></td>
			</tr>
			<tr>
				<td class="pd">Enter product Name</td>
				<td><input type="text" name="name" class="tb" required></td>
			</tr>
			<tr>
				<td class="pd">Enter product Brand</td>
				<td><input type="text" name="brand" class="tb" required></td>
			</tr>
			<tr>
				<td class="pd">Enter product Price</td>
				<td><input type="text" name="price" class="tb" required></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button class="bt" style="background-color:black; color:white">Save Record</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>