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

<section class="flex items-center justify-center bg-gray-100 h-screen">
	  <div class="bg-white mx-30 min-w-max shadow-xl rounded-xl h-full-60%">
	  	<div class="flex justify-end pr-5 pt-2  items-center h-15">
			<a href="/"><i class="text-orange-300 hover:text-orange-400 fa-solid fa-house fa-2xl"></i></a>
		</div>
		<div>
		    <form action="doWrite" method="post">
		      <input type="hidden" name="workType" value="${param.workType}" />
			  <input type="hidden" name="city" value="${param.city}" />
			  <input type="hidden" name="institutionType" value="${param.institutionType}" />
		      <input type="hidden" name="boardId" value="4" />
	     	<div class="mx-auto text-center w-full max-w-2xl px-4 px-30">
				<span class="px-2 items-center text-orange-500 font-bold text-3xl"><a href="/">KinderReview</a></span>
				<span class="px-2 items-center font-bold text-2xl">근무 리뷰 작성</span>
			</div>
			
	      <div class="rounded-2xl p-5">
	        <input type="hidden" name="workingReview" id="hiddenWorkingReview" />
				<input type="hidden" name="interviewReview" id="hiddenInterviewReview" />
				<input type="hidden" name="practiceReview" id="hiddenPracticeReviewType" />
				
	        <div class="px-10 mx-10 pt-8 py-5">
	          <span class="font-bold pr-4 text-lg text-orange-400"><i class="fa-solid fa-school pr-5"></i>기관명</span>
	          <span><input style="width:70%;" class="input input-neutral" name="institutionName" type="text" required /></span>
	        </div>
			
	        <div class="px-10 mx-10 py-2">
	          <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-star-half-stroke pr-5"></i>기관 총 평점</div>
	          <div>
	            <div class="review-form pt-1">
	              <div class="star">
	                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
	                <input type="hidden" name="salaryScore" value="5" />
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="px-10 mx-10 py-4 option">
	          <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-pen-to-square pr-5"></i>기관 한 줄 평</div>
	           <div class="pt-3 pb-4 text-sm">작성하실 리뷰의 제목을 입력해 주세요. (20자 이내)</div>
	          <div>
	            <textarea name="institutionComment" placeholder="10자 이상 기관에 대해 작성해주세요. (필수입력)" 
	              		rows="5" cols="20" wrap="soft" maxlength="20" style="width:100%; height: 70px; overflow-y: auto; overflow-x:hidden; resize: none; word-break: break-word; white-space: pre-wrap;" class="input"></textarea>
	          </div>
	        </div>
	
	        <div class="px-10 mx-10 py-4">
	         <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-square-check pr-5"></i>기관의 특징</div>
	           <div class="pt-2 pb-2 text-sm">아래 버튼을 클릭하여 작성해주세요</div>
		         <div class="">
		         <div class="flex gap-4 font-bold cursor-pointer mt-2">
		           <div class="tab-title px-4 py-1 rounded-lg border border-black-800 hover:bg-gray-200 hover:border-gray-200 cursor-pointer" data-target="#salary-section">급여</div>
		           <div class="tab-title px-4 py-1 rounded-lg border border-black-800 hover:bg-[#ffbf73] hover:border  cursor-pointer" data-target="#welfare-section">복지</div>
		           <div class="tab-title px-4 py-1 rounded-lg border border-black-800 hover:bg-[#ffbf73] hover:border  cursor-pointer" data-target="#work-section">근무환경</div>
		         </div>
		      	</div>
	        </div>
	
	        <div id="salary-section" class="tab-content  mt-4 hidden pl-10 pr-10">
	          <div class="shadow-md rounded-lg py-5 px-10 mx-7 bg-yellow-50">
	            <span class=" font-bold"><i class="fa-solid fa-sack-dollar pr-5 "></i>급여</span>
	            <div class="">
	            <div class="review-form">
	              <div class="star">
	                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
	                <input type="hidden" name="salaryScore" value="5" />
	              </div>
	            </div>
	          </div>
	            <div class="pt-2">
	              <div class="pt-2 pb-4 text-sm">원에서 제공하는 특징에 체크해주세요</div>
	              <label><input class="checkbox-xs" name="salaryOptions" type="checkbox" value="시간 외 수당" /> 시간 외 수당</label>&nbsp;
	              <label><input class="checkbox-xs" name="salaryOptions" type="checkbox" value="퇴직금" /> 퇴직금</label>&nbsp;
	              <label><input class="checkbox-xs" name="salaryOptions" type="checkbox" value="상여금" /> 상여금</label>&nbsp;
	              <label><input class="checkbox-xs" name="salaryOptions" type="checkbox" value="식비" /> 식비</label>
	            </div>
	            <div class="pt-4">
	              <textarea name="salaryComment" placeholder="급여 관련 하고싶은 말을 작성해 주세요." 
	              			rows="5" cols="20" wrap="soft" style="width:100%; height: 70px; overflow-y: auto; overflow-x:hidden; resize: none; word-break: break-word; white-space: pre-wrap;" class="input"></textarea>
	            </div>
	          </div>
	        </div>
	
	        <div id="welfare-section" class="tab-content  mt-4 hidden pl-10 pr-10">
	          <div class="shadow-md rounded-lg py-5 px-10 mx-7 bg-green-50">
	            <span class="font-bold"><i class="fa-solid fa-hand-holding-heart pr-5"></i>복지</span>
	            <div class="">
	            <div class="review-form">
	              <div class="star">
	                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
	                <input type="hidden" name="welfareScore" value="5" />
	              </div>
	            </div>
	          </div>
	            <div class="pt-2">
	              <div class="pt-2 pb-4 text-sm">원에서 제공하는 특징에 체크해주세요</div>
	              <label><input class="checkbox-xs" name="welfareOptions" type="checkbox" value="연반차 사용" /> 연반차 사용</label>&nbsp;
	              <label><input class="checkbox-xs" name="welfareOptions" type="checkbox" value="병가" /> 병가</label>&nbsp;
	              <label><input class="checkbox-xs" name="welfareOptions" type="checkbox" value="방학" /> 방학</label>&nbsp;
	              <label><input class="checkbox-xs" name="welfareOptions" type="checkbox" value="육아휴직" /> 육아휴직</label>&nbsp;
	              <label><input class="checkbox-xs" name="welfareOptions" type="checkbox" value="휴게시간" /> 휴게시간</label>
	            </div>
	            <div class="pt-4">
	              <textarea name="welfareComment" placeholder="복지 관련 하고싶은 말을 작성해 주세요." 
	              			rows="5" cols="20" wrap="soft" style="width:100%; height: 70px; overflow-y: auto; overflow-x:hidden; resize: none; word-break: break-word; white-space: pre-wrap;" class="input"></textarea>
	            </div>
	          </div>
	        </div>
	
	        <div id="work-section" class="tab-content mt-4 hidden pl-10 pr-10">
	          <div class="shadow-md rounded-lg py-5 px-10 mx-7 bg-blue-50">
	            <span class="font-bold "><i class="fa-solid fa-seedling pr-5"></i>근무환경</span>
		           <div class="">
		            <div class="review-form ">
		              <div class="star">
		                <a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a><a href="#" class="on">★</a>
		                <input type="hidden" name="environmentScore" value="5" />
		              </div>
		            </div>
		          </div>
	            <div class="pt-4">
	            <div class="font-bold pb-2 text-m">출퇴근 시간</div>
	              <textarea name="commuteTimeComment" placeholder="기관의 출퇴근 시간을 작성해주세요. (필수입력)" 
	              			rows="5" cols="20" wrap="soft" style="width:100%; height: 70px; overflow-y: auto; overflow-x:hidden; resize: none; word-break: break-word; white-space: pre-wrap;" class="input"></textarea>
	            <div class="font-bold pt-2 pb-2 text-m">기타</div>
	            <div class="text-xs pb-2">기관 내 분위기, 원내 문화, 평가제, 교사 대 아동 비율 등 자유롭게 작성해주세요.</div>	
	              <textarea name="environmentComment" placeholder="기관의 근무환경에 대해 자유롭게 작성해주세요." 
	              			rows="5" cols="20" wrap="soft" style="width:100%; height: 70px; overflow-y: auto; overflow-x:hidden; resize: none; word-break: break-word; white-space: pre-wrap;" class="input"></textarea>
	            </div>
	          </div>
	        </div>
	
	        <div class="py-6 text-center">
	          <button type="submit" onclick="combineContent()" class="btn-wide btn-m text-black bg-[#ffbf73] border-none hover:bg-[#f79614df] hover:border-[#ff9d23]" style="width:150px; height:40px; border-radius: 5px;">
	            작성
	          </button>
	        </div>
	      </div>
	    </form>
	  </div>
	</div>
	  <div class="bg-white p-4 text-center flex">
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
	  
	  $(function() {
	        $('.input')
	            .css({
	                'border-color': 'black',
	                'border-width': '1px',
	                'border-style': 'solid'
	            })
	            .on('focus', function () {
	                $(this).css({
	                    'border-color': 'orange',
	                    'border-width': '2px',
	                    'border-style': 'solid'
	                });
	            })
	            .on('blur', function () {
	                $(this).css({
	                    'border-color': 'black',
	                });
	            });
	    });
	  
	  function combineContent() {
		    const institutionName = document.querySelector('select[name="work-type-select"]').value;
		    const institutionScore = document.querySelector('select[name="city-select"]').value;
		    const institutionComment = document.querySelector('select[name="institution-type-select"]').value;

		    if (!institutionName) { alert("기관명을 작성해주세요."); return; }
		    if (!institutionScore) { alert("기관 총 평점을 선택해주세요."); return; }
		    if (!institutionComment) { alert("기관 한 줄 평을 작성해주세요."); return; }

	  
	</script>
	

	

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>