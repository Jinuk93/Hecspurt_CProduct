<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<script src="/resources/js/cart.js"></script>  
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
                                        <th>사진</th>
                                        <th>상품이름</th>
                                        <th>금액</th>
                                        <th>개수</th>
                                    </tr>
                                </thead>
                                <tbody id = 'cartList'>

                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                          	
                          	
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
                        <div class="panel panel-red">
                        	<div class="panel-heading" id="fullPrice">
                        		
                        	</div>
                        	<div class="panel-body">
                        		
                        	</div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
   
<script type="text/javascript">
	$(document).ready(function(){
		//var userId=sessionStorage.getItem('userID');
		var userId='admin1';
		var cartList=$('#cartList');
		var priceTag=$('#fullPrice');
		showList();

		function showList(){
			cartService.getList(userId,
					function(list){
				var str="";
				var fullPrice=0;
				console.log("getList");
				if(list == null || list.length ==0){
					console.log("no data");
					cartList.html("");
					return;
				}
				for(var i=0, len=list.length||0;i<len;i++){
					var amount=Number(list[i].amount);				
					cartService.getPro(list[i].proID,function(pro){
						var str1="";
						var unitPrice=Number(pro.unitprice)
						var price=unitPrice*amount;
						fullPrice+=price;
						str1+="<tr>"
						str1+="<td><img src='/display?fileName="+pro.imageName+"' alt='No Image'/></td>";
						str1+="<td><p>"+pro.pname+"</p></td>";
						str1+="<td><p>"+price+"</p></td>";
						str1+="<td><p>"+amount+"</p></td>";
						str1+="</tr>";
						cartList.append(str1);
						priceTag.html("<p>총 계 : "+fullPrice+"원</p>");
					});
					
				}
				console.log(priceTag);
				console.log(fullPrice);
				
				priceTag.append("총계 : "+fullPrice+"원");
			});
		}
	});
	
	
</script>

            
 <%@include file="../includes/footer.jsp" %>       