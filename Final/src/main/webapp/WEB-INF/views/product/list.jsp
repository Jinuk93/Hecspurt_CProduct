<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Product List Page</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            상품 목록
                           <button id = "regBtn" type ="button" class= "btn btn-xs pull-right">상품등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>상품이름</th>
                                        <th>가격</th>
                                        <th>재고</th>
                                        <th>카테고리</th>
                                        <th>상품내용</th>
                                        <th>등록날짜</th>
                                        <th>수정날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <c:forEach items = "${list }" var = "product">
                                    <tr class="odd gradeX" id = "">
                                        <td >${product.proID } </td>
                                        <td><a href = "/product/get?proID=${product.proID }">${product.pname }</a></td>
                                        <td>${product.unitprice }</td>
                                        <td>${product.stock }</td>
                                        <td>${product.category }</td>
                                        <td>${product.content }</td>
                                        <td class="center">${product.regDate }</td>
                                        <td class="center">${product.updateDate }</td>
                                    </tr>
                                   </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                          	
                          	 <div class = 'row'>
                          		<div class = "col-lg-12">
                          			
                          			<form id='searchForm' action="/product/list" method="get">
				                      <select class="form-group" name="type">
				                         <option value=""<c:out value="${criteria.type==null?'selected':''}"/>>--</option>
				                           <option value="T"<c:out value="${criteria.type eq 'T'?'selected':''}"/>>제목</option>
				                         <option value="TC"<c:out value="${criteria.type eq 'TC'?'selected':''}"/>>제목 OR 내용</option>
				                      </select>
				                      <input type="text" class="form-control" name='keyword' value='<c:out value="${criteria.keyword}"/>'>
				                      <span class="input-group-btn">
				                         <button class="btn btn-info" type="button"></button>
				                      </span>
				                   </form>
                          		</div>
                          	</div> 
                          	
                          	
                            <!-- /.modal fade -->
                          	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
							   <div class="modal-dialog">
							       <div class="modal-content">
							           <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
							           </div>
							           <div class="modal-body">처리가 완료되었습니다.</div>
							           <div class="modal-footer">
							                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							                <button type="button" class="btn btn-default" >Save Changes</button>
							           </div>
							      </div>
							   </div>
							</div> 
					        <!-- /.modal fade -->
                          
                          
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            
            
<script type="text/javascript">
	$(document).ready(() => {
		let result = '<c:out value="${result}"/>';
		//모달 보여주기 추가
		const checkModal = (result) => {
			if(result===""){
				return;
			}
			if(parseInt(result)>0){
				$(".modal-body").html("상품" + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}

		checkModal(result);
	});
	
	
	$("#regBtn").on("click",() => {
		self.location = "/product/register";
	});
	
	
	
	 var searchForm = $("#searchForm");
	$("#searchForm button").on("click", function(e){
		if(!searchForm.find("option.selectd").val()){
		alert("검색종류를 선택하세요");
	}
	if(!searchForm.find("input[name-'keyword']").val()){
		alert("키워드를 입력하세요");
	}
	e.preventDefault();
	searchForm.submit();
	}); 
	
	
</script>

            
 <%@include file="../includes/footer.jsp" %>       