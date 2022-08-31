<%-- 
    Document   : header
    Created on : Aug 12, 2022, 4:21:32 PM
    Author     : USER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Expensive Web Manager</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/"/>">Khoản chi</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/user/incomeList"/>" tabindex="-1" aria-disabled="true">Khoản thu</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Thống kê
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="<c:url value="/user/statsExpense"/>">Thống kê khoản chi</a></li>
            <li><a class="dropdown-item" href="<c:url value="/user/statsIncome"/>">Thống kê khoản thu</a></li>
          </ul>
        </li>
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Nhóm
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="<c:url value="/user/list"/>">Tạo nhóm</a></li>
            <li><a class="dropdown-item" href="<c:url value="/user/listTeam"/>">Tham gia vào nhóm</a></li>
            <li><a class="dropdown-item" href="#">Danh sách thành viên</a></li>
            <li><a class="dropdown-item" href="#">Trò chuyện</a></li>
          </ul>
        </li>
        
        <sec:authorize access="!isAuthenticated()">
            <li class="nav-item">
                <a class="nav-link text-danger" href="<c:url value="/login"/>">Dang nhap</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="<c:url value="/register"/>">Dang ky</a>
            </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li class="nav-item">
                <a class="nav-link text-info" href="<c:url value="/"/>">${pageContext.request.userPrincipal.name}</a>
            </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li class="nav-item">
                <a class="nav-link text-info" href="<c:url value="/logout"/>">Dang xuat</a>
            </li>
        </sec:authorize>
      </ul>
      <form class="d-flex" action="">
        <input class="form-control me-2" name="kw" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>