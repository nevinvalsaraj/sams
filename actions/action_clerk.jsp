<%@ include file="../Classes/includes.jsp" %>
<%!
void addExpense(HttpServletRequest request,HttpSession session)
{
	ExpenseTable ext = new ExpenseTable();
	Expense ex = new Expense(request.getParameter("addexp_title"),request.getParameter("addexp_description"),request.getParameter("addexp_amount"));
	ext.insertExpense(ex,request.getParameter("addexp_id"),(String)session.getAttribute("id"));
}
void deleteExpense(HttpServletRequest request,HttpSession session)
{
	ExpenseTable ext = new ExpenseTable();
	ext.deleteExpense(request.getParameter("delexp_id"));
}
%>
<%
switch(Integer.parseInt(request.getParameter("opr"))){
	case 1:
	addExpense(request,session);
	break;
	case 2:
	deleteExpense(request,session);
}
response.sendRedirect("../clerk.jsp");
%>