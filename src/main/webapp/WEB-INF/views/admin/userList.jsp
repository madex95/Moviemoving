<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="header.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">유저관리</h1>
                        <div class="mb-4"></div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                	<colgroup>
                                		<col width="30%"/>
                                		<col width="23%"/>
                                		<col width="13%"/>
                                		<col width="7%"/>
                                	</colgroup>
                                    <thead>
                                        <tr>
                                        	<th>아이디(이메일)</th>
                                            <th>이름</th>
                                            <th>수정</th>
                                            <th>탈퇴</th>                           
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach items="${userList}" var="userList" varStatus="index">
	                                        <tr>
	                                            <td>${userList.user_id}</td>
	                                            <td>
	                                            	<div class="${index.index}view">${userList.user_name}</div>
	                                            	<div class="${index.index}modify" style="display: none">
	                                            		<input class="${index.index}text_id" type="hidden" value="${userList.user_id}">
	                                            		<input class="${index.index}text_name" type="text" value="${userList.user_name}">
	                                            	</div>
	                                            </td>
	                                            <td>
	                                            	<button class="${index.index}user_modify user_modify btn btn-default" value="${index.index}">수정</button>
	                                            	<button class="${index.index}user_modify_enter btn btn-default" value="${index.index}" style="display:none">확인</button>
	                                            	<button class="${index.index}user_modify_cencle btn btn-default" value="${index.index}" style="display:none">취소</button>
	                                            </td>
	                                            <td><button type="submit" class="user_clk btn btn-default" value="${userList.user_id}">삭제</button>
													
	                                            	<form id="admin" method="post">                   
					                               	    <input type="hidden" name="user_id">
										        	 	<sec:authorize access="isAuthenticated()">
										                <sec:authentication property="principal.username" var="user_id"/>
										            		<input type="hidden" name="User_id" value="${user_id}">
										            	</sec:authorize>        	
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					                                </form>
					                                <form id="admin2" method="post">
					                               	    <input type="hidden" name="user_id">
					                               	    <input type="hidden" name="user_name">
										        	 	<sec:authorize access="isAuthenticated()">
										                	<sec:authentication property="principal.user_id" var="user_id"/>
										                	<sec:authentication property="principal.user_name" var="user_name"/>
										            			<input type="hidden" name="user_id" value="${user_id}">
										            			<input type="hidden" name="user_name" value="${user_name}">
										            	</sec:authorize>
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					                                </form>                                    
					                             
					                             
	                                            </td>
	                                        </tr>
	                                    </c:forEach>
	                                    <script>
		                                    $(document).ready(function(){
		                                    	var operForm = $("#admin");
		                                    	var operForm2 = $("#admin2");
		                                    	
		                                    	// 삭제
		                                    	$(".user_clk").on("click", function(e){
		                                    		
		                                    		operForm.find("input[name='user_id']").attr("value", e.target.value);
		                                    		
		                                    		operForm.attr("action","/admin/userList/remove").submit();
		                                    	})
		                                    	// 수정
		                                    	$(".user_modify").on("click", function(e){
		                                    		
		                                    		// 수정버튼을 누르면 수정 모드로 들어감
		                                    		$("." + e.target.value + "view").hide();
		                                    		$("." + e.target.value + "modify").show();
		                                    		
		                                    		$("." + e.target.value + "user_modify").hide();
		                                    		$("." + e.target.value + "user_modify_enter").show();
		                                    		$("." + e.target.value + "user_modify_cencle").show();
		                                    		
		                                    		//취소버튼을 눌렀을 때, 원래대로 돌아감
		                                    		$("." + e.target.value + "user_modify_cencle").on("click", function(e){
		                                    			
		                                    			$("." + e.target.value + "view").show();
			                                    		$("." + e.target.value + "modify").hide();
			                                    		
			                                    		$("." + e.target.value + "user_modify").show();
			                                    		$("." + e.target.value + "user_modify_enter").hide();
			                                    		$("." + e.target.value + "user_modify_cencle").hide();
		                                    		})
		                                    		
		                                    		// 확인을 눌렀을 때, update 전송
		                                    		$("." + e.target.value + "user_modify_enter").on("click", function(e){
		                                    			
		                                    			var user_id = $("." + e.target.value + "text_id").val();
		                                    			var user_name = $("." + e.target.value + "text_name").val();
		                                    			
		                                    			operForm2.find("input[name='user_id']").attr("value", user_id);
		                                    			operForm2.find("input[name='user_name']").attr("value", user_name);
			                                    		
			                                    		operForm2.attr("action","/admin/userList/modify").submit();
		                                    		})
		                                    	})
		                                    	
		                                    	
		                                    });
		                            	</script>
	             
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                </main>
                        
<%@include file="footer.jsp" %>