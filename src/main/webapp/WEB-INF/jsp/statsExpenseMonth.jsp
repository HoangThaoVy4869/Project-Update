<%-- 
    Document   : statsExpense
    Created on : Aug 16, 2022, 6:27:34 PM
    Author     : USER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 style="text-align: center">THỐNG KÊ KHOẢN CHI THEO THANG</h1>
<c:forEach items="${statsExpenseMonth}" var="s">
        <div></div>
</c:forEach>

<div>
  <canvas id="myExpenseChartMonth"></canvas>
</div>

<!--<form action="">
    <div class="form-group">
        <label>Từ thời điểm</label>
        <input type="date" name="fromDate" class="form-control">
    </div>
    <div class="form-group">
        <label>Đến thời điểm</label>
        <input type="date" name="toDate" class="form-control">
    </div>
    <input type="submit" value="Thống kê" class="btn btn-success">
</form>-->

<select id="cars">
    <option value="thang"><a href="#">Tháng</a></option>
    <option value="quy"><a href="#">Quý</a></option>
    <option value="nam"><a href="#">Năm</a></option>
</select>
<c:set var="now" value="<%=new java.util.Date()%>" />
<p name="now">Formatted Date (7): <fmt:formatDate  pattern="yyyy-MM-dd" value="${now}" /></p>

<table class="table">
    <tr>
        <th></th>
        <th></th>
    </tr>
    <c:forEach items="${statsExpenseMonth}" var="s">
        <tr>
            <td>${s[2]}</td>
            <td>${s[3]} VNĐ</td>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/resources/js/stats.js"/>"></script>
<script>
    let expenseLabels=[], expenseInfo=[]
    <c:forEach items="${statsExpenseMonth}" var="s">
        expenseLabels.push('${s[2]}')
        expenseInfo.push(${s[3]})
    </c:forEach>
    window.onload = function() {
        expenseChart("myExpenseChartMonth",expenseLabels, expenseInfo)
    }
</script>