<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.puchenko.credit.model.Loan"%>
<%@page import="java.util.List"%>
<%@page import="com.puchenko.credit.service.LoanService"%>
<%@page import="com.puchenko.credit.model.User"%>
<%@page import="com.puchenko.SpringFactory"%>
<%@page import="com.puchenko.SessionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <script src="resources/js/bootstrap.min.js"></script>
        <link href="resources/css/credit.css" rel="stylesheet">

        <title>Loan menu page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки кредитоспособности клиентов. Меню займов</h3>
            <br>
            <h4>
                <span class="glyphicon glyphicon-user"></span>
                <%
                    SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
                    User user = sessionBean.getCurrentUser();
                    String login = "";
                    if (user != null) {
                        login = user.getName();

                        String admin = user.getAdmin();
                        login += " (" + admin + ")";
                    }

                %>
                <%=login%>

            </h4>
            <br>

            <table class="table table-striped">
                <tr>
                    <th>Номер</th>
                    <th>Имя</th>
                    <th>Дата</th>
                    <th>Стоимость</th>
                </tr>
                <%
                    LoanService loanService = (LoanService) SpringFactory.getspringApplicationContext().getBean("loanService");
                    List<Loan> loansList = new ArrayList<>();
                    loansList = loanService.getAllLoans();
                    List<Loan> currentUserLoansList = new ArrayList<>();

                    for (int i = 0; i < loansList.size(); i++) {
                        Loan loan = loansList.get(i);
                        if (loan.getUserId() == user.getId()) {
                            currentUserLoansList.add(loan);
                        }
                    }

                    for (int i = 0; i < currentUserLoansList.size(); i++) {
                        Loan loan = currentUserLoansList.get(i);
                        if (loan != null) {
                            out.write("<tr>");
                            out.write("<td>" + loan.getId() + "</td>");
                            out.write("<td>" + loan.getName() + "</td>");                           
                            Date softwareDate = loan.getDate();
                            if (softwareDate != null) {
                                SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
                                String date = sdf.format(softwareDate);
                                out.write("<td>" + date + "</td>");
                            }

                            out.write("<td>" + loan.getMoney() + "</td>");  
                            out.write("</tr>");
                        }

                        out.write("");
                    }
                %>

            </table>
            <br>


            <table> 
                <tr>
                    <td>
                        <form action="loans-operations.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-sort"></span> Операции займов
                            </button>
                        </form>
                    </td>
                    <td>
                        &nbsp
                    </td>
                    <td>
                        <form action="main-menu.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-home"></span> В главное меню
                            </button>
                        </form>
                    </td>
                </tr>
            </table>

        </div>
    </body>
</html>