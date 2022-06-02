<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

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
			<div class="panel-heading">상품 목록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>ProID</label> <input class="form-control" name="proID"
						value='${product.proID}' readonly="readonly">
				</div>
				<div class="form-group">
					<label>상품명</label> <input type="text" class="form-control"
						name="pname" value='${product.pname}' readonly="readonly">
				</div>
				<div class="form-group">
					<label>상품가격</label> <input type="text" class="form-control"
						name="unitprice" value='${product.unitprice}' readonly="readonly">
				</div>
				<div class="form-group">
					<label>재고량</label> <input type="text" class="form-control"
						name="stock" value='${product.stock}' readonly="readonly">
				</div>
				<div class="form-group">
					<label>카테고리</label> <input type="text" class="form-control"
						name="category" value='${product.category}' readonly="readonly">
				</div>
				<div class="form-group">
					<label>상품내용</label>
					<textarea class="form-control" name="content" rows="3"
						readonly="readonly">${product.content}</textarea>
				</div>
				<button class="btn btn-info"
					onclick="location.href='/product/modify?proID=${product.proID}'">Modify
				</button>
				<button class="btn btn-success"
					onclick="location.href='/product/list'">List</button>
				<button class="btn btn-warning" id="addCartBtn">Add Cart</button>
				<!-- /.table-responsive -->

			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
	<div class="panel panel-info">
		<div class="panel-heading">Attached File List</div>
		<div class="panel-body">
			<div class="form-group uploadResult">
				<img class="card-img-top"
					src="/display?fileName=${product.imageName }" alt="card image cap"
					width="100%">

			</div>
		</div>
	</div>
</div>

<!-- /.col-lg-6 -->
<div class="panel panel-default">
	<div class="panel-heading">
		<i class="fa fa-comments fa-fw"></i> Reply
		<button id="addReplyBtn">New Reply</button>
	</div>
	<div class="panel-body">
		<ul class="chat">
			<li class="left clearfix" data-rno="10">
				<div>
					<div class="header">
						<strong class="primary-font">user00</strong> <small
							class="pull-right text-muted">2021-05-18 13:13</small>
					</div>
					<p>Good job</p>
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- /.reply panel -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModallabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control" name='reply'
						value='New Reply!!' />
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name='replyer'
						value='New Replyer!!' />
				</div>
				<div class="form-group">
					<label>ReplyDate</label> <input class="form-control"
						name='replyDate' value='New Reply Date!!' />
				</div>
				<!--             //replyer, replyDate 를위한 div 배치 -->
			</div>
			<div class="modal-footer">
				<button id='modalRemoveBtn' type="button" class="btn btn-info">Remove</button>
				<button id='modalModBtn' type="button" class="btn btn-info">Modify</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-info">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-info">Close</button>
				<!--             id 가 modalRemoveBtn, modalRegisterBtn, modalCloseBtn 배치 -->
			</div>
		</div>
	</div>
</div>
<!-- /.modal fade -->

<!-- /.row -->
<script src="/resources/js/reply.js"></script>
<script src="/resources/js/cart.js"></script>
<script>
    /* $(document).ready(()=> {
        console.log(replyService);
    }); */
    const proIDValue = "<c:out value='${product.proID}'/>";
    /* replyService.add(
        {
            reply:"JS TEST",
            replyer:"js tester",
            proID:proIDValue
        },

        (result) => {
            alert("Result :" + result);
        }
    ); */

    /* replyService.remove(
        28,
        (count) => {
            console.log(count);
            if(count==="success"){
                alert("removed!");
            }
        },
        (err) => {
            alert("error occurred..")
        }
    ); */
    /* replyService.getList(
            {
                proID:proIDValue,
                page:1
            },
            (list) => {
                list.map((item) => {
                    console.log(item);
                })
            }

    );
    replyService.update(
        {
            rno:27,
            proID:proIDValue,
            reply:"Update Test",

        },
        (result) => {
            alert("수정완료");
        }
    ); */
    /* replyService.get(10,(data) => {
        console.log(data);
    }); */
    const replyUI = $(".chat");
    const showList = (page) => {
        //getList(parm1, callback);
        replyService.getList(
            {
                proID: proIDValue,
                page: page || 1
            },
            (list) => {
                if (list == null || list.length === 0) {
                    replyUI.html("");
                    return;
                }
                let str = list.reduce((acc, curr, idx) => {
                    acc += replyService.makeHtml(curr);
                    return acc;
                }, "");
                replyUI.html(str);
            }
        );
    }
    showList(1);
    const modal = $(".modal");
    const modalInputReply = modal.find("input[name='reply']");
    const modalInputReplyer = modal.find("input[name='replyer']");
    const modalInputReplyDate = modal.find("input[name='replyDate']");

    const modalModBtn = $("#modalModBtn");
    const modalRemoveBtn = $("#modalRemoveBtn");
    const modalRegisterBtn = $("#modalRegisterBtn");

    $("#addReplyBtn").on("click", (e) => {
        modal.find("input").val("");
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id!='modalCloseBtn']").hide();
        modalRegisterBtn.show();
        $(".modal").modal("show");
    });
    modalRegisterBtn.on("click", (e) => {
        let reply = {
            reply: modalInputReply.val(),
            replyer: modalInputReplyer.val(),
            proID: proIDValue
        };
        replyService.add(reply, (result) => {
            alert(result);
            modal.find("input").val("");
            $(".modal").modal("hide");
            showList(1);
        });
    })
    $(".chat").on("click", "li", function (e) {
        var rno = $(this).data("rno");
        console.log(rno);
        replyService.get(rno, (reply) => {
            modalInputReply.val(reply.reply);
            modalInputReplyer.val(reply.replyer);
            modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
            modal.data("rno", reply.rno);

            modal.find("button[id!='modalCloseBtn']").hide();
            modalModBtn.show();
            modalRemoveBtn.show();
            $(".modal").modal("show");
        });
    });
    modalModBtn.on("click", function (e) {
        var reply = {
            rno: modal.data("rno"),
            reply: modalInputReply.val(),
        };
        replyService.update(reply, function (result) {
            $(".modal").modal("hide");
            showList(1);
        });
    });
    modalRemoveBtn.on("click", function (e) {
        var rno = modal.data("rno");
        replyService.remove(rno, function (result) {
            console.log(result);
            $(".modal").modal("hide");
            showList(1);
        });
    });


    $(document).ready(() => {
        const uploadResult = $(".uploadResult ul");
        // showUploadedFile START
        function showUploadedFile(uploadResultArr) {
            let str = "";

            $(uploadResultArr).each(function (i, obj) {
                if (!obj.fileType) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                    str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'><div>";
                    str += "<span>" + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'  class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<img src='/resources/images/attach.jpg'></a>"
                    str += "</div></li>";
                } else {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                    let originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
                    originPath = originPath.replace(new RegExp(/\\/g), "/");  // 폴더 구분자인 경우 '/'로 통일
                    str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'><div>";
                    str += "<span>" + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'  class='btn btn-warning btn-circle'> <i class='fa fa-times'></i></button><br>";
                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
                    str += "</div></li>";
                }
            });

            uploadResult.append(str);
        } // showUploadedFile END

        const proID = "<c:out value='${product.proID}'/> ";
        $.getJSON("/product/getAttachList", {proID}, (arr) => {
            console.log(arr);
            showUploadedFile(arr);
        });
        // uploadResult 태그에 해당 데이터를 출력하기위한 함수
    })
	$("#addCartBtn").on("click", (e) => {
        console.log("click!");
        //var uID=sessionStorage.getItem('userID');
        cartService.get({
        	//userID : uID,
        	userID:'admin1',
        	proID:proIDValue
        },(result)=>{
        	console.log(result);
        	
        	if(!result){
        		console.log("Need add");
        		cartService.add({
        			//userID : uID,
                	userID:'admin1',
                	proID:proIDValue,
        			amount:1
        		},(res)=>{
        			alert("장바구니에 물건을 추가했습니다.");
        		});
        		 
        	 }else{
        		 var rCid=result.getElementsByTagName('cid')[0].textContent;
        		 var rAmount=Number(result.getElementsByTagName('amount')[0].textContent)+1;
        		 console.log(rCid);
        		 cartService.update({
        			//userID : uID,
                	userID:'admin1',
                	proID:proIDValue,
        			amount:rAmount,
        			cid:rCid
        		},(res)=>{
        			alert("장바구니에 물건을 추가했습니다.");
        		});
        	}
        	
        });
    });
    
</script>
<%@include file="../includes/footer.jsp"%>
