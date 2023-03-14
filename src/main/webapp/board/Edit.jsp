<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
function delB(boardIdx){
	//alert(boardIdx);
	if(confirm("삭제 하시겠습니까?")){
		location.href="${path}/boardDelete.do?boardIdx="+boardIdx
	}
}
</script>

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
<h3>글 상세보기</h3>

<form name=boardEdit action=${path}/boardEdit.do  method="post"> 
	<table border=1>
		<tr>
			<td>NO</td>
			<td>${one.boardIdx}</td>
		</tr>	
		<tr>	
			<td>제목 <input type=hidden name=boardIdx value="${one.boardIdx}"></td>
			<td><input type=text name=title value="${one.title}" size=25></td>
		</tr>	
		<tr>
			<td>작성자</td>
			<td>${one.writer}</td>
		</tr>	
		<tr>
			<td>내 용</td>
			<td> <textarea name=content rows=5 cols=40>${one.content}</textarea></td>
		</tr>	
		<tr>
			<td>등록일</td>
			<td>${one.regdate}</td>
		</tr>
		
		<c:if test="${one.writer eq userId || userId eq 'admin'}">  
		<tr align="center">
			<td colspan=2>
			<input type=submit value="글 수정 ">&emsp;
			<input type=button value="글 삭제 " onclick="delB(${one.boardIdx})">
			</td>
		</tr>
		</c:if>
	</table>
	</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>