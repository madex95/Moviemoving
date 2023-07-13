<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="header.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4"><c:out value="${getList.movieInfo_title}"/></h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="panel-body">
										<div class="form-group">
					                    		<label>분류코드</label>
					                        	<input class="form-control" name="movieInfo_code" value='<c:out value="${getList.movieInfo_code}"/>' readonly>
					                    </div>
					                    <div class="form-group">
					                            <label>영화넘버</label>
					                            <input class="form-control" name="movieInfo_no" value="${getList.movieInfo_no}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>제목</label>
					                             <input class="form-control" name="movieInfo_title" value="${getList.movieInfo_title}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>장르</label>
					                             <input class="form-control" name="movieInfo_category" value="${getList.movieInfo_category}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>영화개봉일</label>
					                             <input class="form-control" name="movieInfo_year" value="${getList.movieInfo_year}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>시청연령</label>
					                           	 <input class="form-control" name="movieInfo_age" value="${getList.movieInfo_age}" readonly>
					                	</div>
					                    <div class="form-group">
					                     		 <label>러닝타임</label>
					                  			 <input class="form-control" name="movieInfo_rt" value="${getList.movieInfo_rt}" readonly>
					                    </div>					                    
					                    <div class="form-group">
					                             <label>썸네일</label>
					                             <input class="form-control" name="movieInfo_thum" value="${getList.movieInfo_thum}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>백그라운드 큰이미지</label>
					                             <input class="form-control" name="movieInfo_bkimg" value="${getList.movieInfo_bkimg}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>예고편 영상</label>
					                             <input class="form-control" name="movieInfo_video" value="${getList.movieInfo_video}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>넷플릭스</label>
					                             <input class="form-control" name="movieInfo_netflix" value="${getList.movieInfo_netflix}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>왓챠</label>
					                             <input class="form-control" name="movieInfo_watcha" value="${getList.movieInfo_watcha}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>웨이브</label>
					                             <input class="form-control" name="movieInfo_wavve" value="${getList.movieInfo_wavve}" readonly>
					                    </div>
					                    <div class="form-group">
					                             <label>설명</label>
					                             <textarea rows="5" name="movieInfo_con" style="width:100%;" readonly>${getList.movieInfo_con}</textarea>					                             
					                    </div>				                                		
					                                	
					               </div>
                                
			                             
			                            <a href="/admin/modify?MovieInfo_no=<c:out value='${getList.movieInfo_no}'/>" class="btn btn-primary">수정</a>
			                             
			                           	<a href="/admin/movieList" class="btn btn-primary">목록</a>
			                           	
			                           	<script type="text/javascript">
			                           	$(document).ready(funtion(){
			                           		var operForm = $("#operForm");
			                           		$("button[data-oper='modify']").on("click",function(e){
			                           			operForm.attr("action","admin/modify").submit();
			                           		});
			                           		$("button[data-oper='list']").on("click",function(e){
			                           			operForm.find("#bno").remove();
			                           			operForm.attr("action","/admin/movieList")
			                           			operForm.submit();
			                           		});
			                           	});
			                           	</script>
			                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
                            </div>
                        </div>
                    </div>
                </main>
                
<%@include file="footer.jsp" %>