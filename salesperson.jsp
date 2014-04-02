<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Salesperson | Home</title>
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
                            Salesperson Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome to SAMS - Salesperson Home</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>


                <div class="row alert alert-info">
                    <h3 class="text-center">Issue New Ticket</h3>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputEmail3" placeholder="Show ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show Date</label>
                            <div class="col-sm-8">
                                <div class="bfh-datepicker" data-format="d-m-y" data-date="today">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">No. of Ordinary tickets</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputEmail3" placeholder="No. of Ordinary tickets">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">No. of Balcony tickets</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="No. of Balcony tickets">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Issue Ticket</button>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="row alert alert-info">
                    <div class="row alert alert-info">
                        <h3 class="text-center">Cancel Ticket</h3>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Transaction ID</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="User Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">No. of Ordinary tickets</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="No. of Ordinary tickets">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">No. of Balcony tickets</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="No. of Balcony tickets">
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
    </div>

    <!-- jQuery -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="js/bootstrap-formhelpers.js"></script>
</body>

</html>