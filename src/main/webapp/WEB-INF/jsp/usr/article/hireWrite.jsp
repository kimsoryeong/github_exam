<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="채용 공고 글쓰기" />
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/common/topbar.jsp"%>

<section class="bg-gray-100 min-h-screen py-8">
  <form action="doWrite" method="post" id="hireWrite" enctype="multipart/form-data" onsubmit="return hireWriteForm()">
	 <input type="hidden" name="boardName" value="채용 공고" />
	 <input type="hidden" name="institutionName" value="${member.institutionName}"/>
		<div class="container mx-auto max-w-4xl">
			<div class="bg-white rounded-t-lg shadow p-6 mb-4 border-b-4 border-orange-300 flex justify-between items-center">
				<div>
					<h1 class="text-2xl font-bold text-orange-400">채용공고 글쓰기</h1>
				</div>
			</div>
			<div class="bg-white border-b-2 rounded-t-lg px-10 py-6 shadow space-y-6">
		  <div class="space-y-2">
			
		  <div class="flex gap-4 w-full">
		  <div class="w-1/2 flex items-start">
		    <i class="fa-solid fa-school text-orange-400 pr-2 mt-1"></i>
		    <div>
		      <div class="flex items-center">
		        <span class="font-bold text-orange-400 pr-5">기관명</span>
		        <span class="font-bold text-black">${member.institutionName}</span>
		      </div>
		      <div class="text-sm text-gray-500  pb-4 pl-[66px]">${member.address}</div>
		    </div>
		  </div>
		  <div class="w-1/2 flex items-center pl-12 pb-4">
		    <i class="fa-solid fa-phone text-orange-400 pr-2"></i>
		    <span class="font-bold text-orange-400 pr-2">전화번호</span>
		    <input
		      class="input border rounded px-3 py-2 w-full max-w-[250px]"
		      name="phoneNumber"
		      type="text"
		      placeholder="전화번호를 입력하세요"
		      required
		    />
		  </div>
		</div>
		  <div class="flex flex-wrap justify-between gap-6">
			<div>
		      <span class="font-bold text-orange-400 pr-5 whitespace-nowrap">
		        <i class="fa-solid fa-sack-dollar pr-5"></i>급여
		      </span>
		      <input class="input border rounded px-3 py-2 w-60 " name="hireSalary" type="text" placeholder="급여를 입력하세요" required />
			</div>
		    <div class="font-bold text-orange-400 mb-2">
		        <i class="fa-solid fa-briefcase pr-1"></i>
		        <span class="pr-10">경력사항</span>
		        <label class="px-3"><input type="radio" name="personalHistory" value="무관" class="mr-3">무관</label>
		        <label class="pr-15 pl-8"><input type="radio" name="personalHistory" value="유" class="mr-3">유</label>
		      	<div class="error-message-personalHistory text-red-500 text-sm mt-1 hidden">경력 사항을 선택해주세요.</div>
		    </div>
		</div>
		  <div class="flex flex-wrap justify-between gap-6">
		    <div>
		      <div class="font-bold text-orange-400 mb-2">
		        <i class="fa-regular fa-user pr-2"></i>구인 직종
		      </div>
		      <select id="workType" name="workType" class="rounded-md border px-3 py-2 w-60">
		        <option value="" disabled selected>구인 직종</option>
		        <option value="원장">원장</option>
		        <option value="원감">원감</option>
		        <option value="정교사">정교사</option>
		        <option value="보조교사">보조교사</option>
		        <option value="방과후교사">방과후교사</option>
		        <option value="종일반교사">종일반교사</option>
		        <option value="파트타임">파트타임</option>
		        <option value="방문교사">방문교사</option>
		        <option value="영양사">영양사</option>
		        <option value="기타">기타</option>
		      </select>
		    </div>
		    <div>
		      <div class="font-bold text-orange-400 mb-2">
		        <i class="fa-solid fa-location-dot pr-2"></i>근무지역
		      </div>
		      <select id="city" name="city" onchange="updateDistricts()"
		        class="rounded-md border px-3 py-2 w-60">
		        <option value="" disabled selected>시/도 선택</option>
		        <option value="서울">서울</option>
		        <option value="대전">대전</option>
		        <option value="대구">대구</option>
		        <option value="부산">부산</option>
		        <option value="인천">인천</option>
		        <option value="광주">광주</option>
		        <option value="세종">세종</option>
		        <option value="울산">울산</option>
		        <option value="강원">강원</option>
		        <option value="경기">경기</option>
		        <option value="경남">경남</option>
		        <option value="경북">경북</option>
		        <option value="전남">전남</option>
		        <option value="전북">전북</option>
		        <option value="제주">제주</option>
		        <option value="충남">충남</option>
		        <option value="충북">충북</option>
		      </select>
		    </div>
			    <div>
			      <div class="font-bold text-orange-400 mb-2">
			        <i class="fa-solid fa-calendar-days pr-2"></i>마감일
			      </div>
			      <input type="date" id="deadline" name="deadline" class="border rounded-md px-3 py-2 w-60">
			      <div class="error-message-deadline text-red-500 text-sm mt-1 hidden">마감일을 선택해주세요.</div>
			    </div>
		     </div>
		  </div>
			<div class="bg-white border-b-2 rounded-b-lg py-5 ">
				<div class=" py-1">
			      <div class="pb-3">
			      <input name="title" placeholder="제목을 작성해주세요." class="p-2 bg-gray-100 text-sm border-gray-300 rounded-sm w-full"/>  
			      </div>
		<div class=" flex-col justify-end">
				<label for="workCertFile"
					class="inline-block cursor-pointer  bg-orange-100 text-orange-700 font-semibold py-1 px-4 rounded hover:bg-orange-200 text-sm">
					파일 선택 
				</label> 
				<span id="fileName" class="ml-2 text-sm text-gray-600">선택된 파일 없음</span> 
				<input type="file" name="workCertFile" id="workCertFile" accept=".pdf,.jpg,.jpeg,.png" class="hidden" />
				<div class="text-xs text-gray-400 pb-2">PDF, JPG, PNG 파일만 업로드 가능합니다.</div>
			</div>
			      <textarea name="content" cols=120 rows=10
			        placeholder="내용을 작성해주세요."
			        style="overflow-x: hidden; "
			        class="p-2 bg-gray-100 text-sm border-gray-300 rounded-sm w-full"></textarea>  
			    </div>
	    		<div class="pt-2 flex justify-between items-center">
					<button
						class="tab-title px-4 py-1 rounded-lg text-3xl text-orange-300 hover:text-orange-400 transition cursor-pointer"
						onclick="history.back();" type="button">
						<i class="fa-solid fa-arrow-left"></i>
					</button>
					<button type="submit"
						class="btn-wide  bg-orange-300 hover:bg-orange-400 text-white font-bold rounded-lg"
						style="width: 150px; height: 40px;">작성</button>
				</div>
			</div>
		</div>
	</form>
</section>
<script>
	const fileInput = document.getElementById('workCertFile');
	const fileNameSpan = document.getElementById('fileName');
	
	fileInput.addEventListener('change', function () {
	  if (fileInput.files.length > 0) {
	    fileNameSpan.textContent = fileInput.files[0].name;
	  } else {
	    fileNameSpan.textContent = '선택된 파일 없음';
	  }
	});
	
	$('input[name="bizFile"]').on('change', function() {
		  const file = this.files[0];
		  if (file && file.size > 10 * 1024 * 1024) { 
		    alert("파일 크기는 최대 10MB까지 업로드 가능합니다.");
		    this.value = ''; 
		  }
		});


  function hireWriteForm() {
    const city = document.getElementById('city').value;
    const workType = document.getElementById('workType').value;
    const personalHistoryElems = document.getElementsByName('personalHistory');
    const title = document.querySelector('input[name="title"]').value.trim();
    const content = document.querySelector('textarea[name="content"]').value.trim();
    const deadline = document.querySelector('input[name="deadline"]').value.trim();

    let personalHistoryChecked = false;
    for (let elem of personalHistoryElems) {
      if (elem.checked) {
        personalHistoryChecked = true;
        break;
      }
    }

    if (!city) {
      alert('근무지역을 선택해주세요.');
      return false;
    }

    if (!workType) {
      alert('구인 직종을 선택해주세요.');
      return false;
    }

    if (!personalHistory) {
      alert('경력사항을 선택해주세요.');
      return false;
    }
    if (!deadline) {
      alert('마감일을 선택해주세요.');
      return false;
    }

    if (title.length === 0) {
      alert('제목을 입력해주세요.');
      return false;
    }

    if (content.length === 0) {
      alert('내용을 입력해주세요.');
      return false;
    }

    return true;
  }
  
  const today = new Date().toISOString().split("T")[0];
  const deadlineInput = document.getElementById("deadline");
  deadlineInput.min = today;
  deadlineInput.value = today;

</script>






<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>