<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>

<script type="text/javascript">
/* function checkAll() {
	        if (!checkpname(form.pname.value)) {
		return false;
		}else if(!checkunitprice(form.unitprice.value)) {
			return false;
		} else if (!checkstock(form.stock.value)) {
			return false;
		} else if (!checkcategory(form.category.value)) {
			return false;
		}  return true;
    }

 function checkpname(pname) {
	//Id가 입력되었는지 확인하기  
	if (!checkExistData(pname, "pname"))
	    return false;
} */
window.onload = function(){
	document.querySelector('#registerform').onsubmit = function(){
		var pname = document.querySelector('#pname');
		var unitprice = document.querySelector('#unitprice');
		var stock = document.querySelector('#stock');
		var category = document.querySelector('#category');
		// 유효성 검사 1: 공백이 없어야 한다.
		if(pname.value.trim().length < 1){
			alert ('상품명은 필수 항목입니다.');
			pname.value='';
			pname.focus();
			//커서를 userid로 이동시키는 함수
			return false;
			}
		if(unitprice.value.trim().length<1){
			alert('상품가격은 필수 항목입니다.');
			unitprice.value='';
			unitprice.focus();
			return false;
			}
		// pw == pwcheck 이어야 한다.
		if(stock.value.trim().length<1 ){
			alert('재고량을 입력해주세요.');
			stock.value='';
			stock.focus();
			return false;
			}
		if(category.value.trim().length<1){
			alert('카테고리 항목은 필수항목입니다.');
			category.value='';
			category.focus();
			return false;
			}
		};
		};

</script>



<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Product Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">상품 등록</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form id = "registerform" role="form" action="/product/register2" method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                        <label for ="pname">상품명</label> <input type="text" class="form-control" name="pname" id = "pname">
                    </div>
                    <div class="form-group">
                        <label>상품가격</label> <input type="number" class="form-control" name="unitprice" id = "unitprice">
                    </div>
                    <div class="form-group">
                        <label>재고량</label> <input type="number" class="form-control" name="stock" id = "stock">
                    </div>
                    <div class="form-group">
                        <label>카테고리</label> <input type="text" class="form-control" name="category" id = "category">
                    </div>
                    <div class="form-group">
                        <label>상품내용</label>
                        <textarea class="form-control" name="content" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>이미지</label> <input type="file" class="form-control" name="file">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </form>
                <!-- /.table-responsive -->


                <!-- /.table-responsive -->

                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        
    </div>
    <!-- /.col-lg-6 -->

</div>
<!-- /.row -->



<%@include file="../includes/footer.jsp" %>
