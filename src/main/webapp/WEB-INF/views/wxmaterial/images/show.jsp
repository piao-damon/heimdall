<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fnc" uri="/WEB-INF/tags/fnc.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<spring:url value='/webjars/bootstrap/2.3.0/css/bootstrap.min.css' />" rel="stylesheet" />
</head>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<a class="brand">彩虹桥</a>
			<ul class="nav">
				<li><a href="<spring:url value='/'/>">欢迎</a></li>
				<li><a href="<spring:url value='/account/show'/>">微信公众平台账号管理</a></li>
				<li class="active"><a href="<spring:url value='/wxmaterial/images'/>">微信素材管理</a></li>
				<li><a href="<spring:url value='/autoresponse/subscribe'/>">自动回复</a></li>
				<li><a href="<spring:url value='/wxmenu/show'/>">自定义菜单</a></li>
			</ul>
		</div>
	</div>

<div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="<spring:url value='/wxmaterial/images'/>" data-toggle="tab">图片库</a></li>
		<li><a href="<spring:url value='/wxmaterial/news'/>" data-toggle="tab">图文消息</a></li>
		<li><a href="<spring:url value='/wxmaterial/voices'/>" data-toggle="tab">语音库</a></li>
		<li><a href="<spring:url value='/wxmaterial/videos'/>" data-toggle="tab">视频库</a></li>
	</ul>
	
	<c:forEach items="${fnc:getWxImageList('wx59b9035ec663ded4')}" var="image" varStatus="stat">
		<c:if test="${stat.index%4==0}">
			<div class="row-fluid">
				<ul class="thumbnails">
		</c:if>
				<li class="span3">
					<a class="thumbnail">
						<img style="width: 300px; height: 300px;" src="<spring:url value='${image.image_localurl}'/>">
						<div class="caption">
							<h3 align="center">${image.name.length()<28?image.name:image.name.substring(0,28)}</h3>
						</div>
					</a>
				</li>
		<c:if test="${stat.index%4==3}">
				</ul>
			</div>
		</c:if>
	</c:forEach>
	
	<!-- 延迟加载js，提高页面加载速度 -->
	<script src="<spring:url value='/webjars/jquery/2.0.3/jquery.js'/>"></script>
	<script src="<spring:url value='/resources/js/common.js'/>"></script>
</body>
</html>

