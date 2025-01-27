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
	<form action="confirm-delete.jsp" method="post">
		<table class="taf" style="background-color:red">
			<tr>
				<td class="pd">Enter product Id</td>
				<td><input type="text" name="pid" class="tb" required></td>
				<td colspan="2" align="right">
					<button class="bt">Show Record</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>