<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="Classes/includes.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Clerk | Home</title>
    <meta charset="UTF-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
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
                            Clerk Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome to SAMS - Clerk Home</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>

                <div class="row alert alert-info">
                    <ul class="nav nav-pills">
                      <li><a href="#">Add Expense</a></li>
                      <li><a href="#delexp">Delete Expense</a></li>
                    </ul>
                </div>


                <div class="row alert alert-info" id="addexp">
                    <h3 class="text-center">Add Expense Record</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/addExp.jsp">
                        
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="addexp_id" placeholder="Show ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Expense Description</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="addexp_description" placeholder="Expense Description">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Expense amount</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="addexp_amount" placeholder="Expense amount">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Add Expense</button>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="row alert alert-info" id="delexp">
                    <h3 class="text-center">Delete Expense Record</h3>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Expense ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="delexp_id" placeholder="Expense ID">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default" method="POST">Delete Expense Record</button>
                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>

</html>