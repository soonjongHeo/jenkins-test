<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>관리자상세</title>
	<%@ include file="../include/header.jsp" %>
	
	<script>
		$(document).ready(function(){
			$("#btnUpdate").click(function(){
				document.form.action="${path}/admin/update.do";
				document.form.submit();
			});
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form.action="${path}/admin/delete.do";
					document.form.submit();
				}
			});
		})
	</script>
</head>
<body>
	<%@ include file="../include/menu.jsp" %>
	<h2>관리자상세</h2>
	<form name="form" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="adminId" value="${viewAdmin.adminId}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" value="${viewAdmin.name}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" value="${viewAdmin.email}"></td>
			</tr>
			<tr>
				<td>관리자가입일자</td>
				<td><fmt:formatDate value="${viewAdmin.joinDate}" type="date" dateStyle="full" /></td>
			</tr>
			<tr>
				<td colspan="2" aling="center">
					<input type="button" value="목록" onclick="location.href='${path}/admin/list.do'">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
					<div style="color:red;">${message}</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
