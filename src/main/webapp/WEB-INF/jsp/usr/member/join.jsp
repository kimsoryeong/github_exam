<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />

<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 테일윈드, 데이지UI -->
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 공용 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="shortcut icon" href="/resource/images/favicon.ico" />
</head>

<%-- <%@ include file="/WEB-INF/jsp/common/header.jsp" %> --%>
<section class="h-screen flex items-center pt-10 justify-center bg-gray-100">
	<div class="bg-white shadow-xl rounded-xl p-10 mb-30 w-full max-w-md">
		<div class="flex justify-end text-orange-300 hover:text-orange-400 mb-5 items-center">
			<a href="/"><i class="fa-solid fa-house fa-2xl"></i></a>
		</div>	
		<div class="text-center mb-8">
			<h1 class="text-3xl font-bold text-orange-500"><a href="/">KinderReview</a></h1>
			<p class="text-sm text-gray-500 mt-1">회원가입 후 이용하세요</p>
		</div>

		<form action="doJoin" method="post" onsubmit="return joinFormChk(this);">
			<div class="mb-4 ">
				<label class="block text-sm font-medium text-gray-700 mb-1">아이디</label>
				<div class="joininput flex items-center border border-gray-300 rounded-md px-3 py-2">
					<svg class="w-5 h-5 text-gray-400 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A4 4 0 018 16h8a4 4 0 012.879 1.804M15 11a3 3 0 10-6 0 3 3 0 006 0z" />
					</svg>
					<input type="text" name="loginId" class=" w-full outline-none border-none" placeholder="아이디 입력" onblur="loginIdDupChk(this);" autocomplete="off" />
				</div>
				<div id="loginIdDupChkMsg" class="mt-2 text-sm h-5 text-center"></div>
			</div>
			<div class="mb-4">
				<label class="block text-sm font-medium text-gray-700 mb-1">비밀번호</label>
				<div class="joininput flex items-center border border-gray-300 rounded-md px-3 py-2">
					<svg class="w-5 h-5 text-gray-400 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11c1.104 0 2-.672 2-1.5S13.104 8 12 8s-2 .672-2 1.5.896 1.5 2 1.5zM6 10V8a6 6 0 1112 0v2a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2v-6a2 2 0 012-2z" />
					</svg>
					<input type="password" name="loginPw" class="w-full outline-none border-none" placeholder="비밀번호 입력" autocomplete="new-password" />
				</div>
			</div>
			<div class="mb-4">
				<label class="block text-sm font-medium text-gray-700 mb-1">비밀번호 확인</label>
				<div class="joininput flex items-center border border-gray-300 rounded-md px-3 py-2">
					<svg class="w-5 h-5 text-gray-400 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11c1.104 0 2-.672 2-1.5S13.104 8 12 8s-2 .672-2 1.5.896 1.5 2 1.5zM6 10V8a6 6 0 1112 0v2a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2v-6a2 2 0 012-2z" />
					</svg>
					<input type="password" name="loginPwChk" class="w-full outline-none border-none" placeholder="비밀번호 확인" autocomplete="new-password" />
				</div>
			</div>
			<div class="mb-6">
				<label class="block text-sm font-medium text-gray-700 mb-1">닉네임</label>
				<div class="joininput flex items-center border border-gray-300 rounded-md px-3 py-2">
					<svg class="w-5 h-5 text-gray-400 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A4 4 0 018 16h8a4 4 0 012.879 1.804M15 11a3 3 0 10-6 0 3 3 0 006 0z" />
					</svg>
					<input type="text" name="nickname" class="w-full outline-none border-none" placeholder="닉네임 입력" />
				</div>
			</div>
			<button type="submit" class="w-full bg-orange-400 hover:bg-orange-500 text-white font-semibold py-2 rounded-md transition">
				회원가입
			</button>
		</form>
	</div>
</section>
<script>
	let validLoginId = null;

	const joinFormChk = function (form) {
		form.loginId.value = form.loginId.value.trim();
		form.loginPw.value = form.loginPw.value.trim();
		form.loginPwChk.value = form.loginPwChk.value.trim();
		form.nickname.value = form.nickname.value.trim();
		
		if (form.loginId.value.length == 0) {
			alert('아이디는 필수 입력 정보입니다');
			form.loginId.focus();
			return false;
		}
		
		if (form.loginId.value != validLoginId) {
			alert('[ ' + form.loginId.value + ' ] 은(는) 사용할 수 없는 아이디입니다.');
			form.loginId.value = '';
			form.loginId.focus();
			return false;
		}
		
		if (form.loginPw.value.length == 0) {
			alert('비밀번호는 필수 입력 정보입니다');
			form.loginPw.focus();
			return false;
		}
		
		if (form.nickname.value.length == 0) {
			alert('닉네임은 필수 입력 정보입니다');
			form.nickname.focus();
			return false;
		}
		
		if (form.nickname.value != validNickname) {
			alert('[ ' + form.nickname.value + ' ] 은(는) 사용할 수 없는 닉네임입니다.');
			form.nickname.value = '';
			form.nickname.focus();
			return false;
		}
		
		if (form.loginPw.value != form.loginPwChk.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.loginPw.value = '';
			form.loginPwChk.value = '';
			form.loginPw.focus();
			return false;
		}
		
		return true;
	}
	
	const loginIdDupChk = function (el) {
		el.value = el.value.trim();
		let loginIdDupChkMsg = $('#loginIdDupChkMsg');
		
		if (el.value.length == 0) {
			loginIdDupChkMsg.removeClass('text-green-500');
			loginIdDupChkMsg.addClass('text-red-500');
			loginIdDupChkMsg.html('아이디는 필수 입력 정보입니다');
			return;
		}
		
		$.ajax({
			url : '/usr/member/loginIdDupChk',
			type : 'GET',
			data : {
				loginId : el.value
			},
			dataType : 'json',
			success : function (data) {
				if (data.success) {
					loginIdDupChkMsg.removeClass('text-red-500');
					loginIdDupChkMsg.addClass('text-green-500');
					loginIdDupChkMsg.html(`${data.rsMsg}`);
					validLoginId = el.value;
				} else {
					loginIdDupChkMsg.removeClass('text-green-500');
					loginIdDupChkMsg.addClass('text-red-500');
					loginIdDupChkMsg.html(`${data.rsMsg}`);
					validLoginId = null;
				}
			},
			error : function (xhr, status, error) {
				console.log(error);
			}
		})
	}
	
	$(function() {
	    $('.joininput')
	        .css({
	            'border-color': 'gray',
	            'border-width': '1px',
	            'border-style': 'solid'
	        })
	        .on('focusin', function () {
	            $(this).css({
	                'border-color': '#ff9d23',
	                'border-width': '2px',
	                'border-style': 'solid'
	            });
	        })
	        .on('focusout', function () {
	            $(this).css({
	                'border-color': 'gray',
	                'border-width': '1px',
	                'border-style': 'solid'
	            });
	        });
	});
</script>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>