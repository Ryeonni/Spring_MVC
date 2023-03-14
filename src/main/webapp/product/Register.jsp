<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<h3> 상품 등록</h3>
<form name=product action=${path}/productRegister.do  method="post" enctype="multipart/form-data"> 
	<table border=1>
		<tr>
			<td>상품명</td>
			<td><input type=text name=productName size=45></td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td><input type=text name=price size=45></td>
		</tr>
		<tr>
			<td>상품용량</td>
			<td><input type=text name=size size=45></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea name=description rows=6 cols=40></textarea></td>
		</tr>	
		<tr>
			<td>상품이미지</td>
			<td><input type=file name=img accept=".jpg, .gif, .png" size=30></td>
		</tr>	
	</table>
	<br>
	<div align="center">
		<input type=submit value="상품 등록" > 
	</div>
	
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>