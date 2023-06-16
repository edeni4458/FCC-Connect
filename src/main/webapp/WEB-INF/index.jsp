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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FCC Connect Login</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
    <div class="main-container">
        <h1 class="align-content-center">FCC Connect</h1>
        <hr>
            <div class="sub-container">
                <div class="left-side">
                    <h2>Register</h2>
                    <form:form action="/register" method="post" modelAttribute="newUser">
                        <div>
                            <div class="form-group">
                            <form:label path="userName">name</form:label>
                            <form:input  class="form-control" path="userName"/>
                            <form:errors class="red-font" path="userName"/>
                            </div>
                            <div class="form-group">
                            <form:label path="email">email</form:label>
                            <form:input  class="form-control" path="email"/>
                            <form:errors class="red-font" path="email"/>
                            </div>
                            <div>
                            <form:label path="password">password</form:label>
                            <form:input type="password"  class="form-control" path="password"/>
                            <form:errors class="red-font" path="password"/>
                            </div>
                            <div>
                            <form:label path="confirm">confirm password</form:label>
                            <form:input type="password" class="form-control" path="confirm"/>
                            <form:errors class="red-font" path="confirm"/>
                            </div>
                        </div>
                        <input id="margin-top" class="btn btn-dark" type="submit" value="register">
                    </form:form>
                </div>
                <div class="right-side">
                    <h2>Login</h2>
                    <div class="form-group">
                        <form:form action="/login" method="post" modelAttribute="newLogin">
                            <div class="form-group">
                                <form:label path="email">email</form:label>
                                <form:input  class="form-control" path="email"/>
                                <form:errors class="red-font" path="email"/>
                            </div>
                            <div>
                                <form:label path="password">password</form:label>
                                <form:input type="password" class="form-control" path="password"/>
                                <form:errors class="red-font" path="password"/>
                            </div>
                        <input id="margin-top"  class="btn btn-dark" type="submit" value="login">
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="sub-note">
                <a href="https://www.fccbronx.org/">Know. Love. Live.</a>
            </div>
        </div>
</body>
</html>