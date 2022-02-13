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

	<form action="/main.do" method="post">
		<div class="group">
			<h1>예상 소요시간은?</h1>
			<br> <br>
			<h5>출발지와 목적지를 입력해 주세요</h5>
			<br> <br> <img src="include/image/1_main.png" alt="1"><br>
			<h1>출발지</h1>
			<div class="select">
				<input type="text" name="text_search_rental" list="startList"
					class="form-control">
				<datalist id="startList">
					<c:forEach var="list" items="${startList }">
						<option value="${list.rentalOfficeName }">
					</c:forEach>
				</datalist>
			</div>
		</div>

		<div class="group">
			<h1>목적지</h1>
			<div class="select">
				<input type="text" name="text_search_return" list="startList"
					class="form-control">
				<datalist id="startList">
					<c:forEach var="list" items="${startList }">
						<option value="${list.returnOfficeName }">
					</c:forEach>
				</datalist>
			</div>
		</div>
		<input type="submit" value="검색" id="btn"
			style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;">
		<input type="button" value="뒤로" id="btn"
			style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
			onclick="history.go(-1);">

	</form>

</body>
</html>