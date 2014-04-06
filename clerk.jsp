<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                <ul class="nav nav-pills nav-stacked alert alert-info" style="position: fixed">
                  <li class="active"><a href="#table_show">Show Details</a></li>
                  <li><a href="#addexp">Add Expense</a></li>
                  <li><a href="#table_expense">Expense Details</a></li>
                  <li><a href="#delexp">Delete Expense</a></li>
                </ul>
            </div>


            <div class="col-md-6 col-md-offset-1 col-sm-6 col-sm-offset-1 col-xs-12">

                <div class="row alert alert-success">
                    <h3 class="text-center">
                        <strong>
                            Clerk Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome <%=session.getAttribute("user").toString()%>!</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>

                <div class="row">
                    <h3 class="text-center">Show Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_show">
                            <tr class="info">
                                <th>Show ID</th>
                                <th>Show Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
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
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

                <div class="row alert alert-info" id="addexp">
                    <h3 class="text-center">Add Expense Record</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_clerk.jsp">
                        <input type="hidden" name="opr" value=1> 
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="addexp_id" placeholder="Show ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Expense Title</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="addexp_title" placeholder="Expense Title">
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
                            ExpenseTable ext = new ExpenseTable();
                            List<Expense> exl = ext.listExpense();
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

                <div class="row alert alert-info" id="delexp">
                    <h3 class="text-center">Delete Expense Record</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_clerk.jsp">
                        <input type="hidden" name="opr" value=2>
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
    <script src="js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-formhelpers.js"></script>
    <script src="js/notify.min.js"></script>
    <script>
        $( document ).ready(function() {
            $('#addexp_datediv').find('div.input-group').find('input').attr("name", "addexp_date");
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