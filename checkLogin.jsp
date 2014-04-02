<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="user.UserData" scope="session"/>

<%@ include file="Classes/includes.jsp" %>
<html>
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
		</head>
		<body>
				<%
				//String u = user.getUserName();
				//String p = user.getPassword();
				Employee e = new Employee(7,"n");
				EmployeeTable et = new EmployeeTable();
				e = et.queryEmployee(e);
				if(e!=null)
				{
					response.sendRedirect("Home.jsp");
				}
				else
					response.sendRedirect("Error.jsp");
				%>
		</body>
</html>