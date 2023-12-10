<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${sessionScope.language != null ? sessionScope.language : 'ru'}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>
<c:set var="disabled" value="${sessionScope.user.isAuth ? false : true}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Товары</title>
    <link href="<c:url value="/resource/css/single-category.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resource/css/footer.css"/>" rel="stylesheet" type="text/css"/>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        text-decoration: none;
        list-style: none;
        color: #F4A460;
        font-size: 16px;
        font-family: Verdana, Tahoma, sans-serif;
    }
    body{
        background-color: #ffffff;
    }

    header{
        background-color: #fffacd;
        margin-bottom: 50px;
    }
    .lang{
        display: flex;
        height: 30px;
        align-items: center;
        justify-content: end;
    }
    .lang input{
        border: none;
        outline: none;
        height: 30px;
        padding: 5px;
        background-color: #fffacd;
    }

    .lang input.active{
        border: 3px solid #F4A460;
        text-align: center;
        padding-top: 2px;
    }
    .lang input:hover{
        background-color: #FFD700;
        cursor: pointer;
    }
    .container{
        width: 90%;
        margin: 0 auto;
    }
    .brand a{
        color: #F4A460;
        font-size: 28px;
    }
    .navigation-bar{
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 80px;
    }

    .logform{
        width: auto;
        height: auto;
    }
    .loginbtn{
        color: #fffacd !important;
        border-radius: 15px;
        padding: 10px;
        font-weight: bold;
        background-color: #F4A460;
        margin-left: 5px;
        border: none;
    }
    .loginbtn:hover{
        background-color: #FFD700;
    }
    #tel{
        font-weight: bold;
        background-color: #F4A460;
        border-radius: 15px;
        padding: 10px;
        color: #fffacd;
    }
    #tel:hover{
        background-color: #FFD700;
    }

    .telephone{
        display: none;
        font-weight: bold;
        background-color: #F4A460;
        border-radius: 15px;
        padding: 10px;
        color: #fffacd;
        width: 100%;
        text-align: center;
    }
    .navigation-list a{
        margin-left: 20px;
        transition: 0.3s;
        color:#F4A460;
    }

    .navigation-list a:hover{
        text-shadow: #FFD700 1px 1px 2px;
        color: #FFD700;
    }

    .navigation-list{
        display: flex;
        align-items: center;
    }

    .container {
        width: 90%;
        margin: 0 auto;
    }

    h2 {
        font-size: 22px;
    }

    .single-category {
        margin-bottom: 30px;
    }

    .single-category-title {
        color: #F4A460;
        margin-bottom: 30px;
        text-align: center;
    }

    .dishes {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .dish-item {
        /*display: flex;*/

        /*width: 48.5%;*/
        width: 98%;
        margin-top: 30px;

    }

    .dish-item-img {
        width: 42%;
        height: 170px;
        position: relative;
        margin-bottom: 20px;
    }

    .dish-item-img img {
        height: 100%;
        width: 100%;
        object-fit: cover;
    }

    .dish-item-price {
        position: absolute;
        bottom: -5px;
        right: -10px;
        background-color: #1b1b1be4;
        color: white;
        padding: 3px;
        text-align: center;
        border-radius: 15px;
        font-size: 0.9em;
    }

    .dish-item-info {
        padding-left: 15px;
        width: 58%;
    }

    .dish-item-title {
        color: #F4A460;
        margin-bottom: 20px;
    }

    .dish-item-description {
        color: #F4A460;
        cursor: default;
    }

    .dish-item-wrapper {
        display: flex;
        flex-direction: column;
        /*justify-content: space-between;*/
        /*align-items: center;*/
        max-width: 50%;
    }
    .tobasket:hover {
        background-color: #FFD700;
        cursor: pointer;
    }
    .tobasket {
        color: #ffffff !important;
        border-radius: 10px;
        padding: 10px 5px 12px 5px;
        font-weight: bold;
        background-color: #F4A460;
        margin-top: 20px;
        margin-left: 10px;
        border: none;
        width: 115px;
    }
    /*.tobasket:disabled:hover {*/
    /*   */
    /*    cursor: not-allowed;*/
    /*}*/

    .tobasket:disabled{
        cursor: not-allowed;
        opacity: 0.7;
        background-color: #F4A460;
    }


    @media (max-width: 768px) {
        .dish-item {
            width: 100%;

        }

        .dishes {
            justify-content: center;

        }

        .dish-item-img {
            height: 170px;
        }
    }

    @media (max-width: 576px) {
        .dish-item {
            display: block;
            margin: 0 auto;
            width: 70%;
            margin-bottom: 20px;
        }

        .dish-item-img {
            width: 100%;
            height: 200px;
        }

        .dish-item-info {
            width: 100%;
        }
    }



    footer{
        background-color: #D2B48C;
        padding-top: 50px;
        padding-bottom: 50px;
    }
    .footer-title{
        color: #fff;
        text-align: center;
        margin-bottom: 50px;
    }
    .map{
        width: 85%;
        margin: 0 auto;
    }
    .map-item{
        position: relative;
    }

    iframe{
        width: 100%;
        height: 350px;
    }
    /* footer .container{
        display: flex;
        align-items: center;
        justify-content: center;
    } */
    .map-title{
        position: absolute;
        bottom: 2.5px;
        left: 0;
        color: #fff;
        background-color:  #1b1b1be4;
        text-align: center;
        text-transform: uppercase;
        width: 100%;
        line-height: 1.4em;
        border-radius: 5px 5px 0 0;
    }
    .copyright{
        color: #fff;
        text-align: center;
        margin-top: 30px;
    }
</style>
<body>
<header>
    <div class="container">
        <div class="navigation-bar">
            <div class="brand">
                <h1><a href="/">Opulence</a></h1>
            </div>
            <nav class="navigation">
                <ul class="navigation-list">
                    <li class="navigation-list-item"><a href="/"><fmt:message key="nav.main"/></a></li>
                    <li class="navigation-list-item"><a href="/#menu"><fmt:message key="nav.menu"/></a></li>
                    <li class="navigation-list-item"><a href="/basket"><fmt:message key="nav.basket"/></a></li>
                    <li class="navigation-list-item"><a id="tel" href="tel:+375331112233">+375(33)111-22-33</a></li>
                    <c:if test="${sessionScope.user.isAuth}">
                        <li class="navigation-list-item">
                            <form method="POST" action="/logout">
                                <input type="submit" class="loginbtn" value="<fmt:message key="nav.logout"/>"/>
                            </form>

                        </li>
                    </c:if>
                    <c:if test="${!sessionScope.user.isAuth}">
                        <li class="navigation-list-item">
                            <a href="login" class="loginbtn"><fmt:message key="nav.login"/></a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</header>
<section class="single-category">
    <div class="container">
        <h2 class="single-category-title"><fmt:message key="single.dihes"/></h2>
        <div class="dishes">
            <div class='dish-item-wrapper'>
                <c:forEach var="dish" items="${dishes}">
                    <div class='dish-item'>
                        <div>
                            <div class='dish-item-img'>
                                <img src="${dish.img}" alt="${dish.name}">
                                <span class='dish-item-price'>${dish.price} <fmt:message key="single.currency"/></span>
                            </div>
                            <div class='dish-item-info'>
                                <h3 class='dish-item-title'>${dish.name}</h3>
                                <p class='dish-item-description'>
                                        ${dish.description}
                                </p>
                            </div>
                        </div>

                        <form method='post' action="/single-category/${dish.id}/${category_id}/add-to-basket">
                            <c:if test="${disabled == true}">
                                <button type="submit" class='tobasket' disabled><fmt:message key="single.addToBasket"/></button>
                            </c:if>
                            <c:if test="${disabled == false}">
                                <button type="submit" class='tobasket' ><fmt:message key="single.addToBasket"/></button>
                            </c:if>

                        </form>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <h3 class="footer-title"><fmt:message key="location.our"/></h3>
        <div class="map">
            <a class="map-link" href="https://goo.gl/maps/JMnpTyQd8CUJm8pz7" target="_blank">
                <div class="map-item">
                    <iframe width="100%"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2350.1197435668223!2d27.59273715106426!3d53.911848039805776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46dbcfaefc7ace77%3A0x108d2d965ec4df2f!2z0YPQuy4g0JPQuNC60LDQu9C-IDksINCc0LjQvdGB0Lo!5e0!3m2!1sru!2sby!4v1677136102096!5m2!1sru!2sby"
                            style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                    <span class="map-title">map</span>
                </div>
            </a>
        </div>
        <div class="copyright">
            All rights are reserved &#169;
        </div>
    </div>
</footer>
</body>
</html>
