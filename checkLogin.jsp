<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Classes/includes.jsp" %>

<html>
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
		</head>
		<body>
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				String pass = request.getParameter("password");
				EmployeeTable et = new EmployeeTable();
				Employee e = et.validate(id,pass);
				if(e!=null)
				{
					if(e.eType == 0)
						response.sendRedirect("manager.jsp");	
					else if(e.eType == 1)
						response.sendRedirect("clerk.jsp");	
					else
						response.sendRedirect("salesperson.jsp");
				}
				else
					response.sendRedirect("Error.jsp");
				%>
		</body>
</html>