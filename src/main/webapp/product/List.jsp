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
	width:600px;
	height:300px;
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
<h3> 상품 목록 </h3>
<%-- 
. 페이지 사이즈 : ${page.pageSize} 
. 페이지리스트 사이즈 : ${page.pageListSize} 
. 전체 레코드 수 : ${page.total}
. 총 페이지 수: ${page.totalPage} 
. 현재 레코드 : ${page.start} <br>
. 현재 페이지 : ${page.nowPage} 
. 하단 가로 시작 : ${page.listStartPage} 
. 하단 가로 끝 : ${page.listEndPage}
. 마지막 페이지 첫번째 레코드 : ${page.endPage} 
--%>	

	<table border=1>
		<tr>
			<th>상품번호</th>
			<th>상&nbsp;품</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>상품용량</th>			
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.productIdx}</td>
			<td align="center"><img src="${path}/product/image/${list.productImgStr}"  width=80 height=80></td>
			
			<c:if test="${userId ne 'admin'}">
			<td><a href="${path}/productOne.do?productIdx=${list.productIdx}">${list.productName}</a></td>
			</c:if>
			<c:if test="${userId eq 'admin'}">
			<td><a href="${path}/productOneAdmin.do?productIdx=${list.productIdx}">${list.productName}</a></td>
			</c:if>
			
			<td><fmt:formatNumber value="${list.price}" pattern="#,###"/>원</td>
			<td>${list.size}g</td>
			<td>${list.cnt}</td>
		</tr>	
		</c:forEach>
	</table>
	<br>
	
	<!-- 처음 -->
 	<c:url value="productList.do" var="url">
 		<c:param name="start" value="1" />
 		<c:param name="searchCondition" value="${page.searchCondition}" />
		<c:param name="searchKeyword" value="${page.searchKeyword}" />
	</c:url>
 	<a href="${url}"><img src="product/page_pprev.png"></a>
 	
 	<!-- [1] [2] [3] ... -->
 	<c:forEach var="i" begin="${page.listStartPage}" end="${page.listEndPage}">
	 	<c:if test="${ i <= page.totalPage }">
	 		<c:set var="start" value="${(i-1)*page.pageSize+1}"/>
	 		<c:url value="productList.do" var="url">
		 		<c:param name="start" value="${start}" />
		 		<c:param name="searchCondition" value="${page.searchCondition}" />
				<c:param name="searchKeyword" value="${page.searchKeyword}" />
			</c:url>
	 		<a href="${url}">[${i}]</a> 
	 	</c:if>
 	</c:forEach>
 	
 	<!-- 마지막으로 -->
 	<c:set var="start" value="${page.endPage}"/>
 	<c:url value="productList.do" var="url">
 		<c:param name="start" value="${start}" />
 		<c:param name="searchCondition" value="${page.searchCondition}" />
		<c:param name="searchKeyword" value="${page.searchKeyword}" />
	</c:url>
	<a href="${url}"><img src="product/page_nnext.png"></a>
	
	<br><br>
	 <form action="productList.do">
		 <select name=searchCondition>
			 <option> 선 택 </option>
			 <option value="productIdx"> 상품번호 </option>
			 <option value="productName"> 상품명 </option>
		 </select>
			 <input type=text name=searchKeyword>
			 <input type=submit value="검색하기">
 	</form> 
</div>
<br>
</section>
<c:import url="/include/bottom.jsp"></c:import>