<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Worker Delivery</title>
</head>
<body>
    <h1>Worker Delivery</h1>
    <table style="border-collapse: collapse; width: 100%; border: 1px solid black;">
        <thead>
            <tr style="background-color: lightgray;">
                <th style="border: 1px solid black; padding: 8px; text-align: left;">JOB ID</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">CUSTOMER</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">ADDRESS</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">CITY</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">STATE</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">ZIP</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">PRODUCT</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">PRODUCT URL</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">COMMENTS</th>
                <th style="border: 1px solid black; padding: 8px; text-align: left;">STATUS</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="delivery" items="${deliveryList}">
                <tr style="border: 1px solid black;">
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.deliveryId}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.customer}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.cAddress}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.cCity}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.cState}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.cZip}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.product}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.productUrl}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.comments}</td>
                    <td style="border: 1px solid black; padding: 8px; text-align: left;">${delivery.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div style="text-align: center; margin-top: 10px;">
        <button onclick="window.location.href='/delivery/admin/addDeliveryForm?workerId=${workerId}'">Add Job</button>
    </div>
</body>
</html>