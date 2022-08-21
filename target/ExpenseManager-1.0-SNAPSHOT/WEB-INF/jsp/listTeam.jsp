<%-- 
    Document   : listTeam
    Created on : Aug 20, 2022, 8:27:52 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container pt-4 mt-3">
    <h2>Danh sách Nhóm</h2>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Tên nhóm</th>
                <th>Mô tả</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${team}" var="t">
                <tr>
                    <td class="col-2">${t.id}</td>
                    <td class="col-3">${t.name}</td>
                    <td class="col-2">${t.description}</td>
                    <td class="col-2">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal2">Tham gia nhóm</button>                  
                    </td>
                </tr>
            </c:forEach>        
        </tbody>
    </table>


    <div class="myForm2">
        <c:url value="listTeam" var="action" />
        <form:form method="post" action="${action}" modelAttribute="team">
            <!-- The Modal -->
            <div class="modal" id="myModal2">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Chọn vào nhóm</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="mb-3 mt-3">
                                <label for="name" class="form-label">Tên user</label>
                           
                            </div>
                            <div class="mt-3">
                                <label for="description" class="form-label">Chọn nhóm</label>
                                <select id="team" class="form-select">
                                    <c:forEach items="${team}" var="t">
                                        <option value="${t.id}">${t.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
