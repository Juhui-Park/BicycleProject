<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예상 소요시간</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="include/style2.css">
</head>
<body>
	<div class="container">
		<h1>예상 소요시간</h1>
		<img src="include/image/1_result.png" alt="1"><br>
		<h3>"${text_search_rental }"로 부터 "${text_search_return }"까지의 거리의</h3>
		<div class="group1">
			<c:choose>
				<c:when test="${time eq null }">
					<p>이용한 정보가 없어 예상할 수 없어요ㅠㅠ</p>
				</c:when>
				<c:when test="${time ne null }">
					<h1>예상시간은 ${time}분 입니다.</h1><br>
				</c:when>
			</c:choose>
		</div>

		<div>
			<input type="button" value="처음으로 돌아가기"
				style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
				onclick="location.href='/';"> <input type="button"
				value="뒤로가기"
				style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
				onclick="history.go(-1);">
		</div>
	</div>
</body>
</html>