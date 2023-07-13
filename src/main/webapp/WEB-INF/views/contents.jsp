<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@include file="includes/header.jsp"%>

<script>
//북마크 중복검사 + 등록 + 삭제
window.onload = function(){
	var operForm = $("#operForm");   
	var insertForm = $("#insertRate");
	
	var User_id = $("input[name='User_id']").val();
	var MovieInfo_no = $("input[name='MovieInfo_no']").val();
	var data = {User_id : User_id, MovieInfo_no: MovieInfo_no};
	
	$('#bookmark-btn').on('click', function(){
		if(User_id == null){
			alert("로그인을 해주세요.");
		}
	})
	
	$('#review-btn').on('click', function(){
		if(User_id == null){
			alert("로그인을 해주세요.");
		}
	})
	
    $.ajax({
		type:"post",
		url: "/bookmarkChk",
		data : data,
		success : function(result){
			console.log("보고싶어요여부 : " + result);
			
			if(result == "fail"){
				$('#bookmark-btn').addClass('active');
				$('#bookmark-btn').on('click', function(){
					operForm.attr("action","/removeBookmark").submit();
					alert("보고싶어요를 취소했습니다.");
				});
			} else {
				$('#bookmark-btn').on('click', function(){
					operForm.attr("action","/insertBookmark").submit();
					alert("보고싶어요를 등록했습니다.");
				});
			}
		},
		error : function(request, status, error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
    
    $.ajax({
		type:"post",
		url: "/rateChk",
		data : data,
		success : function(result){
			console.log("평가하기여부 : " + result);
			
			if(result == "fail"){
				$('#review-btn').addClass('active');				
			} else {
				$('#review-btn').on('click',function(){
			        $('.review-pop').show();     
			        $('.review-pop > div').addClass('pop-wrap');
			        popupCenter();
			    }); 
			}
		},
		error : function(request, status, error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}  
</script>

<!-- Youtube API -->
<script src="/resources/js/youTube.js"></script>

<!--- 서브컨텐츠 시작 ----------->
<div class="sub-con con-wrap">
	<section class="video-info">
		<div class="video-bg-wrap"
			style="background-image:url('<c:out value="${movie.movieInfo_bkimg}"/>')">
			<div class="video-bg-right"></div>
			<div class="video-bg-left"></div>
			<div class="video-bg"></div>
			<c:if test="${movie.movieInfo_video != null}">
			<div class="video-wrap" id="ytWrap" data-link='<c:out value="${movie.movieInfo_video}"/>'>
                <div id="ytplayer"></div>
            </div>  
            </c:if>
		</div>
		<div class="summary-info-wrap">
			<div class="summary-info">
				<div class="title">
					<h2>
						<c:out value="${movie.movieInfo_title}" />
					</h2>
					<span><c:out value="${movie.movieInfo_year}" /></span> <span
						class="left-line-gray cateList"> <c:forEach
							items="${cateList}" var="cateList">
							<c:out value="${cateList.categoryList_name}" />
							<strong>,</strong>
						</c:forEach>
					</span>
				</div>
				<div class="info-btn">
					<div class="btn" id="bookmark-btn">
						<i class="fa fa-bookmark-o disp-block"></i> <i
							class="fa fa-bookmark disp-none"></i> <span>보고싶어요</span>
					</div>
					<div class="btn" id="review-btn">
						<i class="fa fa-star-o disp-block"></i> <i
							class="fa fa-star disp-none"></i> <span>평가하기</span>
					</div>
				</div>
				<form id='operForm' action="/bookmark" method="post">
					<input type="hidden" name="MovieInfo_no"
						value="<c:out value='${movie.movieInfo_no}'/>">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="user_id" />
						<input type="hidden" name="User_id" value="${user_id}">
					</sec:authorize>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

			</div>
			<div class="go-site">
				<p class="title">감상 가능한 곳</p>
				<div class="btn-wrap">
					<c:if test="${movie.movieInfo_netflix != null}">
						<a id="go-netflix" class="goBtn"
							href="<c:out value='${movie.movieInfo_netflix}'/>"
							target="_blank"></a>
					</c:if>
					<c:if test="${movie.movieInfo_watcha != null}">
						<a id="go-watcha" class="goBtn"
							href="<c:out value='${movie.movieInfo_watcha}'/>" target="_blank"></a>
					</c:if>
					<c:if test="${movie.movieInfo_wavve != null}">
						<a id="go-wavve" class="goBtn"
							href="<c:out value='${movie.movieInfo_wavve}'/>" target="_blank"></a>
					</c:if>
				</div>
			</div>
			<div class="poster-img">
				<img src="${movie.movieInfo_thum}">
			</div>
		</div>
	</section>

	<section class="video-info-con">
		<dl class="text">
			<dt>연령 등급</dt>
			<dd>
				<c:out value="${movie.movieInfo_age}" />
			</dd>
			<dt>장르</dt>
			<dd class="cateList">
				<c:forEach items="${cateList}" var="cateList">
					<c:out value="${cateList.categoryList_name}" />
					<strong>,</strong>
				</c:forEach>
			</dd>
			<dt>재생시간</dt>
			<dd>
				<c:out value="${movie.movieInfo_rt}" />
			</dd>
		</dl>
		<dl class="plot">
			<dt>내용</dt>
			<dd>
				<c:out value="${movie.movieInfo_con}" />
			</dd>
		</dl>
	</section>
	<section class="video-review">
		<div class="review-wrap">
			<div class="review-title">
				<p class="title">
					<i class="fa fa-star"></i> 평가
				</p>
				<p class="average">
					평균 <i class="fa fa-star"></i> 
					<c:choose>
						<c:when test="${rateGPA != 0}">
							<strong><c:out value="${rateGPA}"/></strong>
						</c:when>
						<c:otherwise>
							<strong>0</strong>
						</c:otherwise> 
					</c:choose>
					<c:choose>
						<c:when test="${rateCount != 0}">
							<span>(<c:out value="${rateCount}"/>명)</span>
						</c:when>
						<c:otherwise>
							<span>(0명)</span>
						</c:otherwise>
					</c:choose>
				</p>
			</div>			
			<div class="review-con">
				<p class="listNull">등록된 평가가 없습니다.</p>
				<ul class="review">
					<c:forEach items="${rateList}" var="rateList">
						<li>
							<div class="title">
								<span><c:out value="${rateList.user_name}" /></span>
								<span class="review-star">
									<c:choose>
										<c:when test="${rateList.movieRate_score eq 5}">
											&#xf005 &#xf005 &#xf005 &#xf005 &#xf005
										</c:when>
										<c:when test="${rateList.movieRate_score eq 4}">
											&#xf005 &#xf005 &#xf005 &#xf005
										</c:when>
										<c:when test="${rateList.movieRate_score eq 3}">
											&#xf005 &#xf005 &#xf005
										</c:when>
										<c:when test="${rateList.movieRate_score eq 2}">
											&#xf005 &#xf005
										</c:when>
										<c:when test="${rateList.movieRate_score eq 1}">
											&#xf005
										</c:when>
									</c:choose>
								</span>
								<span class="more sm-bt" id="<c:out value='${rateList.user_id}' />">더보기</span>
							</div>
							<p><c:out value="${rateList.movieRate_con}" /></p>
							
							<!-- 평가하기팝업-더보기 시작 ----------->
							<div class="pop-wrap-bg review-more-pop">
								<div class="pop-wrap review-pop-wrap">
									<div class="pop-close-bt">
										<i class="fa fa-window-close-o" aria-hidden="true"></i>
									</div>
									<div class="title">
										<span><c:out value="${rateList.user_name}" /></span> 
										<span class="review-star">
											<c:choose>
												<c:when test="${rateList.movieRate_score eq 5}">
													&#xf005 &#xf005 &#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateList.movieRate_score eq 4}">
													&#xf005 &#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateList.movieRate_score eq 3}">
													&#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateList.movieRate_score eq 2}">
													&#xf005 &#xf005
												</c:when>
												<c:when test="${rateList.movieRate_score eq 1}">
													&#xf005
												</c:when>
											</c:choose>
										</span>
									</div>
									<textarea name="review" class="textarea-field" readonly><c:out value="${rateList.movieRate_con}" /></textarea>
								</div>
							</div>
							<!-- //평가하기팝업-더보기 끝 ----------->
						</li>
					</c:forEach>
				</ul>		
				<div class="more-w100">더보기 <i class="fa-chevron-down fa"></i></div>
                <div class="close-w100">접기 <i class="fa-chevron-up fa"></i></div>	
              </div>	
		</div>
	</section>
</div>


<script>
$(function(){	
	$("#insertRate .input-submit").on("click", function(e){
		e.preventDefault();
		if($("#insertRate .textarea-field").val() == ""){
			alert("내용을 입력해주세요.");
			$("#insertRate .textarea-field").focus();
		} else {
			$("#insertRate").submit();
		}
	})
	
	//평가- 더보기기능
	if($('.review li').length > 0) {
		$('.listNull').hide();
	}
	
    if($('.review li').length > 6) {
        $('.review-con').find('.more-w100').show();
    } else {
        $('.review-con').find('.more-w100').hide();
    }
	
    $('.review-con li').slice(0,6).css('display','block');    
    $('.review-con .more-w100').on('click', function(e){
        e.preventDefault();
        $('.review-con li:hidden').slice(0,6).slideDown(function(){
            $(this).css('display','block');
        });
        
        if($('.review-con li:hidden').length == 0) {
            $(this).parent('.review-con').find('.more-w100').hide();
            $(this).parent('.review-con').find('.close-w100').show();
        }
    });   
    $('.review-con .close-w100').on('click', function(e){
        e.preventDefault();
        $('.review-con li').slideUp(function(){
            $('.review-con li').slice(0,6).css('display','block');  
        });

        $(this).parent('.review-con').find('.more-w100').show();
        $(this).parent('.review-con').find('.close-w100').hide();
    });
    
    $('.more').on('click',function(){    	
    	$(this).closest('li').find('.review-more-pop').show();
    	$(this).closest('li').find('.review-more-pop > div').addClass('pop-wrap');
        popupCenter();
    }); 
})
</script>


<!-- 평가하기팝업-작성 시작 ----------->
<div class="pop-wrap-bg review-pop">
	<div class="review-pop-wrap">
		<div class="pop-close-bt">
			<i class="fa fa-window-close-o" aria-hidden="true"></i>
		</div>
		<div class="pop-title">
			<h2>평가하기</h2>
		</div>
		<form action="/insertRate" method="POST" id="insertRate">
			<div class="title">
				<div class="starBox">
					<span>평점 </span>
					<select class="review-star" name="MovieRate_score">
						<option value="5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
						<option value="4">&#xf005 &#xf005 &#xf005 &#xf005</option>
						<option value="3">&#xf005 &#xf005 &#xf005</option>
						<option value="2">&#xf005 &#xf005</option>
						<option value="1">&#xf005</option>
					</select>
				</div>
			</div>
			<textarea name="MovieRate_con" class="textarea-field"></textarea>
			<p>사회적 문제가 될수 있는 발언, 욕설 및 비방은 관리자에 의해 삭제될 수 있으니 참고하여 주시기바랍니다.</p>
			<input type="submit" value="확인" class="input-field input-submit">

			<input type="hidden" name="MovieInfo_no" value="<c:out value='${movie.movieInfo_no}'/>">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="user_id" />
				<input type="hidden" name="User_id" value="${user_id}">
			</sec:authorize>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</div>
<!-- //평가하기팝업-작성 끝 ----------->


<!-- //서브컨텐츠 끝 ----------->

<%@include file="includes/footer.jsp"%>