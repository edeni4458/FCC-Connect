<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- c:out ; c:forEach etc. -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Formatting (dates) -->
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>New Student</title>
                        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
                        <link rel="stylesheet" href="/css/edit.css">
                        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                        <script type="text/javascript" src="/js/app.js"></script>

                    </head>

                    <body class="p-3 mb-2 bg-dark text-white">
                        <div class="container">
                            <div class="container-md">
                                
                                <h1>Add a Student</h1>
                                <hr>

                                <form:form action="/classes/add/student" method="post" modelAttribute="student">
                                    <div class="form-control">
                                        <form:label path="name">Student Name</form:label>
                                        <form:errors class="red-font" path="name"></form:errors>
                                        <form:input class="form-control" path="name"></form:input>
                                    </div>
                                    <div class="form-control">
                                        <form:label path="contact">Student Email</form:label>
                                        <form:errors class="red-font" path="contact"></form:errors>
                                        <form:input class="form-control" path="contact"></form:input>
                                    </div>
                                    <div class="form-control">
                                        <form:label path="course">Classes</form:label>
                                        <form:errors class="red-font" path="course"></form:errors>
                                        <form:select class="form-control" path="course">
                                            <c:forEach var="course" items="${courses}">
                                                <option value="${course.id}">${course.name}</option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                    <hr>
                                    <input class="btn btn-primary" type="submit" value="add student">
                                    <a class="btn btn-warning" href="/classes">cancel</a>
                                </form:form>
                            </div>
                        </div>
                        </div>

                    </body>

                    </html>