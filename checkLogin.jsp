<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Employee.jsp" %>
<html>
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
		</head>
		<body>
				<%
				int username=Integer.parseInt(request.getParameter("username"));
				String password=request.getParameter("password");
				Employee e = new Employee();
				if(e.queryEmployee(username,password)!=-1)
						{
						session.setAttribute("username",username);
						response.sendRedirect("Home.jsp");
						}
				else
						response.sendRedirect("Error.jsp");
				%>
		</body>
</html>