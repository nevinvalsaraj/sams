<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Classes/includes.jsp" %>
<html>
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
		</head>
		<body>
				<%
				Employee e = new Employee(Integer.parseInt(request.getParameter("username")),request.getParameter("password"));
				EmployeeTable et = new EmployeeTable();
				e=et.queryEmployee(e);
				if(e!=null)
				{
					session.setAttribute("username",e.eName);
					response.sendRedirect("Home.jsp");
				}
				else
					response.sendRedirect("Error.jsp");
				%>
		</body>
</html>