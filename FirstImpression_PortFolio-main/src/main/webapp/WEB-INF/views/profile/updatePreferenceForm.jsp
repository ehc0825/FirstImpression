<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>πμ²«μΈμ - First Impression</title>

<link rel="icon" type="image/x-icon"
	href="${path}/resources/design/favicon.ico" />
<style type="text/css">
.mainContainer {
	margin-top: 75px;
	padding: 50px;
}
</style>

<script type="text/javascript">

$(function() {
	$('#filterText').keyup(function(event) {
	        var val = $(this).val().toUpperCase();			        
        if (val == "") {
            $('.search').show();
        } else {
            $('.search').hide();
            $(".search:contains('"+val+"')").show();
	        }
    });
});
</script>

</head>
<body>
	<header><jsp:include page="../layout/header.jsp"></jsp:include></header>
	<div class="container">
		<section class="mainContainer">
			<form action="updatePreference.do" method="post" name="frm"
				onsubmit="return chk()">
				<input type="hidden" name="nick" value="${profile.nick }">
				<fieldset>
					<legend>${profile.nick }λμ Preference</legend>

					<label for="" class="form-label mt-4">μλμ μ°λ Ήλ</label> <br>
					<c:if test="${preference.minAge != 0 }">
						<label for="" class="form-label mt-2">μ΅μ λμ΄ : <span
							id="showMinAge"></span></label>
						<input type="range" class="form-range" min="20" max="99"
							value="${preference.minAge }" step="1" id="minAge" name="minAge">
						<label for="" class="form-label mt-2">μ΅λ λμ΄ : <span
							id="showMaxAge"></span></label>
						<input type="range" class="form-range" min="20" max="99"
							value="${preference.maxAge }" step="1" id="maxAge" name="maxAge">
					</c:if>

					<c:if test="${preference.minAge == 0}">
						<label for="" class="form-label mt-2">μ΅μ λμ΄ : <span
							id="showMinAge"></span></label>
						<input type="range" class="form-range" min="20" max="99"
							value="20" step="1" id="minAge" name="minAge">
						<label for="" class="form-label mt-2">μ΅λ λμ΄ : <span
							id="showMaxAge"></span></label>
						<input type="range" class="form-range" min="20" max="99"
							value="99" step="1" id="maxAge" name="maxAge">
					</c:if>
				</fieldset>
				<fieldset class="form-group">
					<label for="" class="col-sm-2 col-form-label mt-2">μλμ μ±λ³</label>
					<c:if test="${preference.gender eq 'male' }">
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="gender" id="optionsRadios1"
							value="male" checked="checked"> λ¨μ±
						</label>
					</div>
					</c:if>
					<c:if test="${preference.gender ne 'male' }">
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="gender" id="optionsRadios1"
							value="male"> λ¨μ±
						</label>
					</div>
					</c:if>
					<c:if test="${preference.gender eq 'female' }">
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="gender" id="optionsRadios2"
							value="female" checked="checked"> μ¬μ±
						</label>
					</div>
					</c:if>
					<c:if test="${preference.gender ne 'female' }">
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="gender" id="optionsRadios2"
							value="female"> μ¬μ±
						</label>
					</div>
					</c:if>
					<c:if test="${preference.gender eq 'both' || preference.gender eq null }">
					<div class="form-check disabled">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="gender" id="optionsRadios3"
							value="both" checked="checked"> λͺ¨λ
						</label>
					</div>
					</c:if>
					
					<c:if test="${preference.gender ne 'both' && preference.gender ne null }">
					<div class="form-check disabled">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="gender" id="optionsRadios3"
							value="both"> λͺ¨λ
						</label>
					</div>
					</c:if>
					
				</fieldset>
				<fieldset class="form-group">
					<legend class="mt-4">μλλ°©μ κ΄μ¬μ¬ (μκ΄μμ νΉμ 1κ° μ ν κ°λ₯ ν©λλ€.)</legend>
					<p><input class="form-control" style="width:35%" type="text" id="filterText" placeholder="μνλ νκ·Έ κ²μ"></p>
					<p>&nbsp;</p>
					
					<c:if test="${preference.tag eq null }">
						<input class="btn-check" type="radio" value="None" id="tagNone"
							name="tag" checked="checked">
						<label class="btn btn-outline-secondary btn-sm mt-2" for="tagNone">μκ΄
							μμ</label>
					</c:if>
					<c:if test="${preference.tag ne null }">
						<input class="btn-check" type="radio" value="None" id="tagNone"
							name="tag">
						<label class="btn btn-outline-secondary btn-sm mt-2" for="tagNone">μκ΄
							μμ</label>
					</c:if>
					<div class="row" id="tagList">
						<c:if test="${not empty myTag }">
							<div class="search col-lg-2">
								<input class="btn-check" type="radio" value="${myTag }"
									id="${myTag }" name="tag" checked="checked"><label
									class="btn btn-outline-secondary btn-sm mt-1" for="${myTag }">${myTag }</label>
							</div>
						</c:if>
						<c:forEach var="tags" items="${tags }">
							<div class="search col-lg-2">
								<input class="btn-check" type="radio" value="${tags }"
									id="${tags }" name="tag"><label
									class="btn btn-outline-secondary btn-sm mt-1" for="${tags }">${tags }</label>
							</div>
						</c:forEach>
					</div>

				</fieldset>
				<div class="form-group" align="center">
					<label for="" class="form-label mt-4"> </label> <input
						type="submit" class="btn btn-primary" value="μμ  μλ£">
				</div>
			</form>
		</section>

	</div>
	<footer><jsp:include page="../layout/footer.jsp"></jsp:include></footer>
	<script type="text/javascript">
		var minAge = document.getElementById("minAge");
		var maxAge = document.getElementById("maxAge");

		var showMinAge = document.getElementById("showMinAge");
		var showMaxAge = document.getElementById("showMaxAge");

		showMinAge.innerHTML = frm.minAge.value;
		showMaxAge.innerHTML = frm.maxAge.value;

		minAge.oninput = function() {
			showMinAge.innerHTML = this.value;
		}
		maxAge.oninput = function() {
			showMaxAge.innerHTML = this.value;
		}
		function chk() {
			if(frm.maxAge.value<=frm.minAge.value){
				alert("μ΅μ λμ΄λ μ΅λ λμ΄λ³΄λ€ ν΄ μ μμ΅λλ€.");
				return false;
			}
		}
		
	</script>
</body>
</html>