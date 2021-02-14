<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<%@ include file="./include/header.jsp" %>
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<style type="text/css">
		 
	</style>
	<script>
		$(function() {
			
		});
		
		function paybtn(){
			var goodname = $('input[name=goodname]').val();
			var buyername = $('input[name=buyername]').val();
			var buyeremail = $('input[name=buyeremail]').val();
			var buyertel = $('input[name=buyertel]').val();
			var price = $('input[name=price]').val();
			var buyeraddr = $('input[name=buyeraddr]').val();
			var buyerpostcode = $('input[name=buyerpostcode]').val();
			console.log('buyername: ', buyername);
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp86950097'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:'+goodname,
			    amount : price,
			    buyer_email : buyeremail,
			    buyer_name : buyername,
			    buyer_tel : buyertel,
			    buyer_addr : buyeraddr,
			    buyer_postcode : buyerpostcode,
			    m_redirect_url : 'http://localhost:8181/stdpay.do'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
	</script>
	
</head>
<body>
	<form id="SendPayForm_id" name="" method="POST" >
        <input type="text"    name="goodname" value="테스트" >
        <input type="text"    name="buyername" value="홍길동" >
        <input type="text"    name="buyertel" value="010-1234-5678" >
        <input type="text"    name="buyeremail" value="test@inicis.com" >
        <input type="text"    name="price" value="1000" >
        <input type="text"    name="buyeraddr" value="서울특별시 강남구 삼성동" >
        <input type="text"    name="buyerpostcode" value="123-456" >
        <input type="hidden"  name="mid" value="INIpayTest" >
        <input type="hidden"  name="gopaymethod" value="Card" >
        <input type="hidden"  name="mKey" value="3a9503069192f207491d4b19bd743fc249a761ed94246c8c42fed06c3cd15a33" >
        <input type="hidden"  name="signature" value="033dfcaf17a3c22c61cfdd8b773da4c1cab2711d99b766d79044b49ffdb43712" >
        <input type="hidden"  name="oid" value="INIpayTest_1613007569462" >
        <input type="hidden"  name="timestamp" value="1613007569462" >
        <input type="hidden"  name="version" value="1.0" >
        <input type="hidden"  name="currency" value="WON" >
        <input type="hidden"  name="acceptmethod" value="below1000" >
        <input type="hidden"  name="returnUrl" value="http://localhost:8181/stdpay.do" >
        <input type="hidden"  name="closeUrl" value="http://localhost:8181/stdpay.do" >
   </form>

      <button onclick="paybtn()" style="padding:10px; margin-left:10%">결제요청</button>
</body>
</html>
