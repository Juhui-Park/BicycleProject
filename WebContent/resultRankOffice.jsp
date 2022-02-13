<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탑10 결과</title>
<link rel="stylesheet" href="include/style2.css">
</head>
<style>
.title_txt {
	text-align: center;
}

.main_txt {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<body>
	<div class="title_txt">
		<div class="main_txt">
			<h1>인기순위 Top10!</h1>
			<img src="include/image/4_crown.png" alt="5"><br>
			<c:forEach var="list" items="${rank }" varStatus="status" begin="0"
				end="11" step="1">
			${status.count} : ${list }<br>
			</c:forEach>
			<br> <input type="button" value="뒤로가기"
				style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
				onclick="history.go(-1);">
		</div>
	</div>

</body>
</html>