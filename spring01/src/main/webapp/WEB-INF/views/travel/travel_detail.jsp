<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행상세</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
	<c:if test="${sessionScope.userId != null || sessionScope.adminId == null}">
	<%@ include file="../include/menu.jsp" %>
	</c:if>
	<c:if test="${sessionScope.adminId != null}">
	<%@ include file="../include/admin_menu.jsp" %>
	</c:if>
	<h2>여행상세 정보</h2>
	<table>
		 <tr>
		 	<td align="center">
		 		<table>
		 			<tr>
		 				<td>여행명</td>
		 				<td>${detail.travelName}</td>
		 			</tr>
		 			<tr>
		 				<td>여행날짜</td>
		 				<td>${detail.travelDate}</td>
		 			</tr>
		 			<tr>
		 				<td>여행지</td>
		 				<td><fmt:formatDate value="${detail.travelAddress}" 
					pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
		 			</tr>
		 			<tr>
		 				<td>여행LATITUDE</td>
		 				<td>${detail.travelLatitude}</td>
		 			</tr>
		 			<tr>
		 				<td>여행LONGITUDE</td>
		 				<td>${detail.travelLongitude}</td>
		 			</tr>
		 			<tr>
		 				<td>등록일</td>
		 				<td><fmt:formatDate value="${detail.regDt}" 
					pattern="yyyy-MM-dd HH:mm:ss"/></td>
		 			</tr>
		 			<tr>
		 				<td>수정일</td>
		 				<td><fmt:formatDate value="${detail.updDt}" 
					pattern="yyyy-MM-dd HH:mm:ss"/></td>
		 			</tr>
		 		</table>
		 	</td>
		 </tr>
	</table>
	<br/>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openList();
			});
			
			$("#update").on("click", function(e){
				e.preventDefault();
				fn_openUpdate();
			});
			
		});
		
		function fn_openList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/travel/list.do' />");
			comSubmit.submit();
		}
		
		function fn_openUpdate(){
			var travelId = "${detail.travelId}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/travel/updateP.do' />");
			comSubmit.addParam("travelId", travelId);
			comSubmit.submit();
		}
		
	</script>
</body>
</html>