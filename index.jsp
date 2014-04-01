<html>
<head>First Page</html>
<body>
<%@ include file="Employee.jsp" %>

<%
  Employee e = new Employee();
  out.println(e.queryEmployee(7,"n"));
%>

</body>
</html>
