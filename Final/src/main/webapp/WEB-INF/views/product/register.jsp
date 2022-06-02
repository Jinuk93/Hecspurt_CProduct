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
                <form role="form" action="/product/register" method="post">
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
                    <button type="submit" class="btn btn-default">Submit</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </form>
                <!-- /.table-responsive -->


                <!-- /.table-responsive -->

                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">File Attach</div>
            <div class="panel-body">
                <div class="form-group uploadDiv">
                    <input type="file" name='uploadFile' multiple>
                </div>
                <div class="form-group uploadResult">
                    <ul></ul>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-lg-6 -->

</div>
<!-- /.row -->
<script type="text/javascript">
    var formObj = $("form[role='form']");
    $(document).ready(function () {


        $("button[type='submit']").on("click", function (e) {
            e.preventDefault();
            console.log("submit clicked");
        }); // submit button event


        $("input[type='file']").change(function (e) {
            const formData = new FormData();
            const inputFile = $("input[name='uploadFile']");
            const files = inputFile[0].files;

            // 업로드 전에 <input type='file'> 객체가 포함된 <div> 복사
            const cloneObj = $(".uploadDiv").clone();
            // console.log(files);


            // 업로드 결과를 보기위해
            const uploadResult = $(".uploadResult ul");

            function showUploadedFile(uploadResultArr) {

                let str = "";
                // $(uploadResultArr).each(function (i, obj){
                // 	// 이미지가 아닐 경우
                // 	if (!obj.fileType) {
                // 		let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                //
                // 		str += "<li><div>";
                // 		str += "<span>" + obj.fileName + "</span>";
                // 		str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                // 		str += "<img src='/resources/images/attach.jpg'></a>";
                // 		str += "</div></li>";
                //
                // 		// str += "<li><div><a href='/download?fileName=" + fileCallPath
                // 		// 		+ "'><img src='/resources/images/attach.jpg'>" + obj.fileName + "</a>"
                // 		// 		+ "<span data-file=\'" + fileCallPath + "\' data-type='file'>x</span></div></li>";
                //
                // 		// 이미지일 경우
                // 	} else {
                // 		// 한글처리
                // 		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                // 		let originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
                // 		originPath = originPath.replace(new RegExp(/\\/g), "/");  // 폴더 구분자인 경우 '/'로 통일
                //
                // 		str += "<li><div>";
                // 		str += "<span>" + obj.fileName + "</span>";
                // 		str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                // 		str += "<img src='/display?fileName=" + fileCallPath + "'>";
                // 		str += "</div></li>";
                //
                //
                // 		// str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>"
                // 		// 		+ "<span data-file='" + fileCallPath + "\' data-type='image'>x</span></li>";
                // 	}
                // });

                $(uploadResultArr).each(function (i, obj) {
                    if (!obj.fileType) {
                        var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'><div>";
                        str += "<span>" + obj.fileName + "</span>";
                        str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'  class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                        str += "<img src='/resources/images/attach.png'></a>"
                        str += "</div></li>";
                    } else {
                        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'><div>";
                        str += "<span>" + obj.fileName + "</span>";
                        str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'  class='btn btn-warning btn-circle'> <i class='fa fa-times'></i></button><br>";
                        str += "<img src='/display?fileName=" + fileCallPath + "'>";
                        str += "</div></li>";
                    }

                });

                uploadResult.append(str);
            } // showUploadedFile END


            // 업로드 파일 유효성 검사
            const regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            const maxSize = 5242880;

            function checkExtension(fileName, fileSize) {
                if (fileSize >= maxSize) {
                    alert("파일 크기 초과");
                    return false;
                }
                if (regex.test(fileName)) {
                    alert("해당 종류의 파일은 업로드 할 수 없음");
                    return false;
                }
                return true;
            } // checkExtension END

            // 사용자가 입력한 업로드 파일 유효성 검사 및 파일 추가
            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            } // 사용자가 입력한 업로드 파일 유효성 검사 및 파일 추가 END

            console.log("files.length: " + files.length);

            alert(formData);
            console.log(formData);
            
            // 파일 업로드
            $.ajax({
                url: "/uploadAjaxAction",
                processData: false, // 전달할 데이터 query string 을 만들지 말 것
                contentType: false,
                data: formData,     // 전달할 데이터
                type: "POST",
                dataType: 'json',   // 받을 데이터 형식
                success: function (result) {
                    console.log(result);
                    showUploadedFile(result);
                    $(".uploadDiv").html(cloneObj.html());
                },
            }); // $.ajax END

        });


        // X 그림 누르면 해당 파일 삭제
        $(".uploadResult").on("click", "button", function (e) {
            let targetFile = $(this).data("file");
            let type = $(this).data("type");
            let targetLi = $(this).closest("li");
            // console.log(targetFile);

            $.ajax({
                url: '/deleteFile',
                data: {fileName: targetFile, type: type},
                dataType: 'text',
                type: 'post',
                success: function (result) {
                    alert(result);
                    targetLi.remove();
                },
            }); // ajax END

        }); // uploadResult END

        $(".bigPictureWrapper").on("click", function (e) {
            $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
            setTimeout(function () {
                $('.bigPictureWrapper').hide();
            }, 1000);
        }); // bigPictureWrapper END

    });

    function showImage(fileCallPath) {
        // alert(fileCallPath);
        $(".bigPictureWrapper").css("display", "flex").show();
        $(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
            .animate({width: '100%', height: '100%'}, 1000);
    } // showImage END

    $("button[type='submit']").on("click", function (e) {
        e.preventDefault();
        console.log("submit clicked");

        let str = "";
        $(".uploadResult ul li").each(function (i, obj) {
            let jobj = $(obj);
            console.dir(jobj);
            str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
        });
        formObj.append(str).submit();

    }); // submit button event
</script>

<%@include file="../includes/footer.jsp" %>
