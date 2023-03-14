<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- <script>
function delP(productIdx){
	alert(productIdx);
	location.href="${path}/productDelete.do?=productIdx"+productIdx
}
</script> -->

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
<form name=productOne_admin action=${path}/productUpdate.do  method="post" enctype="multipart/form-data"> 
	<table border=1>	
		<tr>	
			<td colspan=2 align="center"><img src=${path}/product/image/${one.productImgStr} width=200 height=200></td>
		</tr>
		<tr>
			<td align="center">상품명<input type=hidden name=productIdx value="${one.productIdx}"></td>
			<td><input type=text name=productName value="${one.productName}"> </td>
		</tr>	
		<tr>
			<td align="center">상품가격</td>
			<td><input type=text name=price value="${one.price}"></td>
		</tr>	
		<tr>
			<td align="center">상품용량</td>
			<td><input type=text name=size value="${one.size}"></td>
		</tr>	
		<tr>
			<td align="center">상품설명</td>
			<td><textarea name=description rows=5 cols=40>${one.description}</textarea></td>
		</tr>	
		<tr>
			<td align="center">이미지</td>
			<td><input type=file name=img accept=".jpg, .gif, .png" size=30></td>
		</tr>	
	</table>
	<br>
	<div align="center">
		<input type=submit value="상품수정" onsubmit="${path}/productUpdate.do"> 
		<%-- <input type=button value="상품삭제" onClick="delP(${one.productIdx})">  --%>
	</div>
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>