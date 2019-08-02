<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Dosis:500"
	rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<style type="text/css">
.boards{
	padding-left: 320px;
}
</style>
<script language="javascript">
	function addboard() {
		boardform.submit();
	}
</script>
</head>
<body>
	<header>
		<div class="title">
			<jsp:include page="../main/main_login_form.jsp" />
			<jsp:include page="../main/main_menubar.jsp" />
		</div>
	</header>
	<section>
		<link href="https://fonts.googleapis.com/css?family=Song+Myung"
			rel="stylesheet">
		<div class="page_content">
			<!-- 게시판 등록 -->
			<form action="./BoardAddAction.bo" method="post"
				enctype="multipart/form-data" name="boardform" class="boards">
				<table cellpadding="0" cellspacing="0">
					<tr align="center" valign="middle">
						<td colspan="5">MVC 게시판</td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">글쓴이</div>
						</td>
						<td><input name="boardName" type="text" size="10"
							maxlength="10" value="" /></td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">비밀번호</div>
						</td>
						<td><input name="boardPass" type="password" size="10"
							maxlength="10" value="" /></td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">제 목</div>
						</td>
						<td><input name="boardSubject" type="text" size="50"
							maxlength="100" value="" /></td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center">내 용</div>
						</td>
						<td><textarea name="boardContent" cols="67" rows="15"></textarea>
						</td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center">파일 첨부</div>
						</td>
						<td><input name="boardFile" type="file" /></td>
					</tr>
					<tr bgcolor="cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr align="center" valign="middle">
						<td colspan="5"><a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
							<a href="javascript:history.go(-1)">[뒤로]</a></td>
					</tr>
				</table>
			</form>
			<br>
			<!-- 게시판 등록 -->
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