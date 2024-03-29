<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 편집</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
	<c:if test="${sessionScope.userId != null || sessionScope.adminId == null}">
	<%@ include file="../include/menu.jsp" %>
	</c:if>
	<c:if test="${sessionScope.adminId != null}">
	<%@ include file="../include/admin_menu.jsp" %>
	</c:if>
	<h2>상품 정보 편집</h2>
	 
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<tbody>
				<tr>
					<th scope="row">상품명</th>
					<td><input type="text" id="productName" name="productName" class="wdp_90" value="${detail.productName}" /></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text" id="price" name="price" class="wdp_90" value="${detail.price}" /></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="5" cols="60" title="내용" id="description" name="description">${detail.description}</textarea>
					</td>
				</tr>
				<tr>
					<th scope="row">상품이미지</th>
					<td>
						<img src="${path}/images/${detail.pictureUrl}" width="300px" height="300px" />
						<br/>
						<input type="file" id="file1" name="file1">
					</td>
				</tr>
			</tbody>
		</table>
		<br/><br/>
		<input type="hidden" id="productId" name="productId" value="${detail.productId}">
		<a href="#this" class="btn" id="update">수정하기</a>
		<a href="#this" class="btn" id="delete">삭제하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	
	<script type="text/javascript">
		var gfv_count = 1;
		
		$(document).ready(function(){
			$("#list").on("click", function(e){
				e.preventDefault();
				fn_openList();
			});	
			
			$("#update").on("click", function(e){ 
				//수정하기 버튼
				e.preventDefault();
				var productName = document.frm.productName.value;
				var price = document.frm.price.value;
				var description = document.frm.description.value;
				if(productName == "") {
					alert("상품명을 입력하세요.");
					document.frm.productName.focus();
					return;
				}
				if(price == "") {
					alert("가격을 입력하세요.");
					document.frm.price.focus();
					return;
				}
				if(description == "") {
					alert("상품설명을 입력하세요.");
					document.frm.description.focus();
					return;
				}
				fn_update();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_delete();
			});
		});
		
		function fn_openList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/product/list.do' />");
			comSubmit.submit();
		}
		
		function fn_update(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/shop/product/update.do' />");
			comSubmit.submit();
		}
		
		function fn_delete(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/product/delete.do' />");
			comSubmit.addParam("productId", $("#productId").val());
			comSubmit.submit();
		}
		
		CKEDITOR.replace("description", {
			filebrowserUploadUrl : "${path}/imageUpload.do"
		});
	</script>
	 

</body>
</html>