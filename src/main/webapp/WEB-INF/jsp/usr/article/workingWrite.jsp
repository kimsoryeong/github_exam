<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="flex justify-between items-center h-20 px-4">
	  <span class="text-orange-500 font-bold text-3xl">
	    <a href="/">KinderReview</a>
	  </span>
	  <span class="flex items-center space-x-6 text-black">
	    <i class="fa-solid fa-house fa-2xl"></i>
	    <i class="fa-regular fa-user fa-2xl"></i>
	  </span>
	</div>
	
	
	  <div class="container flex justify-center">
	    <form action="doWrite" method="post">
	      <input type="hidden" name="boardId" value="4" />
	      <div class="text-center w-200 mt-5">
	        <span class="px-2 font-bold text-2xl">근무 후기 작성</span>
	      </div>
	
	      <div class="border-2 border-yellow-500 mt-5 rounded-2xl mx-auto w-full max-w-2xl px-4 p-5">
	        <div class="pr-10 pl-10 pt-4 pb-4">
	          <span class="font-bold pb-4">기관명</span>
	          <span><input class="input input-neutral" name="institutionName" type="text" required /></span>
	        </div>
	
	        <div class="pr-10 pl-10 pt-2 pb-2">
	          <div class="font-bold">기관 총 평점</div>
	          <div>
	            <div class="review-form">
	              <div class="star">
	                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
	                <input type="hidden" name="salaryScore" value="5" />
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="option pr-10 pl-10 pt-2 pb-2">
	          <div class="font-bold pb-4">기관 한 줄 평</div>
	          <div class="">
	            <input type="text" name="content" id="contentField" placeholder="15자 이상 기관에 대해 작성해주세요. (필수입력)" style="width:100%;" class="input input-neutral" />
	          </div>
	        </div>
	
	        <div class="pl-10 pr-10 pt-2">
	         <div class="font-bold">기관의 특징</div>
	           <div class="pt-2 pb-2 text-sm">아래 버튼을 클릭하여 작성해주세요</div>
		         <div class="">
		         <div class="flex gap-4 font-bold cursor-pointer mt-2">
		           <div class="tab-title px-4 py-1 rounded-lg border border-gray-300 hover:bg-[#E0E0E0] hover:border hover:border-[#E0E0E0] cursor-pointer" data-target="#salary-section">급여</div>
		           <div class="tab-title px-4 py-1 rounded-lg border border-gray-300 hover:bg-[#E0E0E0] hover:border hover:border-[#E0E0E0] cursor-pointer" data-target="#welfare-section">복지</div>
		           <div class="tab-title px-4 py-1 rounded-lg border border-gray-300 hover:bg-[#E0E0E0] hover:border hover:border-[#E0E0E0] cursor-pointer" data-target="#work-section">근무환경</div>
		         </div>
		      	</div>
	        </div>
	
	        <!-- 급여 영역 -->
	        <div id="salary-section" class="tab-content mt-4 hidden pl-10 pr-10 pt-4">
	          <div class="border-2 border-gray-500 p-5 rounded-lg">
	            <span class="pr-10 pl-10 font-bold">급여</span>
	            <div class="pr-10 pl-10 ">
	            <div class="review-form">
	              <div class="star">
	                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
	                <input type="hidden" name="salaryScore" value="5" />
	              </div>
	            </div>
	          </div>
	            <div class="pt-4 pl-10 pr-10">
	              <div class="pt-2 pb-2 text-sm">해당하는 특징에 체크해주세요</div>
	              <label><input class="radio radio-neutral radio-xs" name="salaryOptions" type="radio" value="overtime-pay" /> 시간 외 수당</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="salaryOptions" type="radio" value="severance-pay" /> 퇴직금</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="salaryOptions" type="radio" value="bonus" /> 상여금</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="salaryOptions" type="radio" value="food expenses" /> 식비</label>
	            </div>
	            <div class="pt-4 pl-10 pr-10">
	              <input type="text" name="salaryComment" placeholder="급여 관련 하고싶은 말을 작성해 주세요." style="width:100%;" class="input input-neutral" />
	            </div>
	          </div>
	        </div>
	
	        <!-- 복지 영역 -->
	        <div id="welfare-section" class="tab-content mt-4 hidden pl-10 pr-10 pt-4">
	          <div class="border-2 border-gray-500 p-5 rounded-lg">
	            <span class="pr-10 pl-10 font-bold">복지</span>
	            <div class="pr-10 pl-10 ">
	            <div class="review-form">
	              <div class="star">
	                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
	                <input type="hidden" name="welfareScore" value="5" />
	              </div>
	            </div>
	          </div>
	            <div class="pt-4 pl-10 pr-10">
	              <div class="pt-2 pb-2 text-sm">해당하는 특징에 체크해주세요</div>
	              <label><input class="radio radio-neutral radio-xs" name="welfareOptions" type="radio" value="annualleave" /> 연반차 사용</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="welfareOptions" type="radio" value="sickLeave" /> 병가</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="welfareOptions" type="radio" value="vacation" /> 방학</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="welfareOptions" type="radio" value="parentalLeave" /> 육아휴직</label>&nbsp;
	              <label><input class="radio radio-neutral radio-xs" name="welfareOptions" type="radio" value="BreakTime" /> 휴게시간</label>
	            </div>
	            <div class="pt-4 pl-10 pr-10">
	              <input type="text" name="welfareComment" placeholder="복지 관련 하고싶은 말을 작성해 주세요." style="width:100%;" class="input input-neutral" />
	            </div>
	          </div>
	        </div>
	
	        <!-- 근무환경 영역 -->
	        <div id="work-section" class="tab-content mt-4 hidden border-2 border-green-500 pl-10 pr-10 pt-4">
	          <div class="border-2 border-gray-500 p-5 rounded-lg">
	            <span class="pr-10 pl-10 font-bold ">근무환경</span>
		           <div class="pr-10 pl-10 ">
		            <div class="review-form ">
		              <div class="star">
		                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
		                <input type="hidden" name="environmentScore" value="5" />
		              </div>
		            </div>
		          </div>
	            <div class="pt-4 pl-10 pr-10">
	            <div class="font-bold pb-2 text-sm">출퇴근 시간</div>
	              <input type="text" name="environmentComment" id="CommuteTime" placeholder="기관의 출퇴근 시간을 작성해주세요." style="width:100%;" class="input input-neutral" />
	            <div class="font-bold pt-2 pb-2 text-sm">기타</div>
	            <div class="text-xs pb-2">기관 내 분위기, 행사 빈도수, 특성화 활동, 원내 문화, 평가제, 교사 대 아동 비율 등&nbsp; 자유롭게 작성해주세요.</div>	
	              <input type="text" name="environmentComment" id="environment" placeholder="기관의 근무환경에 대해 자유롭게 작성해주세요." style="width:100%;" class="input input-neutral" />
	            </div>
	          </div>
	        </div>
	
	        <div class="text-center p-5">
	          <button type="submit" onclick="combineContent()" class="btn-wide btn-m text-black bg-[#ffbf73] border-none hover:bg-[#f79614df] hover:border-[#ff9d23]" style="width:150px; height:40px; border-radius: 5px;">
	            작성
	          </button>
	        </div>
	      </div>
	    </form>
	  </div>
	
	  <div class="bg-white p-6 text-center flex justify-end">
	    <div>
	      <button class="btn btn-outline btn-s" onclick="history.back();" style="border-radius: 5px;">뒤로가기</button>
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
	    $(".tab-title").click(function () {
	      $(".tab-content").hide();
	      const target = $(this).data("target");
	      $(target).slideDown();
	    });
	
	    $(".review-form .star a").click(function () {
	      const wasOn = $(this).hasClass("on");
	      $(this).parent().children("a").removeClass("on");
	      $(this).addClass("on").prevAll("a").addClass("on");
	      if (wasOn) $(this).removeClass("on");
	
	      const score = $(this).closest(".review-form").find(".on").length;
	      $(this).closest(".review-form").find("input[name='salaryScore']").val(score);
	      return false;
	    });
	  });
	</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>