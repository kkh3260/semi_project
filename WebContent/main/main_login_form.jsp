<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	int money = 10000; 
%>
<div class="titleImg" ><!--==============================이미지삽입===================================  -->
<a href="./GoodsList_new.go?item=new_item"><img src="images/bar-209148_1920.jpg" alt="" style="width: 950px; height: 350px;"></a></div>
<div class="loginFrom">
	<ul class="user">
		<%
			if (id != null) {
				if((int)session.getAttribute("admin")==1){
					%>
						<li>관리자 계정</li>
						<li><%=session.getAttribute("username")%> 님</li>
						<li><a href="./GoodsAdd.ag">상품등록</a></li>
						<li><a href="./GoodsList.ag">상품관리</a></li>
						<li><a href="./AdminOrderList.ao">주문확인</a></li>
						<li><a href="./MemberLogout.me">로그아웃</a></li>
					<%
				}else{
					%>
						<li>환영합니다 <%=session.getAttribute("username")%> 님</li>
						<li>이번달에 결제한 금액</li>
						<li align="center"><%=money %></li>
						<li><a href="./MemberMypage.me">마이페이지</a></li>
						<li><a href="./BasketList.ba">장바구니</a></li>
						<li><a href="./OrderList.or">주문 확인</a></li>
						<li><a href="./MemberLogout.me">로그아웃</a></li>
					<%
				}
		%>
		<%
			} else {
		%>
		<li><a href="./MemberLogin.me">로그인</a></li>
		<li><a href="./MemberJoin.me">회원가입</a></li>
		<%
			}
		%>
	</ul>
</div>