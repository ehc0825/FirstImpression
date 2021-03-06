<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<c:set value="${profile.nick }" var="UserNick"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>πμ²«μΈμ - First Impression</title>
<link rel="icon" type="image/x-icon"
	href="${path}/resources/design/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/bootstrap/css/bootstrap.watch.css">
<script type="text/javascript">
	function upReply(replyNum) {
		var reUpdateForm = document.getElementById("reUpdateForm" + replyNum);
		reUpdateForm.style.display = "block";
	}
	function closeUpdate(replyNum) {
		var reUpdateForm = document.getElementById("reUpdateForm" + replyNum);
		reUpdateForm.style.display = "none";
	}
	function reReply(replyNum) {
		var reReplyForm = document.getElementById("reReplyForm" + replyNum);
		reReplyForm.style.display = "block";
	}
	function closeReRe(replyNum) {
		var reReplyForm = document.getElementById("reReplyForm" + replyNum);
		reReplyForm.style.display = "none";
	}
	function suspendFboard() {
		var con = confirm("κ²μκΈμ μ μ§νμκ² μ΅λκΉ?");
		if (con) {
			location.href = "suspendFboard.fb?fbNum=${fboard.fbNum}";
		}
	}
</script>
<style type="text/css">
page-section {
	color: black !important;
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: transparent;
	background-clip: border-box;
	border: 1px solid rgba(255, 255, 255, .2);
	border-radius: .5rem;
	color: black;
}

.reBtn, .upBtn, .delBtn {
	cursor: pointer;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="../layout/header.jsp"></jsp:include>
	</header>
	<div class="bs-docs-section">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4 mb-2">
				<div class="page-section mb-2">
					<div class="card mb-3">
						<h3 class="card-header">${anoFeed.anTitle }
							<a href="reportuser.do?nick=${profile.nick }"
								class="btn btn-primary btn-sm mt-1" style="float: right;">μ κ³ π¨</a>
						</h3>
						<div class="card-footer">
							<c:if test="${anoFeed.anCheck eq 'y' }">
								<img src="resources/pic/anonymous.png" alt="anonymous"
									width="50" height="50" class="rounded-circle">
								<span class="badge rounded-pill bg-secondary">μ΅λͺ</span>
							</c:if>
							<c:if test="${anoFeed.anCheck ne 'y'}">
								<a href="userProfile.do?nick=${anoFeed.profile.nick }" style="text-decoration: none;">
								<c:if test="${anoFeed.profile.photo1 eq null }">
									<img src="resources/pic/sample.png" alt="user"
									width="50" height="50" class="rounded-circle">
								</c:if>
								<c:if test="${anoFeed.profile.photo1 ne null }">
									<img src="resources/profiles/${anoFeed.profile.photo1 }" alt="user"
									width="50" height="50" class="rounded-circle">
								</c:if>  
								</a>	
								<span class="btn btn-primary btn-sm mt-1">${anoFeed.nick}</span>
							</c:if>

							<c:if test="${anoFeed.likeChk eq 'y' }">
								<a idx="${anoFeed.anNum }" href="javascript:"
									class="heart-click heart_icon${anoFeed.anNum }"><svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-suit-heart-fill"
										viewBox="0 0 16 16">
														<path
											d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
													</svg></a>
							</c:if>
							<c:if test="${anoFeed.likeChk ne 'y' }">
								<a idx="${anoFeed.anNum }" href="javascript:"
									class="heart-click heart_icon${anoFeed.anNum }"><svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-suit-heart"
										viewBox="0 0 16 16">
														<path
											d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
													</svg></a>
							</c:if>
							<span id="like${anoFeed.anNum }">${anoFeed.likeCount }</span> <span
								class="col-5"> <c:if test="${anoFeed.nick eq UserNick }">
									<button class="btn btn-primary btn-sm mt-1"
										onclick="delFeed('${anoFeed.anNum}')" style="float: right;">μ­μ </button>
									<a href="anoFeedUpdateForm.do?anNum=${anoFeed.anNum }"
										class="btn btn-primary btn-sm mt-1"
										style="text-decoration: none; float: right;">μμ </a>
								</c:if>
							</span>
						</div>
						<div class="card-footer">
							<c:if test="${empty anoFeed.hashTag }">
								<span class="badge rounded-pill bg-secondary">μ€μ λ ν΄μνκ·Έκ°
									μμ΅λλ€</span>
							</c:if>
							<c:if test="${not empty anoFeed.hashTag  }">
								<c:forEach var="hashTag" items="${anoFeed.hashTag }">
									<span class="btn btn-primary btn-sm mt-1">#${hashTag.tag}</span>
								</c:forEach>
							</c:if>
						</div>
						<c:if test="${anoFeed.photo ne null }">
							<img height="auto" id="photo"
								src="resources/feed/${anoFeed.photo}" alt="μ΄λ―Έμ§">
						</c:if>
						
						<div class="card-body">
							<pre>${ anoFeed.anContent}</pre>
						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-lg-12">
									&nbsp;&nbsp; <input class="form-check-input mb-1"
										type="checkbox" name="rpCheck" value="y"
										id="rpCheck${anoFeed.anNum }"> <label
										class="text-muted mb-1" for="rpCheck${anoFeed.anNum }">μ΅λͺ
										π­</label>
									<div class="input-group" style="margin-left: 2.5%; width: 95%;">
										<input type="text" class="form-control form-control-sm ml-1"
											name="replyContent" id="replyContent${anoFeed.anNum }"
											aria-describedby="rpBtn${anoFeed.anNum }"> <a
											idx="${anoFeed.anNum }"
											class="rpbtn btn btn-primary btn-sm mr-1" href="javascript:"
											id="rpBtn${anoFeed.anNum }">κ²μ</a>
									</div>
								</div>
							</div>
							<div id="reply-list${anoFeed.anNum }">
								<div id="replyCount${anoFeed.anNum }">
									<span class="text-muted mt-3">λκΈ μ΄
										${anoFeed.replyCount}κ°</span>
								</div>
								<br>
								<c:if test="${not empty anoFeed.reply  }">
									<c:set var="i" value="1"></c:set>
									<c:forEach items="${anoFeed.reply }" var="reply">
										<c:if test="${reply.replyDel eq 'n' }">
											<div class="row">
												<div class="col-6 mt-1">
													<c:if test="${reply.rpCheck eq 'y'}">
														<c:if test="${reply.ref_step eq 1 }">
														&nbsp;&nbsp;&nbsp;					
													</c:if>
														<img src="resources/pic/anonymous.png" alt="anonymous"
															width="30" height="30" class="rounded-circle">
														<span class="text-muted"> μ΅λͺ </span>
													</c:if>
													<c:if test="${reply.rpCheck ne 'y'}">
														<c:if test="${reply.ref_step eq 1 }">
														&nbsp;&nbsp;&nbsp;					
													</c:if>
														<a href="userProfile.do?nick=${reply.nick }"
															style="text-decoration: none;"> <img
															src="resources/profiles/${reply.profile.photo1 }"
															alt="user" width="30" height="30" class="rounded-circle">
															<span class="text-muted"> ${reply.nick} </span>
														</a>
													</c:if>
												</div>
												<div class="col-1"></div>
												<div class="col-5 mt-1">
													<c:if test="${reply.ref_step eq 1 }">
														&nbsp;&nbsp;&nbsp;					
													</c:if>
													<c:if test="${reply.ref_step ne 1 }">
														<span class="reBtn" onclick="reReply('${reply.rpNum}')">λ΅κΈ</span>
													</c:if>
													<c:if test="${reply.nick eq UserNick }">
														<span class="upBtn" onclick="upReply('${reply.rpNum}')">μμ </span>
														<a idx="${reply.rpNum }" class="delBtn" href="javascript:"
															style="text-decoration: none;">μ­μ </a>
													</c:if>
												</div>
											</div>
											<div></div>
											<c:if test="${reply.ref_step eq 1 }">
												<div class="row">
													<div class="col-1"></div>
													<div class="col-10 mt-1" id="replyContent${reply.rpNum }">
														<span>${reply.replyContent}</span>
													</div>
													<div class="col-1"></div>
												</div>
											</c:if>
											<c:if test="${reply.ref_step ne 1 }">
												<div class="mt-1" id="replyContent${reply.rpNum }">
													<span>${reply.replyContent}</span>
												</div>
											</c:if>
											<form id="reUpdateForm${reply.rpNum }"
												name="reUpdateForm${reply.rpNum }" method="post"
												style="display: none;">
												&nbsp;&nbsp;
												<c:if test="${reply.rpCheck eq 'y' }">
													<input class="form-check-input mb-1" type="checkbox"
														name="updateChecked" value="y"
														id="updateChecked${reply.rpNum }" checked="checked">
													<label class="text-muted mb-1"
														for="updateCheck${reply.rpNum }">μ΅λͺ π­</label>
												</c:if>
												<c:if test="${reply.rpCheck eq 'n' }">
													<input class="form-check-input mb-1" type="checkbox"
														name="updateCheck" value="y"
														id="updateCheck${reply.rpNum }">
													<label class="text-muted mb-1"
														for="updateCheck${reply.rpNum }">μ΅λͺ π­</label>
												</c:if>
												<div class="input-group"
													style="margin-left: 2.5%; width: 95%;">
													<input type="text"
														class="form-control form-control-sm ml-1"
														name="replyContent" id="updateContent${reply.rpNum }"
														value="${reply.replyContent }"> <a
														idx="${reply.rpNum }"
														class="updateBtn btn btn-primary btn-sm"
														href="javascript:" id="updateBtn${reply.rpNum }">μλ£</a> <span
														class="btn btn-primary btn-sm"
														onclick="closeUpdate('${reply.rpNum}')">μ·¨μ</span>
												</div>
											</form>
											<form id="reReplyForm${reply.rpNum }"
												name="reReplyForm${reply.rpNum }" method="post"
												style="display: none;">
												&nbsp;&nbsp; <input class="form-check-input mb-1"
													type="checkbox" name="reRpCheck" value="y"
													id="reRpCheck${reply.rpNum }"> <label
													class="text-muted mb-1" for="reRpCheck${reply.rpNum }">μ΅λͺ
													π­</label>
												<div class="input-group"
													style="margin-left: 2.5%; width: 95%;">
													<input type="text"
														class="form-control form-control-sm ml-1"
														name="reReplyContent" id="reReplyContent${reply.rpNum }"
														aria-describedby="reRpBtn${reply.rpNum }"> <a
														idx="${reply.rpNum }"
														class="reRpbtn btn btn-primary btn-sm mr-1"
														href="javascript:" id="reRpBtn${reply.rpNum }">κ²μ</a> <span
														class="btn btn-primary btn-sm"
														onclick="closeReRe('${reply.rpNum}')">μ·¨μ</span>
												</div>
											</form>
											<div class="mt-2"></div>
										</c:if>
										<c:if test="${reply.replyDel eq 'y' }">
											<div></div>
											<div class="text-muted mt-2 mb-2">μ­μ λ λκΈμλλ€.</div>
											<div></div>
										</c:if>
										<c:set var="i" value="${i+1}"></c:set>
									</c:forEach>

								</c:if>
								<c:if test="${empty anoFeed.reply  }">
									<span class="text-muted">λκΈμ΄ μμ΅λλ€.</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<footer>
		<jsp:include page="../layout/footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	$(".heart-click")
			.click(
					function() {
						// κ²μλ¬Ό λ²νΈ(no)λ₯Ό idxλ‘ μ λ¬λ°μ μ μ₯ν©λλ€.
						let no = $(this).attr('idx');

						// λΉννΈλ₯Ό λλ μλ
						if ($(this).children('svg').attr('class') == "bi bi-suit-heart") {

							$.ajax({
								url : 'addLike.do',
								type : 'get',
								data : {
									no : no,
								},
								success : function(likeCount) {

									var heart = likeCount;

									// νμ΄μ§, λͺ¨λ¬μ°½μ ννΈμ κ°±μ 
									$('#like' + no).text(heart);

								},
								error : function() {
									alert('μλ² μλ¬');
								}
							});

							// κ½μ°¬ννΈλ‘ λ°κΎΈκΈ°
							$(this)
									.html(
											"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");
							$('.heart_icon' + no)
									.html(
											"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");

							// κ½μ°¬ ννΈλ₯Ό λλ μ λ
						} else if ($(this).children('svg').attr('class') == "bi bi-suit-heart-fill") {

							$.ajax({
								url : 'removeLike.do',
								type : 'get',
								data : {
									no : no,
								},
								success : function(likeCount) {

									let heart = likeCount;
									// νμ΄μ§, λͺ¨λ¬μ°½μ ννΈμ κ°±μ 
									$('#like' + no).text(heart);

								},
								error : function() {
									alert('μλ² μλ¬');
								}
							});

							// λΉννΈλ‘ λ°κΎΈκΈ°
							$(this)
									.html(
											'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');

							$('.heart_icon' + no)
									.html(
											'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');
						}

					});
	$(".updateBtn").click(
			function() {
				// κ²μλ¬Ό λ²νΈ(no)λ₯Ό idxλ‘ μ λ¬λ°μ μ μ₯ν©λλ€.
				let rpNum = $(this).attr('idx');
				let rpCheck;
				let replyContent = $('#updateContent' + rpNum).val();
				if ($('#updateCheck' + rpNum).is(':checked')) {
					rpCheck = 'y'
				} else {
					rpCheck = 'n'
				}
				if (replyContent == " " || replyContent == "" || replyContent == null || replyContent == "  " || replyContent == "    ") {
					alert("λκΈμ λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ");
					return false;
				}
				
				$.ajax({
					url : 'updateReply.do',
					type : 'post',
					data : {
						rpNum : rpNum,
						rpCheck : rpCheck,
						replyContent : replyContent
					},
					success : function(replyCount) {
						location.reload();

					},

					error : function() {
						alert('μλ² μλ¬');
					}
				});
			});
	$(".rpbtn").click(
			function() {
				let no = $(this).attr('idx');
				let rpCheck;
				let replyContent = $('#replyContent' + no).val();
				if ($('#rpCheck'+no).is(':checked')) {
					rpCheck = 'y'
				} else {
					rpCheck = 'n'
				}
				if (replyContent == " " || replyContent == "" || replyContent == null || replyContent == "  " || replyContent == "    ") {
					alert("λκΈμ λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ");
					return false;
				}
				if (typeof rpCheck == 'undefined' || rpCheck == null
						|| rpCheck == '') {
					rpCheck = "n";
				}
				$.ajax({
					url : 'insertReply.do',
					type : 'post',
					data : {
						no : no,
						rpCheck : rpCheck,
						replyContent : replyContent
					},
					success : function(replyCount) {

						location.reload();
					},

					error : function() {
						alert('μλ² μλ¬');
					}
				});
			});
	$(".delBtn").click(
			function() {
				let rpNum = $(this).attr('idx');
				$.ajax({
					url : 'deleteReply.do',
					type : 'GET',
					data : {
						rpNum : rpNum,
					},
					success : function(replyCount) {

						location.reload();
					},

					error : function() {
						alert('μλ² μλ¬');
					}
				});
			});
	$(".reRpBtn").click(
			function() {
				// κ²μλ¬Ό λ²νΈ(no)λ₯Ό idxλ‘ μ λ¬λ°μ μ μ₯ν©λλ€.
				let ref = $(this).attr('idx');
				let rpCheck;
				let replyContent = $('#reReplyContent' + ref).val();
				if ($('#reRpCheck' + ref).is(':checked')) {
					rpCheck = 'y'
				} else {
					rpCheck = 'n'
				}
				if (replyContent == " " || replyContent == "" || replyContent == null || replyContent == "  " || replyContent == "    ") {
					alert("λκΈμ λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ");
					return false;
				}

				if (typeof rpCheck == 'undefined' || rpCheck == null
						|| rpCheck == '') {
					rpCheck = "n";
				}
				$.ajax({
					url : 'insertReReply.do',
					type : 'post',
					data : {
						ref : ref,
						rpCheck : rpCheck,
						replyContent : replyContent
					},
					success : function(replyCount) {

						location.reload();
					},

					error : function() {
						alert('μλ² μλ¬');
					}
				});
			});
</script>
</html>