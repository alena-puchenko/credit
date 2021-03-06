<%@page import="com.puchenko.credit.model.Loan"%>
<%@page import="com.puchenko.credit.service.LoanService"%>
<%@page import="com.puchenko.credit.model.Client"%>
<%@page import="com.puchenko.credit.service.ClientService"%>
<%@page import="com.puchenko.credit.model.Client"%>
<%@page import="com.puchenko.credit.service.ClientService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.puchenko.credit.model.Link"%>
<%@page import="java.util.List"%>
<%@page import="com.puchenko.credit.service.LinkService"%>
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
        <title>Credits rating menu Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки кредитоспособности клиентов. Меню кредитов и рейтингов</h3>
            <br>
            <h4>
                <span class="glyphicon glyphicon-user"></span>
                <%
                    SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
                    User user = sessionBean.getCurrentUser();
                    Integer userId = 0;
                    String login = "";
                    if (user != null) {
                        userId = user.getId();
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
                    <th>Заказчик</th>
                    <th>Займ</th>
                    <th>Процент выплат</th>
                    <th>Деньги</th>
                </tr>
                <%
                    ClientService clientService = (ClientService) SpringFactory.getspringApplicationContext().getBean("clientService");
                    List<Client> clientsList = new ArrayList<>();
                    clientsList = clientService.getAllClientsByUserId(userId);
                    out.write("<br>");
                    out.write("<br>");

                    for (int i = 0; i < clientsList.size(); i++) {
                        Client client = clientsList.get(i);
                        if (client != null) {
                            LinkService linkService = (LinkService) SpringFactory.getspringApplicationContext().getBean("linkService");
                            List<Link> linksList = new ArrayList<>();
                            linksList = linkService.getAllLinksByCustomerId(client.getId());
                            //Sortlist by Software ID
                            for (int b = 0; b < linksList.size() - 1; b++) {
                                for (int a = 1; a < linksList.size() - b; a++) {
                                    Link tempLink = linksList.get(a);
                                    if (tempLink.getLinkId()< linksList.get(a - 1).getLinkId()) {
                                        linksList.set(a, linksList.get(a - 1));
                                        linksList.set(a - 1, tempLink);
                                    }
                                }
                            }

                            out.write("<tr>");
                            out.write("<td>" + "Заказчик в списке №: " + i + "</td>");
                            out.write("</tr>");

                            // Out a cell with current project id
                            Integer totalBalancePercent = 0;
                            Integer totalBalanceMoney = 0;
                            for (int j = 0; j < linksList.size(); j++) {
                                Link link = linksList.get(j);
                                if (link != null){
                                out.write("<tr>");

                                out.write("<td>" + link.getId() + "</td>");
                                Client tempClient = clientService.readClient(link.getClientId());
                                out.write("<td>" + tempClient.getName() + "</td>");

                                LoanService loanService = (LoanService) SpringFactory.getspringApplicationContext().getBean("loanService");
                                Integer loanId = link.getLinkId();
                                Loan tempLoan = loanService.readLoan(loanId);
                                out.write("<td>" + tempLoan.getName() + "</td>");
                                out.write("<td>" + link.getPercent() + "</td>");
                                out.write("<td>" + tempLoan.getMoney() + "</td>");

                                totalBalancePercent = totalBalancePercent + link.getPercent();
                                totalBalanceMoney = totalBalanceMoney + tempLoan.getMoney();
                                if (j > 0){
                                    totalBalancePercent = totalBalancePercent / (j + 1);
                                }
                                }
                            }

                            out.write("<tr>");
                            out.write("<td>" + "Итого проценты: " + totalBalancePercent + "</td>");
                            out.write("<td>" + "Итого сумма: " + totalBalanceMoney + "</td>");
                            out.write("</tr>");

                        }
                        out.write("");
                    }
                %>

            </table>


            <table> 
                <tr>
                    <td>
                        <form action="credits-operations.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-bullhorn"></span> Операции кредитов
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
