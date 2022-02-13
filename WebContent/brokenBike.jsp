<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점검이 필요한 자전거</title>
<link rel="stylesheet" href="include/style2.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="/brokenBike.do" method="post">
		<div class="group">
			<h1>점검이 필요한 자전거</h1>
			<h5>점검대상의 주행거리를 입력해 주세요.</h5><br>
			<img src="include/image/2_main.png" alt="2"><br>
			<input type="text" name="textMeter" id="input"> 미터(m)<br>  <br> <br>
			<input type="submit" value="입력" style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;" id="btn">
			<input type="button" value="뒤로" id="btn" style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;" onclick="location.href='/';">
		</div>
		
	</form>
</body>
</html>