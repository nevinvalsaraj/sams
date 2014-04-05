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
            <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">

                <div class="row alert alert-success">
                    <h3 class="text-center">
                        <strong>
                            Salesperson Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome  <%=session.getAttribute("user").toString()%>!</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>

                <div class="row alert alert-info">
                    <ul class="nav nav-pills">
                      <li><a href="#issue">Issue Ticket</a></li>
                      <li><a href="#cancel">Cancel Ticket</a></li>
                    </ul>
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
</body>

</html>