<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 코스</title>
<link rel="stylesheet" href="include/style2.css">
<style>
.main_txt {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}
</style>
</head>
<body>
<form action="/resultRecommend.do" method="post">
	<div class="group">
	<h1>추천 코스</h1>
	<br> <br>
		출발지와 예상라이딩시간을 알려주세요.<br> 갈수있는 정류장을 출력합니다:)<br> 
		<img src="include/image/3_main.png" alt="3" />
		<br> <br>
			출발지:<input type="text" name="textRecommend" list="startList"><br>
			<datalist id="startList">
				<c:forEach var="list" items="${startList }">
					<option value="${list.rentalOfficeName }">
				</c:forEach>
			</datalist>
			<br> 예상 라이딩 시간(분) : <input type="number" name="time"> <br> <br>
			<input type="submit" value="입력" style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;">
			<input type="button" value="뒤로" id="btn"
			style="color: #fff; background: black; font-size: 2em; border-radius: 0.5em; padding: 5px 20px;"
			onclick="location.href='/';">
		
		<br>
		
		
	</div>
	</form>
</body>
</html>