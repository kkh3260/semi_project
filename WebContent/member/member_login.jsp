<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<link href="https://fonts.googleapis.com/css?family=Song+Myung"
	rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Song Myung', serif;
	line-height: 20px;
}

section {
	background: -webkit-linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%,
		rgba(66, 245, 189, 0.4) 100%);
	background: linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%,
		rgba(66, 245, 189, 0.4) 100%);
	color: rgba(0, 0, 0, 0.6);
}

.form {
	z-index: 15;
	position: relative;
	background: #FFFFFF;
	width: 600px;
	border-radius: 4px;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
	margin: 100px auto 10px;
	overflow: hidden;
}
.find_ip_pw{
	align-self: center;
}
.find_ip_pw p a {
	width: 500px;
	font-size: 15pt;
	font-weight: 1000;
	text-transform: none;
	color: #4285F4;
	text-decoration: none;
	text-align: center;
	color: #375472;
	cursor: pointer;
}

.form-group {
	width: 500px;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	margin: 0 0 20px;
}

.form-group:last-child {
	margin: 10px;
}

.form-group label {
	width: 30%;
	display: block;
	margin: 10px 10px 10px;
	color: rgba(0, 0, 0, 0.6);
	font-size: 20px;
	line-height: 2;
	text-transform: uppercase;
	letter-spacing: .2em;
	text-align: center;
	display: block;
}

.form-group input {
	outline: none;
	display: block;
	background: rgba(0, 0, 0, 0.1);
	width: 60%;
	border: 0;
	border-radius: 10px;
	box-sizing: border-box;
	padding: 12px 20px;
	color: black;
	font-size: 15pt;
	text-align: center;
	line-height: inherit;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
	margin: 10px;
	line-height: 10px;
	text-align: center;
}

.form-group input:focus {
	color: rgba(0, 0, 0, 0.8);
}

.form-group button {
	outline: navy;
	background: #4285F4;
	width: 50%;
	border: 10px;
	border-radius: 10px;
	padding: 0 12px 20px;
	margin: auto;
	color: white;
	font-family: inherit;
	font-size: 15pt;
	line-height: 2;
	cursor: pointer;
	text-align: center;
	text-indent: inherit;
}

.form-header {
	width: 100% margin: 0 0 0 40px;
	padding: 0 0 0 40px;
}

.form-header h1 {
	padding: 4px 0;
	color: #4285F4;
	font-size: 24px;
	font-weight: 700;
	text-transform: uppercase;
}
</style>

<script>
	function check() {
		var id = loginform.MEMBER_ID.value;
		var pass = loginform.MEMBER_PW.value;

		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			loginform.MEMBER_ID.focus();
			return false;
		}
		if (pass.length == 0) {
			alert("비밀번호를 입력하세요.");
			loginform.MEMBER_PW.focus();
			return false;
		}

		return true;
	}

	function openConfirmId(loginform) {
		var url = "./MemberFind.me";
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"
				+ "scrollbars=no,resizable=no,width=450px,height=300");
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
		<div class="form">
			<form action="./MemberLoginAction.me" method="post" name="loginform"
				onsubmit="return check()">
				<div class="form-toggle"></div>
				<div class="form-header">
					<h1>회원 로그인</h1>
				</div>
				<div class="form-group">
					<label for="MEMBER_ID">아이디</label> <input type="text"
						id="MEMBER_ID" name="MEMBER_ID" required="required" />
				</div>
				<div class="form-group">
					<label for="MEMBER_PW">패스워드</label> <input type="password"
						id="MEMBER_PW" name="MEMBER_PW" required="required" maxlength=12 />

					<div class="find_ip_pw">
						<p>
							<a href="#" style="color: navy"
								onclick="openConfirmId(this.form)">ID/PW 찾기</a>
						</p>
					</div>
					<!-- <div id="warning" style="display: none;">
						<p>브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다. 로그인 유지 기능을 사용할 경우 다음 접속부터는
							로그인할 필요가 없습니다. 단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을
							해주세요.</p>
					</div> -->
				</div>
				<div class="form-group">
					<button type="submit">로그인</button>
				</div>
				<div class="form-group">
					<button type="submit"
						onclick="javascript:window.location='./MemberJoin.me'">회원가입</button>
				</div>
		</div>

		</form>

		</div>
	</section>
	<footer>
		<jsp:include page="../main/main_footer.jsp" />
	</footer>
</body>
</html>
