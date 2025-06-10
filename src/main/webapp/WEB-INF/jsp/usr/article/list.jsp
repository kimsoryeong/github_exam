<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() } 게시판" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto max-w-5xl border-4 border-red-500">
			<div class="ml-8 mb-2">
				<div><span>${board.getName() } 게시판</span></div>
				<div><span>총 : ${articlesCnt }개</span></div>
			</div>
				<div class="border-4 border-green-800">
					<div class="text-right">
					<form action="/"  method="get">
						<select name="searchType">
							<option selected value="">선택</option>
							<option value="institution">제목</option>
							<option value="content">내용</option>
							<option value="institution+content">제목+내용</option>
						</select>
						<input type="text" name="keyword" id="keyword">
						<button class="btn btn-neutral btn-outline btn-sm" type="submit">검색</button>
					</form>
					</div>
				</div>
			</div>	
			<div class="max-w-5xl flex mx-auto border-4 border-yellow-500">
				<div class="h-100 w-1/5 border-4 border-pink-500">
					<div class="font-bold mt-5 mb-5 ml-2"><span>${board.getName() }</span></div>
					<c:if test="${board.id == 1}">
					<div class="text-sm ml-2">
						<div class="mb-2"><a href="/usr/article/list?boardId=7">유치원 정보</a></div>
						<div class="mb-2"><a href="/usr/article/list?boardId=8">어린이집 정보</a></div>
					</div>
					</c:if>
					<c:if test="${board.id == 2}">
					<div class="text-sm ml-2">
						<div class="mb-2"><a href="/usr/article/list?boardId=4">근무후기</a></div>
						<div class="mb-2"><a href="/usr/article/list?boardId=5">면접후기</a></div>
						<div class="mb-2"><a href="/usr/article/list?boardId=6">실습 및 봉사후기</a></div>
					</div>
					</c:if>
				</div>
				<div class="w-4/5 border-4 border-black mx-auto" >
					<div class="border-4 border-pink-200">
						<div class="pr-10 pl-10 pt-4 pb-4 ">
							 <div class="font-bold pb-4">지역별 기관찾기</div>
								<form method="get" action="/usr/article/list">
								    <input type="hidden" name="boardId" value="${board.id}" />
								   	 <select id="city" onchange="updateDistricts()" style ="height:40px; width: 35%; border-radius: 5px;"class="select" name="city-select">
									    <option class ="text-center h-40" value="" disabled selected>-- 시/도 선택 --</option>
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
								     
								    <button type="submit" class="btn  btn-s">조회</button>
								</form>
							</div>
						</div>
						   <div class="p-4 border-b">
						      <div class="flex justify-between items-center">
							  </div>
							  <c:forEach items="${articles }" var="article">
							    <span class="hover:underline underline-offset-4 font-bold text-lg text-[#333]"><a href="detail?id=${article.getId() }">${article.getInstitutionName() }</a></span>
							    <span class="text-yellow-500 font-bold">★ ${article.getStar() }</span>
	    						<div class="text-sm text-gray-600 mt-3 mb-3">“${article.getContent() }”</div>
							  </c:forEach>
							</div>
						</div>
					</div>
			<div class="max-w-5xl mx-auto border-4 border-green-500">
 			<c:if test="${req.getLoginedMember().getId() != 0 }">
				<c:choose>
					<c:when test="${req.getLoginedMember().getAuthLevel() == 0 }">
						<div class="bg-white px-6 pt-6">
							<div class="text-right"><a class="btn btn-neutral btn-outline btn-xs" href="/usr/article/mainWrite?boardId=${board.getId()}">글쓰기</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${board.getId() != 1 }">
							<div class="bg-white px-6 pt-6">
								<div class="text-right "><a class="btn btn-neutral btn-outline btn-xs" href="/usr/article/mainWrite?boardId=${board.getId()}">글쓰기</a>
								</div>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:if>
			</div>
			<div class="flex justify-center mb-8 mt-4">
				<div class="join">
					<c:set var="queryString" value="?boardId=${board.getId() }" />
					<c:if test="${begin != 1 }">
						<a class="join-item btn btn-sm" href="${queryString }&cPage=1"><i class="fa-solid fa-angles-left"></i></a>
						<a class="join-item btn btn-sm" href="${queryString }&cPage=${begin - 1 }"><i class="fa-solid fa-caret-left"></i></a>
					</c:if>
					<c:forEach begin="${begin }" end="${end }" var="i">
						<a class="join-item btn-sm btn ${cPage == i ? 'btn-active' : '' }" href="${queryString }&cPage=${i }">${i }</a>
					</c:forEach>
					<c:if test="${end != totalPagesCnt }">
						<a class="join-item btn btn-sm" href="${queryString }&cPage=${end + 1 }"><i class="fa-solid fa-caret-right"></i></a>
						<a class="join-item btn btn-sm" href="${queryString }&cPage=${totalPagesCnt }"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>
	</section>
	
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>