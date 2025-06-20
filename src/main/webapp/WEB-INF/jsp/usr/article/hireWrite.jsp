<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="채용공고 글쓰기" />
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/common/topbar.jsp"%>


<section class="bg-gray-100 min-h-screen py-8">
	<div class="container mx-auto max-w-4xl">
		<div
			class="bg-white rounded-t-lg shadow p-6 mb-4 border-b-4 border-orange-300 flex justify-between items-center">
			<div>
				<h1 class="text-2xl font-bold text-orange-400">채용공고 글쓰기</h1>
			</div>
		</div>
		<div class="bg-white border-b-2 rounded-t-lg px-2 py-5 shadow">
			<div class="px-5 pt-2 pb-4">
            <span class="font-bold pr-4  text-orange-400"><i class="fa-solid fa-school pr-4"></i>기관명</span>
            <span><input style="width:40%;" class="input border" name="institutionName" type="text" required /></span>
            <span class="font-bold pr-4  text-orange-400"><i class="fa-solid fa-phone px-4"></i>전화번호</span>
            <span><input style="width:30%;" class="input border" name="hireSalary" type="text" required /></span>
            </div>
          
		  <div class="px-5 py-4">
           
			<span class="option">
			  <span class="font-bold pr-3 text-orange-400">
			    <i class="fa-solid fa-file-image pr-2"></i>첨부 파일
			  </span>
			  <label for="workCertFile" class="inline-block cursor-pointer bg-orange-100 text-orange-700 font-semibold py-1 px-4 rounded hover:bg-orange-200 text-sm">
			    파일 선택
			  </label>
			  <span id="fileName" class="ml-2 text-sm text-gray-600">선택된 파일 없음</span>
			  <input type="file" name="workCertFile" id="workCertFile" accept=".pdf,.jpg,.jpeg,.png" class="hidden" />
			   <span class="font-bold pl-35 pr-8 text-orange-400"><i class="fa-solid fa-sack-dollar pr-8"></i>급여</span>
            	<span><input style="width:30%;" class="input border " name="hireSalary" type="text" required /></span>
			</span>
			  <div class="text-xs text-gray-400 mt-1">PDF, JPG, PNG 파일만 업로드 가능합니다.</div>
          </div>
			 <div class="flex justify-around pt-3">
			<div class="">
				<div class="font-bold pb-3 text-orange-400 ">
					<i class="fa-solid fa-location-dot pr-2 "></i>근무지역
				</div>
				<select style="width: 250px;" id="city" onchange="updateDistricts()"
					class="rounded-md select border" name="city-select">
					<option class="text-center h-40" value="" disabled selected>--시/도 선택--</option>
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
			<div class="">
				<div class="font-bold pb-3 text-orange-400">
					<i class="fa-regular fa-user pr-2"></i>구인 직종
				</div>
				<select style="width: 250px;" id="workType"
					class="select rounded-md border" name="work-type-select">
					<option class="text-center" value="" disabled selected>--구인 직종--</option>
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
			<div class="w-60 text-center ">
				<div class="font-bold text-orange-400">
					<i class="fa-solid fa-briefcase pr-2"></i>경력사항
				</div>
				<div class="mt-3">
					<label><input class="radio border radio-xs mr-2" name="personalHistory" type="radio" value="무관" />무관</label> 
					<label><input class="radio border radio-xs mx-2" name="personalHistory" type="radio" value="유" />유</label>
				</div>
				<div class="error-message-personalHistory text-red-500 text-sm mt-1 hidden">경력 사항을 선택해주세요.</div>
			</div>
			
			</div> 
		</div>
		<div class="bg-white border-b-2 rounded-b-lg px-2 py-5 ">
		<div class="px-5 py-1">
	      <div class="pb-3">
	      <input name="content" placeholder="제목을 작성해주세요." class="p-2 bg-gray-100 text-sm border-gray-300 rounded-sm w-full"/>  
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
	
</section>

<style>
.hidden { display: none; }
</style>

<script>
		
	</script>



<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>