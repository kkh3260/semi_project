<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link type="text/css" href="css/mainpage.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="title">
			<jsp:include page="../main/main_login_form.jsp" />
			<jsp:include page="../main/main_menubar.jsp" />
		</div>
	</header>
	<section>
		<div class="page_content">
			<table width="400" cellspacing="0" cellpadding="0" border="0"
				align="center">
				<tr>
					<td colspan=2>
						<!-- 회원가입 -->
						<p align="center">마이페이지
						<table border="1" width="100%" height="100%" align="center">
							<tr>
								<td bgcolor="#f5f5f5">회원 정보 수정</td>
								<td><input type="button" name="confirm_id" value=" 회원 정보 수정 " onclick="location.href='./MemberModifyAction_1.me'" /></td>
							</tr>
							<tr>
								<td bgcolor="#f5f5f5">주문확인</td>
								<td><input type="button" name="confirm_id" value=" 주문확인 " onclick="location.href='./OrderList.or'" /></td>
							</tr>
							<tr>
								<td bgcolor="#f5f5f5">찜한 상품</td>
								<td><input type="button" name="confirm_id" value=" 찜한 상품 목록 " onclick="./Main.me" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<nav>
			<!-- nav영역 -->
		</nav>
	</section>
	<footer>
		<jsp:include page="../main/main_footer.jsp" />
	</footer>
</body>
</html>