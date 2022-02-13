<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점검이 필요한 자전거 결과</title>
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
		<h1>점검이 필요한 자전거</h1>
		<br> <img src="include/image/2_result.png" alt="2" />
		<br> <br>
		<input type="button" value="처음으로 돌아가기"
			style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
			onclick="location.href='/';"> <input type="button"
			value="뒤로가기"
			style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
			onclick="history.go(-1);">
	</div>
	<div class="main_txt">
		<table>
			<tr>
				<td bgcolor="#BDBDBD">자전거ID</td>
				<td bgcolor="#BDBDBD">마지막역</td>
			</tr>
			<c:forEach var="list" items="${repair }">
				<tr>
					<td>${list.bicycleId }</td>
					<td>${list.returnOfficeName }</td>
				</tr>
			</c:forEach>
		</table>
		<br> 
	</div>

</body>
</html>