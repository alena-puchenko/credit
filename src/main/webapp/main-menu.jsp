<%@page import="com.puchenko.credit.model.User"%>
<%@page import="com.puchenko.SessionBean"%>
<%@page import="com.puchenko.SessionBean"%>
<%@page import="com.puchenko.SpringFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <script src="resources/js/bootstrap.min.js"></script>
        <link href="resources/css/credit.css" rel="stylesheet">

        <title>Main menu Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки кредитоспособности клиентов. Главное меню</h3>
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
                    <th>Описание</th>
                    <th>Меню</th>
                <tr>
                    <td>Клиенты текущего пользователя</td>
                    <td>
                        <form action="clients-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Меню клиентов
                            </button> 
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Займы текущего пользователя</td>
                    <td>
                        <form action="loans-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-sort" aria-hidden="true"></span> Меню займов
                            </button> 
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Кредиты и рейтинги</td>
                    <td>
                        <form action="credits-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span> Меню кридитов и рейтингов
                            </button> 
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Статистика</td>
                    <td>
                        <form action="stats-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Меню статистики
                            </button> 
                        </form>
                    </td>
                </tr>                

                <%
                    if (user != null) {
                        if (user.getAdmin().equals("admin")) {
                            out.write("<tr>");
                            out.write("<td>Пользователи</td>");
                            out.write("<td>");
                            out.write("<form action=\"user-menu.jsp\">");
                            out.write("<button class=\"btn btn-warning btn-block\">");
                            out.write("<span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span> Меню пользователей");
                            out.write("</button>");
                            out.write("</form>");
                            out.write("</td>");
                            out.write("</tr>");
                        }
                    }
                %>

            </table>

            <form class="form-signin" method="GET" action="/credit/webresources/logout">
                <button class="btn btn-info" type="submit">
                    <span class="glyphicon glyphicon-off"></span> Выйти
                </button>
            </form>
        </div>

    </body>
</html>
