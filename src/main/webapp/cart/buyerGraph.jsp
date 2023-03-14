<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
table {
	width:400px;
	font-size:14px;
}
th {
	background:#FAFABE;
}
td {
	text-align:center;
	border-left:none;
	border-right:none;
}
</style>

<section>
<br>
<div align="center">
<h3> 회원별 구매내역</h3> 
 	<table id="title">
		<tr>
			<th>회원이름</th>
			<th>구매금액</th>
		</tr>
		<c:forEach items="${list}"  var="list">
		<tr> 
			<td> ${list.name} <input type="hidden" value="${list.userId}"></td>
			<td> <fmt:formatNumber value="${list.sumPrice}" pattern="#,###" />원</td> 
		</tr> 
		</c:forEach>
 	</table>
<br>
</div>

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script> 
<script src="http://code.highcharts.com/modules/data.js"></script>     

<div align="center">
<div id=body1>
	 <div id=hidden style="display:none" > 
	 <!-- 표는 숨겨준다.!!  -->
		 <table border=1  width=800  id='datatable' >
		    <tr>
			    <td> 회원이름 </td>  
			    <td> 구매금액 </td>
		    </tr> 
			<c:forEach items="${list}"  var="list">
		    <tr>
			    <td> ${list.name} </td>
			    <td> ${list.sumPrice} </td>
		    </tr>
			</c:forEach>
		</table>
	</div>
</div>

<br>
<div id="container" style="width: 450px; height: 300px; margin: 0 auto;"></div>

<script>
$(document).ready(function() { 
   var data = {
      table: 'datatable'
   };
   var chart = {
      type: 'column'
   };
   var title = {
      text: '고객별 구매 금액'   
   };      
   var yAxis = {
      allowDecimals: false,
      title: {
         text: '매출액'
      }
   };
   var tooltip = {
      formatter: function () {
         return '<b>' + this.series.name + '</b><br/>' +
            this.point.y + ' ' + this.point.name.toLowerCase();
      }
   };
   var credits = {
      enabled: false
   };  
      
   var json = {};   
   json.chart = chart; 
   json.title = title; 
   json.data = data;
   json.yAxis = yAxis;
   json.credits = credits;  
   json.tooltip = tooltip;  
   $('#container').highcharts(json);
});
</script>
</div>

<br>
</section>
<c:import url="/include/bottom.jsp"></c:import>