<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘내일할 것 같은 정류장</title>
<link rel="stylesheet" href="include/layout.css">
<link rel="stylesheet" href="include/style2.css">
<style>
.main_txt {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 0%);
}

.title_txt {
	text-align: center;
}
</style>
</head>

<body>
	<div class="title_txt">
		<p>
		<h1>오늘내일할 것 같은 정류장</h1>
		<br> <img src="include/image/5_main.png" alt="5" />
	</div>
	<div class="main_txt">
		<section id="content">
			<c:forEach var="list" items="${closeOfficeList }">
			${list }<br>
			</c:forEach>
		</section>
		<div class="title_txt">
		<br> <input type="button" value="뒤로가기"
				style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
				onclick="history.go(-1);">
				</div>
	</div>
	
</body>
</html>