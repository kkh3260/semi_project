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
			<table width="960" cellspacing="0" cellpadding="0" border="0"
				bordercolor="gray" align="center">
				<tr>
					<td colspan=2>
						<!-- 상품 등록 -->
						<table border="0" width="80%">
							<form name="goodsform" action="./GoodsAddAction.ag" method="post" enctype="multipart/form-data">
								<input type="hidden" name="goods_best" value="0">
								<tr>
									<td>
										<p align="center">
											<span style="font-size: 26pt;">상 품 등 록</span>
										</p>
									</td>
								</tr>

								<tr>
									<td height="331">
										<table border="1" align="center" width="558">
											<tr>
												<td width="200" height="50">
													<p align="center">
														<font size=3>상품명</font>
													</p>
												</td>
												<td><input type="text" name="goods_name"></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>판매가</font>
													</p>
												</td>
												<td><input type="text" name="goods_price"></td>
											</tr>

											<tr>
												<td width="200" height="50">
													<p align="center">
														<font size=3>주종</font>
													</p>
												</td>
												<td width="346" height="50"><select
													name="goods_category" size="1">
														<option value="beer" selected>맥주</option>
														<option value="rice">막걸리</option>
														<option value="wine">와인</option>
														<option value="whiskey">위스키</option>

												</select></td>
											</tr>
											<tr>
												<td width="200" height="50">
													<p align="center">
														<font size=3>국가</font>
													</p>
												</td>
												<td width="200" height="50"><input type="text" name="goods_country"> 
													<!-- <selectname="goods_country" size="1">
														<option value="korea" selected>한국</option>
														<option value="japan">일본</option>
														<option value="america">미국</option>
														<option value="Germany">독일</option></select> --></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>용량</font>
													</p>
												</td>
												<td><input type="text" name="goods_size"></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>도수</font>
													</p>
												</td>
												<td><input type="text" name="goods_abv"></td>
											</tr>

											<tr>
												<td>
													<p align="center">
														<font size=3>재고량</font>
													</p>
												</td>
												<td><input type="text" name="goods_amount"></td>
											</tr>

											<tr>
												<td width="196">
													<p align="center">
														<font size=3>상품 설명</font>
													</p>
												</td>
												<td width="346"><textarea name="goods_content" cols=50
														rows=7>
											</textarea></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>메인 제품이미지</font>
													</p>
												</td>
												<td><input type="file" name="file4"></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>제품이미지1</font>
													</p>
												</td>
												<td><input type="file" name="file3"></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>제품이미지2</font>
													</p>
												</td>
												<td><input type="file" name="file2"></td>
											</tr>
											<tr>
												<td>
													<p align="center">
														<font size=3>제품이미지3</font>
													</p>
												</td>
												<td><input type="file" name="file1"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr align="center">
									<td height="75" align="center">
										<p align="center">
											<input type="submit" value="등록">&nbsp; <input
												type="reset" value="다시쓰기" onclick="resetInsertData()">
										</p>
									</td>
								</tr>
						</table>
						</form> <!-- 상품 등록 -->
					</td>
				</tr>
			</table>
		</div>
	</section>
	<footer>
		<jsp:include page="../main/main_footer.jsp" />
	</footer>
</body>
</html>
