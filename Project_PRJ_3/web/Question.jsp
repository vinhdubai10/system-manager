<%-- 
    Document   : Question
    Created on : Nov 11, 2022, 9:44:16 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Question</h1>
        <form action="question" method="get">
                    <table border="1">
                        <tr>
                            <td>Question</td>
                            <td>A</td>
                            <td>B</td>
                            <td>C</td>
                            <td>D</td>
                            <td>Answer</td>
                        </tr>
                        <c:forEach items="${listQ}" var="item">
                            <td>${item.getQuestion()}</td>
                            <td>${item.getA()}</td>
                            <td>${item.getB()}</td>
                            <td>${item.getC()}</td>
                            <td>${item.getD()}</td>
                            <td>${item.getAnswer()}</td>
                        </c:forEach>
                        
                        

                    </table>
                <input type="submit" value="OK" name="ok">
                    

                </form>
    </body>
</html>
