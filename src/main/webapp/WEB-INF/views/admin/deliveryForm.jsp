<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Add Delivery Job</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
    	var workerIdValue = ${workerId};
    	
	    $(document).ready(function () {
	        $('#addButton').click(function () {
	            var formData = {
	            		workerId: $('#workerId').val(),
	            		cIdentifier: $('#identifier').val(),
	                    customer: $('#customer').val(),
	                    cAddress: $('#address').val(),
	                    cCity: $('#city').val(),
	                    cState: $('#state').val(),
	                    cZip: $('#zip').val(),
	                    product: $('#product').val(),
	                    productUrl: $('#productUrl').val(),
	                    comments: $('#comments').val()
	            };
	            
	            $.ajax({
	                url: '/delivery/api/admin/addDelivery',
	                type: 'POST',
	                data: JSON.stringify(formData),
	                contentType: 'application/json; charset=utf-8',
	                dataType: 'json',
	                success: function (response) {
                        if (response === 1) {
                            alert("등록에 성공하였습니다.");
                            window.location.href = '/delivery/admin/listDelivery?workerId=' + workerIdValue;
                        } else {
                            alert("등록에 실패하였습니다.");
                        }
                    },
                    error: function (error) {
                        console.error(error);
                        alert("작업중 에러가 발생하였습니다.");
                    }
	            });
	        });
	    });
	</script>
</head>
<body>
    <h1>Add Delivery Job</h1>
    
    <form id="addForm">
    	<input type="hidden" id="workerId" name="wId" value="${workerId }">
    	
    	<label for="customer">IDENTIFIER:</label>
        <input type="text" id="identifier" name="cIdentifier" required><br>
    
        <label for="customer">CUSTOMER:</label>
        <input type="text" id="customer" name="customer" required><br>
        
        <label for="address">ADDRESS:</label>
        <input type="text" id="address" name="cAddress" required><br>
        
        <label for="city">CITY:</label>
        <input type="text" id="city" name="cCity" required><br>
        
        <label for="state">STATE:</label>
        <input type="text" id="state" name="cState" required><br>
        
        <label for="zip">ZIP:</label>
        <input type="text" id="zip" name="cZip" required><br>
        
        <label for="product">PRODUCT:</label>
        <input type="text" id="product" name="product" required><br>
        
        <label for="productUrl">PRODUCT URL:</label>
        <input type="text" id="productUrl" name="productUrl" required><br>
        
        <label for="comments">COMMENTS:</label>
        <input type="text" id="comments" name="comments"><br>
        
        <button type="button" id="addButton">Add Job</button>
    </form>
</body>
</html>