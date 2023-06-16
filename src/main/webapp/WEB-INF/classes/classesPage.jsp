
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Class Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href=" css/classPage.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="main-container">
        <h5 id="text">Create classes and add students to them.</h5>
        <div class="greeting">
            <h1>Welcome, ${user.userName}</h1>
            <a class="btn btn-danger" href="/logout">logout</a>
        </div>
        <div class="course-level">
            <h5>Class Schedules</h5>
            <div class="buttons">
                <a class="btn btn-outline-success" href="/classes/new">+ new course</a>
                <a class="btn btn-outline-success" href="/classes/add/student">+ add student</a>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
                <th>Class Name</th>
                <th>Instructer</th>
                <th>Weekday</th>
                <th>Date</th>
                <th>Price</th>
                <th>Time</th>
                <th>AM/PM</th>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>
                            <a id="remove-line" href="/classes/${course.id}">${course.name}</a>
                            <c:if test="${course.user.id == userId}">
                                <a class="btn btn-dark" href="/classes/${course.id}/edit">edit</a>
                            </c:if>
                        </td>
                        <td>${course.user.userName}</td>
                        <td>${course.day}</td>
                        <td>${course.date}</td>
                        <td>$${course.price}</td>
                        <td>${course.time}</td>
                        <td>${course.amPm}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="logo-box">
        <a href="https://www.fccbronx.org/"><img src="https://www.crosslinkcares.org/wp-content/uploads/2021/04/fcc-tile.png" alt="FCC logo"></a>
    </div>
</body>
</html>
