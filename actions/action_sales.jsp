<%@ include file="../Classes/includes.jsp" %>
<%!
int addTransaction(HttpServletRequest request,HttpSession session)
{
	TransactionTable tt = new TransactionTable();
	Transaction t = new Transaction(request.getParameter("issue_bal"),request.getParameter("issue_ord"));
	return tt.insertTransaction(t,request.getParameter("issue_showid"),(String)session.getAttribute("id"));
}
void deleteTransaction(HttpServletRequest request,HttpSession session)
{
	TransactionTable tt = new TransactionTable();
	tt.deleteTransaction(request.getParameter("cancel_transid"),(String)session.getAttribute("id"));
}
%>
<%
switch(Integer.parseInt(request.getParameter("opr"))) {
	case 1:
	if(addTransaction(request,session)!=-1)
		response.sendRedirect("../ticket.jsp");
	else
		response.sendRedirect("../salesperson.jsp");
	break;
	case 2:
	deleteTransaction(request,session);
	response.sendRedirect("../salesperson.jsp");
}
%>