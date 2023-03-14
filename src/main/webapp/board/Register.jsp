<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<section>
<br>
<div align="center">
<h3>게시판 글 등록</h3>
<form name=board action=${path}/boardRegisterOK.do  method="post"> 
	<table>
		<tr>
			<td>제목</td>
			<td><input type=text name=title size=52></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${userId}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name=content rows=6 cols=40></textarea></td>
		</tr>	
	</table>
	<br>
	<div align="center">
		<input type=submit value="글 등록" > 
	</div>
	
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>