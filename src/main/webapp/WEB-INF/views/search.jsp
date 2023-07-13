<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header.jsp"%>

<!-- 페이징처리 자바스크립트 ------------------------------------------------>
<script>
	$(document).ready(function() {
		var moveForm = $("#moveForm");

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/search");
			moveForm.submit();

		});
		
		// 목록개수 변경 이벤트
		$("#amount").on("change", function(){
			var selectedText = $(this).find("option:selected").val();	

			moveForm.find("input[name='amount']").val(selectedText).attr("href");
			moveForm.submit();
		});
		
	
		//장르 체크박스 이벤트
		$(".checkbox-label").on("click", function(){
			var checkGenre = $(this).find("input[type='checkbox']").val();
			moveForm.find("input[name='genre']").val(checkGenre).attr("href");
			moveForm.submit();
		});		
	});

</script>
<!-- 페이징처리 자바스크립트 -->



<!--- 서브컨텐츠 시작 ----------->
<!--검색창 ----------------------------------------------->
<div class="search-con con-wrap">
	<form class="search-keywordBOx">
		<label class="search-label"> <input type="text" name="keyword"
			value="${pageMaker.cri.keyword}" class="input-field input-search"
			maxlength="100">
			<button class="search-bt">
				<i class="fa fa-search"></i>
			</button>
		</label>
	</form>
	<!--검색창 끝  -->
	<!--  장르 체크박스 ------------------------------------------------------------------------- -->
	<section id="search-option">
		<form id = "listForm" >			
		<div class="genre-wrap">
				<ul>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="act" <c:if test="${pageMaker.cri.genre eq 'act'}">checked</c:if>> 액션
							<c:choose>
								<c:when test="${getTotalact != 0}">
									<span class="searchCount">(<c:out value="${getTotalact}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(0)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="ani" <c:if test="${pageMaker.cri.genre eq 'ani'}">checked</c:if>> 애니메이션
								<c:choose>
								<c:when test="${getTotalani != 1}">
									<span class="searchCount">(<c:out value="${getTotalani}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(1)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="comedy" <c:if test="${pageMaker.cri.genre eq 'comedy'}">checked</c:if>> 코미디
								<c:choose>
								<c:when test="${getTotalcomedy != 2}">
									<span class="searchCount">(<c:out value="${getTotalcomedy}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(2)</span>
								</c:otherwise>
							</c:choose>
						</label>
						</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="crime" <c:if test="${pageMaker.cri.genre eq 'crime'}">checked</c:if>> 범죄
								<c:choose>
								<c:when test="${getTotalcrime!= 3}">
									<span class="searchCount">(<c:out value="${getTotalcrime}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(3)</span>
								</c:otherwise>
							</c:choose>
						</label>
						</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="docu" <c:if test="${pageMaker.cri.genre eq 'docu'}">checked</c:if>> 다큐멘터리
								<c:choose>
								<c:when test="${getTotaldocu != 4}">
									<span class="searchCount">(<c:out value="${getTotaldocu}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(4)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="drama" <c:if test="${pageMaker.cri.genre eq 'drama'}">checked</c:if>> 드라마
								<c:choose>
								<c:when test="${getTotaldrama != 5}">
									<span class="searchCount">(<c:out value="${getTotaldrama}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(5)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="family" <c:if test="${pageMaker.cri.genre eq 'family'}">checked</c:if>> 가족
								<c:choose>
								<c:when test="${getTotalfamily != 6}">
									<span class="searchCount">(<c:out value="${getTotaldrama}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(6)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="fantasy" <c:if test="${pageMaker.cri.genre eq 'fantasy'}">checked</c:if>> 판타지
								<c:choose>
								<c:when test="${getTotalfantasy != 7}">
									<span class="searchCount">(<c:out value="${getTotalfantasy}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(7)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="horror" <c:if test="${pageMaker.cri.genre eq 'horror'}">checked</c:if>> 공포
								<c:choose>
								<c:when test="${getTotalhorror != 8}">
									<span class="searchCount">(<c:out value="${getTotalhorror}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(8)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="history" <c:if test="${pageMaker.cri.genre eq 'history'}">checked</c:if>> 역사
								<c:choose>
								<c:when test="${getTotalhistory != 9}">
									<span class="searchCount">(<c:out value="${getTotalhistory}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(9)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="music" <c:if test="${pageMaker.cri.genre eq 'music'}">checked</c:if>> 음악
								<c:choose>
								<c:when test="${getTotalmusic != 10}">
									<span class="searchCount">(<c:out value="${getTotalmusic}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(10)</span>
								</c:otherwise>
							</c:choose> 
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="romance" <c:if test="${pageMaker.cri.genre eq 'romance'}">checked</c:if>> 로맨스
								<c:choose>
								<c:when test="${getTotalromance != 11}">
									<span class="searchCount">(<c:out value="${getTotalromance}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(11)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="SF" <c:if test="${pageMaker.cri.genre eq 'SF'}">checked</c:if>> SF
								<c:choose>
								<c:when test="${getTotalSF != 12}">
									<span class="searchCount">(<c:out value="${getTotalSF}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(12)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label">
							<input type="checkbox" value="sports" <c:if test="${pageMaker.cri.genre eq 'sports'}">checked</c:if>> 스포츠
								<c:choose>
								<c:when test="${getTotalsports != 13}">
									<span class="searchCount">(<c:out value="${getTotalsports}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(13)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label"> 
							<input type="checkbox" value="thrill" <c:if test="${pageMaker.cri.genre eq 'thrill'}">checked</c:if>> 스릴
								<c:choose>
								<c:when test="${getTotalthrill != 14}">
									<span class="searchCount">(<c:out value="${getTotalthrill}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(14)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
					<li>
						<label class="checkbox-label"> 
							<input type="checkbox" value="war" <c:if test="${pageMaker.cri.genre eq 'war'}">checked</c:if>> 전쟁
								<c:choose>
								<c:when test="${getTotalwar != 15}">
									<span class="searchCount">(<c:out value="${getTotalwar}"/>)</span>
								</c:when>
								<c:otherwise>
									<span class="searchCount">(15)</span>
								</c:otherwise>
							</c:choose>
						</label>
					</li>
				</ul>
			</div>
 			<div class="cate-wrap" >
				<ul class="category-select">
					<li value="search-label" class="<c:if test='${pageMaker.cri.keyword2 == null}'>active</c:if>"><a href = "/search?keyword=${pageMaker.cri.keyword}">전체 <span class="searchCount">(<c:out value="${getTotal}"/>)</span></a></li>
					<li class="<c:if test='${pageMaker.cri.keyword2 eq "m"}'>active</c:if>">
						<a href = "/search?keyword=${pageMaker.cri.keyword}&keyword2=m">영화 
						<c:choose>
							<c:when test="${getTotalM != 0}">
								<span class="searchCount">(<c:out value="${getTotalM}"/>)</span>
							</c:when>
							<c:otherwise>
								<span class="searchCount">(0)</span>
							</c:otherwise>
						</c:choose>
						</a>
					</li>
					<li class="<c:if test='${pageMaker.cri.keyword2 eq "t"}'>active</c:if>">
						<a href = "/search?keyword=${pageMaker.cri.keyword}&keyword2=t">TV프로그램 
						<c:choose>
							<c:when test="${getTotalT != 0}">
								<span class="searchCount">(<c:out value="${getTotalT}"/>)</span>
							</c:when>
							<c:otherwise>
								<span class="searchCount">(0)</span>
							</c:otherwise>
						</c:choose>
						</a>
					</li>
				</ul>
				<!-- 목록 출력 수량 변경 --------------------->
				<select class = "form-control" id = "amount" >
					<option value="30" <c:if test="${pageMaker.cri.amount == 30}">selected="selected"</c:if>>30개</option>
					<option value="50" <c:if test="${pageMaker.cri.amount ==50}">selected="selected"</c:if>>50개</option>
					<option value="100" <c:if test="${pageMaker.cri.amount == 100}">selected="selected"</c:if>>100개</option>
				</select>
				<!-- 목록 출력 수량 변경 -->
			</div>
		</form>
	</section>
	<!--  장르 체크박스-------------->

	<!-- 전체 목록 ------------------------------------------------------------------>
	<section id="search-movie">
		
		<c:choose>
			<c:when test="${pageMaker.cri.keyword2 eq 'm'}"><h3>영화</h3></c:when>
			<c:when test="${pageMaker.cri.keyword2 eq 't'}"><h3>TV프로그램</h3></c:when>
			<c:otherwise><h3>전체	</h3></c:otherwise>
		</c:choose>
		
		<div class="search-box">
			<div class="list-wrap">
				<ul>
					<c:forEach items="${list}" var="list">
						<li>
							<div class="list-img">
								<img src="<c:out value = '${list.movieInfo_thum}' />">
							</div>
							<div class="list-title">
								<span class="title"><c:out
										value="${list.movieInfo_title}" /></span>
							</div> <a href="/movie?MovieInfo_no=<c:out value='${list.movieInfo_no}'/>" class="box-a"></a>
					</c:forEach>
				</ul>
			</div>

			<!-- 페이지번호 ------------------------------------------------------------------------>
			<div class="list-num">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a
								href="${pageMaker.startPage-1}"> prev </a></li>
						</c:if>

						<!--  각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
						</c:forEach>

						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a
								href="${pageMaker.endPage +1}"> next </a></li>
						</c:if>

					</ul>
				</div>
			</div>

			<form id='moveForm' action='/search' method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
				<input type='hidden' name = 'keyword2' value = '${pageMaker.cri.keyword2}'>
				<input type='hidden' name = 'genre' value = '${pageMaker.cri.genre}'>
			</form>
			<!-- 페이지번호 -->
		</div>
	</section>
	<!-- 영화 목록 -->
</div>
<!-- //서브컨텐츠 끝 ----------->

<%@include file="includes/footer.jsp"%>