<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="includes/header.jsp" %>

<script>
$(function(){
	//후기삭제
	var operForm = $("#operForm"); 
	
	$(".delete-bt").on("click", function(){		
		var MovieInfo_no = $(this).closest("li").find("input[name='movieNo']").val();
		operForm.find("input[name='MovieInfo_no']").attr("value",MovieInfo_no);
		operForm.attr("action","/removeRate").submit(); 
	});	
	
	//listNull 안보이게하기
	if($(".movie-list ul li").length > 0) {
		$(".movie-list").find(".listNull").hide();
	} else {
		$(".movie-list").find(".listNull").show();
	}
	
	if($(".revie-movie li").length > 0) {
		$(".revie-movie").parent().find(".listNull").hide();
	} else {
		$(".revie-movie").parent().find(".listNull").show();
	}
	
	if($(".tv-list ul li").length > 0) {
		$(".tv-list").find(".listNull").hide();
	} else {
		$(".tv-list").find(".listNull").show();
	}
	
	if($(".revie-tv li").length > 0) {
		$(".revie-tv").parent().find(".listNull").hide();
	} else {
		$(".revie-tv").parent().find(".listNull").show();
	}
	
	//수정팝업창
	$('.modify-bt').on('click',function(){    	
    	$(this).closest('li').find('.review-modify-pop').show();
    	$(this).closest('li').find('.review-modify-pop > div').addClass('pop-wrap');
        popupCenter();
    }); 
	
})
</script>

<!--- 서브컨텐츠 시작 ----------->
        <div class="mypage-con con-wrap">
        	 <form method="POST" id="operForm">
        	 	<input type="hidden" name="MovieInfo_no" value="0">
        	 	<sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.username" var="user_id"/>
            	<input type="hidden" name="User_id" value="${user_id}">
            	</sec:authorize>
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            
            <section class="mypage-title">
                 <sec:authorize access="isAuthenticated()">
			      <h1><sec:authentication property="principal.user.user_name" /></h1>
			      	<h3>님 반갑습니다 !</h3>
		         </sec:authorize>
                <span class="modify_bt_pw sm-bt" id="update">비밀번호변경</span>
                <span class="modify_bt_pw sm-bt" id="delete">회원탈퇴</span>
            </section>
            <section class="mypage-movie">
                <h3>영화</h3>
                <div class="mp-box mp-bookmark">
                    <div class="mp-title">
                        <i class="fa fa-bookmark"></i> 보고싶어요
                    </div>
                    <div class="list-wrap movie-list">
                        <ul class="list">
                        	<c:forEach items="${moviemark}" var="moviemark">
                        		<li>
	                                <div class="list-img">
	                                    <img src="<c:out value='${moviemark.movieInfo_thum}'/>">
	                                </div>
	                                <div class="list-title">
	                                    <span class="title"><c:out value='${moviemark.movieInfo_title}'/></span>
	                                </div>                        
	                                <a href="/movie?MovieInfo_no=<c:out value='${moviemark.movieInfo_no}'/>" class="box-a"></a>
	                            </li>
                        	</c:forEach>                          
                        </ul>
                        <p class="listNull">등록된 영화가 없습니다.</p>
                        <div class="more-w100">더보기 <i class="fa-chevron-down fa"></i></div>
                        <div class="close-w100">접기 <i class="fa-chevron-up fa"></i></div>
                    </div>                    
                </div>
                <div class="mp-box mp-reivew">
                    <div class="mp-title">
                        <i class="fa fa-star"></i> 평가
                    </div>
                    <div class="review-con movie-review-list">                       
                        <ul class="review revie-movie">
	                        <c:forEach items="${rateListMovie}" var="rateListMovie">
	                            <li>
	                                <div class="movie-img">
	                                    <a href="/movie?MovieInfo_no=<c:out value='${rateListMovie.movieInfo_no}'/>"><img src="<c:out value='${rateListMovie.movieInfo_thum}'/>"></a>
	                                </div>
	                                <div class="titleBox">
	                                    <span><c:out value='${rateListMovie.movieInfo_title}'/></span>
	                                    <span class="review-star">
											<c:choose>
												<c:when test="${rateListMovie.movieRate_score eq 5}">
													&#xf005 &#xf005 &#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateListMovie.movieRate_score eq 4}">
													&#xf005 &#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateListMovie.movieRate_score eq 3}">
													&#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateListMovie.movieRate_score eq 2}">
													&#xf005 &#xf005
												</c:when>
												<c:when test="${rateListMovie.movieRate_score eq 1}">
													&#xf005
												</c:when>
											</c:choose>
										</span>
	                                    <p><c:out value='${rateListMovie.movieRate_con}'/></p>
	                                    <span class="modify-bt sm-bt">수정</span>
	                                    <span class="delete-bt sm-bt">삭제</span>	                                   
	                                </div>	                                   
	                                <input type="hidden" name="movieNo" value="<c:out value='${rateListMovie.movieInfo_no}'/>">
	                                
	                                <!-- 평가하기팝업-수정 시작 ----------->
							        <div class="pop-wrap-bg review-modify-pop">
							            <div class="review-pop-wrap">
							                <div class="pop-close-bt"><i class="fa fa-window-close-o" aria-hidden="true"></i></div>
							                <div class="pop-title">
							                    <h2>평가 수정하기</h2>
							                </div>
							                <form action="/modifyRate" method="POST" id="insertRate">
							                    <div class="title">
							                        <strong><c:out value='${rateListMovie.movieInfo_title}'/></strong>
							                        <div class="starBox">
														<span>평점 </span>
														<select class="review-star" name="MovieRate_score">
															<option <c:if test="${rateListMovie.movieRate_score eq 5}">selected="selected"</c:if> value="5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
															<option <c:if test="${rateListMovie.movieRate_score eq 4}">selected="selected"</c:if> value="4">&#xf005 &#xf005 &#xf005 &#xf005</option>
															<option <c:if test="${rateListMovie.movieRate_score eq 3}">selected="selected"</c:if> value="3">&#xf005 &#xf005 &#xf005</option>
															<option <c:if test="${rateListMovie.movieRate_score eq 2}">selected="selected"</c:if> value="2">&#xf005 &#xf005</option>
															<option <c:if test="${rateListMovie.movieRate_score eq 1}">selected="selected"</c:if> value="1">&#xf005</option>
														</select>
													</div>
							                    </div>
							                    <textarea name="MovieRate_con" class="textarea-field"><c:out value='${rateListMovie.movieRate_con}' /></textarea>
							                    <p class="notice">사회적 문제가 될수 있는 발언, 욕설 및 비방은 관리자에 의해 삭제될 수 있으니 참고하여 주시기바랍니다.</p>
							                    <input type="submit" value="수정" class="input-field input-submit">

												<input type="hidden" name="MovieInfo_no" value="<c:out value='${rateListMovie.movieInfo_no}'/>">
												<sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal.username" var="user_id" />
													<input type="hidden" name="User_id" value="${user_id}">
												</sec:authorize>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						                    </form>
							            </div>
							        </div>
							        <!-- //평가하기팝업-수정 끝 ----------->                         
	                            </li> 
	                         </c:forEach>                           
                        </ul>
                        <p class="listNull">등록된 평가가 없습니다.</p>
                        <div class="more-w100">더보기 <i class="fa-chevron-down fa"></i></div>
                        <div class="close-w100">접기 <i class="fa-chevron-up fa"></i></div>
                    </div>                    
                </div>
            </section>
            
            <section class="mypage-tv">
            <h3>TV프로그램</h3>
                <div class="mp-box mp-bookmark">
                    <div class="mp-title">
                        <i class="fa fa-bookmark"></i> 보고싶어요
                    </div>
                    <div class="list-wrap tv-list">
                        <ul class="list">
                            <c:forEach items="${tvmarke}" var="tvmarke">
                        		<li>
	                                <div class="list-img">
	                                    <img src="<c:out value='${tvmarke.movieInfo_thum}'/>">
	                                </div>
	                                <div class="list-title">
	                                    <span class="title"><c:out value='${tvmarke.movieInfo_title}'/></span>
	                                </div>                        
	                                <a href="/movie?MovieInfo_no=<c:out value='${tvmarke.movieInfo_no}'/>" class="box-a"></a>
	                            </li>	                            
                        	</c:forEach> 
                        </ul>
                        <p class="listNull">등록된 TV프로그램이 없습니다.</p>
                        <div class="more-w100">더보기 <i class="fa-chevron-down fa"></i></div>
                        <div class="close-w100">접기 <i class="fa-chevron-up fa"></i></div>
                    </div>                    
                </div>
                <div class="mp-box mp-reivew">
                    <div class="mp-title">
                        <i class="fa fa-star"></i> 평가
                    </div>
                    <div class="review-con tv-review-list">                       
                        <ul class="review revie-tv">
                            <c:forEach items="${rateListTV}" var="rateListTV">
	                            <li>
	                                <div class="movie-img">
	                                    <a href="/movie?MovieInfo_no=<c:out value='${rateListTV.movieInfo_no}'/>"><img src="<c:out value='${rateListTV.movieInfo_thum}'/>"></a>
	                                </div>
	                                <div class="titleBox">
	                                    <span><c:out value='${rateListTV.movieInfo_title}'/></span>
	                                    <span class="review-star">
											<c:choose>
												<c:when test="${rateListTV.movieRate_score eq 5}">
													&#xf005 &#xf005 &#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateListTV.movieRate_score eq 4}">
													&#xf005 &#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateListTV.movieRate_score eq 3}">
													&#xf005 &#xf005 &#xf005
												</c:when>
												<c:when test="${rateListTV.movieRate_score eq 2}">
													&#xf005 &#xf005
												</c:when>
												<c:when test="${rateListTV.movieRate_score eq 1}">
													&#xf005
												</c:when>
											</c:choose>
										</span>
	                                    <p><c:out value='${rateListTV.movieRate_con}'/></p>
	                                    <span class="modify-bt sm-bt">수정</span>
	                                    <span class="delete-bt sm-bt">삭제</span>	                                    
	                                </div> 	                                
	                                <input type="hidden" name="movieNo" value="<c:out value='${rateListTV.movieInfo_no}'/>">
	                                
	                                <!-- 평가하기팝업-수정 시작 ----------->
							        <div class="pop-wrap-bg review-modify-pop">
							            <div class="review-pop-wrap">
							                <div class="pop-close-bt"><i class="fa fa-window-close-o" aria-hidden="true"></i></div>
							                <div class="pop-title">
							                    <h2>평가 수정하기</h2>
							                </div>
							                <form action="/modifyRate" method="POST" id="insertRate">
							                    <div class="title">
							                        <strong><c:out value='${rateListTV.movieInfo_title}'/></strong>
							                        <div class="starBox">
														<span>평점 </span>
														<select class="review-star" name="MovieRate_score">
															<option <c:if test="${rateListTV.movieRate_score eq 5}">selected="selected"</c:if> value="5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
															<option <c:if test="${rateListTV.movieRate_score eq 4}">selected="selected"</c:if> value="4">&#xf005 &#xf005 &#xf005 &#xf005</option>
															<option <c:if test="${rateListTV.movieRate_score eq 3}">selected="selected"</c:if> value="3">&#xf005 &#xf005 &#xf005</option>
															<option <c:if test="${rateListTV.movieRate_score eq 2}">selected="selected"</c:if> value="2">&#xf005 &#xf005</option>
															<option <c:if test="${rateListTV.movieRate_score eq 1}">selected="selected"</c:if> value="1">&#xf005</option>
														</select>
													</div>
							                    </div>
							                    <textarea name="MovieRate_con" class="textarea-field"><c:out value="${rateListTV.movieRate_con}" /></textarea>
							                    <p class="notice">사회적 문제가 될수 있는 발언, 욕설 및 비방은 관리자에 의해 삭제될 수 있으니 참고하여 주시기바랍니다.</p>
							                    <input type="submit" value="수정" class="input-field input-submit">

												<input type="hidden" name="MovieInfo_no" value="<c:out value='${rateListTV.movieInfo_no}'/>">
												<sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal.username" var="user_id" />
													<input type="hidden" name="User_id" value="${user_id}">
												</sec:authorize>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						                    </form>
							            </div>
							        </div>
							        <!-- //평가하기팝업-수정 끝 ----------->
	                            </li>	                           
	                         </c:forEach>  
                        </ul>
                        <p class="listNull">등록된 평가가 없습니다.</p>
                        <div class="more-w100">더보기 <i class="fa-chevron-down fa"></i></div>
                        <div class="close-w100">접기 <i class="fa-chevron-up fa"></i></div>
                    </div>                    
                </div>
            </section>
        </div>
        <!-- //서브컨텐츠 끝 ----------->

        <!-- 회원탈퇴 팝업 시작 ----------->
        <div class="pop-wrap-bg delete-pop">
            <div class="">
                <div class="pop-close-bt"><i class="fa fa-window-close-o" aria-hidden="true"></i></div>
                <div class="pop-title">
                    <h2>회원탈퇴</h2>
                    <p>회원탈퇴를 위해 비밀번호를 입력해주세요.</p>
                </div>
                <form action="/delete" method="POST">
                    <input type="password" id="delete-user_pw" name="inputPassword" placeholder="비밀번호" class="input-field input-pw" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
					<p id="delete-pw-error" class="error-message"></p>
                    <div class="delete-footer"> </div>
                    <button type="submit" class="input-field input-submit" id="deleteBtn">회원탈퇴</button>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                </form>
            </div>
        </div>
        <!-- //회원탈퇴 팝업 끝 ----------->
        
       <!-- 비밀번호수정 팝업 시작 ----------->
        <div class="pop-wrap-bg update-pop">
            <div class="">
                <div class="pop-close-bt"><i class="fa fa-window-close-o" aria-hidden="true"></i></div>
                <div class="pop-title">
                    <h2>비밀번호수정</h2>
                    <p>비밀번호수정을 위해 빈칸을 입력해주세요.</p>
                </div>
                <form action="/modifypw" method="POST">
                    <input type="password" id="old-user_pw" name="oldPassword" placeholder="현재비밀번호" class="input-field input-pw" onfocus="this.placeholder = ''" onblur="this.placeholder = '현재비밀번호'">
					<p id="modify-old-error" class="error-message"></p>
					<input type="password" id="modify-user_pw" name="user_pw" placeholder="수정 할 비밀번호" class="input-field input-pw" onfocus="this.placeholder = ''" onblur="this.placeholder = '수정 할 비밀번호'">
					<p id="modify-pw-error" class="error-message"></p>
                    <div class="update-footer"> </div>
                    <button type="submit" class="input-field input-submit" id="modifyBtn">수정완료</button>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                </form>
            </div>
        </div>
        <!-- //비밀번호수정 팝업 끝 ----------->

<%@include file="includes/footer.jsp" %>