<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
	<title>관리자로그인</title>
	<%@ include file="../include/header.jsp" %>
	<script type="text/javascript">
		$(function(){
			$("#btnLogin").click(function(){
				var adminId = $("#adminId").val();
				var passwd = $("#passwd").val();
				if(adminId == "") {
					alert("아이디를 입력하세요.");
					$("#adminId").focus();
					return;
				}
				if(passwd == "") {
					alert("비밀번호를 입력하세요.");
					$("#passwd").focus();
					return;
				}
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/admin/loginCheck.do' />");
				comSubmit.submit();
			})
		})
	</script>
</head>
<body>
	<%@ include file="../include/menu.jsp" %>
	<h2>관리자로그인</h2>
	<form id="frm" name="frm" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input id="adminId" name="adminId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="passwd" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
					<c:if test="${message == 'nologin'}">
						<div style="coler:red;">
							먼저 로그인하세요.
						</div>
					</c:if>
					<c:if test="${message == 'error'}">
						<div style="coler:red;">
							아이디 또는 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
					<c:if test="${message == 'logout'}">
						<div style="coler:red;">
							로그아웃되었습니다.
						</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
