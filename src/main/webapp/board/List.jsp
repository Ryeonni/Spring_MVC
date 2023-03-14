<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:import url="/include/top.jsp"></c:import>

<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
function boardIn(){
	//alert("글 등록");
	location.href="${path}/Register.do"
}
</script>

<style>
table {
	border:1px;
	border-collapse: collapse;
	width:600px;
}
th {
	border-left:none;
	border-right:none;
	background:#FAFABE;
}
td {
	text-align:center;
	text-indent:4px;
	border-left:none;
	border-right:none;
}
</style> 

<section>
<br>
<div align="center">
<h3>게시판 글 목록</h3>
<%-- 
|. 페이지 사이즈 : ${page.pageSize}
|. 페이지리스트 사이즈 : ${page.pageListSize} 
|. 전체 레코드 수 : ${page.total}
|. 총 페이지 수: ${page.totalPage} 
|. 현재 레코드 : ${page.start} <br>
|. 현재 페이지 : ${page.nowPage} 
|. 하단 가로 시작 : ${page.listStartPage} 
|. 하단 가로 끝 : ${page.listEndPage}
|. 마지막 페이지 첫번째 레코드 : ${page.endPage}
--%>

	<table border=1>
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="b" items="${list}">
		<tr>
			<td>${b.boardIdx}</td>
			<td><a href="${path}/boardOne.do?boardIdx=${b.boardIdx}"> ${b.title} </a></td>
			<td>${b.writer}</td>
			<td>${b.regdate}</td>
			<td>${b.cnt}</td>
		</tr>
		</c:forEach>	
	</table>
		<c:if test="${!empty userId}">
		<br>
		<div align="center">
			<input type=button onClick="boardIn()" value="글 등록" >
		</div>
		</c:if>
	<br>
	
	<!-- 처음 -->
 	<c:url value="boardList.do" var="url">
 		<c:param name="start" value="1" />
 		<c:param name="searchCondition" value="${page.searchCondition}" />
		<c:param name="searchKeyword" value="${page.searchKeyword}" />
	</c:url>
 	<a href="${url}"><img src="product/page_pprev.png"></a>
 	
 	<!-- [1] [2] [3] ... -->
 	<c:forEach var="i" begin="${page.listStartPage}" end="${page.listEndPage}">
	 	<c:if test="${ i <= page.totalPage }">
	 		<c:set var="start" value="${(i-1)*page.pageSize+1}"/>
	 		<c:url value="boardList.do" var="url">
		 		<c:param name="start" value="${start}" />
		 		<c:param name="searchCondition" value="${page.searchCondition}" />
				<c:param name="searchKeyword" value="${page.searchKeyword}" />
			</c:url>
	 		<a href="${url}">[${i}]</a> 
	 	</c:if>
 	</c:forEach>
 	
 	<!-- 마지막으로 -->
 	<c:set var="start" value="${page.endPage}"/>
 	<c:url value="boardList.do" var="url">
 		<c:param name="start" value="${start}" />
 		<c:param name="searchCondition" value="${page.searchCondition}" />
		<c:param name="searchKeyword" value="${page.searchKeyword}" />
	</c:url>
	<a href="${url}"><img src="product/page_nnext.png"></a>
	
	<br><br>
	 <form action="boardList.do">
		 <select name=searchCondition>
			 <option> 선 택 </option>
			 <option value="title"> 제&nbsp;목 </option>
			 <option value="content"> 내&nbsp;용 </option>
			 <option value="writer"> 작성자 </option>
		 </select>
			 <input type=text name=searchKeyword>
			 <input type=submit value="검색하기">
 	</form> 
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>