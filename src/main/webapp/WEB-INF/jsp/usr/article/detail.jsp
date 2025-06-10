<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<section class="mt-8">
		<div class="max-w-2xl mx-auto p-6 bg-white">
		  <div class="flex justify-between text-xs text-gray-600 border-b border-gray-300 pb-3 mb-4">
		    <div>
		      <span class="font-semibold">번호:</span>
		      <span>${article.id}</span>
		    </div>
		    <div class="text-right">
		      <div><span class="font-semibold">작성일:</span> ${article.regDate.substring(2, 16)}</div>
		      <div><span class="font-semibold">수정일:</span> ${article.updateDate.substring(2, 16)}</div>
		    </div>
		  </div>
		  <div class="flex items-center space-x-4 mb-3">
		    <i class="fa-solid fa-city fa-3x text-gray-700"></i>
		    <div>
		      <h2 class="text-3xl font-bold text-gray-900">${article.institutionName}</h2>
		      <div class="text-sm text-gray-500">
		        ${article.institutionType} · ${article.workType} / ${article.city}
		      </div>
		    </div>
		    <div class="ml-auto flex items-center space-x-1">
		      <span class="text-yellow-400 text-2xl font-bold">★</span>
		      <span class="text-yellow-400 text-xl font-semibold">${article.star}</span>
		    </div>
		  </div>
		  <blockquote class="border-l-4 border-yellow-400 pl-4 italic text-gray-700 mb-6">
		    "${article.content}"
		  </blockquote>
		  <div class="border rounded-lg p-4 mb-6 bg-yellow-50">
		    <div class="flex items-center justify-between mb-3">
		      <h3 class="font-bold text-xl text-yellow-600">급여</h3>
		      <div class="flex items-center space-x-1 text-yellow-500 text-2xl font-bold">
		        <span>★</span>
		        <span>${article.salaryScore}</span>
		      </div>
		    </div>
		    <div class="mb-3">
		      <div class="font-semibold mb-1">원에서의 지원</div>
		      <c:choose>
		        <c:when test="${not empty article.salaryOptions}">
		          <ul class="list-disc list-inside text-gray-700 space-y-1">
		            <c:forEach var="option" items="${article.salaryOptions}">
		              <li>${option}</li>
		            </c:forEach>
		          </ul>
		        </c:when>
		        <c:otherwise>
		          <p class="text-gray-500 italic">지원 정보 없음</p>
		        </c:otherwise>
		      </c:choose>
		    </div>
		    <div>
		      <div class="font-semibold mb-1">급여 코멘트</div>
		      <p class="text-gray-800">${article.salaryComment != null ? article.salaryComment : "코멘트 없음"}</p>
		    </div>
		  </div>
		  <div class="border rounded-lg p-4 mb-6 bg-green-50">
		    <div class="flex items-center justify-between mb-3">
		      <h3 class="font-bold text-xl text-green-600">복지</h3>
		      <div class="flex items-center space-x-1 text-green-500 text-2xl font-bold">
		        <span>★</span>
		        <span>${article.welfareScore}</span>
		      </div>
		    </div>
		    <div class="mb-3">
		      <div class="font-semibold mb-1">원에서의 지원</div>
		      <c:choose>
		        <c:when test="${not empty article.welfareOptions}">
		          <ul class="list-disc list-inside text-gray-700 space-y-1">
		            <c:forEach var="option" items="${article.welfareOptions}">
		              <li>${option}</li>
		            </c:forEach>
		          </ul>
		        </c:when>
		        <c:otherwise>
		          <p class="text-gray-500 italic">지원 정보 없음</p>
		        </c:otherwise>
		      </c:choose>
		    </div>
		    <div>
		      <div class="font-semibold mb-1">복지 코멘트</div>
		      <p class="text-gray-800">${article.welfareComment != null ? article.welfareComment : "코멘트 없음"}</p>
		    </div>
		  </div>
		  <div class="border rounded-lg p-4 mb-6 bg-blue-50">
		    <div class="flex items-center justify-between mb-3">
		      <h3 class="font-bold text-xl text-blue-600">근무환경</h3>
		      <div class="flex items-center space-x-1 text-blue-500 text-2xl font-bold">
		        <span>★</span>
		        <span>${article.environmentScore}</span>
		      </div>
		    </div>
		    <div class="mb-3">
		      <div class="font-semibold mb-1">근무환경 코멘트</div>
		      <p class="text-gray-800">${article.commuteTimeComment != null ? article.environmentComment : "코멘트 없음"}</p>
		      <p class="text-gray-800">${article.environmentComment != null ? article.environmentComment : "코멘트 없음"}</p>
		    </div>
		  </div>
		<div class="container mx-auto">
			<div class="bg-white  flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<c:if test="${article.getMemberId() == req.getLoginedMember().getId() }">
					<div class="flex">
						<div class="mr-2"><a class="btn btn-neutral btn-outline btn-xs" href="modify?id=${article.getId() }">수정</a></div>
						<div><a class="btn btn-neutral btn-outline btn-xs" href="delete?id=${article.getId() }&boardId=${article.getBoardId() }" onclick="if(confirm('정말로 삭제하시겠습니까?') == false) return false;">삭제</a></div>
					</div>
				</c:if>
			</div>
		</div>
		</div>
	</section>
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>