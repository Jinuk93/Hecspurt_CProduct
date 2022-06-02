<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
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
                <form role="form" action="/product/register2" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>상품명</label> <input type="text" class="form-control" name="pname">
                    </div>
                    <div class="form-group">
                        <label>상품가격</label> <input type="text" class="form-control" name="unitprice">
                    </div>
                    <div class="form-group">
                        <label>재고량</label> <input type="text" class="form-control" name="stock">
                    </div>
                    <div class="form-group">
                        <label>카테고리</label> <input type="text" class="form-control" name="category">
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
