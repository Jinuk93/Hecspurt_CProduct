<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Product Modify Page</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           ${product.proID }번 상품
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form role = "form" action = "/product/modify" method = "post">
                            	
                            	<div class = "form-group">
                                	<label>상품번호</label><input class = "form-control" name = 'proID'value = '<c:out value = "${product.proID }"/>' readonly = "readonly">
                                </div>
                                <div class = "form-group">
                                	<label>상품이름</label><input class = "form-control" name = 'pname' value = '<c:out value = "${product.pname }"/>'>
                                </div>
                                <div class = "form-group">
                                	<label>상품가격</label><input class = "form-control" name = 'unitprice' value = '<c:out value = "${product.unitprice }"/>'>
                                </div>
                                <div class = "form-group">
                                	<label>상품재고</label><input class = "form-control" name = 'stock' value = '<c:out value = "${product.stock }"/>'>
                                </div>
                                <div class = "form-group">
                                	<label>카테고리</label><input class = "form-control" name = 'category' value = '<c:out value = "${product.category }"/>'>
                                </div>
                                <div class = "form-group">
                                	<label>상품내용</label><textarea class = "form-control" rows = "10" name = 'content'  >${product.content }</textarea>
                                </div>
                                <div class = "form-group">
                                	<label>RegDate</label><input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${product.regDate}"/>' readonly="readonly"/>
                                </div>
                                <div class = "form-group">
                                	<label>UpdateDate</label><input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${product.updateDate}"/>' readonly="readonly"/>
                                </div>
                                <div class="form-group">
			                        <label>이미지</label> <img class="card-img-top"
										src="/display?fileName=${product.imageName }"
										alt="card image cap" width="100%">		                
			                        
			                    </div>
								<button type = "submit" data-oper = 'modify'class ="btn btn-info">modify</button>
								<button type = "submit" data-oper = 'remove'class ="btn btn-danger">remove</button>								
								<button type = "submit" data-oper = 'list'class ="btn btn-success">list</button>
                            </form>
                            <!-- /.table-responsive -->
                          
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
	$(document).ready(function(){
	var formObj = $("form");
	$('button').on("click", function(e){
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		if(operation === 'remove'){
			formObj.attr("action", "/product/remove");
		}else if(operation === 'list'){
			self.location = "/product/list";
			return;
		}
		formObj.submit();
		});
	});
</script>
 <%@include file="../includes/footer.jsp" %>       