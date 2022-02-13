<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천코스 결과</title>
<link rel="stylesheet" href="layout.css">
<link rel="stylesheet" href="include/style2.css">
<style>
.title_txt {
	text-align: center;
}

.main_txt {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 0%);
}
</style>
</head>

<body>
	<div class="title_txt">
		<h1>여기로 가는 거는 어떠신가요?</h1>
		<img src="include/image/3_result.png" alt="3" /> <br> <br>
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
				<td bgcolor="#BDBDBD">목적지</td>
				<td bgcolor="#BDBDBD">소요시간</td>
			</tr>
			<c:forEach var="list" items="${recommendList}">
				<tr>
					<td>${list.returnOfficeName}</td>
					<td>${list.ridingTime}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
</body>
</html>