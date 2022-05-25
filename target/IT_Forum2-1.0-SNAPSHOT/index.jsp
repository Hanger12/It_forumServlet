<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.it_forum2.MyEJB" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="css/Style_MainPage.css">
    <link rel="stylesheet" href="css/SearchInputcss.css">
    <link rel="stylesheet" href="css/Form_register.css">
</head>
<body>
<%
    request.setAttribute("TabContent","tabcontent");
    request.setAttribute("TabContent2","tabcontent");
    request.setAttribute("TabContent1","tabcontent1");

    request.setAttribute("nameBForum","checked");
    if(request.getAttribute("nameBAllQuest")!=null||request.getAttribute("nameBUsers")!=null)
    {
        if(request.getAttribute("nameBAllQuest")!=null)
        {
            request.setAttribute("TabContent","tabcontent1");
            request.setAttribute("TabContent1","tabcontent");
        }
        else if(request.getAttribute("nameBUsers")!=null) {
            request.setAttribute("TabContent2","tabcontent1");
            request.setAttribute("TabContent1","tabcontent");

        }

    }
    else if(request.getAttribute("nameBForum")!=null) {
        request.setAttribute("TabContent","tabcontent");
        request.setAttribute("TabContent1","tabcontent1");
        request.setAttribute("TabContent2","tabcontent");
    }
    request.setAttribute("PopUpHide","PopUpHide();");
    request.setAttribute("PopUpRegisterHide","PopUpRegisterHide();");
    MyEJB.AllPersonStartPage();
    MyEJB.AllQuestionOnPerson();
    double value = MyEJB.Sorted.size();
    double Count= Math.ceil(value/5);
    request.setAttribute("CountUser",Count);
    int iterB =0;
    int iterE=4;
    request.setAttribute("Users",MyEJB.Sorted);
    request.setAttribute("Question",MyEJB.SortedQuestion);

%>

    <header id="Header">
        <div class="Logo">
            <a href="index.jsp"><img src="img/LogoBlack.png" alt="IT-Programmer_Forum" class="img"></a>
            <div class="nav-bar">
                <div class="nav-bar-inner">
                    <div class="uli-nav">
                        <ul class="spisok_ver3">
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-1" type="radio" name="radio" value="1"  onclick="openCity(event, 'London')" ${nameBForum}>
                                    <label for="radio-1"><i class="fab fa-wpforms"></i>  Форум</label>
                                </div>
                            </li>
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-2" type="radio" name="radio" value="2" onclick="openCity(event, 'Paris')" ${nameBAllQuest}>
                                    <label for="radio-2"><i class="fas fa-code"></i>  Все Вопросы</label>
                                </div>
                            </li>
                           <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-3" type="radio" name="radio" value="3" onclick="openCity(event, 'Tokyo')" ${nameBUsers}>
                                    <label for="radio-3"><i class="fas fa-users"></i>  Пользователи</label>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="rightButton">
                        <%
                            if(MyEJB.LoginIn!=null)
                            {
                                if(MyEJB.AdminIN==null)
                                {
                                    out.println("<form name=\"form1\" action=\"Users-Servlet\" method=\"post\">\n" +
                                            "                        <h3 style=\"color: white\" class=\"profile\">"+MyEJB.LoginIn+"</h3>\n" +
                                            "                        <button type=\"submit\" name=\"ButtonClose\">Выйти</button>\n" +
                                            "                    </form>");
                                }
                                else {
                                    out.println("<form name=\"form1\" action=\"Users-Servlet\" method=\"post\">\n" +
                                            "                        <h3 style=\"color: red\" class=\"profile\">"+MyEJB.LoginIn+"</h3>\n" +
                                            "                        <button type=\"submit\" name=\"ButtonClose\">Выйти</button>\n" +
                                            "                    </form>");
                                }
                            }
                            else{
                                out.println("<ul class=\"spisok_ver4\">\n" +
                                        "                            <li>\n" +
                                        "                                <button type=\"button\" class=\"btn_reg\" onclick=\"PopUpShow()\"><i class=\"fas fa-sign-in-alt\"></i>  Войти</button>\n" +
                                        "                            </li>\n" +
                                        "                            <li>\n" +
                                        "                                <button type=\"button\" class=\"btn_reg\" onclick=\"PopUpRegisterShow()\"><i class=\"fas fa-user-plus\"></i>  Регистрация</button>\n" +
                                        "                            </li>\n" +
                                        "                        </ul>");

                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="Search-pos">
                <form action="Users-Servlet" method="post" class="search">
                    <input type="search" name="TagSearch" placeholder="Поиск по тегу" class="input" />
                    <input type="submit" class="submit"/>
                </form>
            </div>
        </div>
    </header>
    <form name="login" method="post" action="Users-Servlet">
        <div class="b-popup" id="popup1">
            <div class="b-popup-content">
                <div class="title">
                    <button type="button" class="closebuttonform"  onclick="PopUpHide()"><i class="fas fa-times"></i></button>
                    <h1>Вход</h1>
                </div>
                <div>
                    <div class="box-login">
                        <label for="Login">Логин</label>
                        <input type="text" id="Login" name="LoginIn" placeholder="Введите Логин или Email" required>
                        <br>
                        <label for="Password">Пароль</label>
                        <input type="password" id="Password" name="PasswordIn" placeholder="Введите Пароль" required>
                        <%if(request.getAttribute("LoginUser")==null&&request.getParameter("LoginIn")!=null&&request.getParameter("PasswordIn")!=null)
                        {
                            request.setAttribute("PopUpHide","PopUpShow();");
                            out.println("<h4 id=\"error\"style=\"color: red\">Неправильное имя пользователя или пароль</h4>");
                        }
                        %>
                    </div>
                </div>
                <div>
                    <input type="submit" value="Войти" class="button_Login_Register">
                </div>
            </div>
        </div>
    </form>
    <form name="Register" method="post" action="Users-Servlet">
        <div class="b-popup" id="popup2">
            <div class="b-popup-content">
                <div class="title">
                    <button type="button" class="closebuttonform" onclick="PopUpRegisterHide()"><i class="fas fa-times"></i></button>
                    <h1>Регистрация</h1>
                </div>
                <div>
                    <label for="Login1">Логин</label>
                    <input type="text" id="Login1" name="Login" placeholder="Введите Логин" required>
                    <br>
                    <label for="Email">Email</label>
                    <input type="email" id="Email"  name="Email" placeholder="Введите Email" required>
                    <br>
                    <label for="Password1">Пароль</label>
                    <input type="password" id="Password1" name="Password" placeholder="Введите Пароль" required>
                    <%if(request.getAttribute("Error")=="Данный пользователь уже зарегистрирован"&&request.getParameter("Login")!=null&&request.getParameter("Password")!=null&&request.getParameter("Email")!=null)
                    {
                        request.setAttribute("PopUpRegisterHide","PopUpRegisterShow();");
                        out.println("<h4 id=\"error1\"style=\"color: red\">"+request.getAttribute("Error").toString()+"</h4>");
                    }
                    else if(request.getAttribute("Error")=="Регистрация прошла успешно")
                    {
                        request.setAttribute("PopUpRegisterHide","PopUpRegisterShow();");
                        out.println("<h4 id=\"error1\"style=\"color: green\">"+request.getAttribute("Error").toString()+"</h4>");
                    }
                    %>
                </div>
                <div >
                    <input type="submit" value="Зарегистрироваться" class="button_Login_Register">
                </div>
            </div>
        </div>
    </form>
<form name="QuestionSub" method="post" action="Users-Servlet">
    <div class="b-popup" id="popup3">
        <div class="b-popup-content2">
            <div class="title">
                <button type="button" class="closebuttonform" onclick="PopUpQuestionSubHide()"><i class="fas fa-times"></i></button>
                <h1>Задать свой вопрос</h1>
            </div>
            <div>
                <label for="Tag">Метка(язык)</label>
                <input type="text" id="Tag" name="Tag" placeholder="Язык программирования" required>
                <br>
                <label for="Them">Тема</label>
                <input type="text" id="Them" name="Them" placeholder="Введите Тему" required>
                <br>
                <label for="Question">Вопрос</label>
                <textarea id="Question" name="Question" class="InputEnterQuest" placeholder="Введите Вопрос" required></textarea>
            </div>
            <div>
                <input type="submit" value="Отправить" class="Button_Quest_Submit">
            </div>
        </div>
    </div>
</form>
    <div class="Main">
        <div id="London" class="${TabContent1}">
            <div style="width: 100%;height: 180px;text-align: center;font-size: 18px;background-image: url(img/fonAbout.jpg);color: white">
                <h1>Форум IT Специалистов</h1>
                <p>Присоединяйтесь к нашему сообществу и задавайте вопросы</p>
                <button type="button" class="btn_reg2" onclick="PopUpRegisterShow()"><i class="fas fa-user-plus"></i>  Регистрация</button>
            </div>
            <div class="question_block">
                <div class="title">
                    <h1>Вопросы</h1>
                </div>
                <c:set var="Admin" value="${MyEJB.AdminIN}"/>
                <c:forEach items="${Question}" var="atr" end="4">
                    <div class="question_item">
                        <c:if test="${Admin!=null}">
                            <button type="button" onclick="location.href ='delete-servlet?idQuest=${atr.IDQ}'" class="closebuttonform"><i class="fas fa-times"></i></button>
                        </c:if>
                        <h3>${atr.login}</h3>
                        <h4>${atr.admin}</h4>
                        <h1 onclick="location.href ='Users-Servlet?id=${atr.IDQ}'">${atr.theme}</h1>
                        <h4>Метка: ${atr.tag}</h4>
                    </div>
                </c:forEach>
            </div>
            <div class="Person_block">
                <div class="title">
                    <h1>Новые Пользователи</h1>
                </div>
                <div class="personBlockItems">
                    <c:set var="admin" value="${MyEJB.AdminIN}"/>
                    <c:forEach items="${Users}" var="atr" end="7">
                    <div class="personItemMain">
                        <c:if test="${admin!=null}">
                            <button type="button" onclick="location.href ='delete-servlet?idUser=${atr.id}&LoginUser=${atr.admin}'" class="closebuttonform"><i class="fas fa-times"></i></button>
                        </c:if>
                        <h3 class="profile">${atr.login}</h3>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="QuestionSubmit">
                <%if(MyEJB.LoginIn==null){
                    out.println("<h3 style=\"color: red\">Чтобы оставить вопрос необходимо зарегистрироваться</h3>");
                }
                else {
                    out.println("<button type=\"button\" class=\"ButtonQuest\" onclick=\"PopUpQuestionSub()\">Задать свой вопрос</button>");
                }%>

            </div>
        </div>
        <div id="Paris" class="${TabContent}">
            <div class="question_block1">
                <c:set var="isSearch" value="${MyEJB.isSearch}"/>
                <div class="title">
                    <c:if test="${isSearch==true}">
                        <form action="Users-Servlet" method="post">
                            <button type="submit" name="back" class="Backwordbutton"><i class="fas fa-arrow-circle-left"></i></button>
                        </form>
                    </c:if>
                    <h1>Все Вопросы</h1>
                </div>
                <c:set var="Admin" value="${MyEJB.AdminIN}"/>
                <c:if test="${isSearch==false}">
                    <c:forEach items="${Question}" var="atr">
                        <div class="question_item">
                            <c:if test="${Admin!=null}">
                                <button type="button" onclick="location.href ='delete-servlet?idQuest=${atr.IDQ}'" class="closebuttonform"><i class="fas fa-times"></i></button>
                            </c:if>
                            <h3>${atr.login}</h3>
                            <h4>${atr.admin}</h4>
                            <h1 onclick="location.href ='Users-Servlet?id=${atr.IDQ}'">${atr.theme}</h1>
                            <h4>Метка: ${atr.tag}</h4>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${isSearch==true}">
                    <c:forEach items="${SearchQuest}" var="atr">
                        <div class="question_item">
                            <c:set var="Admin" value="${MyEJB.AdminIN}"/>
                            <c:if test="${Admin!=null}">
                                <button type="button" onclick="location.href ='delete-servlet?idQuest=${atr.IDQ}'" class="closebuttonform"><i class="fas fa-times"></i></button>
                            </c:if>
                            <h3>${atr.login}</h3>
                            <h4>${atr.admin}</h4>
                            <h1 onclick="location.href ='Users-Servlet?id=${atr.IDQ}'">${atr.theme}</h1>
                            <h4>Метка: ${atr.tag}</h4>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <div id="Tokyo" class="${TabContent2}">
            <div class="question_block1">
                <c:set var="UserB" value="<%=iterB%>"/>
                <c:set var="UserE" value="<%=iterE%>"/>
                <c:forEach items="${Users}" var="atr" end="${CountUser-1}">
                    <div class="user_block">
                        <c:forEach items="${Users}" var="atr" begin="${UserB}" end="${UserE}">
                            <c:if test="${admin!=null}">
                                <button type="button" onclick="location.href ='delete-servlet?idUser=${atr.id}&LoginUser=${atr.admin}'" class="closebuttonform"><i class="fas fa-times"></i></button>
                            </c:if>
                            <br>
                            <h1>${atr.login}</h1>
                        </c:forEach>
                        <c:set var="UserB" value="<%=iterB+=5%>"/>
                        <c:set var="UserE" value="<%=iterE+=5%>"/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script>
        function openCity(evt, cityName,) {
            var i, tabcontent, tabcontent1;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tabcontent1 = document.getElementsByClassName("tabcontent1");
            for (i = 0; i < tabcontent1.length; i++) {
                tabcontent1[i].style.display = "none";
            }
            document.getElementById(cityName).style.display = "block";
        }

    </script>
<script src="https://kit.fontawesome.com/d5efc829a1.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
    <script>
        $(document).ready(function(){
            //Скрыть PopUp при загрузке страницы
          ${PopUpHide}
          ${PopUpRegisterHide}
            PopUpQuestionSubHide();
        });
        //Функция отображения PopUp
        function PopUpShow(){
            $("#popup1").show();
        }
        //Функция скрытия PopUp
        function PopUpHide(){
            const el = $("#error").html();
            if(el)
            {
                $("#error").remove();
            }
            $("#popup1").hide();
        }
        function PopUpRegisterShow(){
            $("#popup2").show();
        }
        function PopUpRegisterHide(){
            const el = $("#error1").html();
            if(el)
            {
                $("#error1").remove();
            }
            $("#popup2").hide();
        }
        function PopUpQuestionSubHide(){
            $("#popup3").hide();
        }
        function PopUpQuestionSub(){
            $("#popup3").show();
        }
    </script>
</body>
</html>