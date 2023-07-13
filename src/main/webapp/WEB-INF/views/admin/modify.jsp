<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="header.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">movieList 수정</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="panel-body" style="position:relative;">
                                	<form role="form" action="/admin/modify" method="post">
										<div class="form-group">
					                    		<label>분류코드</label>
					                        	<input class="form-control" name="movieInfo_code" value='<c:out value="${getList.movieInfo_code}"/>'>
					                    </div>
					                    <div class="form-group">
					                            <label>영화넘버</label>
					                            <input class="form-control" name="movieInfo_no" value="${getList.movieInfo_no}">
					                    </div>
					                    <div class="form-group">
					                             <label>제목</label>
					                             <input class="form-control" name="movieInfo_title" value="${getList.movieInfo_title}">
					                    </div>
					                    <div class="form-group">
					                             <label>장르</label>
					                             <input class="form-control" name="movieInfo_category" value="${getList.movieInfo_category}">
					                    </div>
					                    <div class="form-group">
					                             <label>영화개봉일</label>
					                             <input class="form-control" name="movieInfo_year" value="${getList.movieInfo_year}">
					                    </div>
					                    <div class="form-group">
					                             <label>시청연령</label>
					                           	 <input class="form-control" name="movieInfo_age" value="${getList.movieInfo_age}">
					                	</div>
					                    <div class="form-group">
					                     		 <label>러닝타임</label>
					                  			 <input class="form-control" name="movieInfo_rt" value="${getList.movieInfo_rt}">
					                    </div>					                    
					                    <div class="form-group">
					                             <label>썸네일</label>
					                             <input class="form-control" name="movieInfo_thum" value="${getList.movieInfo_thum}">
					                    </div>
					                    <div class="form-group">
					                             <label>백그라운드 큰이미지</label>
					                             <input class="form-control" name="movieInfo_bkimg" value="${getList.movieInfo_bkimg}">
					                    </div>
					                    <div class="form-group">
					                             <label>예고편 영상</label>
					                             <input class="form-control" name="movieInfo_video" value="${getList.movieInfo_video}">
					                    </div>
					                    <div class="form-group">
					                             <label>넷플릭스</label>
					                             <input class="form-control" name="movieInfo_netflix" value="${getList.movieInfo_netflix}">
					                    </div>
					                    <div class="form-group">
					                             <label>왓챠</label>
					                             <input class="form-control" name="movieInfo_watcha" value="${getList.movieInfo_watcha}">
					                    </div>
					                    <div class="form-group">
					                             <label>웨이브</label>
					                             <input class="form-control" name="movieInfo_wavve" value="${getList.movieInfo_wavve}">
					                    </div>
					                     <div class="form-group">
					                             <label>설명</label>
					                             <textarea rows="5" name="movieInfo_con" style="width:100%;">${getList.movieInfo_con}</textarea>					                             
					                    </div>
					                    
					                    
			                            <button type="submit" data-oper='modify' class="movie_modify btn btn-primary">수정</button>
			                            <button type="submit" data-oper='list'class="movie_list btn btn-primary">목록</button>
			                            
                                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                	</form>
                                	
                                	<form role="form2" action="/admin/remove" method="post" style="position:absolute; right:0; bottom:0;">
	                                		<button data-oper='remove'class="movie_remove btn btn-primary" value="${getList.movieInfo_no}">삭제</button>
				                        	<input type="hidden" name="MovieInfo_no" value="${getList.movieInfo_no}">
				                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				                        </form>
			                        
                                	<script>
                                		$(document).ready(function(){
                                			var formObj=$("form");
											
                                			$(".movie_list").on("click", function(e){
                                				
                                				e.preventDefault();
                                			
                                				self.location="/admin/movieList";
                                				
                                			});
                                		});
                                	</script>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
          
<%@include file="footer.jsp" %>