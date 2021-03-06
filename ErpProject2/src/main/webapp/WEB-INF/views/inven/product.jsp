<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<section class="container mt-3">
	<form method="get" action="search.product" class="form-inline mt-3">
		<select name ="searchProduct" class="form-control mx-1 mt-2">
			<option value="pro_no">제품코드</option>
			<option value="pro_name">제품명</option>
		</select>
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">
		<button type="submit" class="btn btn-success mx-1 mt-2">검색</button>
		<a class="btn btn-dark mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a> 
		<a class="btn btn-dark mx-1 mt-2" data-toggle="modal" href="#detailModal" hidden="">상세보기</a> 
	</form>
	
	<div class="container mt-4">
		<h2>제품관리</h2>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>규격</th>
					<th>무게</th>
					<th>구매단가</th>
					<th>판매단가</th>
					<th>비고</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${products }">
				<tbody>
					<tr onclick="getDetailProduct('${i.pro_no }','${i.pro_name }','${i.pro_unit }','${i.pro_weight }','${i.pro_buy }','${i.pro_sell }','${i.pro_hscode }','${i.pro_note }')">
						<td align="center"><input type="checkbox" class="checked" value="${i.pro_no }" ></td>
						<td align="center">${i.pro_no }</td>
						<td align="center">${i.pro_name }</td>
						<td align="center">${i.pro_unit }</td>
						<td align="center">${i.pro_weight }</td>
						<td align="center"><fmt:formatNumber value="${i.pro_buy }" pattern="#,###" /></td>
						<td align="center"><fmt:formatNumber value="${i.pro_sell }" pattern="#,###" /></td>
						<td align="center">${i.pro_note }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		
		<nav aria-label="Page navigation">
			  <ul class="pagination">
			   <li class="page-item">
				   	<c:if test="${curPage != 1 && curPage != null}">
						<a href="Productpage.change?p=${curPage-1 }" class="page-link">Previous</a>
					</c:if>
				</li>
			    <c:forEach var="z" begin="1" end="${pageCount }">
			    	<li class="page-item"><a class="page-link" href="Productpage.change?p=${z }">${z }</a></li>
			    </c:forEach>  
			    <li class="page-item">
			    <c:if test="${curPage != pageCount }">
					<a href="Productpage.change?p=${curPage+1 }" class="page-link">Next</a>
				</c:if>
			    </li>
			  </ul>
		</nav>
		
	</div>
</section>	
	
	<!-- 등록하기 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">품목등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>		
				<div class="modal-body">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
                    	<li class="nav-item">
                           <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#product-necessary" role="tab" aria-controls="home" aria-selected="true">필수 항목</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#product-detail" role="tab" aria-controls="profile" aria-selected="false">상세 등록</a>
                        </li>
                	</ul>
					<form action="reg.product" method="post">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="product-necessary" role="tabpanel" aria-labelledby="profile-tab">
								<div class="form-group">
									<label>제품코드</label>
									<input type="text" name="pro_no" class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>제품명</label>
									<input type="text" name="pro_name" class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>규격</label>
									<input type="text" name="pro_unit" class="form-control" maxlength="30">
								</div>
								
								<div class="form-group">
									<label>구매단가</label>
									<input type="text" name="pro_buy" class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>판매단가</label>
									<input type="text" name="pro_sell" class="form-control" maxlength="30">
								</div>
								</div>
							<div class="tab-pane fade" id="product-detail" role="tabpanel" aria-labelledby="profile-tab2">
								<div class="form-group">
									<label>무게</label>
									<input type="text" name="pro_weight" class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>HS CODE</label>
									<input type="text" name="pro_hscode" class="form-control" maxlength="30">
								</div>
								<div class="form-group">
									<label>비고</label>
									<textarea name="pro_note" class="form-control" maxlength="2048" style="height:180px;"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>		
			</div>
		</div>
	</div>
	
	<!-- 상세페이지 -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">상세보기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>		
				<div class="modal-body">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
                    	<li class="nav-item">
                           <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#product-necessary2" role="tab" aria-controls="home" aria-selected="true">필수 항목</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#product-detail2" role="tab" aria-controls="profile" aria-selected="false">상세 등록</a>
                        </li>
                	</ul>
                	
					<form action="update.product" method="post">
						<div class="tab-content profile-tab" id="myTabContent">
							<div class="tab-pane fade show active" id="product-necessary2" role="tabpanel" aria-labelledby="profile-tab">
								<div class="form-group">
									<label>제품코드</label>
									<input type="text" name="pro_no" class="form-control" maxlength="30" id="d_no" readonly="readonly">
								</div>
								<div class="form-group">
									<label>제품명</label>
									<input type="text" name="pro_name" class="form-control" maxlength="30" id="d_name">
								</div>
								<div class="form-group">
									<label>규격</label>
									<input type="text" name="pro_unit" class="form-control" maxlength="30" id="d_unit">
								</div>
									<div class="form-group">
									<label>구매단가</label>
									<input type="text" name="pro_buy" class="form-control" maxlength="30" id="d_buy">
								</div>
								<div class="form-group">
									<label>판매단가</label>
									<input type="text" name="pro_sell" class="form-control" maxlength="30" id="d_sell">
								</div>
							</div>
							<div class="tab-pane fade" id="product-detail2" role="tabpanel" aria-labelledby="profile-tab2">
								<div class="form-group">
									<label>무게</label>
									<input type="text" name="pro_weight" class="form-control" maxlength="30" id="d_weight">
								</div>
								<div class="form-group">
									<label>HS CODE</label>
									<input type="text" name="pro_hscode" class="form-control" maxlength="30" id="d_hscode">
								</div>
								<div class="form-group">
									<label>비고</label>
									<textarea name="pro_note" class="form-control" maxlength="2048" style="height:180px;" id="d_note"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteProduct(pro_no)">삭제</button>
							<button type="submit" class="btn btn-primary">수정</button>
						</div>
					</form>
				</div>		
			</div>
		</div>
	</div>
	

</body>
</html>