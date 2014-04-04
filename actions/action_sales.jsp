<%@ include file="../Classes/includes.jsp" %>
<%!
void addTrasaction(HttpServletRequest request,HttpSession session)
{
	TransactionTable tt = new TransactionTable();
	Transaction tt = new Transaction(request.getParameter("addexp_title"),request.getParameter("addexp_description"));
	ext.insertTransaction(tt,request.getParameter("addexp_id"),(String)session.getAttribute("id"));
}
void deleteTransaction(HttpServletRequest request,HttpSession session)
{
	ExpenseTable ext = new ExpenseTable();
	ext.deleteExpense(request.getParameter("delexp_id"));
}
%>
<%
out.println(session.getAttribute("id"));
switch(Integer.parseInt(request.getParameter("opr"))){
	case 1:
	addTransaction(request,session);
	break;
	case 2:
	deleteTransaction(request,session);
}
response.sendRedirect("../salesperson.jsp");
%>