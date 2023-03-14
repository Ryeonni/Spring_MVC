<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<script>
function delP(cartIdx){
	//alert(cartIdx);
	if(confirm("삭제 하시겠습니까?")){
		location.href="${path}/cartDelete.do?cartIdx="+cartIdx
	}
}

function resetC(){
	//alert("resetCart?");
	location.href="${path}/cartDeleteAll.do"
}

function orderIn(){
	//alert("insertOrder?");
	cart.action="${path}/insertOrder.do"
	cart.submit();
}

</script>

<style>
table {
	border:1px;
	border-collapse: collapse;
	width:600px;
}
td {
	text-align:center;
	text-indent:4px;
	border-left:none;
	border-right:none;
}
th {
	border-left:none;
	border-right:none;
	background:#FAFABE;
}
</style> 

<section>
<br>
<div align="center">

<h3>장바구니</h3>
<c:choose>
 <c:when test="${count==0}">
 	<br><br><br> 장바구니가 비어 있습니다.
 </c:when>
<c:otherwise>
<form name=cart action=${path}/cartUpdate.do method=post >
	<table border=1>
		<tr>
			<th>상품명</th>
			<th>금액</th>
			<th>수량</th>
			<th>합계</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.productName}</td>
			<td><fmt:formatNumber value="${list.price}" pattern="#,###"/>원</td>
			<td>
				<input type=hidden name=cartIdx value="${list.cartIdx}">
				<input type=hidden name=productIdx value="${list.productIdx}">
				<input type=number name=amount min=1 max=10 value="${list.amount}" size=3>개
			</td>
			<td><fmt:formatNumber value="${list.sumPrice}" pattern="#,###"/>원</td>
			<td><input type=button value=" 삭  제 " onclick="delP(${list.cartIdx})"></td>
		</tr>	
		</c:forEach>
		<tr>
			<td colspan=5>
			<h3>장바구니 총 합계 : <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</h3>
			</td>
		</tr>
	</table>
	<br>
		<div align="center">
			<input type=submit value=" 수량변경 "> &emsp;
			<input type=button value=" 상품주문 " onClick="orderIn()"> &emsp;
		    <input type=button value=" 전체삭제 " onClick="resetC()"> 
		</div>
</form>
</c:otherwise>
</c:choose>
	
</div>
<br>
</section>
<c:import url="/include/bottom.jsp"></c:import>