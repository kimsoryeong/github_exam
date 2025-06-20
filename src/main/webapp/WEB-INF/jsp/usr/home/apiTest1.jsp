<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


	<script>
		const api_key = 'TYVGBMLA-TYVG-TYVG-TYVG-TYVGBMLAF1';
		const url = 'http://e-childschoolinfo.moe.go.kr/openApi/openApiIntro.do?pageName=openApiIntro4';
		
		const apiTest = function (){
			$.ajax({
				url: url,
				type: 'GET',
				data: {
					
				},
				dataType: 'XML',
				success: function (data){
					console.log(data);
				},
				error: function (xhr, status, error) {
					console.log(error);
				}
			})
		}
		
		apiTest();
	
	</script>
	
	<section class="mt-8">
		<div class="container mx-auto">
			<div>api test 페이지</div>
			<div id="apiTest"></div>
		</div>
	</section>


	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>