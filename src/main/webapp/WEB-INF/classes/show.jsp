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
                        <title>View ${course.name}</title>
                        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
                        <link rel="stylesheet" href="/css/edit.css">
                        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                        <script type="text/javascript" src="/js/app.js"></script>
                </head>
                    <body class="p-3 mb-2 bg-dark text-white">
                        <div class="container">
                            <div class="buttonShow">
                                <h1>${course.name} with ${course.user.userName}</h1>
                                <div class="button-Show">
                                    <a class="btn btn-success" href="/classes/new">+ new course</a>
                                    <a class="btn btn-success" href="/classes/add/student">+ add student</a>
                                </div>
                            </div>
                            <hr>
                            <h3>${course.day}</h3>
                            <h3>${course.time} ${course.amPm}</h3>
                            <h4>$${course.price}</h4>
                            <h4>${course.description}</h4>
                            <hr>
                            <div class="studentsView">
                                <h3>Students Enrolled:</h3>
                                <table class="table table">
                                    <thead class="white-font">
                                        <th>Student Name</th>
                                        <th>Student Email</th>
                                        <th>Action</th>
                                    </thead>
                                    <tbody class="white-font">
                                        <c:forEach var="student" items="${course.students}">
                                            <tr>
                                                <td>${student.name}</td>
                                                <td>${student.contact}</td>
                                                <td>
                                                    <a class="btn btn-success" href="/classes/${student.id}/edit/student">edit</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <hr>
                            <div class="buttons">
                                <a class="btn btn-warning" href="/classes">return</a>
                                <c:if test="${course.user.id == userId}">
                                    <a class="btn btn-primary" href="/classes/${id}/edit">edit</a>
                                    <form action="/classes/${course.id}" method="post">
                                        <input type="hidden" name="_method" value="delete">
                                        <input class="btn btn-danger" type="submit" value="delete">
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </body>
            </html>