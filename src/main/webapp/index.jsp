<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:import url="/include/top.jsp"></c:import>
<section>
<br>
<div align="center">
 <h2> Ryeonni's ShoppingMall </h2>
	 <c:if test="${!empty userId}">
	 <h3> ${userId}&nbsp;님 환영합니다 ! </h3>
	 </c:if>
</div>
<br><br>
</section>
<c:import url="/include/bottom.jsp"></c:import>