<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.board.db.*"%>

<%
	BoardDTO board = (BoardDTO) request.getAttribute("boarddata");
%>
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
			<!-- 게시판 수정 -->
			<table cellpadding="0" cellspacing="0"  class="boards">
				<tr align="center" valign="middle">
					<td colspan="5">MVC 게시판</td>
				</tr>

				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">
						<div align="center">제 목&nbsp;&nbsp;</div>
					</td>

					<td style="font-family: 돋음; font-size: 12"><%=board.getBoardSubject()%>
					</td>
				</tr>

				<tr bgcolor="cccccc">
					<td colspan="2" style="height: 1px;"></td>
				</tr>

				<tr>
					<td style="font-family: 돋음; font-size: 12">
						<div align="center">내 용</div>
					</td>
					<td style="font-family: 돋음; font-size: 12">
						<table border=0 width=490 height=250 style="table-layout: fixed">
							<tr>
								<td valign=top style="font-family: 돋음; font-size: 12"><%=board.getBoardContent()%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12">
						<div align="center">첨부파일</div>
					</td>
					<td style="font-family: 돋음; font-size: 12">
						<%
							if (!(board.getBoardFile() == null)) {
						%> <%-- <a href="./boardUpload/<%=board.getBoardFile()%>"> --%> <a
						href="./BoardDownload.bo?path=<%=board.getBoardFile()%>"> <%=board.getBoardFile()%>
					</a> <%
 	}
 %>
					</td>
				</tr>

				<tr bgcolor="cccccc">
					<td colspan="2" style="height: 1px;"></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>

				<tr align="center" valign="middle">
					<td colspan="5"><font size=2> <a
							href="./BoardReplyView.bo?num=<%=board.getBoardNum()%>"> [답변]
						</a>&nbsp;&nbsp; <a
							href="./BoardModify.bo?num=<%=board.getBoardNum()%>"> [수정] </a>&nbsp;&nbsp;
							<a href="./BoardDelete.bo?num=<%=board.getBoardNum()%>"> [삭제]
						</a>&nbsp;&nbsp; <a href="./BoardList.bo">[목록]</a>&nbsp;&nbsp;
					</font></td>
				</tr>
			</table>
			<br>
			<!-- 게시판 수정 -->
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