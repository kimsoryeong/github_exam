<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="면접 리뷰 작성" />
<%@ include file="/WEB-INF/jsp/common/header.jsp" %> 

<section class="flex items-center justify-center bg-gray-100 min-h-screen">
  <div class="bg-white mx-auto w-full max-w-2xl shadow-xl rounded-xl">
    <div class="flex justify-end pt-6 pl-6 pr-5 items-center">
      <a href="/"><i class="text-orange-300 hover:text-orange-400 fa-solid fa-house fa-2xl"></i></a>
    </div>
    <div>
      <form action="doWrite" method="post" id="reviewForm" autocomplete="off">
        <input type="hidden" name="workType" value="${param.workType}" />
        <input type="hidden" name="city" value="${param.city}" />
        <input type="hidden" name="institutionType" value="${param.institutionType}" />
        <input type="hidden" name="boardName" value="면접 리뷰" />
        <div class="mx-auto text-center w-full max-w-2xl px-4">
          <span class="px-2 items-center text-orange-500 font-bold text-3xl"><a href="/">KinderReview</a></span>
          <c:set var="boardId" value="${param.boardName}" />
          <span class="px-2 items-center font-bold text-2xl">${param.boardName} 작성</span>
        </div>

        <div class="rounded-2xl p-5">
          <div class="px-10 mx-10 pt-8 py-5">
            <span class="font-bold pr-4 text-lg text-orange-400"><i class="fa-solid fa-school pr-5"></i>기관명</span>
            <span><input style="width:70%;" class="input input-neutral" name="institutionName" type="text" required /></span>
          </div>

          <div class="px-10 mx-10 py-2">
            <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-star-half-stroke pr-5"></i>면접 총 평점</div>
            <div>
              <div class="review-form pt-1" id="overall-star">
                <div class="star">
                  <a href="#">★</a><a href="#">★</a><a href="#">★</a><a href="#">★</a><a href="#">★</a>
                  <input type="hidden" name="overallScore" value="0" />
                </div>
              </div>
              <div class="error-message text-red-500 text-sm mt-1 hidden">면접 총 평점 별점을 선택해주세요.</div>
            </div>
          </div>

          <div class="px-10 mx-10 py-4 option">
            <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-pen-to-square pr-5"></i>면접 한 줄 평</div>
            <div class="pt-3 pb-4 text-sm">작성하실 면접 리뷰의 제목을 입력해 주세요. (20자 이내)</div>
            <div>
              <input name="interviewComment" maxlength="20" 
                placeholder="10자 이상 기관의 면접에 대해 작성해주세요. (필수입력)"
                class="input h-10 resize-none" style="width:100%;"></>
              <div class="error-message text-red-500 text-sm mt-1 hidden">한 줄 평을 10~20자 이내로 입력해주세요.</div>
            </div>
          </div>
		
		  <div class="px-10 mx-10 py-3">
		  <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-square-check pr-5"></i>경력 사항</div>
		  	<div class="mt-3">
		  		<label><input class="radio radio-xs mr-2" name="personalHistory" type="radio" value="신입 교사" />신입 교사</label>
            	<label><input class="radio radio-xs mx-2" name="personalHistory" type="radio" value="경력 교사" />경력 교사</label>
			</div>            
		</div>
		
		
        <div class="px-10 mx-10 py-4">
		 <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-square-check pr-5"></i>면접의 특징</div>
		  <div class="pt-2 pb-2 text-sm">아래 버튼을 클릭하여 작성해주세요</div>
		  <div>
		    <div class="flex gap-4 font-bold cursor-pointer mt-2 justify-center">
		      <div class="tab-title px-4 py-1 rounded-lg border border-black-800 text-gray-500 hover:text-orange-400 transition cursor-pointer" data-target="#salary-section">
		        면접 정보 <span class="tab-error text-red-500 hidden">*</span>
		      </div>
		      <div class="tab-title px-4 py-1 rounded-lg border border-black-800 text-gray-500 hover:text-orange-400 transition cursor-pointer" data-target="#welfare-section">
		        질의응답 <span class="tab-error text-red-500 hidden">*</span>
		      </div>
		    </div>
		  </div>
		</div>


          <div id="salary-section" class="tab-content mt-4 pl-10 pr-10">
            <div class="shadow-md rounded-lg p-6 mx-7 my-1 bg-yellow-50 min-h-[220px]">
		      
		       <div class="py-3">
		         <div class="font-bold pb-2 text-m">면접 준비</div>
		         <input name="interviewMaterial" maxlength="20" placeholder="5자 이상 면접 준비물에 대해 작성해주세요."
		              class="input h-10 resize-none" style="width:100%;"/>
	             <div class="error-message text-red-500 text-sm mt-1 hidden">면접 준비물을 5~20자 이내로 입력해주세요.</div>
	       	   </div>
	       	   
		       <div class="py-3">
		         <div class="font-bold pb-2 text-m">면접 진행</div>
		         <div class="pt-2 pb-4 text-sm">면접관 수, 면접 방식(1:1, 그룹), 면접 분위기 등 자유롭게 작성해주세요.</div>
		         <textarea name="interviewProgress" cols=60 rows=2
                placeholder="10자 이상 기관의 면접 진행 과정에 대해 작성해주세요. (필수입력)"
                style="overflow-x:hidden;" class="p-2 text-sm border-gray-300 rounded-sm w-full"></textarea>
              	<div class="error-message text-red-500 textarea-sm mt-1 hidden">면접 진행 과정을 10자 이상 입력해주세요.</div>
	       	   </div>
	       	   
		       <div class="py-3">
		         <div class="font-bold pb-2 text-m">면접 마무리</div>
		         <div class="pt-2 pb-4 text-sm">결과 통보 기간, 면접관의 피드백 등 자유롭게 작성해주세요.</div>
		         <textarea name="interviewResults" cols=60 rows=2
                placeholder="10자 이상 기관의 면접 마무리 과정에 대해 작성해주세요. (필수입력)"
                style="overflow-x:hidden;" class="p-2 text-sm border-gray-300 rounded-sm w-full"></textarea>
	             <div class="error-message text-red-500 text-sm mt-1 hidden">면접 마무리 과정을 10자 이상 입력해주세요.</div>
	       	   </div>
	        
          </div>


          <div id="welfare-section" class="tab-content mt-4 pl-10 pr-10 hidden">
            <div class="shadow-md rounded-lg p-6 mx-7 my-1 bg-blue-50 min-h-[220px]">
            
            <span class="text-lg font-bold pr-3"><i class="fa-solid fa-users pr-5"></i>질의응답 및 조언</span>
              		
          <div class="px-10 mx-10 py-3">
           <div class="font-bold text-lg text-orange-400"><i class="fa-regular fa-pen-to-square pr-5"></i>질의응답</div>
            <div class="pt-3 pb-4 text-sm">기억에 남는 면접 질문과 본인의 답변을 작성해 주세요.</div>
              <textarea name="interviewQnA" cols=60 rows=2
                placeholder="10자 이상 기관의 면접 질의응답에 대해 작성해주세요. (필수입력)"
                style="overflow-x:hidden;" class="p-2 text-sm border-gray-300 rounded-sm w-full"></textarea>
              <div class="error-message text-red-500 textarea-sm mt-1 hidden">질의응답을 10자 이상 입력해주세요.</div>
          </div>
          	
              <div class="pt-2">
                <div class="font-bold pb-2 text-m">조언</div>
                <div class="text-xs pb-2">면접 분위기, 기관의 특성 등 자유롭게 작성해주세요. </div>
                <input type="text" name="interviewTip" id="environment" placeholder="기관의 근무환경에 대해 자유롭게 작성해주세요." style="width:100%;" class="input input-neutral" />
                <div class="comment-error-message text-red-500 text-sm mt-1 hidden">근무환경 관련 한줄평을 5~50자로 작성해주세요.</div>
              </div>
            </div>
            
          </div>

          <div class="pt-2 flex justify-between items-center">
            <button class="tab-title px-4 py-1 rounded-lg text-3xl text-orange-300 hover:text-orange-400 transition cursor-pointer" onclick="history.back();" type="button"><i class="fa-solid fa-arrow-left"></i></button>
            <button type="submit" class="btn-wide  bg-orange-300 hover:bg-orange-400 text-white font-bold rounded-lg" style="width:150px; height:40px;">
              작성
            </button>
          </div>
        </div>
      </form>
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
  .tab-content > div {
    min-height: 220px;
  }
  textarea.input {
    resize: none;
    min-height: 2.5rem;
    max-height: 2.5rem;
    line-height: 2.2rem;
    padding-top: 0.2rem;
    padding-bottom: 0.2rem;
  }
</style>

<script>
$(function () {
  var isStarClicked = { overall: false, salary: false, welfare: false, env: false };

  $(".review-form .star a").click(function (e) {
    e.preventDefault();
    const wasOn = $(this).hasClass("on");
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    if (wasOn) $(this).removeClass("on");
    $(this).closest(".review-form").find("input[type='hidden']").val($(this).closest(".review-form").find(".on").length);
    var $reviewForm = $(this).closest(".review-form");
    if ($reviewForm.attr("id") === "overall-star") {
      $reviewForm.parent().find(".error-message").addClass("hidden");
      isStarClicked.overall = true;
    } else {
      $reviewForm.next(".error-message").addClass("hidden");
      var $section = $(this).closest(".shadow-md").parent();
      var sectionId = $section.attr("id");
      if (sectionId === "salary-section") isStarClicked.salary = true;
      else if (sectionId === "welfare-section") isStarClicked.welfare = true;
      else if (sectionId === "work-section") isStarClicked.env = true;
    }
    checkTabErrors();
  });

  $("input[name='institutionComment'], input[name='salaryComment'], input[name='welfareComment'], input[name='environmentComment'], input[name='commuteTimeComment']").on("input", function(){
    var comment = $(this).val();
    var minLen = $(this).attr("name") === "institutionComment" ? 10 : 5;
    var maxLen = $(this).attr("name") === "institutionComment" ? 20 : 50;
    if(!comment || comment.trim().length < minLen || comment.trim().length > maxLen){
      $(this).siblings(".comment-error-message, .error-message").removeClass("hidden");
    }else{
      $(this).siblings(".comment-error-message, .error-message").addClass("hidden");
    }
    checkTabErrors();
  });

  $(".tab-title").click(function () {
    if ($(this).text().trim() === "뒤로가기") return;
    $(".tab-content").hide();
    $( $(this).data("target") ).slideDown();
    $(".tab-title").removeClass("border-orange-400 text-orange-400 bg-gray-100 bg-white");
    $(this).addClass("border-orange-400 text-orange-400");
  });

  function checkTabErrors() {
    var salaryError = $("#salary-section .error-message:not(.hidden), #salary-section .comment-error-message:not(.hidden)").length > 0;
    $(".tab-title:contains('급여')").find(".tab-error").toggleClass("hidden", !salaryError);
    var welfareError = $("#welfare-section .error-message:not(.hidden), #welfare-section .comment-error-message:not(.hidden)").length > 0;
    $(".tab-title:contains('복지')").find(".tab-error").toggleClass("hidden", !welfareError);
    var workError = $("#work-section .error-message:not(.hidden), #work-section .comment-error-message:not(.hidden)").length > 0;
    $(".tab-title:contains('근무환경')").find(".tab-error").toggleClass("hidden", !workError);
  }

  $("#reviewForm").on("submit", function(e){
    let valid = true;
    var $firstError = null;

    if( $("#overall-star .star .on").length === 0 || !isStarClicked.overall ){
      $("#overall-star").parent().find(".error-message").removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("#overall-star").parent().find(".error-message").first();
    }

    var comment = $("input[name='institutionComment']").val();
    if(!comment || comment.trim().length < 10 || comment.trim().length > 20){
      $("input[name='institutionComment']").siblings(".error-message").removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("input[name='institutionComment']").siblings(".error-message").first();
    }

    if( $("#salary-section .star .on").length === 0 || !isStarClicked.salary ){
      $("#salary-section .error-message").first().removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("#salary-section .error-message").first();
    }

    var salaryComment = $("input[name='salaryComment']").val();
    if(!salaryComment || salaryComment.trim().length < 5 || salaryComment.trim().length > 50){
      $("input[name='salaryComment']").siblings(".comment-error-message").removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("input[name='salaryComment']").siblings(".comment-error-message").first();
    }

    if( $("#welfare-section .star .on").length === 0 || !isStarClicked.welfare ){
      $("#welfare-section .error-message").first().removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("#welfare-section .error-message").first();
    }

    var welfareComment = $("input[name='welfareComment']").val();
    if(!welfareComment || welfareComment.trim().length < 5 || welfareComment.trim().length > 50){
      $("input[name='welfareComment']").siblings(".comment-error-message").removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("input[name='welfareComment']").siblings(".comment-error-message").first();
    }

    if( $("#work-section .star .on").length === 0 || !isStarClicked.env ){
      $("#work-section .error-message").first().removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("#work-section .error-message").first();
    }

    var envComment = $("input[name='environmentComment']").val();
    if(!envComment || envComment.trim().length < 5 || envComment.trim().length > 50){
      $("input[name='environmentComment']").siblings(".comment-error-message").removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("input[name='environmentComment']").siblings(".comment-error-message").first();
    }

    var commuteComment = $("input[name='commuteTimeComment']").val();
    if(!commuteComment || commuteComment.trim().length < 5 || commuteComment.trim().length > 50){
      $("input[name='commuteTimeComment']").siblings(".comment-error-message").removeClass("hidden");
      valid = false;
      $firstError = $firstError || $("input[name='commuteTimeComment']").siblings(".comment-error-message").first();
    }

    checkTabErrors();
    if(!valid){
      $('html, body').animate({ scrollTop: ($firstError.offset().top - 100) }, 300);
      e.preventDefault();
    }
  });
});
</script>



<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
