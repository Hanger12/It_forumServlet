<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_MainPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/SearchInputcss.css">
</head>
<body>
    <header id="Header">
        <div class="Logo">
            <a href="index.jsp"><img src="img/LogoBlack.png" alt="IT-Programmer_Forum" class="img"></a>
            <div class="nav-bar">
                <div class="nav-bar-inner">
                    <div class="uli-nav">
                        <ul class="spisok_ver3">
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-1" type="radio" name="radio" value="1"  onclick="openCity(event, 'London')" checked>
                                    <label for="radio-1"><i class="fab fa-wpforms"></i>Форум</label>
                                </div>
                                <!--<button type="button" class="btn"><i class="fab fa-wpforms"></i>Форум</button>-->
                            </li>
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-2" type="radio" name="radio" value="2" onclick="openCity(event, 'Paris')">
                                    <label for="radio-2"><i class="fab fa-wpforms"></i>Что нового</label>
                                </div>
                                <!--<button type="button" class="btn"><i class="fab fa-wpforms"></i>Что нового</button>-->
                            </li>
                            <li>
                                <div class="form_radio_btn btn">
                                    <input id="radio-3" type="radio" name="radio" value="3" onclick="openCity(event, 'Tokyo')">
                                    <label for="radio-3"><i class="fab fa-wpforms"></i>Пользователи</label>
                                </div>
                                <!--<button type="button" class="btn"><i class="fab fa-wpforms"></i>Пользователи</button>-->
                            </li>

                        </ul>
                    </div>
                    <div class="rightButton">
                        <ul class="spisok_ver4">
                            <li>
                                <button type="button" class="btn_reg"><i class="fab fa-wpforms"></i>  Войти</button>
                            </li>
                            <li>
                                <button type="button" class="btn_reg"><i class="fab fa-wpforms"></i>  Регистрация</button>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="Search-pos">
                <form action="" method="post" class="search">
                    <input type="search" name="" placeholder="поиск" class="input" />
                    <input type="submit" name="" value="" class="submit" />
                </form>
            </div>
        </div>
    </header>
    <div class="Main">
        <div id="London" class="tabcontent1">
            <div class="question_block">
                <div class="title">
                    <h1>Вопросы</h1>
                </div>
                <div class="question_item">

                </div>
                <div class="question_item">

                </div>
                <div class="question_item">

                </div>
                <div class="question_item">

                </div>
            </div>
            <div class="Person_block">
                <div class="title">
                    <h1>Пользователи</h1>
                </div>
            </div>
        </div>

        <div id="Paris" class="tabcontent">
            <h3>Paris</h3>
            <p>Paris is the capital of France.</p>
        </div>

        <div id="Tokyo" class="tabcontent">
            <h3>Tokyo</h3>
            <p>Tokyo is the capital of Japan.</p>
        </div>
    </div>
    <script>
        function openCity(evt, cityName) {
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
</body>
</html>