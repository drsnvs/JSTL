<%-- 
    Document   : index
    Created on : Apr 18, 2024, 9:23:07 AM
    Author     : st
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSTL Example</title>
</head>
<body>
    <c:set var="name" value="Darshan" />
    <c:if test="${name ne null}">
        <p>Welcome, <c:out value="${name}" /></p>
    </c:if>

    <c:set var="now" value="<%= new java.util.Date() %>" />

    <fmt:formatDate value="${now}" pattern="MM/dd/yyyy" var="formattedDate" />
    <p>Current Date: <c:out value="${formattedDate}" /></p>
    
    <%try{%>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/darshan_14" user="root" password="" />
        <sql:query dataSource="${dataSource}" var="result">
            SELECT * FROM users;
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <p>Address: <c:out value="${row.address}" /></p>
        </c:forEach>
    <%}catch(Exception e){
        e.printStackTrace();
    }%>
    

</body>
</html>
