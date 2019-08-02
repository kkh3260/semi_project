<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String category = (String) request.getAttribute("category");
	String price = (String) request.getAttribute("price");
	int nowpage = 1;
	if (request.getParameter("page") != null) {
		nowpage = Integer.parseInt(request.getParameter("page"));
	}
	int count = ((Integer) (request.getAttribute("count"))).intValue();
	int pageCount = ((Integer) (request.getAttribute("pageCount"))).intValue();
	int startPage = ((Integer) (request.getAttribute("startPage"))).intValue();
	int endPage = ((Integer) (request.getAttribute("endPage"))).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<script>
	function searchPrice(item, searchprice) {
		if (searchprice != "all") {
			window.location.href = "GoodsList.go?item=" + item
					+ "&page=1&searchprice=" + searchprice;
		} else {
			window.location.href = "GoodsList.go?item=" + item + "&page=1";
		}
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
		<div class="page_content">
			<table width="760" cellspacing="0" cellpadding="0" border="0"
				align="center">
							<tr>
								<td valign="top">
									<!-- 상품 리스트 -->
									<table border="0">
										<tr>
											<c:choose>
												<c:when test="${requestScope.itemList[0].GOODS_NUM==null}">
													<tr align="center">
														<td width="700" height="300" align="center">등록된 상품이없습니다.</td>
													</tr>
												</c:when>

												<c:otherwise>
													<c:forEach var="item" items="${requestScope.itemList}" begin="0" end="3">
															<td width="180" valign="top"><br>
																<div align="center">
																	<%
																		if (category.equals("new_item")) {
																						if (price.equals("no")) {
																	%>
																	<a
																		href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=new">
																		<%
																			} else {
																		%> <a
																		href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=new&price=${price}">
																			<%
																				}
																							} else if (category.equals("hit_item")) {
																								if (price.equals("no")) {
																			%> <a
																			href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=hit">
																				<%
																					} else {
																				%> <a
																				href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=hit&price=${price}">
																					<%
																						}
																									} else {
																										if (price.equals("no")) {
																					%> <a
																					href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=other">
																						<%
																							} else {
																						%> <a
																						href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=other&price=${price}">
																							<%
																								}
																											}
																							%><img src="./upload/${fn:trim(item.GOODS_IMAGE)}" height="130" width="130" border="0" /> 
																								 <br />${item.GOODS_NAME}<br />
																					</a> 
																					<br /> <b>${item.GOODS_PRICE}원</b>
																</div> <br></td>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
										<c:forEach var="item" items="${requestScope.itemList}" begin="4" end="7">
															<td width="180" valign="top"><br>
																<div align="center">
																	<%
																		if (category.equals("new_item")) {
																						if (price.equals("no")) {
																	%>
																	<a
																		href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=new">
																		<%
																			} else {
																		%> <a
																		href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=new&price=${price}">
																			<%
																				}
																							} else if (category.equals("hit_item")) {
																								if (price.equals("no")) {
																			%> <a
																			href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=hit">
																				<%
																					} else {
																				%> <a
																				href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=hit&price=${price}">
																					<%
																						}
																									} else {
																										if (price.equals("no")) {
																					%> <a
																					href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=other">
																						<%
																							} else {
																						%> <a
																						href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=other&price=${price}">
																							<%
																								}
																											}
																							%> <img
																							src="./upload/${fn:trim(item.GOODS_IMAGE)}"
																							width="130" height="130" border="0" /> <br />${item.GOODS_NAME}<br />
																					</a> <br /> <b>${item.GOODS_PRICE}원</b>
																</div> <br></td>
													</c:forEach>
										</tr>
										<tr>
										<c:forEach var="item" items="${requestScope.itemList}" begin="8" end="11">
															<td width="180" valign="top"><br>
																<div align="center">
																	<%
																		if (category.equals("new_item")) {
																						if (price.equals("no")) {
																	%>
																	<a
																		href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=new">
																		<%
																			} else {
																		%> <a
																		href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=new&price=${price}">
																			<%
																				}
																							} else if (category.equals("hit_item")) {
																								if (price.equals("no")) {
																			%> <a
																			href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=hit">
																				<%
																					} else {
																				%> <a
																				href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=hit&price=${price}">
																					<%
																						}
																									} else {
																										if (price.equals("no")) {
																					%> <a
																					href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=other">
																						<%
																							} else {
																						%> <a
																						href="Goods_Detail.go?item=${item.GOODS_CATEGORY}&gr_goods_num=${item.GOODS_NUM}&isitem=other&price=${price}">
																							<%
																								}
																											}
																							%> <img
																							src="./upload/${fn:trim(item.GOODS_IMAGE)}"
																							width="130" height="130" border="0" /> <br />${item.GOODS_NAME}<br />
																					</a> <br /> <b>${item.GOODS_PRICE}원</b>
																</div> <br></td>
													</c:forEach>
										</tr>

									</table> <!-- 상품 리스트 -->
								</td>
							</tr>
							
							<tr align="center">
								<td height="20" colspan="4" align="center">
									<!-- 페이징 --> <%
 	if (count > 0) {
 		if (startPage > 10) {
 %> <a
									href="GoodsList.go?item=<%=category%>&
					page=<%=startPage - 1%>">[이전]</a>
									<%
										}
											for (int i = startPage; i <= endPage; i++) {
												if (i == nowpage) {
									%> <font color=red>[<%=i%>]
								</font> <%
 	} else {
 				if (price.equals("no")) {
 %> <a href="GoodsList.go?item=<%=category%>
						&page=<%=i%>">[<%=i%>]
								</a> <%
 	} else {
 %> <a
									href="GoodsList.go?item=<%=category%>
						&page=<%=i%>&searchprice=<%=price%>">[<%=i%>]
								</a> <%
 	}
 			}
 		}
 		if (endPage < pageCount) {
 %> <a
									href="GoodsList.go?item=<%=category%>
					&page=<%=endPage + 1%>">[다음]</a>
									<%
										}
										}
									%> <!-- 페이징 -->
									<br>
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
