<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	request.setAttribute("plus", num1 + num2);
	request.setAttribute("minus", num1 - num2);
	request.setAttribute("multiply", num1 * num2);
	request.setAttribute("divide", num1 / num2);
	%>


</body>
</html>