<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>๐์ฒซ์ธ์ - First Impression</title>

<link rel="icon" type="image/x-icon"
	href="${path}/resources/design/favicon.ico" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.name.value.length < 2) {
			alert("์ด๋ฆ์ 2์ ์ด์ ์๋ ฅํด์ฃผ์ธ์");
			frm.name.focus();
			return false;
		}
		if (frm.password.value != '') {
			if (frm.password.value != frm.password2.value) {
				alert("์ํธ์ ์ํธ ํ์ธ ๋ค๋ฆ๋๋ค");
				frm.password.focus(); // ์ปค์
				frm.password.value = ""; // ์ํธ ๋ฐ์ดํฐ ์ง์ฐ๊ธฐ 
				return false; // actionํ์ง ๋ง๋ผ
			}
			var pass = frm.password.value;
			var passwdReg = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,20}$/);
			if (!passwdReg.test(pass)) {
				alert("๋น๋ฐ๋ฒํธ๋ ๊ณต๋ฐฑ์ ์ ์ธํ ์๋ฌธ ๋/์๋ฌธ์ ์ซ์๋ฅผ ๋ชจ๋ ํฌํจํ 8์๋ฆฌ ์ด์ 20์๋ฆฌ ์ดํ๋ก ์๋ ฅํด์ฃผ์ธ์");
				frm.password.focus();
				return false;
			}
			if (pass.search(/\s/) != -1) {
				alert("๋น๋ฐ๋ฒํธ๋ ๊ณต๋ฐฑ ์์ด ์๋ ฅํด์ฃผ์ธ์");
				frm.password.focus();
				return false;
			}
		}
		if (frm.roadAddress.value == '' && frm.detailAddress.value == '') {

		}
		if ($("#emailCodeInput").is("disabled", false)) {
			if (frm.emailDoubleChk.value == ''
					|| frm.emailDoubleChk.value == "false") {
				alert("์ด๋ฉ์ผ ์ธ์ฆ์ ์๋ฃํด์ฃผ์ธ์");
				frm.emailCodeInput.focus();
				return false;
			}
		}
	}
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// ํ์์์ ๊ฒ์๊ฒฐ๊ณผ ํญ๋ชฉ์ ํด๋ฆญํ์๋ ์คํํ  ์ฝ๋๋ฅผ ์์ฑํ๋ ๋ถ๋ถ.

				// ๋๋ก๋ช ์ฃผ์์ ๋ธ์ถ ๊ท์น์ ๋ฐ๋ผ ์ฃผ์๋ฅผ ํ์ํ๋ค.
				// ๋ด๋ ค์ค๋ ๋ณ์๊ฐ ๊ฐ์ด ์๋ ๊ฒฝ์ฐ์ ๊ณต๋ฐฑ('')๊ฐ์ ๊ฐ์ง๋ฏ๋ก, ์ด๋ฅผ ์ฐธ๊ณ ํ์ฌ ๋ถ๊ธฐ ํ๋ค.
				var roadAddr = data.roadAddress; // ๋๋ก๋ช ์ฃผ์ ๋ณ์
				var extraRoadAddr = ''; // ์ฐธ๊ณ  ํญ๋ชฉ ๋ณ์

				// ๋ฒ์ ๋๋ช์ด ์์ ๊ฒฝ์ฐ ์ถ๊ฐํ๋ค. (๋ฒ์ ๋ฆฌ๋ ์ ์ธ)
				// ๋ฒ์ ๋์ ๊ฒฝ์ฐ ๋ง์ง๋ง ๋ฌธ์๊ฐ "๋/๋ก/๊ฐ"๋ก ๋๋๋ค.
				if (data.bname !== '' && /[๋|๋ก|๊ฐ]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// ๊ฑด๋ฌผ๋ช์ด ์๊ณ , ๊ณต๋์ฃผํ์ผ ๊ฒฝ์ฐ ์ถ๊ฐํ๋ค.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// ํ์ํ  ์ฐธ๊ณ ํญ๋ชฉ์ด ์์ ๊ฒฝ์ฐ, ๊ดํธ๊น์ง ์ถ๊ฐํ ์ต์ข ๋ฌธ์์ด์ ๋ง๋ ๋ค.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// ์ฐํธ๋ฒํธ์ ์ฃผ์ ์ ๋ณด๋ฅผ ํด๋น ํ๋์ ๋ฃ๋๋ค.
				document.getElementById('postCode').value = data.zonecode;
				document.getElementById("roadAddress").value = roadAddr;
			}
		}).open();
	}
</script>
<style type="text/css">
.mainContainer {
	margin-top: 75px;
	padding: 50px;
}

.pass_re1 {
	color: green;
	display: none;
	font-weight: bold;
}

.pass_re2 {
	color: red;
	display: none;
	font-weight: bold;
}
.lvpass_re1 {
	color: green;
	display: none;
	font-weight: bold;
}

.lvpass_re2 {
	color: red;
	display: none;
	font-weight: bold;
}

.email_re1 {
	color: green;
	display: none;
}

.email_re2 {
	color: red;
	display: none;
}

.email_re3 {
	color: red;
	display: none;
}

.emailChk_re1 {
	color: green;
	display: none;
}

.emailChk_re2 {
	color: red;
	display: none;
}
</style>
</head>
<body>
	<header><jsp:include page="../layout/header.jsp"></jsp:include></header>
	<div class="container">
		<section class="mainContainer">
			<form action="memberUpdate.do" method="post" id="frm"
				onsubmit="return chk()">
				<fieldset class="mb-3 mt-3">
					<legend>ํ์ ์ ๋ณด ์์ </legend>
					<div class="form-group row mt-3">
						<label class="col-sm-2 col-form-label">์์ด๋ / ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" id="id"
								name="id" disabled="disabled" aria-describedby="button-addon2"
								value="${member.id }">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">๋ณ๋ช / Nick Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" id="nick"
								name="nick" disabled="disabled" aria-describedby="button-addon2"
								value="${member.nick }">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">์์ผ / Date of Birth</label>
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" id="birth"
								name="birth" disabled="disabled"
								aria-describedby="button-addon2" value="${member.birth }">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="form-label mt-2">์ด๋ฆ / Full Name</label> <input
							type="text" class="form-control" id="name" name="name"
							aria-describedby="nameHelp" placeholder="์ด๋ฆ"
							value="${member.name }" required="required"> <small
							id="emailHelp" class="form-text text-muted"></small>
					</div>

					<div class="form-group">
						<label for="phone" class="form-label mt-2">ํด๋ํฐ / Phone
							Number</label> <input type="tel" class="form-control" id="phone"
							name="phone" placeholder="010-1111-1111" value="${member.phone }"
							required="required">
					</div>

					<div class="form-group">
						<label for="password" class="form-label mt-2">์ํธ ๋ณ๊ฒฝ /
							Password</label> <input type="password" class="form-control"
							id="password" name="password" placeholder="Password"
							aria-describedby="passHelp"> <small id="passHelp"
							class="form-text text-muted">์ํธ๋ ์๋ฌธ ๋/์๋ฌธ์, ์ซ์๋ฅผ ๋ชจ๋ ํฌํจํ 8์๋ฆฌ
							์ด์ 20์๋ฆฌ ์ดํ๋ง ์ฌ์ฉ ๊ฐ๋ฅํฉ๋๋ค.</small>
					</div>
					<div class="pass_re1">์ํธ์ ์ํธํ์ธ์ด ์ผ์นํฉ๋๋ค</div>
					<div class="pass_re2">์ํธ์ ์ํธํ์ธ์ด ์๋ก ๋ค๋ฆ๋๋ค.</div>
					<div class="passValid"></div>
					<div class="form-group">
						<label for="password2" class="form-label mt-2">์ํธ ํ์ธ /
							Check Password</label> <input type="password" class="form-control mb-2"
							id="password2" name="password2" placeholder="Password">
					</div>

					<div class="form-group row mt-2">
						<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="text" disabled="disabled"
								class="form-control-plaintext" id="staticEmail"
								value="${member.email }">
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="form-label mt-2">Email ๋ณ๊ฒฝ</label> <input
							type="email" class="form-control" id="email" name="email"
							aria-describedby="emailHelp" placeholder="example@email.com"
							aria-describedby="emailHelp"> <small id="emailHelp"
							class="form-text text-muted">์ด๋ฉ์ผ์ ๋น๋ฐ๋ฒํธ ์ฐพ๊ธฐ ๋ฐ ์ธ์ฆ์ ์ฌ์ฉ๋์ค๋ ์ ํจํ
							์ด๋ฉ์ผ์ ์๋ ฅํด์ฃผ์ธ์.</small>
					</div>
					<div class="email_re1">์ฌ์ฉ ๊ฐ๋ฅํ ์ด๋ฉ์ผ ์๋๋ค.</div>
					<div class="email_re2">์ด๋ฏธ ์ฌ์ฉ์ค์ธ ์ด๋ฉ์ผ ์๋๋ค.</div>
					<div class="email_re3">์ฌ์ฉ ํ  ์ ์๋ ์ด๋ฉ์ผ ์๋๋ค.</div>

					<div class="form-group">
						<label class="form-label mt-1"></label>
						<div class="input-group">
							<input class="form-control" id="emailCodeInput" type="text"
								name="emailCodeInput" placeholder="์ธ์ฆ๋ฒํธ๋ฅผ ์๋ ฅํด์ฃผ์ธ์"
								disabled="disabled"> <span class="btn btn-primary"
								id="emailChk">์ธ์ฆํ๊ธฐ</span>
						</div>
						<div class="point successEmailChk"></div>
						<input type="hidden" id="emailDoubleChk" name="emailDoubleChk"
							value="" />
					</div>
					<div class="form-group row mt-3">
						<label class="col-sm-2 col-form-label">ํ์ฌ ์ฃผ์ </label>
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" id="birth"
								name="birth" readonly="readonly"
								aria-describedby="button-addon2" value="${member.address }">
						</div>
					</div>

					<div class="form-group">
						<label class="form-label mt-2">์๋ก์ด ์ฃผ์ / Address</label>
						<div class="input-group">
							<input class="form-control" style="width: 40%; display: inline;"
								placeholder="์ฐํธ๋ฒํธ" name="postCode" id="postCode" type="text"
								readonly="readonly">
							<button type="button" class="btn btn-primary" id="addressFinder"
								onclick="execPostCode();">์ฐํธ๋ฒํธ ์ฐพ๊ธฐ</button>
						</div>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="๋๋ก๋ช ์ฃผ์"
							name="roadAddress" id="roadAddress" type="text"
							readonly="readonly" />
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="์์ธ์ฃผ์"
							name="detailAddress" id="detailAddress" type="text" />
					</div>

					<div align="center" style="margin-top: 20px;">
						<button type="submit" class="btn btn-primary">๊ณ์</button>
					</div>
				</fieldset>
			</form>
			<div>
				<a id="leaveBtn" class="btn btn-link">ํ์ ํํด</a>
				<div class="leaveCheck" style="display: none;">
					<form action="deleteMember.do" method="post">
						<div class="form-group">
							<label for="password" class="form-label mt-2">์ํธ /
								Password</label> <input type="password" class="form-control" id="lvPass"
								name="lvPass" placeholder="Password" aria-describedby="passHelp">
						</div>
						<div class="form-group">
							<label for="password2" class="form-label mt-2">์ํธ ํ์ธ /
								Check Password</label> <input type="password" class="form-control mb-2"
								id="lvPass2" name="lvPass2" placeholder="Password">
						</div>
						<small id="" class="form-text text-muted"></small>
						<div class="form-group" align="center">
							<input type="submit" class="btn btn-dark" value="Leave!">
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
	<footer><jsp:include page="../layout/footer.jsp"></jsp:include></footer>
</body>
<script type="text/javascript">
	$('#password2').on("propertychange change keyup paste input", function() {
		var password2 = $('#password2').val(); // password์ ์๋ ฅ๋๋ ๊ฐ
		var password = $('#password').val();
		var data = {
			password : password,
			password2 : password2
		} // '์ปจํธ๋กค์ ๋๊ธธ ๋ฐ์ดํฐ ์ด๋ฆ' : '๋ฐ์ดํฐ(.input์ ์๋ ฅ๋๋ ๊ฐ)'

		$.ajax({
			type : "post",
			url : "passChk.do",
			data : data,
			success : function(result) {

				if (result != 'fail') {
					$('.pass_re1').css("display", "inline");
					$('.pass_re2').css("display", "none");
				} else {
					$('.pass_re2').css("display", "inline");
					$('.pass_re1').css("display", "none");
				}
			}// success ์ข๋ฃ
		}); // ajax ์ข๋ฃ	
	});
	var code = "";
	$("#emailChk").click(function() {
		var email = $("#email").val();
		$.ajax({
			type : "GET",
			url : "mailChk.do?email=" + email,
			cache : false,
			success : function(data) {
				if (data == "error") {
					alert("์ด๋ฉ์ผ ์ฃผ์๊ฐ ์ฌ๋ฐ๋ฅด์ง ์์ต๋๋ค. ์ ํจํ ์ด๋ฉ์ผ ์ฃผ์๋ฅผ ์๋ ฅํด์ฃผ์ธ์.");
					$("#emailCodeInput").attr("autofocus", true);
					$(".successEmailChk").text("์ ํจํ ์ด๋ฉ์ผ ์ฃผ์๋ฅผ ์๋ ฅํด์ฃผ์ธ์.");
					$(".successEmailChk").css("color", "red");
				} else {
					alert("์ธ์ฆ๋ฒํธ ๋ฐ์ก์ด ์๋ฃ๋์์ต๋๋ค.\n์๋ ฅํ ์ด๋ฉ์ผ์์ ์ธ์ฆ๋ฒํธ ํ์ธ์ ํด์ฃผ์ญ์์ค.");
					$("#emailCodeInput").attr("disabled", false);
					$(".successEmailChk").text("์ธ์ฆ๋ฒํธ๋ฅผ ์๋ ฅํ ๋ค ์ด๋ฉ์ผ ์ธ์ฆ์ ๋๋ฌ์ฃผ์ญ์์ค.");
					$(".successEmailChk").css("color", "green");
					code = data;
				}
			}
		});
	});
	$("#emailCodeInput")
			.on(
					"propertychange chagne keyup paste input",
					function() {
						if ($("#emailCodeInput").val() == code) {
							$(".successEmailChk").text("์ธ์ฆ๋ฒํธ๊ฐ ์ผ์นํฉ๋๋ค.");
							$(".successEmailChk").css("color", "green");
							$("#emailDoubleChk").val("true");
							$("#sm_email2").attr("disabled", true);
							//$("#sm_email").attr("disabled",true);
						} else {
							$(".successEmailChk").text(
									"์ธ์ฆ๋ฒํธ๊ฐ ์ผ์นํ์ง ์์ต๋๋ค. ํ์ธํด์ฃผ์๊ธฐ ๋ฐ๋๋๋ค.");
							$(".successEmailChk").css("color", "red");
							$("#emailDoubleChk").val("false");
							$("#sm_email2").attr("autofocus", true);
						}
					});
	$("#leaveBtn").click(function() {
		let con = confirm("์ ๋ง ํํดํ์๊ฒ ์ต๋๊น?");
		if(con){
			$(".leaveCheck").css("display", "block");
		}
	});
	$('#lvPass2').on("propertychange change keyup paste input", function() {
		var password2 = $('#lvPass2').val(); // password์ ์๋ ฅ๋๋ ๊ฐ
		var password = $('#lvPass').val();
		var data = {
			password : password,
			password2 : password2
		} // '์ปจํธ๋กค์ ๋๊ธธ ๋ฐ์ดํฐ ์ด๋ฆ' : '๋ฐ์ดํฐ(.input์ ์๋ ฅ๋๋ ๊ฐ)'

		$.ajax({
			type : "post",
			url : "passChk.do",
			data : data,
			success : function(result) {

				if (result != 'fail') {
					$('.lvpass_re1').css("display", "inline");
					$('.lvpass_re2').css("display", "none");
				} else {
					$('.lvpass_re2').css("display", "inline");
					$('.lvpass_re1').css("display", "none");
				}
			}// success ์ข๋ฃ
		}); // ajax ์ข๋ฃ	
	});
	
</script>
</html>