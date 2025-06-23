<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<script>
		const api_key = 'SM69Y0vg2XMMU/gdP86ol+V+A4TF/OlorBAuweSvglYR4xIFFajCJFjME/Xud2UymFZDOe4oxcqXqOFhOJ7HKw==';
		const url = 'https://apis.data.go.kr/6300000/openapi2022/kinderschInfo/getkinderschInfo';
		
		const apiTest = function (){
			$.ajax({
				url: url,
				type: 'GET',
				data: {
					serviceKey: api_key ,
					gu: 'A',
					pageNo: 1,
					numOfRows: 1000 
				},
				dataType: 'json',
				success: function (data){
					
					let a = data.response.body.items;
					
					for(idx in a){
						let item = a[idx]; 
					    let name = item.kndrgrNm;
					    let city = item.signgu;
					    let addr = item.locpic;
					    let tel = item.telno;
						
					}
					
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
			
		</div>
	</section>


	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>