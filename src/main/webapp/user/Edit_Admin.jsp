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
<h3>회원 정보</h3>
<form name=userEdit> 
	<table border=1>
		<tr>
			<td align="left">아이디</td>
			<td>${li.id}<input type=hidden name=id id="userId" value="${li.id}"></td>
		</tr>
<!-- 		<tr>
			<td align="left">비밀번호</td>
			<td><input type=password name=password size=21></td>
		</tr> 
-->
		<tr>
			<td align="left">이&emsp;름</td>
			<td><input type=text name=name value="${li.name}"></td>
		</tr>
		<tr>
			<td align="left">전화번호</td>
			<td><input type=text name=tel value="${li.tel}"></td>
		</tr>
		<tr>
			<td align="left">주&emsp;소</td>
			<td>
			<table>
				<tr>
					<td align="left">
					<input type="text" id="sample6_postcode" name=addr1 value="${li.addr1}"> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					</td>
				</tr>
				<tr>
					<td align="left">
					<input type="text" id="sample6_address" size=50 name=addr2 value="${li.addr2}">
					<br>
					</td>
				</tr>
				<tr>
					<td align="left">
					<input type="text" id="sample6_detailAddress" size=30 name=addr3 value="${li.addr3}"> 
					<input type="text" id="sample6_extraAddress" size=20 name=addr4> 
					</td>
				</tr>
			</table>
		<tr>
			<td align="left">이메일</td>
			<td><input type="email" name=email size=30 value="${li.email}"></td>
		</tr>
	</table>
</form>
</div>
<br>

<!-- 카카오 API 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/user/postcode.js"></script>

</section>
<c:import url="/include/bottom.jsp"></c:import>