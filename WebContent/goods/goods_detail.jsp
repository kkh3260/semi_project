<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="net.goods.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	GoodsBean itemArray = (GoodsBean) request.getAttribute("itemArray");
	String category = (String) request.getAttribute("item");
	String price = (String) request.getAttribute("price");
	GoodsBean prevpage = (GoodsBean) request.getAttribute("prevpage");
	GoodsBean nextpage = (GoodsBean) request.getAttribute("nextpage");
%>
<link href="https://fonts.googleapis.com/css?family=Dosis:500"
	rel="stylesheet">
<!DOCTYPE html>
<!-- 페이스북 공유 -->
<html>
<head>
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<script>
	/* jscrip객체  isBuy()    -> 구매하기 */
	function isBuy(goodsform) {
		var amount = document.goodsform.amount.value;
		var isbuy = confirm("구매하시겠습니까?");
		if (isbuy == true) {
			goodsform.action = "OrderStart.or";
			goodsform.submit();
		} else {
			return;
		}
	}
	/* jscrip객체  isBasket() -> 장바구니 */
	function isBasket(basketform) {
		var amount = document.goodsform.amount.value;

		var isbuy = confirm("장바구니에 저장하시겠습니까?");

		if (isbuy == true) {
			basketform.action = "BasketAdd.ba";
			basketform.submit();
		} else {
			return;
		}
	}

	/* jscrip객체  count_change() -> ?? */
	function count_change(temp) {
		var test = document.goodsform.amount.value;
		if (temp == 0) {
			test++;
		} else if (temp == 1) {
			if (test > 1)
				test--;
		}

		document.goodsform.amount.value = test;
	}
</script>
</head>
<body>
	<!-- SNS 공유용 주소 연결 용 -->
	<script type="text/javascript" async>
		var url_default_ks = "https://story.kakao.com/share?url=";
		var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u=";
		var url_default_tw_txt = "https://twitter.com/intent/tweet?text=";
		var url_default_tw_url = "&url=";
		var url_default_band = "http://band.us/plugin/share?body=";
		var url_route_band = "&route=";
		var url_default_naver = "http://share.naver.com/web/shareView.nhn?url=";
		var title_default_naver = "&title=";
		var url_this_page = location.href;
		var title_this_page = document.title;
		var url_combine_ks = url_default_ks + url_this_page;
		var url_combine_fb = url_default_fb + url_this_page;
		var url_combine_tw = url_default_tw_txt + document.title
				+ url_default_tw_url + url_this_page;
		var url_combine_band = url_default_band + encodeURI(url_this_page)
				+ '%0A' + encodeURI(title_this_page) + '%0A'
				+ '&route=tistory.com';
		var url_combine_naver = url_default_naver + encodeURI(url_this_page)
				+ title_default_naver + encodeURI(title_this_page);
	</script>

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
			<table width="960" cellspacing="0" cellpadding="0" border="0"
				align="center">
				<tr>
					<td colspan=2 align=center>
						<!-- 상품 내용 -->
						<form name="goodsform" action="#" method="post">
							<input type="hidden" name="goodsnum"
								value="${itemArray.GOODS_NUM }"> <input type="hidden"
								name="item" value="<%=request.getParameter("item")%>"> <input
								type="hidden" name="gr_goods_num"
								value="<%=request.getParameter("gr_goods_num")%>"> <input
								type="hidden" name="isitem"
								value="<%=request.getParameter("isitem")%>"> <input
								type="hidden" name="order" value="goods"> <input
								type="hidden" name="price"
								value="<%=itemArray.getGOODS_PRICE()%>"> <input
								type="hidden" name="goodsname"
								value="<%=itemArray.getGOODS_NAME()%>"> <input
								type="hidden" name="goodsimage" value="${fn:trim(mainImage)}">
							<input type="hidden" name="goodscountry"
								value="${itemArray.GOODS_COUNTRY }"> <input
								type="hidden" name="goodssize" value="${itemArray.GOODS_SIZE }">
							<input type="hidden" name="goodsaby"
								value="${itemArray.GOODS_ABV }">
							<link
								href="https://fonts.googleapis.com/css?family=Dosis:500|Stylish"
								rel="stylesheet">
							<div class="page_content">
								<div class="top">
									<div class="set1"><%=itemArray.getGOODS_CATEGORY()%></div>
									<div class="set2">
										HOME >
										<%=itemArray.getGOODS_CATEGORY()%></div>
								</div>
								<hr>
								<div class="left">
									<img src="./upload/${fn:trim(mainImage)}" width="400"
										height="400" />
								</div>

								<div class="right">
									<hr>

									<div class="set5">
										<div class="set3">${itemArray.GOODS_NAME}</div>
									</div>
									<hr>
									<div id="form1">
										<div class="set6">

											<div class="set4">판매가격</div>
											<div class="set8">${itemArray.GOODS_PRICE}</div>
										</div>
										<div class="set5">
											<div class="set4">제품코드</div>
											<div class="set8">${itemArray.GOODS_NUM }</div>
										</div>
										<div class="set5">
											<div class="set4">제조국</div>
											<div class="set8">${itemArray.GOODS_COUNTRY }</div>
										</div>
										<div class="set5">
											<div class="set4">제품용량</div>
											<div class="set8">${itemArray.GOODS_SIZE }(ml)</div>
										</div>
										<div class="set5">
											<div class="set4">알코올함량</div>
											<div class="set8">${itemArray.GOODS_ABV }(%)</div>
										</div>

										<table class="set11">



											<tr>
												<td rowspan="2">수량 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td width="58" rowspan="2">
												<input name="amount"type="text" style="text-align: right" value="1" size="4" /></td>
												<td valign="bottom">
													<div align="center">
														<a href="JavaScript:count_change(0)">▲</a>
													</div>
												</td>
												<td width="69" rowspan="2" align="left">개</td>
											</tr>
											<tr>
												<td valign="top">
													<div align="center">
														<a href="JavaScript:count_change(1)">▼</a>
													</div>
												</td>
											</tr>
										</table>
										<div class="set13">
											<a href="javascript:isBuy(goodsform);"> [구매하기] </a>
										</div>
										<div class="set14">
											<a href="javascript:isBasket(goodsform);"> [장바구니 담기] </a>
										</div>
									</div>

								</div>
								<div class="bottom"></div>
							</div>

							</div>



							<div>



								<table align="center">
									<tr>
										<td>
											<%
												if (prevpage.getGOODS_NUM() != 0) {
													if (price.equals("no")) {
											%> <a
											href="Goods_Detail.go?search=prev&gr_goods_num=<%=itemArray.getGOODS_NUM()%>&item=<%=category%>">
												<%
													} else {
												%> <a
												href="Goods_Detail.go?search=prev&gr_goods_num=<%=itemArray.getGOODS_NUM()%>&item=<%=category%>&price=<%=price%>">
													<%
														}
													%> [이전상품]
											</a>
										</td>
										<td width="150" align="center">
											<div align="center" width="200">
												<img src="./upload/<%=prevpage.getGOODS_IMAGE()%>"
													width="70" height="50" border="0"> <br><%=prevpage.getGOODS_NAME()%>
											</div>
										</td>
										<%
											}
										%>
										<td width="150" align="center">
											<%
												if (nextpage.getGOODS_NUM() != 0) {
											%>
											<div align="center">
												<img src="./upload/<%=nextpage.getGOODS_IMAGE()%>"
													width="70" height="50" border="0"> <br><%=nextpage.getGOODS_NAME()%>
											</div>
										</td>
										<td>
											<%
												if (price.equals("no")) {
											%> <a
											href="Goods_Detail.go?search=next&gr_goods_num=<%=itemArray.getGOODS_NUM()%>&item=<%=category%>" />
											<%
												} else {
											%> <a
											href="Goods_Detail.go?search=next&gr_goods_num=<%=itemArray.getGOODS_NUM()%>&item=<%=category%>&price=<%=price%>" />
											<%
												}
											%> [다음상품] </a> <%
 	}
 %>
										</td>
									</tr>
								</table>
							</div>

							<!-- SNS버튼 시작 -->
							<br>
							<div align="center">공유하기</div>
							<div
								style="width: 100%; text-align: center; margin-bottom: 64px;">
								<!-- 페이스북 공유 버튼 -->
								<a href=""
									onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;"><img
									src="./images/facebook.gif"
									title="페이스북으로 공유하기" class="sharebtn_custom"
									style="width: 32px;"></a>
								<!-- 트위터 공유 버튼 -->
								<a href=""
									onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;"><img
									src="./images/tweeter.gif"
									title="트위터로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
								<!-- 카카오 스토리 공유 버튼 -->
								<a href=""
									onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;"><img
									src="./images/kakao.gif"
									title="카카오스토리로 공유하기" class="sharebtn_custom"
									style="width: 32px;"></a>
								<!-- 네이버 공유 버튼 -->
								<a href=""
									onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;"><img
									src="./images/naver.gif"
									title="네이버로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
								<!-- 밴드 공유 버튼 -->
								<a href=""
									onclick="window.open(url_combine_band, '', 'scrollbars=no, width=584, height=635'); return false;"><img
									src="./images/band.gif"
									title="밴드로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
							</div>
							<!-- SNS버튼 끝 -->


						</form>
						<hr> <!-- 상품 구매 메뉴 끝 --> <!-- 상품 내용 -->
						<table width="700" height="300" align="center">
							<tr>
								<td align="center">
									<div align="center">${itemArray.GOODS_CONTENT }</div>
								</td>
							</tr>
						</table> <br> <br>
						<table width="200" border="0" align="center">
							<tr align="left">
								<td colspan="3"><c:forEach var="itemimg"
										items="${requestScope.contentImage}">

										<c:choose>
											<c:when test="${fn:trim(itemimg) eq 'null'}">

											</c:when>
											<c:otherwise>
												<img src="./upload/${fn:trim(itemimg)}" width="550" />
											</c:otherwise>
										</c:choose>

									</c:forEach></td>
							</tr>
						</table> <!-- 상품 내용 끝 -->

					</td>
				</tr>
			</table>
			<br>
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
