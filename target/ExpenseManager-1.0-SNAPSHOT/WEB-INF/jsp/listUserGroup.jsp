<%-- 
    Document   : addUserGroup
    Created on : Aug 17, 2022, 4:10:33 PM
    Author     : USER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container pt-4 mt-3">
    <h2>Thêm thành viên</h2>

    <div class="col">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">Tạo nhóm</button>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>FirstName</th>
                <th>LastName</th>
                <th>Email</th>
                <th>UserName</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${user}" var="u">
                <tr>
                    <td class="col-2">${u[0]}</td>
                    <td class="col-3">${u[1]}</td>
                    <td class="col-2">${u[2]}</td>
                    <td class="col-2">${u[3]}</td>
                    <td class="col-2">
                        <a><button type="button" class="btn btn-primary">Thêm vào nhóm</button></a>
                    </td>
                </tr>
            </c:forEach>        
        </tbody>
    </table>

    <div class="myForm">
        <c:url value="team" var="action" />
        <form:form method="post" action="${action}" modelAttribute="team">
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Tạo nhóm</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="mb-3 mt-3">
                                <label for="name" class="form-label">Tên nhóm</label>
                                <form:input path="name" class="form-control" placeholder="Enter name" id="name"/>
                            </div>
                            <div class="mt-3">
                                <label for="description" class="form-label">Mô tả</label>
                                <form:textarea path="description" class="form-control" rows="5" id="description" name="text"></form:textarea>
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
