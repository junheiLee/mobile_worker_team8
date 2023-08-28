<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>디테일</title>
<link href="<c:url value='/resources/style.css'/>" rel="stylesheet">
</head>
<body>
	<div class="container">
		<header>
		<p>Smart Quick Parcel Service</p>
		</header>
		<div class="info" style="height: 80px;">
			<p>There are ${deliveryList.size() } jobs</p>
		</div>
		<div class="contents">
			<c:forEach var="deliveryVO" items="${deliveryList}">
				<div class="aaa"
					onclick="document.location='${contextPath}/worker/delivery/${deliveryVO.deliveryId }'">
					${deliveryVO.deliveryId }: ${deliveryVO.customer}: ${deliveryVO.cAddress }
				</div>
			</c:forEach>
		</div>
	</div>


</body>
</html>