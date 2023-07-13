<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="header.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">영화관리</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                	<colgroup>
                                		<col width="5%"/>
                                		<col width="5%"/>
                                		<col width=""/>
                                		<col width="8%"/>
                                		<col width="5%"/>
                                		<col width="8%"/>
                                		<col width="5%"/>
                                		<col width="5%"/>
                                		<col width="5%"/>
                                		<col width="15%"/>
                                	</colgroup>
                                    <thead>
                                        <tr>
                                            <th>분류코드</th>
                                            <th>영화넘버</th>
                                            <th>제목</th>
                                            <th>영화개봉일</th>
                                            <th>시청연령</th>
                                            <th>러닝타임</th>                                          
                                            <th>넷플릭스</th>
                                            <th>왓챠</th>
                                            <th>웨이브</th>
                                            <th>장르</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${movieList}" var="movieList">
                                        <tr>
                                        	<td>${movieList.movieInfo_code}</td>
                                            <td>${movieList.movieInfo_no}</td>
                                            <td><a href='/admin/get?MovieInfo_no=<c:out value="${movieList.movieInfo_no}"/>'><c:out value="${movieList.movieInfo_title}"/></a></td>
                                            <td>${movieList.movieInfo_year}</td>
                                            <td>${movieList.movieInfo_age}</td>
                                            <td>${movieList.movieInfo_rt}</td>                                            
                                            <td>
	                                            <c:if test="${movieList.movieInfo_netflix != null}">
	                                            	<i class="netflix-icon">넷플릭스</i>
	                                            </c:if>
                                            </td>
                                            <td>
	                                            <c:if test="${movieList.movieInfo_watcha != null}">
	                                            	<i class="watcha-icon">왓챠</i>
	                                            </c:if>
                                            </td>                                            
                                            <td>
                                            	<c:if test="${movieList.movieInfo_wavve != null}">
                                            		<i class="wavve-icon">웨이브</i>
                                            	</c:if>
                                            </td>
                                            <td>${movieList.movieInfo_category}</td>                                            
                                        </tr>
                                    </c:forEach>      
                                    </tbody>
                                </table>
                                <form id="adminMovie" method="post">                   
                               	    <input type="hidden" name="MovieInfo_no" value="0">
					        	 	<sec:authorize access="isAuthenticated()">
					                <sec:authentication property="principal.username" var="user_id"/>
					            	<input type="hidden" name="User_id" value="${user_id}">
					            	</sec:authorize>        	
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                                </form>
                                
                                 <script>
                                	$(function(){
                                		var operForm = $("#adminMovie");   
  		
                                		$(".movieRemove").on("click", function(){
                                			var MovieInfo_no = $(this).closest("tr").find("td input[name='MovieInfo_no']").val();
                                			operForm.find("input[name='MovieInfo_no']").attr("value",MovieInfo_no);
                                			
                                			operForm.attr("action","/admin/movieRemove").submit();
                                		});
                                	});
                                </script>
                               <!--  <!-- Modal -------------->
                               
                               
								<div id="myModal" class="modal fade" role="dialog">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <h4 class="modal-title">Modal Header</h4>
								      </div>
								      <div class="modal-body">
								        <p>등록되었습니다.</p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div> 
								  </div>
								</div>
                                
                            </div>
                        </div>
                    </div>
                </main>
          
<%@include file="footer.jsp" %>