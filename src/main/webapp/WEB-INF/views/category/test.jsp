<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test상세페이지</title>
</head>
<body>
test success<br>
<hr>
<c:forEach items="${dto }" var="item">
${item.kan_code} : ${item.cls_nm_1} > ${item.cls_nm_2} > ${item.cls_nm_3} > ${item.cls_nm_4}<br>
활성화 : ${item.activation}<br>
<hr>
</c:forEach>
</body>
</html>