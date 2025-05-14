<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.demo8.food.FoodFileHandler" %>
<%@ page import="lk.sliit.demo8.food.FoodItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Miranda - Food Menu</title>
    <link rel="stylesheet" href="css/food-menu.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="home__container">
    <nav class="navbar">
        <h1 class="logo">Hotel Miranda</h1>
        <ul class="nav__links">
            <%
                // Check if the user is logged in
                if (session != null && session.getAttribute("userEmail") != null) {
            %>
            <li><a href="profile.jsp" class="profile__btn">My Profile</a></li>
            <li><a href="logout">Logout</a></li>
            <%
            } else {
            %>
            <li><a href="login.jsp">Log in</a></li>
            <li><a href="signup.jsp">Sign up</a></li>
            <%
                }
            %>
            <li><a href="features.jsp">Features</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="rooms.jsp">Rooms</a></li>
            <li><a href="gallery.jsp">Gallery</a></li>
            <li><a href="food-menu.jsp">Food Menu</a></li>
            <li><a href="reservation.jsp">Reservation</a></li>
            <li><a href="reviews.jsp">Reviews</a></li>
        </ul>
    </nav>

    <section class="menu__container">
        <h2 class="section__header">Our Food Menu</h2>
        <p class="section__subheader">Savor the flavors of our exquisite dishes</p>
        <div class="menu__content">
            <!-- Left Side: Food List -->
            <div class="menu__list">
                <h3>Menu Varieties</h3>
                <ul id="foodList">
                    <%
                        List<FoodItem> foodItems = FoodFileHandler.readFoodItems();
                        for (FoodItem item : foodItems) {
                    %>
                    <li class="food__item">
                        <span class="food__name"><%= item.getName() %></span>
                        <span class="food__price">$<%= item.getPrice() %></span>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <!-- Right Side: Photos -->
            <div class="menu__photos">
                <%
                    for (FoodItem item : foodItems) {
                        if (!item.getImagePath().isEmpty()) {
                %>
                <div class="photo__item">
                    <img src="<%= item.getImagePath() %>" alt="<%= item.getName() %>">
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </section>
</div>
<script src="js/food-menu.js"></script>
</body>
</html>