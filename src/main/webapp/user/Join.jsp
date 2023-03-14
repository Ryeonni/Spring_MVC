<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:import url="/include/top.jsp"></c:import>

<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="http://code.jquery.com/jquery-1.10.2.js" ></script>

<script>
jQuery.ajaxSetup({cache:false}); //캐시메모리 제거

function getContextPath() {
	let hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
};


$(document).ready( function(){
		  //console.log("TEST"); 
	  $('#idCheck').click( function(){	
		  let path = getContextPath();
		  //console.log("path:",path); 
		  //alert("location.host:"+location.host); // http://localhost:8095
		  //alert("path :"+path); // /user
		  let dataStr={
				 userId : $('#userId').val()
		  };
		  		 
		  $.ajax({			 
			  type: "GET", 
			  url : path+"/idCheck.do",
			  data : dataStr,
			  success: function (data){
				  if(data == "null"){
					  alert("사용가능한 아이디 입니다!"); /* return 메세지! */
				  } else {
					  alert(data + " 는 이미 사용하고 있는 아이디 입니다!"); 
					  $('#userId').val("");
					  $('#userId').focus();
				  }
			  }	  
			  
		  })
	  }) 
})


function checkU(){
	let id = userJoin.id;
	let pwd = userJoin.password;
	let name = userJoin.name;
	let phone = userJoin.tel;
	let address = userJoin.addr1;
	
	if(!id.value) {
		alert("아이디가 입력되지 않았습니다.");
		id.focus();
		return false;
	} else if(!pwd.value) {
		alert("비밀번호가 입력되지 않았습니다.");
		pwd.focus();
		return false;
	} else if(!name.value) {
		alert("이름이 입력되지 않았습니다.");
		name.focus();
		return false;
	} else if(!phone.value) {
		alert("전화번호가 입력되지 않았습니다.");
		phone.focus();
		return false;
	} else if(!address.value) {
		alert("주소가 입력되지 않았습니다.");
		address.focus();
		return false;
	} else {
		alert("환영합니다😀 회원가입 완료 되었습니다!");
		return true;
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
.join {
	width:80px;
	height:30px; 
}
</style>

<section>
<br>
<div align="center">
<h3>회원 가입</h3>
<form name=userJoin action=${path}/userJoinOk.do  method="post" onSubmit="return checkU()"> 
	<table border=1>
		<tr>
			<td align="left">아이디</td>
			<td><input type=text name=id id="userId">
				<input type=button id="idCheck" value="ID중복확인"></td> 
		</tr>
		<tr>
			<td align="left">비밀번호</td>
			<td><input type=password name=password size=21></td>
		</tr>
		<tr>
			<td align="left">이&emsp;름</td>
			<td><input type=text name=name></td>
		</tr>
		<tr>
			<td align="left">전화번호</td>
			<td><input type=text name=tel placeholder="ex) 010-1234-5678" ></td>
		</tr>
		<tr>
			<td align="left">주&emsp;소</td>
			<td>
			<table>
				<tr>
					<td align="left">
					<input type="text" id="sample6_postcode" name=addr1 placeholder="우편번호" onclick="sample6_execDaumPostcode()"> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					</td>
				</tr>
				<tr>
					<td align="left">
					<input type="text" id="sample6_address" placeholder="주소" size=50 name=addr2>
					<br>
					</td>
				</tr>
				<tr>
					<td align="left">
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" size=30 name=addr3> 
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" size=20 name=addr4> 
					</td>
				</tr>
			</table>
		<tr>
			<td align="left">이메일</td>
			<td><input type="email" name=email size=30></td>
		</tr>
	</table>
	<br>
	<div align="center">
		<input type=submit value="회원가입" class=join> &emsp;&emsp;
		<input type=reset value="다시작성" class=join> 
	</div>
</form>
</div>
<br>

<!-- 카카오 API 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/user/postcode.js"></script> 

</section>
<c:import url="/include/bottom.jsp"></c:import>
