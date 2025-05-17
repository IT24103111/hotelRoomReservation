<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.demo8.news.NewsItem" %>
<%@ page import="lk.sliit.demo8.news.NewsFileHandler" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Miranda - Awards & News</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/awards-news.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="awards-news__container">
    <!-- Navigation Bar -->
    <nav class="navbar">
        <h1 class="logo">Hotel Miranda</h1>
        <ul class="nav__links">
            <%
                String userEmail = (String) session.getAttribute("userEmail");
                Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            %>
            <% if (userEmail != null) { %>
            <li><a href="<%= request.getContextPath() %>/profile" class="profile__btn">User Profile</a></li>
            <li><a href="<%= request.getContextPath() %>/logout">Logout</a></li>
            <% } else { %>
            <li><a href="<%= request.getContextPath() %>/login">Log in</a></li>
            <li><a href="<%= request.getContextPath() %>/signup">Sign up</a></li>
            <% } %>
            <li><a href="<%= request.getContextPath() %>/features.jsp">Features</a></li>
            <li><a href="<%= request.getContextPath() %>/about.jsp">About</a></li>
            <li><a href="<%= request.getContextPath() %>/rooms">Rooms</a></li>
            <li><a href="<%= request.getContextPath() %>/gallery">Gallery</a></li>
            <li><a href="<%= request.getContextPath() %>/food-menu.jsp">Food Menu</a></li>
            <li><a href="<%= request.getContextPath() %>/reservation">Reservation</a></li>
            <li><a href="<%= request.getContextPath() %>/reviews.jsp">Reviews</a></li>
            <% if (isAdmin != null && isAdmin) { %>
            <li><a href="<%= request.getContextPath() %>/admin/admin-dashboard.jsp">Admin Dashboard</a></li>
            <% } %>
        </ul>
    </nav>

    <!-- Awards Section -->
    <section class="awards__section">
        <h2 class="section__header">Our Awards</h2>
        <p class="section__subheader">Celebrating Excellence in Hospitality</p>
        <div class="awards__grid">
            <div class="award__card">
                <img src="<%= request.getContextPath() %>/images/o1.jpeg" alt="Best Hotel Award">
                <h3>Best Hotel 2023</h3>
                <p>Voted best hotel for exceptional service and luxurious amenities.</p>
            </div>
            <div class="award__card">
                <img src="<%= request.getContextPath() %>/images/o2.jpeg" alt="Luxury Stay Award">
                <h3>Luxury Stay 2024</h3>
                <p>Recognized by Luxury Travel Magazine for providing an exceptional luxury experience.</p>
            </div>
            <div class="award__card">
                <img src="<%= request.getContextPath() %>/images/o3.jpeg" alt="Eco-Friendly Award">
                <h3>Eco-Friendly Hotel 2024</h3>
                <p>Honored by Green Tourism for our commitment to sustainable practices.</p>
            </div>
        </div>
    </section>

    <!-- News Section -->
    <section class="news__section">
        <h2 class="section__header">Latest News</h2>
        <p class="section__subheader">Stay Updated with Hotel Miranda</p>
        <div class="news__carousel">
            <div class="news__items">
                <%

                    List<NewsItem> newsItems = NewsFileHandler.readNewsItems();
                    if (newsItems == null || newsItems.isEmpty()) {
                %>
                <p>No news items available.</p>
                <%
                } else {
                    for (NewsItem news : newsItems) {
                %>
                <div class="news__item">
                    <h3><%= news.getTitle() %></h3>
                    <p class="news__date"><%= news.getDate() %></p>
                    <p><%= news.getDescription() %></p>
                    <%
                        if (news.getImagePath() != null && !news.getImagePath().isEmpty()) {
                    %>
                    <img src="<%= request.getContextPath() + "/" + news.getImagePath() %>" alt="<%= news.getTitle() %>" style="max-width: 200px; border-radius: 5px;">
                    <%
                        }
                    %>
                    <a href="#" class="read-more">Read More</a>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <button class="carousel__btn prev">❮</button>
            <button class="carousel__btn next">❯</button>
        </div>
    </section>
</div>
<script src="<%= request.getContextPath() %>/js/awards-news.js"></script>
</body>
</html>