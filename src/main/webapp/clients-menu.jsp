<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.puchenko.credit.model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.puchenko.credit.service.ClientService"%>
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
        <title>Clients menu Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки кредитоспособности клиентов. Меню клиентов</h3>
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
                    <th>Доход</th>
                </tr>
                <%
                    ClientService clientService = (ClientService) SpringFactory.getspringApplicationContext().getBean("clientService");
                    List<Client> clientsList = new ArrayList<>();
                    clientsList = clientService.getAllClients();
                    List<Client> currentUserClientsList = new ArrayList<>();
                    
                    for (int i = 0; i < clientsList.size(); i++) {
                        Client client = clientsList.get(i);
                        if (client.getUserId() == user.getId()){
                            currentUserClientsList.add(client);
                        }
                    }
                    

                    for (int i = 0; i < currentUserClientsList.size(); i++) {
                        Client client = currentUserClientsList.get(i);
                        if (client != null) {
                            out.write("<tr>");
                            int clientId = client.getId();
                            out.write("<td>" + clientId + "</td>");

                            String clientName = client.getName();
                            out.write("<td>" + clientName + "</td>");

                            Date clientDate = client.getDate();
                            if (clientDate != null) {
                                SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
                                String date = sdf.format(clientDate);
                                out.write("<td>" + date + "</td>");
                            }
                            
                            Integer clientIncome = client.getIncome();
                            out.write("<td>" + clientIncome + "</td>");

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
                        <form action="clients-operations.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-user"></span> Операции клиентов
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
