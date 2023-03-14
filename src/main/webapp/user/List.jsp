<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
table {
	border:1px;
	border-collapse: collapse;
	width:700px;
}
th {
	border-left:none;
	border-right:none; 
	background:#FAFABE;  
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
<h3>회원 목록</h3>
	<table border=1>
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
			<c:forEach var="user" items="${list}">
		<tr>
			<td>${user.id}</td>
			<td><a href="${path}/userOneAdmin.do?id=${user.id}">${user.name}</a></td>
			<td>${user.tel}</td>
			<td>${user.addr1}-${user.addr2}&nbsp;${user.addr3}</td>
		</tr>	
			</c:forEach>
	</table>
</div>

<br>
</section>
<c:import url="/include/bottom.jsp"></c:import>