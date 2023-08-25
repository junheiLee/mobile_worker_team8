<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>관리자 화면</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(document).ready(function () {
            $('#searchButton').click(function () {
                var region = $('#searchRegion').val();

                $.ajax({
                    url: '/delivery/api/admin/listWorker?region=' + region,
                    type: 'GET',
                    success: function (data) {
                        // console.log(data);
                        var resultTableBody = $('#resultTableBody');
                        resultTableBody.empty(); // 기존 결과 초기화
                        
                        var region = $('#searchRegion').val(); // 검색한 지역 값 가져오기
                        var resultTitle = '<h2>' + region + ' 검색 결과</h2>';
                        $('#resultTitle').html(resultTitle); // 검색 결과 제목 설정

                        // 받아온 JSON 데이터를 테이블 형태로 추가
                        for (var i = 0; i < data.length; i++) {
                            var worker = data[i];
                            var row = '<tr style="border: 1px solid black;">' +
	                            '<td style="border: 1px solid black; padding: 8px; text-align: left;">' + worker.workerId + '</td>' +
	                            '<td style="border: 1px solid black; padding: 8px; text-align: left;">' +
	                            '<a href="/delivery/admin/listDelivery?workerId=' + worker.workerId + '">' + worker.workerEmail + '</a></td>' +
	                            '<td style="border: 1px solid black; padding: 8px; text-align: left;">' + worker.workerCity + '</td>' +
	                            '</tr>';
                            resultTableBody.append(row);
                        }

                        $('#resultTableDiv').show(); // 결과 테이블 표시
                    }
                });
            });
        });
    </script>
</head>
<body>
<h1>배송 기사 검색</h1>

<form id="searchForm">
    <label for="searchRegionq">배송 지역:</label>
    <input type="text" id="searchRegion" name="region" placeholder="지역을 입력하세요">
    <button type="button" id="searchButton">검색</button>
</form>

<div id="resultTableDiv" style="display: none;">
	<div id="resultTitle"></div>
    <table id="resultTable" style="border-collapse: collapse; width: 100%;">
        <thead>
        <tr style="background-color: lightgray;">
            <th style="border: 1px solid black; padding: 8px; text-align: left;">기사 ID</th>
            <th style="border: 1px solid black; padding: 8px; text-align: left;">이메일</th>
            <th style="border: 1px solid black; padding: 8px; text-align: left;">지역</th>
        </tr>
        </thead>
        <tbody id="resultTableBody">
        </tbody>
    </table>
</div>
</body>
</html>