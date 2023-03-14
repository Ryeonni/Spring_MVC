<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
table {
	border:1px;
	border-collapse: collapse;
}
td {
	text-indent:4px;
	height:30px;
	border-left:none;
	border-right:none;
}
</style> 

<section>
<br>
<div align="center">
<h3>상품 상세보기</h3>
<form name=productOne action=${path}/cartInsert.do  method="post"> 
	<table border=1>	
		<tr>	
			<td colspan=2 align="center"><img src="${path}/product/image/${one.productImgStr}" width=150 height=150></td>
		</tr>
		<tr>
			<td align="center">상품명<input type=hidden name=productIdx value="${one.productIdx}"></td>
			<td>${one.productName} </td>
		</tr>	
		<tr>
			<td align="center">상품가격</td>
			<td><fmt:formatNumber value="${one.price}" pattern="#,###" />원</td>
		</tr>
		<tr>
			<td align="center">상품용량</td>
			<td>${one.size}</td>
		</tr>	
		<tr>
			<td align="center">상품설명</td>
			<td><textarea name=description rows=5 cols=40 readonly>${one.description}</textarea></td>
		</tr>	
		<tr>
			<td align="center">수 량</td>
			<td>
			<select name=amount>
				<c:forEach begin="1" end="10" var="i">
				<option value="${i}">${i}개</option>
				</c:forEach>
			</select>
			</td>
		</tr>
	</table>
	<br>
	<div align="center">
		<input type=submit value="장바구니"> 
	</div>
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>