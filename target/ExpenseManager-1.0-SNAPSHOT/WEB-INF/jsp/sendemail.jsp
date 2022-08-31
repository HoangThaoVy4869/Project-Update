<%-- 
    Document   : sendemail
    Created on : Aug 31, 2022, 9:39:21 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 10px;">
    <div class="row" 
         style="border: 1px darkgrey solid; border-radius: 10px; 
         width: 50%; margin: 0 auto; padding: 20px">
        <div class="col-sm-12">
            <h2 class="myclass">Information</h2>
            <form action="/send" method="post">
                <div class="form-group">
                    <label>To:</label>
                    <input type="text"
                           class="form-control" name="to" placeholder="Enter email"/>
                </div>
                <div class="form-group">
                    <label>Subject: </label>
                    <input type="text"
                           class="form-control" name="subject" placeholder="Enter email"/>
                </div>
                <div class="form-group">
                    <label>Content: </label>
                    <input type="text"
                           class="form-control" rows="3" name="content" placeholder="Enter email"/>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
            </form>
        </div>
    </div>
</div>
