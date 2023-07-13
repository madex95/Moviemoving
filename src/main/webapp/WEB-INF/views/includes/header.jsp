<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MovieMoving</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/js/control.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- ajax-csrf 토큰문제 -->
<meta name="_csrf" id="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}">
</head>
<body>

</head>
<body>

<div id="full-wrap">
       <!-- 상단 시작 ----------->
        <header>
            <div id="header-wrap">
                <a id="logo" href="/">
                    <img src="/resources/images/logo.png">            
                </a>
                <nav class="category">
                    <a href="/">영화</a>
                    <a href="/TV">TV프로그램</a>
                </nav>
                <!-- 검색 시작 ----------->
                <form action = "/search">
                    <label class="search-label">
                        <input type="text" name="keyword" value = "${pageMaker.cri.keyword }" class="input-field input-search" maxlength="100">
                    <button class="search-bt"><i class="fa fa-search"></i></button>
                    </label>
                </form>
                <!-- //검색 끝 ----------->
                <nav class="member">
                	<!-- 로그아웃일경우 -->
                	<sec:authorize access="!isAuthenticated()">
                    <a href="#" id="login">로그인</a>
                    <a href="#" id="join">회원가입</a>
                    </sec:authorize>
                    <!-- 로그인일경우 -->
                    <sec:authorize access="isAuthenticated()">
                    <a href="/mypage">마이페이지</a>
               		<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
					<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
					   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					</form>
                    </sec:authorize>
                </nav>
            </div>
        </header>      
        <!-- //상단 끝 ----------->
       
        <!-- 로그인팝업 시작 ----------->
        <div class="pop-wrap-bg login-pop">
            <div class="">
                <div class="pop-close-bt"><i class="fa fa-window-close-o" aria-hidden="true"></i></div>
                <div class="pop-title">
                    <h2>로그인</h2>
                    <p>가입하신 무비무빙 아이디와 비밀번호를 입력해주세요.</p>
                    <p>비밀번호는 대소문자를 구분합니다.</p>
                </div>
                <form action="/login" method="POST">
                    <input type="text" id="login-user_id" name="user_id" placeholder="아이디(이메일 주소)" class="input-field input-id" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디(이메일 주소)'">
                    <p id="login-id-error" class="error-message"></p>
                    <input type="password" id="login-user_pw" name="user_pw" placeholder="비밀번호" class="input-field input-pw" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
					<p id="login-pw-error" class="error-message"></p>
					<c:if test="${not empty param.login_error}">
					        <p class="error-message">아이디 또는 비밀번호가 잘못됐습니다</p>
					        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					</c:if>

                    <div class="login-footer">
                        <label>
                            <input type="checkbox" name="remember-me" class="check"> 자동 로그인
                        </label>
                    </div>

                    <button type="submit" class="input-field input-submit" id="loginBtn">로그인</button>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                </form>
            </div>
        </div>
        <!-- //로그인팝업 끝 ----------->

        <!-- 회원가입팝업 시작 ----------->
        <div class="pop-wrap-bg join-pop">
            <div class="">
                <div class="pop-close-bt"><i class="fa fa-window-close-o" aria-hidden="true"></i></div>
                <div class="pop-title">
                    <h2>회원가입</h2>
                </div>
                <form action="register" method="POST">
                    <input type="text" id="register-user_name" name="user_name" placeholder="이름" class="input-field input-name" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
                    <p id="register-name-error" class="error-message"></p>
                    <input type="text" id="register-user_id" name="user_id" placeholder="아이디(이메일)" class="input-field input-id" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디(이메일 주소)'">
                    <p id="register-id-error" class="error-message"></p>
                    <input type="password" id="register-user_pw" name="user_pw" placeholder="비밀번호" class="input-field input-pw" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
                    <p class="pw-message">※ 비밀번호는 영문+숫자를 포함한 4 - 60자 사이여야 합니다.</p>
                    <p id="register-pw-error" class="error-message"></p>
                    <button type="submit" class="input-field input-submit" id="registerBtn">회원가입</button>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                </form>
            </div>
        </div>
        <!-- //회원가입팝업 끝 ----------->