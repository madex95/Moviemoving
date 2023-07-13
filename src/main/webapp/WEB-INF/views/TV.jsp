<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="includes/header.jsp"%>



<!--- 메인컨텐츠 시작 ----------->
<div class="main-con con-wrap">
	<section id="best">
		<div class="best-list-info">
			<ul>
				<c:forEach items="${tvBest}" var="tvBest">
					<li class="<c:out value='${tvBest.movieInfo_no}'/>">
						<div class="main-video-wrap"
							style="background-image:url('<c:out value='${tvBest.movieInfo_bkimg}'/>')">
							<div class="video-bg-right"></div>
							<div class="video-bg-left"></div>
							<div class="video-bg"></div>
							<div class="veido-wrap">
								<div id="player"></div>
							</div>
							<div class="best-info">
								<p>
									<c:out value='${tvBest.movieInfo_title}' />
								</p>
								<span> <c:out value='${tvBest.movieInfo_con}' />
								</span> <a
									href="/movie?MovieInfo_no=<c:out value='${tvBest.movieInfo_no}'/>"
									class="btn">보러가기 <i class="fa fa-chevron-right"></i></a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="best-list">
			<div class="list-con">
				<ul>
					<c:forEach items="${tvBest}" var="tvBest" varStatus="status">
						<li class="<c:out value='${tvBest.movieInfo_no}'/>">
							<div class="list-con-img">
								<img src="<c:out value='${tvBest.movieInfo_thum}'/>">
							</div>
							<div class="list-con-title">
								<h4 class="grade">
									<c:out value="${status.count}" />
								</h4>
								<p>
									<span class="title"><c:out value="${tvBest.movieInfo_title}" /></span>
									<span><c:out value="${tvBest.movieInfo_year}" /></span>
									<span class="left-line-gray cateList">
										<c:out value="${tvBest.movieInfo_category}" />
									</span>
								</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="btn-box">
				<div class="best-list-Leftarrow circle-arrow">
					<i class="fa fa-chevron-left"></i>
				</div>
				<div class="best-list-Rightarrow circle-arrow">
					<i class="fa fa-chevron-right"></i>
				</div>
			</div>
		</div>
	</section>

	<section class="sitebest-netflicx video-list">
		<div class="sitebest-title">
			<img src="/resources/images/logo/netflix.png">
			<h2>
				<strong>넷플릭스</strong> 인기순위
			</h2>
		</div>
		<ul>
			<c:forEach items="${netflix}" var="netflix" varStatus="status">
				<li><span class="sitebest-tag"><c:out
							value="${status.count}" /></span>
					<div class="list-img">
						<img src="<c:out value='${netflix.movieInfo_thum}'/>">
						<p class="moviePlot">
							<c:out value='${netflix.movieInfo_con}' />
						</p>
					</div>
					<div class="list-title">
						<span class="title"><c:out
								value="${netflix.movieInfo_title}"></c:out></span>
					</div> <a
					href="/movie?MovieInfo_no=<c:out value='${netflix.movieInfo_no}'/>"
					class="box-a move"></a></li>
			</c:forEach>
		</ul>
	</section>
	<section class="sitebest-watcha video-list">
		<div class="sitebest-title">
			<img src="/resources/images/logo/watcha.png">
			<h2>
				<strong>왓챠</strong> 인기순위
			</h2>
		</div>
		<ul>
			<c:forEach items="${watcha}" var="watcha" varStatus="status">
				<li><span class="sitebest-tag"><c:out
							value="${status.count}" /></span>
					<div class="list-img">
						<img src="<c:out value='${watcha.movieInfo_thum}'/>">
						<p class="moviePlot">
							<c:out value='${watcha.movieInfo_con}' />
						</p>
					</div>
					<div class="list-title">
						<span class="title"><c:out
								value="${watcha.movieInfo_title}"></c:out></span>
					</div> <a
					href="/movie?MovieInfo_no=<c:out value='${watcha.movieInfo_no}'/>"
					class="box-a move"></a></li>
			</c:forEach>
		</ul>
	</section>
	<section class="sitebest-wavve video-list">
		<div class="sitebest-title">
			<img src="/resources/images/logo/wavve.png">
			<h2>
				<strong>웨이브</strong> 인기순위
			</h2>
		</div>
		<ul>
			<c:forEach items="${wavve}" var="wavve" varStatus="status">
				<li><span class="sitebest-tag"><c:out
							value="${status.count}" /></span>
					<div class="list-img">
						<img src="<c:out value='${wavve.movieInfo_thum}'/>">
						<p class="moviePlot">
							<c:out value='${wavve.movieInfo_con}' />
						</p>
					</div>
					<div class="list-title">
						<span class="title"><c:out value="${wavve.movieInfo_title}"></c:out></span>
					</div> <a
					href="/movie?MovieInfo_no=<c:out value='${wavve.movieInfo_no}'/>"
					class="box-a move"></a></li>
			</c:forEach>
		</ul>
	</section>
</div>
<!-- //메인컨텐츠 끝 ----------->

<%@include file="includes/footer.jsp"%>