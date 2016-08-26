<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>beautyline</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/beautyline/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/beautyline/assets/js/jquery/jquery-1.9.0.js"></script>
<script>
$(function(){
		$("#join-form").submit( function(){
			console.log( "폼체크" );
			
			//이름체크
			if( $( "#name" ).val() == "" ){
				alert( "이름은 필수 입력 항목입니다. ");
				$( "#name" ).focus();
				return false;
			}
			
			//이메일체크
			if( $( "#email" ).val() == "" ){
				alert( "이메일은 필수 입력 항목입니다. ");
				$( "#email" ).focus();
				return false;
			}
			
			if( $( "#image-checked" ).is( ":visible" ) == false ){
				alert( "이메일 중복 체크를 해 주 세요." );
				return false;
			}
			//패스워드 체크 
			if( $("input[type='password']").val() == "" ){
				alert( "비밀번호는 필수 입력 항목 입니다.");
				$("input[type='password']").focus();
				return false;
			}
			
			//약관동의 체크
			if( $("#agree-prov").is(":checked") == false ){
				alert( "약관 동의가 필요합니다." );
				return false;
			}
			
			console.log( "submit" );
			return true;
			//return true; //검사하고 검사조건 맞으면 return true
		});
		$( "#email" ).change( function(){
		$("#image-checked").hide();
		$("#btn-checkemail").show();
	});
	
	$( "#btn-checkemail" ).click( function(){
		var email = $("#email").val(); //입력받은 이메일 뽑아와야지
		if( email == "" ){
			return; //비어있으면 통신하지마~
		}
		/*val 안에 데이터 있으면 input , 데이터 없으면 보내주는 거죠 */
		$.ajax({//ajax함수에요
			"url":"/beautyline/user?a=checkemail&email=" + email, //큰따옴표 붙이는것이 정석
			"type":"get",
			"dataType": "json",
			"data": "", //post방식일 때 쿼리스트링을 a=checkemail 을 넣어준다.
			"success": function(response){ //데이터를 보내는것?
				if( response.result == "fail" ){
					console.error( "error:" + response.message );
					return;
				}
			
				if( response.data == true ){//true면 존재
					alert( "이미 존재하는 이메일 입니다. 다른 이메일을 사용해 주세요.");
					$("#email").
					val(""). //email에 있던내용 지워주고
					focus(); //다시 그쪽으로 포커스 넘김
					return;
				}
				
				console.log( "사용할 수 있음" );
				$("#image-checked").show();
				$("#btn-checkemail").hide();
				
			},
				"error": function( jsXHR, status, e){
				console.error( "error:" + status + ":" + e );
			}
			
		}); 
		
	});
});

</script>
</head>
<body>
	<div id="container">
		<c:import url= "/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="user">
				<form id="join-form" name="joinForm" method="post" action="/beautyline/user">
					<input type="hidden" name="a" value="join"/>
					<label class="block-label" for="name">이름</label>
					<input id="name" name="name" type="text" value="">

					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<image id="image-checked" style="width:16px;display:none" src="/beautyline/assets/images/check.png">
					<input type="button" id="btn-checkemail" value="id 중복체크">
					
					<label class="block-label">패스워드</label>
					<input name="password" type="password" value="">
					
					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="FEMALE" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="MALE">
					</fieldset>
					
					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>
					
					<input type="submit" value="가입하기">
					
				</form>
			</div>
		</div>
		<c:import url = "/WEB-INF/views/include/navi.jsp"/>
		<c:import url = "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>