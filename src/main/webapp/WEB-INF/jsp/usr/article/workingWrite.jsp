<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="근무후기 작성" />

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

	<section class="mt-4 mx-auto container">
		  <div class="icon-box flex justify-end h-20 items-center">
			    <i class="fa-solid fa-house fa-2xl"></i>
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <i class="fa-regular fa-user fa-2xl"></i>
	 	 </div>
		
		  <div class="container flex justify-center">
		    <form action="doWrite" method="post">
		      <div class="text-center w-200 mt-5">
		        <span class="px-2 text-orange-500 font-bold text-3xl">
		          <a href="/">KinderReview</a>
		        </span>
		        <span class="px-2 font-bold text-2xl">근무 후기 작성</span>
		      </div>
		
		      <div class="pr-10 pl-10 pt-4 pb-4">
		        <span class="font-bold pb-4">기관명</span>
		        <span><input class="input input-neutral" name="title" type="text" required /></span>
		      </div>
		
		      <div class="pr-10 pl-10 pt-4 pb-4">
		        <div class="font-bold pb-4">기관 총 평점</div>
		        <div class="pr-10 pl-10 pt-4 pb-4">
		        <span class="font-bold pb-4"></span>
		        <div class="review-form">
		          <div class="p-1">
		            <div class="star">
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <input type="hidden" name="salaryScore" value="5" />
		            </div>
		          </div>
		        </div>
		      </div>
		      </div>
		
		      <div class="option pr-10 pl-10 pt-4 pb-4">
		        <div class="font-bold pb-4">기관 한 줄 평</div>
		        <div><textarea class="textarea textarea-neutral" name="content" required></textarea></div>
		      </div>
		
		      <div class="text-center font-bold pt-4">기관의 특징</div>
		      <div class="text-center pt-2">해당하는 특징에 체크해주세요</div>
		      <br />
		
		      <div class="pr-10 pl-10 pt-4 pb-4">
		        <span class="font-bold pb-4">급여</span>
		        <div class="review-form">
		          <div class="p-1">
		            <div class="star">
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <a href="#" class="on">★</a>
		              <input type="hidden" name="salaryScore" value="5" />
		            </div>
		          </div>
		        </div>
		      </div>
		
		      <div class="pt-4 pl-10 pr-10">
		        <label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="1" /> 시간 외 수당</label>
		        &nbsp;
		        <label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="2" /> 퇴직금</label>
		        &nbsp;
		        <label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="3" /> 야근수당</label>
		        &nbsp;
		        <label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="4" /> 상여금</label>
		        &nbsp;
		        <label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="5" /> 식비</label>
		      </div>
		
		      <div class="pt-4 pl-10 pr-10">
		        <input
		          type="text"
		          name="salaryComment"
		          placeholder="급여 관련 하고싶은 말을 작성해 주세요."
		          style="width:100%;"
		          class="input input-neutral" />
		      </div>
		
		      <div class="text-center p-10">
		        <button
		          type="submit"
		          class="btn-wide btn-m text-black bg-[#ffbf73] border-none hover:bg-[#f79614df] hover:border-[#ff9d23]"
		          style="width:150px; height:40px; border-radius: 5px;">
		          다음
		        </button>
		      </div>
		    </form>
		  </div>
		
		  <div class="bg-white p-6 text-center flex justify-end">
		    <div>
		      <button class="btn btn-outline btn-s" onclick="history.back();" style="border-radius: 5px;">
		        뒤로가기
		      </button>
		    </div>
		  </div>
		</section>
		<style>
		  .review-form .star a {
		    text-decoration: none;
		    font-size: 2rem;
		    color: #ccc;
		    cursor: pointer;
		  }
		  .review-form .star a.on {
		    color: #f2cb61;
		  }
		</style>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		  $(function () {
		    $(".review-form .star a").click(function () {
		      let wasOn = $(this).hasClass("on");
		      $(this).parent().children("a").removeClass("on");
		      $(this).addClass("on").prevAll("a").addClass("on");
		      if (wasOn) $(this).removeClass("on");
		
		      let score = $(this).closest(".review-form").find(".on").length;
		      $(this).closest(".review-form").find("input[name='salaryScore']").val(score);
		      return false;
		    });
		  });
		</script>
		

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>