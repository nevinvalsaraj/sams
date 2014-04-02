<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="user.UserData" scope="session"/>
<jsp:setProperty name="user" property="*"/> 

<html>
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
		</head>
		<body>
			<a href="checkLogin.jsp">Yo</a>
		</body>
</html>