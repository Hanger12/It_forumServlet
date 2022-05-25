<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.it_forum2.MyEJB" %>
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
    MyEJB.AnswerOnQuestion(MyEJB.IDQuest);
    request.setAttribute("Answer",MyEJB.Answer);
    request.setAttribute("PopUpHide","PopUpHide();");
    request.setAttribute("PopUpRegisterHide","PopUpRegisterHide();");
%>
<header id="Header">
    <div class="Logo">
        <a href="index.jsp"><img src="img/LogoBlack.png" alt="IT-Programmer_Forum" class="img"></a>
        <div class="nav-bar">
            <div class="nav-bar-inner">
                <div class="uli-nav">
                    <form action="Users-Servlet" method="post">
                        <ul class="spisok_ver3">
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-1" type="radio" name="radio" value="1"  onclick="location.href='mainPage?nameBForum=checked'">
                                    <label for="radio-1"><i class="fab fa-wpforms"></i>  Форум</label>
                                </div>
                            </li>
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-2" type="radio" name="radio" value="2" onclick="location.href='mainPage?nameBAllQuest=checked'">
                                    <label for="radio-2"><i class="fas fa-code"></i>  Все Вопросы</label>
                                </div>
                            </li>
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-3" type="radio" name="radio" value="3" onclick="location.href='mainPage?nameBUsers=checked'">
                                    <label for="radio-3"><i class="fas fa-users"></i>  Пользователи</label>
                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
                <div class="rightButton">
                    <%
                        if(MyEJB.LoginIn!=null)
                        {
                            if(!MyEJB.LoginIn.equals("Admin"))
                            {
                                out.println("<form name=\"form1\" action=\"mainPage\" method=\"post\">\n" +
                                        "                        <h3 style=\"color: white\" class=\"profile\">"+MyEJB.LoginIn+"</h3>\n" +
                                        "                        <button type=\"submit\" name=\"ButtonClose\">Выйти</button>\n" +
                                        "                    </form>");
                            }
                            else {
                                out.println("<form name=\"form1\" action=\"mainPage\" method=\"post\">\n" +
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
    </div>
</header>
<form name="login" method="post" action="mainPage">
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
<form name="Register" method="post" action="mainPage">
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
<form name="Answer" method="post" action="mainPage">
    <div class="b-popup" id="popup3">
        <div class="b-popup-content2">
            <div class="title">
                <button type="button" class="closebuttonform" onclick="PopUpAnswerSubHide()"><i class="fas fa-times"></i></button>
                <h1>Ответ на вопрос</h1>
            </div>
            <div>
                <label for="Answer">Ответ</label>
                <textarea id="Answer" name="Answer" class="InputEnterQuest" placeholder="Введите Ответ" required></textarea>
            </div>
            <div>
                <input type="submit" value="Отправить" class="Button_Quest_Submit">
            </div>
        </div>
    </div>
</form>
<div class="Main">
    <div id="questionSelect" class="tabcontent1">
        <div class="question_block2">
            <div class="title1">
                <h1>Вопрос</h1>
            </div>
            <div class="BlockQuestionUser">
                <div class="QuestionUser">
                    <c:forEach items="${SelectQuestion}" var="atr">
                        <h1>${atr.login}</h1>
                        <c:set var="markascorrect" value="${MyEJB.LoginIn}" />
                        <c:set var="loginquest" value="${atr.login}"/>
                        <h4>${atr.admin}</h4>
                    </c:forEach>
                    <div>
                        <%if(MyEJB.LoginIn==null){
                            out.println("<h3 style=\"color: red\">Чтобы ответить необходимо зарегистрироваться</h3>");
                        }
                        else {
                            out.println("<button class=\"ButtonAnswer\" type=\"button\" name=\"ButtonSub\" onclick=\"PopUpAnswerSub()\">Ответить на вопрос</button>");
                        }%>
                    </div>
                </div>
                <div>
                    <c:forEach items="${SelectQuestion}" var="atr">
                        <h1>${atr.theme}</h1>
                        <br>
                        <h3>${atr.question}</h3>
                    </c:forEach>
                </div>
            </div>
            <div class="title1">
                <h1>Ответы</h1>
            </div>
            <c:forEach items="${Answer}" var="atr">
                <div class="BlockAnswerUser">
                    <div class="QuestionUser">
                        <h1>${atr.login}</h1>
                        <h4>${atr.admin}</h4>
                        <c:set var="correct" value="${atr.correct}" />
                        <c:set var="NO" value="нет"/>
                        <c:set var="YES" value="да"/>
                        <c:if test="${markascorrect==loginquest}">
                            <c:if test="${correct==NO}">
                                <button onclick="location.href ='Mark-servlet?idAnswer=${atr.idAnswer}'" >Пометить ответ правильным</button>
                            </c:if>
                            <c:if test="${correct==YES}">
                                <label style="color: green; font-size: 18px">Ответ помечен правильным</label>
                            </c:if>
                        </c:if>
                        <c:if test="${markascorrect!=loginquest}">
                            <c:if test="${correct==YES}">
                                <label style="color: green; font-size: 18px">Ответ помечен правильным</label>
                            </c:if>
                            <c:if test="${correct==NO}">
                                <label style="color: red;font-size: 18px">Чтобы оставить ответ правильным войдите под своим логином того кто оставил вопрос</label>
                            </c:if>
                        </c:if>
                    </div>
                    <div>
                        <h3>${atr.answer}</h3>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/d5efc829a1.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
<script>
    $(document).ready(function(){
        //Скрыть PopUp при загрузке страницы
        ${PopUpHide}
        ${PopUpRegisterHide}
        PopUpAnswerSubHide();
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
    function PopUpAnswerSubHide(){
        $("#popup3").hide();
    }
    function PopUpAnswerSub(){
        $("#popup3").show();
    }
</script>
</body>
</html>