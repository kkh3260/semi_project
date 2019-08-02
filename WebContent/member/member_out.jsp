<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
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
			<table width="650" cellspacing="0" cellpadding="0" border="0"
				align="center">
				<tr>
					<td colspan=2>
						<p align="center">
						<form action="./MemberDeleteAction.me" method="post">
							<table border="1" width="380" cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td align="center" colspan="2"><font size="4"><b>회원
												탈퇴</b></font></td>
								</tr>
								<tr>
									<td align="center" height="35" width="125"><font size="2">비밀번호</font></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="password" name="MEMBER_PW" />
									</td>
								</tr>
								<tr>
									<td align="center" colspan="2" height="35"><input
										type="submit" value="회원 탈퇴" /> <input type="reset"
										value="취 소" /></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<nav>
			<!-- nav영역 -->
		</nav>
	</section>
</body>
</html>
