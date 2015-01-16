<%@page import="com.puchenko.SpringFactory"%>
<%@page import="com.puchenko.credit.model.User"%>
<%@page import="com.puchenko.SessionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <script src="resources/js/bootstrap.min.js"></script>
        <link href="resources/css/credit.css" rel="stylesheet">

        <title>Customers operations page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки кредитоспособности клиентов. Операции клиентов</h3>
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
            <form class="form-signin" method="GET" action="/credit/webresources/clients/create">
                <input name = "paramName" type="text" id="login" class="form-control" placeholder="имя"> 
                <input name = "paramIncome" type="text" id="login" class="form-control" placeholder="доход"> 
                <br>          

                <table>
                    <tr>
                        <td>

                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-user"></span> Создать клиента
                            </button>
                            </form>
                        </td>
                        <td>
                            &nbsp
                        </td>

                        <td>
                            <form action="clients-menu.jsp">
                                <button class="btn btn-info">
                                    <span class="glyphicon glyphicon-user"></span> В меню клиентов
                                </button>
                            </form>
                        </td>
                    </tr>
                </table>    

            </form>
        </div>
    </body>
</html>
