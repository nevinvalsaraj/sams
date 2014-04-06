<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="Classes/includes.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Salesperson | Home</title>
    <meta charset="UTF-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/bootstrap-formhelpers.css" rel="stylesheet" media="screen">
</head>

<body>
    <div class="container-fluid">
        <div class="row alert alert-info">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="text-center">Students' Auditorium Management System</h1>
            </div>
        </div>
        <div class="row">
            
            <div class="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1 hidden-xs">
                <ul class="nav nav-pills nav-stacked alert alert-info" style="position:fixed">
                  <li class="active"><a href="#table_myaccount">My Account Details</a></li>
                  <li><a href="#table_show">Show Details</a></li>
                  <li><a href="#issue">Issue Ticket</a></li>
                  <li><a href="#table_transaction">Transaction Details</a></li>
                  <li><a href="#cancel">Cancel Ticket</a></li>
                </ul>
            </div>


            <div class="col-md-6 col-md-offset-1 col-sm-6 col-sm-offset-1 col-xs-12">

                <div class="row alert alert-success">
                    <h3 class="text-center">
                        <strong>
                            Salesperson Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome <%=session.getAttribute("user").toString()%>!</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>

                <div class="row">
                    <h3 class="text-center">My Account Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_myaccount">
                            <tr class="info">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Total Commission</th>
                                <th>Unpaid Commision</th>
                            </tr>
                            <%
                            EmployeeTable ee = new EmployeeTable();
                            Employee e = ee.queryEmployee(session.getAttribute("id").toString());
                            %>
                                <tr>
                                    <td><%=e.eId%></td>
                                    <td><%=e.eName%></td>
                                    <td><%=((e.eType==0)?"Manager":((e.eType==1)?"Clerk":"Salesperson"))%></td>
                                    <td><%=e.eCommission%></td>
                                    <td><%=e.eCommission-e.ePaid%></td>
                                </tr>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Show Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_show">
                            <tr class="info">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Price - Ord</th>
                                <th>Price - Bal</th>
                                <th>Seats - Ord</th>
                                <th>Seats - Bal</th>
                            </tr>
                            <%
                            ShowTable st = new ShowTable();
                            List<Show> sl = st.listShow();
                            for(int i=0;i<sl.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=sl.get(i).sId%></td>
                                    <td><%=sl.get(i).sName%></td>
                                    <td><%=sl.get(i).sDate%></td>
                                    <td><%=sl.get(i).eDate%></td>
                                    <td><%=sl.get(i).pOrd%></td>
                                    <td><%=sl.get(i).pBal%></td>
                                    <td><%=sl.get(i).lOrd%></td>
                                    <td><%=sl.get(i).lBal%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

                <div class="row alert alert-info" id="issue">
                    <h3 class="text-center">Issue New Ticket</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_sales.jsp">
                        <input type="hidden" name="opr" value=1>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="issue_showid" placeholder="Show ID">
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">No. of Ordinary tickets</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" name="issue_ord">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">No. of Balcony tickets</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" name="issue_bal">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Issue Ticket</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <h3 class="text-center">Transaction Details</h3>
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
                            TransactionTable tt = new TransactionTable();
                            List<Transaction> tl = tt.listTransaction(session.getAttribute("id").toString());
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

                <div class="row alert alert-info" id="cancel">
                    <h3 class="text-center">Cancel Ticket</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_sales.jsp">
                        <input type="hidden" name="opr" value=2>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Transaction ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="cancel_transid" placeholder="User Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Cancel Ticket</button>
                            </div>
                        </div>
                    </form>
                </div>

                

            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-formhelpers.js"></script>
    <script src="js/notify.min.js"></script>
    <script>
        
        $( document ).ready(function() {
            $('#book_start').find('div.input-group').find('input').attr("name", "book_sdate");
            $('#book_end').find('div.input-group').find('input').attr("name", "book_edate");
            // change color if no seats available
            $('#table_show tr').each(function() {
                var temp1 = $(this).find("td").eq(6).html();
                var temp2 = $(this).find("td").eq(7).html();
                if(temp1 == "0" && temp2 == "0")
                    $(this).attr("class","danger");
            });
        });
    </script>
    <script>
    $('li').click(function() {
        if (!$(this).hasClass('active')) {
            $('li.active').removeClass('active');
            $(this).addClass('active');
        }
    });
    </script>
</body>

</html>