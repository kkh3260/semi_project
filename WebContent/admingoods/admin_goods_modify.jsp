<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="net.admin.goods.db.*"%>
<%  
	GoodsBean agb=(GoodsBean)request.getAttribute("agb");
%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<script type="text/javascript">

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
<table width="960" cellspacing="0" cellpadding="0" border="0"
	bordercolor="gray" align="center">
<tr>
	<td colspan=2>
	<!-- 상품 수정 -->
	<form name="goodsform" action="./GoodsModifyAction.ag" method="post">
	<table border="0" width="80%">
		
	<tr>
		<th colspan="2" align="center" style="font-size: 30pt">상 품 수 정</th>
		</tr>
	
	<tr>
		<td height="331">
		<table border="1" align="center" width="558">
		<tr>
			<td width="196" height="30" >
			<p align="center"><font size=2>카테고리</font></p></td>
			<td width="400" height="30">
			<select name="goods_category" size="1" 
					 value=<%=agb.getGOODS_CATEGORY() %>>
				<option value="beer">맥주</option>
				<option value="rice wine">막걸리</option>
				<option value="wine">와인</option>
				<option value="whiskey">위스키</option>
				</select>
			</td> 
			<tr>
			<td width="196" height="30" >
			<p align="center"><font size=2>국가</font></p></td>
			<td width="400" height="30">
				<input type="text" name="goods_country" value=<%=agb.getGOODS_COUNTRY() %>>
			<%-- <select name="goods_country" size="1" 
					value=<%=agb.getGOODS_COUNTRY() %>>
				<option value="korea">한국</option>
				<option value="japan">일본</option>
				<option value="america">미국</option>
				<option value="germany">독일</option>
				</select> --%>
			</td>
		</tr>
		<tr>
			<td style="width: 20%">
			<p align="center"><font size=2>상품명</font></p>
			</td>
			<td><input type="text" name="goods_name" 
					value=<%=agb.getGOODS_NAME() %>></td>
		</tr>
		
		<tr>
			<td>
			<p align="center"><font size=2>판매가</font></p>
			</td>
			<td><input type="text" name="goods_price" 
					value=<%=agb.getGOODS_PRICE() %>></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>용량</font></p>
			</td>
			<td><input type="text" name="goods_size" 
					value=<%=agb.getGOODS_SIZE() %>></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>재고량</font></p>
			</td>
			<td><input type="text" name="goods_amount" 
					value=<%=agb.getGOODS_AMOUNT() %>></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>인기상품</font></p>
			</td>
			<td><input type="radio" name="goods_best" value=1
				<%if(agb.getGOODS_BEST()==1){%>CHECKED<%}%>>
				<font size=2>예</font>
				<input type="radio" name="goods_best" value=0 
				<%if(agb.getGOODS_BEST()==0){%>CHECKED<%}%>>
				<font size=2>아니오</font></td>
		</tr>
		<tr>
			<td width="196">
			<p align="center"><font size=2>제품정보</font></p>
			</td>
			<td width="346">
				<textarea name="goods_content" cols=50 rows=15><%=agb.getGOODS_CONTENT() %></textarea>
			</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="75">
		<p align="center"><input type="submit" value="상품 수정">&nbsp;
		<input type="reset" value="새로 입력" onclick="resetInsertData()"></p>
		</td>
	</tr>
	</form>
	</table>
	<input type="hidden" name="goods_num" value=<%=agb.getGOODS_NUM() %>>
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
