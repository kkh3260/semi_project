<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<style type="text/css">
body {
	margin-top: 20px;
	margin-left: 30px;
	font-family: inherit;
	color: #888888;
	font-size: 8pt;
}

table {

	border-collapse: collapse;
	font-size: 9pt;
	margin-left: 0;
}

img {
	border: none;
}

select {
	font-size: 8pt; 
	font-family:inherit;
	height: 18px;
}

option {
	border: #cccccc solid 1px;
	font-family: inherit;
	color: #888888;
	font-size: 10pt;
}

input {
	height: 18px;
}

th, td {
	padding-left: 20px;
	text-align: left;
	border-bottom: #eeeeee solid 1px;
}

#pink_line {
	margin-left: "0";
}

#member_button {
	margin-top: 10px;
	text-align: center;
}

#mbname, #mbid, #mbpw, #mbpw2, #email_dns {
	width: 150px;
	height: 18px;
}

#mbjumin_1, #mbjumin_2, #zip_h_1, #zip_h_2 {
	width: 68px;
	height: 18px;
}

#addr_h1 {
	width: 350px;
	height: 18px;
}

#addr_h2 {
	width: 700px;
	height: 18px;
}

#mbpw2 {
	width: 200px;
	height: 18px;
}

#tel_h2_1, #tel_h2_2 {
	width: 68px;
}
.setMargin{
	padding : 100px;
	margin-left: 170px;;
}

</style>
<script>
	function check() {
		var id = joinform.MEMBER_ID.value;
		var password1 = joinform.MEMBER_PW.value;
		var password2 = joinform.MEMBER_PW2.value;
		var email1 = joinform.MEMBER_EMAIL1.value;
		var email2 = joinform.MEMBER_EMAIL2.value;
		var phone = joinform.MEMBER_PHONE.value;
		var addr1 = joinform.MEMBER_ADDR1.value;
		var addr2 = joinform.MEMBER_ADDR2.value;
		var mobile = joinform.MEMBER_MOBILE.value;

		var forms = document.getElementById("joinform");

		if ((forms.MEMBER_NAME.value == "")
				|| (forms.MEMBER_NAME.value.length <= 1)) {
			alert("이름을 제대로 입력해 주세요.");
			forms.MEMBER_NAME.focus();
			return false;
		}
		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			joinform.MEMBER_ID.focus();
			return false;
		}
		if (password1.length == 0) {
			alert("비밀번호를 입력하세요.");
			joinform.MEMBER_PW.focus();
			return false;
		}
		if (password1 != password2) {
			alert("비밀번호가 일치하지 않습니다.");
			joinform.MEMBER_PW.value = "";
			joinform.MEMBER_PW2.value = "";
			joinform.MEMBER_PW.focus();
			return false;
		}
		if ((forms.MEMBER_JUMIN1.value == "")
				|| (forms.MEMBER_JUMIN1.value.length < 6)) {
			alert("주민등록번호 앞의 6자리를 입력해 주세요.");
			forms.MEMBER_JUMIN1.focus();
			return false;
		}
		if ((forms.MEMBER_JUMIN2.value == "")
				|| (forms.MEMBER_JUMIN2.value.length < 7)) {
			alert("주민등록번호 뒤의 7자리를 입력해 주세요.");
			forms.MEMBER_JUMIN2.focus();
			return false;
		}
		if (email1.length == 0 || email2.length == 0) {
			alert("이메일을 제대로 입력하세요.");
			joinform.MEMBER_EMAIL1.focus();
			return false;
		}
		if (phone.length == 0) {
			alert("집 전화를 입력하세요.");
			joinform.MEMBER_PHONE.focus();
			return false;
		}
		if ((forms.MEMBER_ZIPCODE1.value == "")
				|| (forms.MEMBER_ZIPCODE1.value.length < 3)) {
			alert("우편번호 앞의 3자리를 입력해 주세요.");
			forms.MEMBER_ZIPCODE1.focus();
			return false;
		}
		if ((forms.MEMBER_ZIPCODE2.value == "")
				|| (forms.MEMBER_ZIPCODE2.value.length < 3)) {
			alert("우편번호 뒤의 3자리 입력해 주세요.");
			forms.MEMBER_ZIPCODE2.focus();
			return false;
		}
		if (addr1.length == 0) {
			alert("집 주소를 입력하세요.");
			joinform.MEMBER_ADDR1.focus();
			return false;
		}
		if (addr2.length == 0) {
			alert("상세 주소를 입력하세요.");
			joinform.MEMBER_ADDR2.focus();
			return false;
		}
		if (mobile.length == 0) {
			alert("휴대폰 번호를 입력하세요.");
			joinform.MEMBER_MOBILE.focus();
			return false;
		}

		return true;
	}

	function openConfirmId(joinform) {
		var id = joinform.MEMBER_ID.value;
		var url = "./MemberIDCheckAction.me?MEMBER_ID="
				+ joinform.MEMBER_ID.value;

		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			joinform.MEMBER_ID.focus();
			return false;
		}
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"
				+ "scrollbars=no,resizable=no,width=400,height=200");
	}

	function openZipcode(joinform) {
		var url = "./Zipcode.me"
		open(url, "confirm", "toolbar=no,location=no,"
				+ "status=no,menubar=no," + "scrollbars=yes,resizable=no,"
				+ "width=410,height=400");
	}

	function gNumCheck() {
		if (event.keyCode >= 48 && event.keyCode <= 57) {
			return true;
		} else {
			event.returnValue = false;
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
			<basefont size=6>
			<table align="center" class="setMargin">
				<tr>
					<td colspan=2>
						<!-- 회원가입 -->
						<form name="form" id="form" action="./MemberJoinAction.me"
							method="post" onsubmit="return check()">
							<tr >
								<td colspan="2" align="left" valign="top" style=""></td>
							</tr>
							<tr>
								<td>
									<p align="center">
										<!--테이블 시작 -->
									<table width="940" style="padding:5px 0 5px 0;">

										<tr>
											<td>이름
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_NAME" id="mbname" />
											</td>
										</tr>
										<tr>
											<td>아이디
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_ID" id="mbid" size="10" maxlength=15 /> <input
												type="button" name="confirm_id" value="중복확인"
												onclick="openConfirmId(this.form)" />
											</td>
										</tr>
										<tr>
											<td>비밀번호
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="password"
												name="MEMBER_PW" id="mbpw" size="15" />
											</td>
										</tr>
										<tr>
											<td>비밀번호
													확인</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="password"
												name="MEMBER_PW2" id="mbpw2" size="15" />
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font size="2">&nbsp;&nbsp;&nbsp; (아이디와 비밀번호는
													문자와 숫자를 조합하여 2~12자리로 만들어 주세요)</font></td>
										</tr>
										<tr>
											<td>주민등록번호
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_JUMIN1" id="mbjumin_1" size="12"
												onkeypress="gNumCheck()" maxlength="6" /> - <input
												type="text" name="MEMBER_JUMIN2" id="mbjumin_2" size="12"
												onkeypress="gNumCheck()" maxlength="7" />
											</td>
										</tr>
										<tr>
											<td>이메일
													주소</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_EMAIL1" id="email_dns" size="13" /> @ <input
												type="text" name="MEMBER_EMAIL2" id="email_dns" size="15" />
											</td>
										</tr>
										<tr>
											<td>메일수신</td>
											<td><input type="radio" name="chk_mail"
												checked>수신 <input type="radio" name="chk_mail"
												value="4"> 수신거부</td>
										</tr>
										<tr>
											<td>집전화
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_PHONE" size="24" />
											</td>
										</tr>
										<tr>
											<td>우편번호
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_ZIPCODE1" id="zip_h_1" size="6"
												onkeypress="gNumCheck()" maxlength="3" />- <input
												type="text" name="MEMBER_ZIPCODE2" id="zip_h_2" size="6"
												onkeypress="gNumCheck()" maxlength="3" />&nbsp;&nbsp; <input
												type="button" name="zipcode" value="우편번호 검색"
												onclick="openZipcode(this.form)" />
											</td>
										</tr>
										<tr>
											<td>집주소
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_ADDR1" id="addr_h1" />
											</td>
										</tr>
										<tr>
											<td>상세주소
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_ADDR2" id="addr_h2" />
											</td>
										</tr>
										<tr>
											<td>휴대폰
											</td>
											<td>&nbsp;&nbsp;&nbsp; <input type="text"
												name="MEMBER_MOBILE" size="24" />
											</td>
										</tr>
									</table>
									<table width="80%">
										<tr>
											<td align="center"><br /> <input type="submit"
												value="회원가입" id="member_button" /><input type="reset"
												value="다시 입력" id="member_button" /></td>
												
										</tr>
									</table>
						</form> <!-- 회원가입 -->

					</td>

				</tr>
			</table>
			<br>
		</div>
	</section>
		<footer>
		<jsp:include page="../main/main_footer.jsp" />
	</footer>
</body>
</html>
