<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTmall | 감도 깊은 취향 셀렉트샵 HTmall</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
<div id="headerHeader">

< 	<div id="headerSection">
		<jsp:include page="main/header.jsp"/>
	</div>
	
 	<div id="bodySection">
		<c:if test="${empty display }">
			<jsp:include page="main/body.jsp"/>
		</c:if>
	    <c:if test="${not empty display }">
	        <jsp:include page="${display }"/>
	    </c:if>
	</div>
</div>
</script>
</body>
<footer>
	<jsp:include page="main/footer.jsp" />
</footer>
</html>