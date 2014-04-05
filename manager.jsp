<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="Classes/includes.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manager | Home</title>
    <meta charset="UTF-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
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
                            Manager Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome to SAMS - Manager Home</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>

                <div class="row alert alert-info">
                    <ul class="nav nav-pills">
                      <li><a href="#book">Book Show</a></li>
                      <li><a href="#newlogin">Create Login</a></li>
                      <li><a href="#deletelogin">Delete Login</a></li>
                      <li><a href="#updatelogin">Update Login</a></li>
                      <li><a href="#pay">Pay Commission</a></li>
                    </ul>
                </div>

                <div class="row alert alert-info" id="book">
                    <h3 class="text-center">Book New Show</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=1>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="book_name" placeholder="Show Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Start Date</label>
                            <div class="col-sm-8">
                                <div class="bfh-datepicker" data-format="y-m-d" data-date="today">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">End Date</label>
                            <div class="col-sm-8">
                                <div class="bfh-datepicker" data-format="d-m-y" data-date="today">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max Price - Balcony</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="book_pricebal" placeholder="Max Price - Balcony">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max price - Ordinary</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="book_priceord" placeholder="Max price - Ordinary">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max seats - Balcony</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" name="book_seatbal">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max seats - Ordinary</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" name="book_seatord">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Book Show</button>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="row alert alert-info" id="newlogin">
                    <h3 class="text-center">Create New Salesperson Login</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=2>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">User Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="newlogin_name" placeholder="User Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Password</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="newlogin_pwd" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Create Login</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="deletelogin">
                    <h3 class="text-center">Delete Existing Salesperson Login</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=3>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">User ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="deletelogin_userid" placeholder="User ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Delete Login</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="updatelogin">
                    <h3 class="text-center">Update Existing Salesperson Details</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=4>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">User ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="updatelogin_userid" placeholder="User ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">New Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="updatelogin_name" placeholder="New Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">New Password</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="updatelogin_pwd" placeholder="New Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Update</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="pay">
                    <h3 class="text-center">Pay Commission</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=5>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Employee ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="pay_eid" placeholder="Employee ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Amount to Pay</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="pay_amt" placeholder="Amount to Pay">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Pay Commission</button>
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
    <script src="js/bootstrap-formhelpers.js"></script>
    <script src="js/notify.min.js"></script>
    <script>
        $.notify("Hello World", "success");
    </script>
</body>

</html>