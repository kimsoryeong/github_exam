<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입 선택" />
<%@ include file="/WEB-INF/jsp/common/header.jsp" %> 

<section class="h-screen flex items-center pt-10 justify-center bg-gray-100">
    <div class="bg-white shadow-xl rounded-xl p-10 mb-30 w-full max-w-md text-center">
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-orange-500"><a href="/">KinderReview</a></h1>
            <p class="text-sm text-gray-500 mt-1">회원 유형을 선택하세요</p>
        </div>

        <div class="flex justify-around mb-8 space-x-4">
            <!-- 개인회원 버튼 -->
            <button id="btnPersonal" class="w-1/2 bg-orange-400 hover:bg-orange-500 text-white font-semibold py-4 rounded-md transition">
                개인회원 가입
            </button>
            <!-- 기업회원 버튼 -->
            <button id="btnCompany" class="w-1/2 bg-orange-400 hover:bg-orange-500 text-white font-semibold py-4 rounded-md transition">
                기업회원 가입
            </button>
        </div>
    </div>
</section>

<script>
    document.getElementById('btnPersonal').addEventListener('click', function() {
        location.href = '/usr/member/personalJoin';  // 개인회원 가입 페이지 주소
    });

    document.getElementById('btnCompany').addEventListener('click', function() {
        location.href = '/usr/member/companyJoin';   // 기업회원 가입 페이지 주소
    });
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>
