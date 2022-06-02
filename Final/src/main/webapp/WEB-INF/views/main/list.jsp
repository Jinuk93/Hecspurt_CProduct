<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">List Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				제품 리스트
				<button id="regBtn" type="button"
					class="btn btn-xs btn-info pull-right ">글쓰기</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class='card-deck'>
				
				
					<c:forEach items="${list }" var="product">
						<div class='col-lg-3'>
							<div class='panel-success panel'
								onclick='window.location.href = "/product/get?proID=${product.proID }"'>
								<!-- 이미지 -->
								<div class="panel-heading">
									<!-- <img class="card-img-top" src="/resources/image/notFound.png" alt="card image cap" width="100%"> -->
									<img class="card-img-top"
										src="/display?fileName=${product.imageName }"
										alt="card image cap" width="100%">
								</div>
								<div class="panel-body">
									<h5 class="card-title">${product.pname}</h5>
									<p>${product.content}</p>
								</div>
								<div class="panel-footer">
									<h6 class="card-subtitle text-right">${product.unitprice}</h6>
								</div>
							</div>
						</div>
					</c:forEach>
					
					
				</div>
				<!-- /.table-responsive -->
				<div class="row">
					<div class="col-lg-12">
						<form id='searchForm' action="/board/list" method="get">
							<select class="form-group" name="type">
								<option value=""
									<c:out value="${criteria.type==null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${criteria.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${criteria.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${criteria.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${criteria.type eq 'TC'?'selected':''}"/>>제목
									OR 내용</option>
								<option value="TW"
									<c:out value="${criteria.type eq 'TW'?'selected':''}"/>>제목OR작성자</option>
								<option value="TCW"
									<c:out value="${criteria.type eq 'TCW'?'selected':''}"/>>제목
									OR 내용 OR 작성자</option>

							</select> <input type="text" class="form-control" name='keyword'
								value='<c:out value="${criteria.keyword}"/>'> <span
								class="input-group-btn">
								<button class="btn btn-info" type="button">검색</button>
							</span>
						</form>
					</div>
				</div>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModallabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-default">Save
									Changes</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.modal fade -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#regBtn").on("click", function() {
			self.location = "/product/register2";
		})
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색 종류를 선택하세요");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			e.preventDefault();
			searchForm.submit();

		})
		

	
	});
	
	
</script>

<%@include file="../includes/footer.jsp"%>
