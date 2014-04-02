<!DOCTYPE html>
<html lang="en">

<head>
    <title>SAMS</title>
    <meta charset="UTF-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>

<body>
    <%
    session.removeAttribute("username");
    session.removeAttribute("password");
    session.invalidate();
    %>
    <div class="container-fluid">
        <div class="row alert alert-info">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="text-center">Students' Auditorium Management System</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">

                <div class="row alert alert-info">
                    <h3 class="text-center">Login Page</h3>
                    <div class="col-md-6 col-md-offset-3">

                        <form class="form from-lg" role="form" action="checkLogin.jsp" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="User ID" name="username">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password" name="password">
                            </div>
                            <button type="submit" class="btn btn-lg btn-success">Log In</button>
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
</body>

</html>
