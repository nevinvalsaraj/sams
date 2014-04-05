<%@ include file="../Classes/includes.jsp" %>
<%!
void bookShow(HttpServletRequest request,HttpSession session)
{
	ShowTable st = new ShowTable();
	Show s = new Show(request.getParameter("book_name"),request.getParameter("book_sdate"),request.getParameter("book_edate"),request.getParameter("book_seatbal"),request.getParameter("book_seatord"),request.getParameter("book_pricebal"),request.getParameter("book_priceord"));
	st.insertShow(s);
}
void createLogin(HttpServletRequest request,HttpSession session)
{
	EmployeeTable et = new EmployeeTable();
	Employee e = new Employee(request.getParameter("newlogin_name"),request.getParameter("newlogin_pwd"),"2");
	et.insertEmployee(e);
}
void deleteLogin(HttpServletRequest request,HttpSession session)
{
	EmployeeTable et = new EmployeeTable();
	et.deleteEmployee(request.getParameter("deletelogin_userid"));
}
void changeLogin(HttpServletRequest request,HttpSession session)
{
	EmployeeTable et = new EmployeeTable();
	et.updatePassword(request.getParameter("updatelogin_userid"),request.getParameter("updatelogin_pwd"));
}
void payComm(HttpServletRequest request,HttpSession session)
{
	EmployeeTable et = new EmployeeTable();
	et.updateCommission(request.getParameter("pay_eid"),request.getParameter("pay_amt"));
}
%>
<%
switch(Integer.parseInt(request.getParameter("opr"))) {
	case 1:
	bookShow(request,session);
	break;
	case 2:
	createLogin(request,session);
	break;
	case 3:
	deleteLogin(request,session);
	break;
	case 4:
	changeLogin(request,session);
	break;
	case 5:
	payComm(request,session);
	break;
}
response.sendRedirect("../manager.jsp");
%>