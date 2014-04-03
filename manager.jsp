<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
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
                    <h3 class="text-center">Book New Show</h3>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputEmail3" placeholder="Show Name">
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
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Max Price - Balcony">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max price - Ordinary</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Max price - Ordinary">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max seats - Balcony</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max seats - Ordinary</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
                            <div class="col-sm-8">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Book Show</button>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="row alert alert-info">
                    <div class="row alert alert-info">
                        <h3 class="text-center">Create New Salesperson Login</h3>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">User Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="User Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Password</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="submit" class="btn btn-primary btn-default">Create Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row alert alert-info">
                    <div class="row alert alert-info">
                        <h3 class="text-center">Delete Existing Salesperson Login</h3>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">User ID</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="User ID">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="submit" class="btn btn-primary btn-default">Delete Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row alert alert-info">
                    <div class="row alert alert-info">
                        <h3 class="text-center">Update Existing Salesperson Details</h3>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">User ID</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="User ID">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">New Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="New Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">New Password</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="New Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="submit" class="btn btn-primary btn-default">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row alert alert-info">
                    <div class="row alert alert-info">
                        <h3 class="text-center">Pay Commission</h3>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Employee ID</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Employee ID">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Amount to Pay</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon">Rs.</span>
                                        <input type="text" class="form-control" id="inputEmail3" placeholder="Amount to Pay">
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
    </div>

    <!-- jQuery -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="js/bootstrap-formhelpers.js"></script>
</body>

</html>