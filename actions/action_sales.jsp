<%@ include file="../Classes/includes.jsp" %>
<%!
int addTrasaction(HttpServletRequest request,HttpSession session)
{
	TransactionTable tt = new TransactionTable();
	Transaction tt = new Transaction(request.getParameter("issue_bal"),request.getParameter("issue_ord"));
	return tt.insertTransaction(tt,request.getParameter("issue_showid"),(String)session.getAttribute("id"));
}
void deleteTransaction(HttpServletRequest request,HttpSession session)
{
	TransactionTable tt = new TransactionTable();
	return ext.deleteTransaction(request.getParameter("cancel_transid"));
}
%>
<%
switch(Integer.parseInt(request.getParameter("opr"))) {
	case 1:
	addTransaction(request,session);
	break;
	case 2:
	deleteTransaction(request,session);
}
response.sendRedirect("../salesperson.jsp");
%>