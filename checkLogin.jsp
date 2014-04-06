<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="Classes/includes.jsp" %>

<html>
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>JSP Page</title>
		</head>
		<body>
				<%
				String id = request.getParameter("id");
				String pass = request.getParameter("password");
				EmployeeTable et = new EmployeeTable();
				Employee e = et.validate(id,pass);
				if(e!=null)
				{
					session.setAttribute("id",id);
					session.setAttribute("user",e.eName);
					if(e.eType == 0)
						response.sendRedirect("manager.jsp");	
					else if(e.eType == 1)
						response.sendRedirect("clerk.jsp");	
					else
						response.sendRedirect("salesperson.jsp");
				}
				else
					response.sendRedirect("error.jsp");
				%>
		</body>
</html>