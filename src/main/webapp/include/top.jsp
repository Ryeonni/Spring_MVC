<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Ryeonni's ShoppingMall </title>
<link rel="stylesheet" href="${path}/include/top.css"  type="text/css">
</head>
<body></body>

<c:set var="path" value="${pageContext.request.contextPath}" />

<nav>
&emsp;&emsp;<a href="${path}/index.jsp"> HOME </a>

<c:if test="${userId eq 'admin'}">
&emsp;&emsp;<a href="${path}/userList.do"> USER LIST </a>
&emsp;&emsp;<a href="${path}/userSales.do"> USER SALES </a>
&emsp;&emsp;<a href="${path}/product/Register.jsp"> PRODUCT REGISTER </a>
</c:if>

<c:if test="${!empty userId}">
&emsp;&emsp;<a href="${path}/productList.do"> PRODUCT </a>
&emsp;&emsp;<a href="${path}/cartList.do"> CART </a>
</c:if>


<%-- &emsp;&emsp;<a href="${path}/boardRegister.do"> BOARD REGISTER </a> --%>
&emsp;&emsp;<a href="${path}/boardList.do"> BOARD </a>

<c:if test="${empty userId}">
&emsp;&emsp;<a href="${path}/user/Login.jsp"> LOGIN </a>
&emsp;&emsp;<a href="${path}/user/Join.jsp"> JOIN </a>
</c:if>

<c:if test="${!empty userId}">
&emsp;&emsp;<a href="${path}/userOne.do"> MY PAGE </a>
&emsp;&emsp;<a href="${path}/Logout.do">${userId}  LOGOUT </a>
</c:if>

</nav>