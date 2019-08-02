<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<header>
		<div class="title">
			<jsp:include page="./main_login_form.jsp" />
			<jsp:include page="./main_menubar.jsp" />
		</div>
	</header>
	<section>
		<div class="page_content">
			<!-- 이부분에 작성 -->
		</div>
		<nav>
			<!-- nav영역 -->
			<img alt="" src="/images/eventbanner.jpg">
		</nav>
	</section>
</body>
</html>