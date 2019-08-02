<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
%>

<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<style type="text/css">
.boards{
	padding-left: 420px;
}
</style>
</head>
<body>
<body>
	<header>
		<div class="title">
			<jsp:include page="../main/main_login_form.jsp" />
			<jsp:include page="../main/main_menubar.jsp" />
		</div>
	</header>
	<section>
		<div class="page_content">
			<form name="deleteForm" action="./BoardDeleteAction.bo?num=<%=num %>"
				method="post" class="boards">
				<table border=1>
					<tr>
						<td><font size=2>글 비밀번호 : </font></td>
						<td><input name="boardPass" type="password"></td>
					</tr>
					<tr>
						<td colspan=2 align=center><a
							href="javascript:deleteForm.submit()">삭제</a>&nbsp;&nbsp; <a
							href="javascript:history.go(-1)">돌아가기</a></td>
					</tr>
				</table>
			</form>
			<br>

		</div>
		<nav>
			<!-- nav영역 -->
		</nav>
	</section>
</body>
</html>