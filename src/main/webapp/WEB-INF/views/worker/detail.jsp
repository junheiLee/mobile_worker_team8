<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송 예약 목록</title>
<link href="<c:url value='/resources/style.css'/>" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(
			function() {
				$("#btn").click(
						function(e) {

							$.ajax(
									{
										method : 'PUT',
										url : '${contextPath}/updateParcel/'
												+ e.target.dataset.id + '/'
												+ e.target.dataset.id2
									}).done(function(결과) {
								location.reload();
							}).fail(function(에러) {
								return console.log(에러);
							})

						});

			});
</script>
</head>
<body>
	<div class="container" style="overflow: scroll;">

		<header>
		<p>Smart Quick Parcel Service</p>
		</header>
		<div class="info" style="height: 160px;">
			<p>Job Id: ${deliveryVO.deliveryId} (${deliveryVO.status})</p>
			<p>&nbsp;</p>
			<p>${deliveryVO.customer }</p>
			<p>&nbsp;</p>
			<p>${deliveryVO.cAddress }</p>
			<p>${deliveryVO.cCity },${deliveryVO.cState}</p>
			<p>Product: ${deliveryVO.product}</p>
			<p>&nbsp;</p>
			<p>Comment: ${deliveryVO.comments}</p>
		</div>

		<div class="sbsb" id="test1">위치정보 지도확인</div>
		<iframe id="map" width="500" height="250" frameborder="0"
			scrolling="no" marginheight="0" marginwidth="0"></iframe>
		<div class="sbsb" id="test2">배송관련 상세내용보기</div>
		<div id="gkdld" class="gkdld2">
			<p class="sbsbsb">우편번호: ${deliveryVO.cZip }</p>
			<p class="sbsbsb">URL: ${deliveryVO.productUrl }</p>
		</div>
		<c:choose>
			<c:when test="${deliveryVO.status eq 'CLOSE' }">
				<div class="sbsb" onclick="document.location='${contextPath}/'">Closed
					Product(홈으로 가기)</div>
			</c:when>
			<c:otherwise>
				<a href="#" id="test3">고객 확인받기</a>
				<div style="margin-bottom: 20px; display: none;" id="gkdld3">
					<canvas id="myCanvas" width="498" height="400"
						style="background-color: #fff;border-left:1px solid gray;border-right:1px solid gray;"></canvas>
					<button id="btn" data-id="${deliveryVO.deliveryId}"
						data-id2="${deliveryVO.cIdentifier }">수령확인</button>
					<button id="clearButton">싸인 지우기</button>
				</div>
			</c:otherwise>
		</c:choose>

	</div>

	<script>
		$('#test2').click(function() {
			$('#gkdld').slideToggle();
		});

		$('#test3').click(function() {
			$('#gkdld3').slideToggle();
		});

		if (navigator.geolocation)
			navigator.geolocation.getCurrentPosition(success); // 현재 위치 정보 요청
		else
			alert("지원하지 않음");

		// 위치 파악 시 success() 호출. 위치 정보가 들어 있는 position 객체가 매개 변수로 넘어온다.
		function success(position) {
			let lat = position.coords.latitude; // 위도
			let lon = position.coords.longitude; // 경도
			let acc = position.coords.accuracy; // 정확도

			// 위도와 경도의 소수점 이하 자리가 너무 길어 유효 숫자 6자리로 짜름
			lat = lat.toPrecision(6);
			lon = lon.toPrecision(6);

			let now = new Date();

			let map = document.getElementById("map");
			map.src = "https://www.openstreetmap.org/export/embed.html?bbox="
					+ (parseFloat(lon) - 0.01) + "%2C"
					+ (parseFloat(lat) - 0.01) + "%2C"
					+ (parseFloat(lon) + 0.01) + "%2C"
					+ (parseFloat(lat) + 0.01);
			// lat와 lon은 문자열이므로 숫자로 바꾸기 위해 parseFloat() 사용

			let maplink = document.getElementById("bigmaplink");
			let zoom = 15; // 지도의 줌 레벨. 숫자가 클수록 자세한 지도
			maplink.href = "https://www.openstreetmap.org/#map=" + zoom + "/"
					+ lat + "/" + lon;
		}
		var canvas = document.getElementById("myCanvas");
		var context = canvas.getContext("2d");
		var isDrawing = false;

		canvas.addEventListener("mousedown", startDrawing);
		canvas.addEventListener("mousemove", draw);
		canvas.addEventListener("mouseup", stopDrawing);
		canvas.addEventListener("mouseout", stopDrawing);

		document.getElementById("clearButton").addEventListener("click",
				clearCanvas);

		function startDrawing(event) {
			isDrawing = true;
			context.beginPath();
			context.moveTo(event.clientX - canvas.getBoundingClientRect().left,
					event.clientY - canvas.getBoundingClientRect().top);
		}

		function draw(event) {
			if (!isDrawing)
				return;
			context.lineTo(event.clientX - canvas.getBoundingClientRect().left,
					event.clientY - canvas.getBoundingClientRect().top);
			context.stroke();
		}

		function stopDrawing() {
			isDrawing = false;
			context.closePath();
		}

		function clearCanvas() {
			context.clearRect(0, 0, canvas.width, canvas.height);
		}
	</script>
</body>
</html>