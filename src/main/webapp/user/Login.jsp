<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:import url="/include/top.jsp"></c:import>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="http://code.jquery.com/jquery-1.10.2.js" ></script>
<script>
$(document).ready( function(){
	  $('#loginbtn').click( function(){
		    loginC();
      })
});

function loginC() {
	 let dataStr={
			id : $('#ID').val(),
			password : $('#PWD').val()
	 };
			  		 
		  $.ajax({			 
			  type: "post", 
			  url : "http://localhost:8090/mvc/userLogin.do",
			  data : dataStr,
			  success: function (data){
				  if(data == 0){
					  alert("회원이 존재하지 않습니다."); 
				  } if(data == 1) {
					  alert("로그인 성공!"); 
					  location.href="http://localhost:8090/mvc/index.do";
				  } 
			  },
	          error : function(e) {
				console.log("ERROR : ", e);  
			  }
		  });
}
</script>

<style>
table {
	border:1px;
	border-collapse:collapse;
	border-spacing:0px 20px;
}
td {
	text-indent:4px;
	height:22px;
}
.login {
	height:30px; 
	width:153px;
}
</style>

<section>
<br>
<div align="center">
<h3>회원 로그인</h3>
<span  style="color:gray; font-size:10pt;">가입시 입력하신 아이디와 비밀번호로 로그인이 가능합니다</span>
<br><br>
<form name=userLogin  method="post">   
	<table>
		<tr>
			<td><input type=text id="ID" name=id placeholder="ID"></td>
		</tr>
		<tr>
			<td><input type=password id="PWD" name=password placeholder="PASSWORD" size=21></td>
		</tr>	
	</table>
	<br>
		<div>
			<input type=button id="loginbtn" value="로그인" class=login>
		</div>
</form>
</div>
<br>

</section>
<c:import url="/include/bottom.jsp"></c:import>