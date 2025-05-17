<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.hotelroomreservation.foodmenu.foodFileHandler" %>
<%@ page import="lk.sliit.hotelroomreservation.foodmenu.foodItem" %>
<!DOCTYPE html>
<html lang="en">
<!-- ... head section remains the same ... -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/foodmenu/css/food_menu.css">

<body>
<div class="home__container">
    <!-- ... navigation section remains the same ... -->
    <section class="menu__container">
        <h2 class="section__header">Our Food Menu</h2>
        <p class="section__subheader">Savor the flavors of our exquisite dishes</p>
        <div class="menu__content">
            <!-- Left Side: Food List -->
            <div class="menu__list">
                <h3>Menu Varieties</h3>
                <ul id="foodList">
                    <%
                        foodFileHandler FoodFileHandler = new foodFileHandler();
                        List<foodItem> foodItems = FoodFileHandler.readFoodItems();
                        for (foodItem item : foodItems) {
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
                    for (foodItem item : foodItems) {
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