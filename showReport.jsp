<%@ include file="Classes/includes.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error404.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="user.*" %>

<head>
    <title>SAMS</title>
    <meta charset="UTF-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>

<body>
    <div class="container-fluid">
        <div class="row alert alert-info">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="text-center">Students' Auditorium Management System</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12">
            	<% 
            		ShowTable st = new ShowTable();
                    Show s = st.queryShow(request.getParameter("showreport_id")); 
                %>
            	<div class="row alert alert-success">
            	    <h3 class="text-center">
            	        <strong>
            	            Manager - Show Report
            	        </strong>
            	    </h3>
            	    <p class="text-center">Welcome <%=session.getAttribute("user").toString()%>!</p>
            	    <br><br>
            	    
            	    <h4 class="text-center"><strong> Show ID : <%= s.sId %></strong></h4>
            	    <h4 class="text-center"><strong> Show Name : "<%= s.sName %>"</strong></h4>
            	    <br>
            	    <p class="text-center">
		        	    <a href="manager.jsp"><strong>Back to Manager Home</strong></a><br>
		        	    <a href="Logout.jsp"><strong>Logout</strong></a>
	        	    </p>
            	</div>

            	<div class="row">
                    <h2 class="text-center" id="table_report"><strong>Financial Report</strong></h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <tr class="info">
                                <th>Amount Collected(Ord) (Rs.) (+)</th>
                                <th>Amount Collected(Bal) (Rs.) (+)</th>
                                <th>Total Amount Collected (+)</th>
                                <th>Expense (-)</th>
                                <th>Commission (-)</th>
                                <th>Net Profit (+)</th>
                            </tr>
                            <%
                            
                            EmployeeTable et = new EmployeeTable();
                            ExpenseTable ext = new ExpenseTable();
                            TransactionTable tt = new TransactionTable();
                            int a_Ord=s.pOrd*(s.mOrd-s.lOrd);
                            int a_Bal=s.pBal*(s.mBal-s.lBal);
                            int a_Tic = a_Ord+a_Bal;
                            int a_Exp=ext.totalSExpense(request.getParameter("showreport_id"));
                            int a_Com=(a_Tic*s.pCommission)/100;
                            int profit = a_Tic-a_Exp-a_Com;
                            %>
                                <tr>

                                    <td><%=a_Ord%></td>
                                    <td><%=a_Bal%></td>
                                    <td><%=a_Tic%></td>
                                    <td><%=a_Exp%></td>
                                    <td><%=a_Com%></td>
                                    <td><%=profit%></td>
                                </tr>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Ticket Sales</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_show">
                            <tr class="info">
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Price - Ord</th>
                                <th>Price - Bal</th>
                                <th>Seats - Ord</th>
                                <th>Seats - Bal</th>
                                <th>Booked Seats - Ord(%)</th>
                                <th>Booked Seats - Bal(%)</th>
                            </tr>
                            <tr>
                                <td><%=s.sDate%></td>
                                <td><%=s.eDate%></td>
                                <td><%=s.pOrd%></td>
                                <td><%=s.pBal%></td>
                                <td><%=s.mOrd%></td>
                                <td><%=s.mBal%></td>
                                <td><%=((s.mOrd-s.lOrd)*100)/s.mOrd%></td>
                                <td><%=((s.mBal-s.lBal)*100)/s.mBal%></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Expenses Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_expense">
                            <tr class="info">
                                <th>ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Date</th>
                                <th>Amount</th>
                            </tr>
                            <%
                            List<Expense> exl = ext.listSExpense(request.getParameter("showreport_id"));
                            for(int i=0;i<exl.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=exl.get(i).exId%></td>
                                    <td><%=exl.get(i).exTitle%></td>
                                    <td><%=exl.get(i).exDescription%></td>
                                    <td><%=exl.get(i).exDate%></td>
                                    <td><%=exl.get(i).amount%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Ticket Sales Transactions</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_transaction">
                            <tr class="info">
                                <th>Transaction ID</th>
                                <th>Show ID</th>
                                <th>Booking Date</th>
                                <th>Seats - Ord</th>
                                <th>Seats - Bal</th>
                                <th>Amount</th>
                                <th>Refund</th>
                            </tr>
                            <%
                            List<Transaction> tl = tt.listSTransaction(request.getParameter("showreport_id"));
                            for(int i=0;i<tl.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=tl.get(i).tId%></td>
                                    <td><%=tl.get(i).sId%></td>
                                    <td><%=tl.get(i).bDate%></td>
                                    <td><%=tl.get(i).nOrd%></td>
                                    <td><%=tl.get(i).nBal%></td>
                                    <td><%=tl.get(i).amount%></td>
                                    <td><%=tt.refundAmount(tl.get(i))%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>

</html>
