<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="Classes/includes.jsp" %>
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

            <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">
                <h3 class="text-center">Show Ticket</h3>

                <div class="row">
                    <h3 class="text-center">Transaction Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_transaction">
                            <tr class="info">
                                <th>Transaction ID</th>
                                <th>Show ID</th>
                                <th>Employee ID</th>
                                <th>Booking Date</th>
                                <th>Seats - Ord</th>
                                <th>Seats - Bal</th>
                                <th>Amount</th>
                            </tr>
                            <%
                            TransactionTable tt = new TransactionTable();
                            List<Transaction> tl = tt.listETransaction(session.getAttribute("id").toString());
                            int i=tl.size()-1;
                            %>
                                <tr>
                                    <td><%=tl.get(i).tId%></td>
                                    <td><%=tl.get(i).sId%></td>
                                    <td><%=tl.get(i).eId%></td>
                                    <td><%=tl.get(i).bDate%></td>
                                    <td><%=tl.get(i).nOrd%></td>
                                    <td><%=tl.get(i).nBal%></td>
                                    <td><%=tl.get(i).amount%></td>
                                </tr>
                        </table>
                    </div>
                </div>

                <div class="row alert alert-info">
                    <p class="text-center">
                        <a href="salesperson.jsp" class="alert-link">Go Back</a>
                    </p>
                </div>

            </div>

        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            window.print();
        });
    </script>
</body>

</html>
