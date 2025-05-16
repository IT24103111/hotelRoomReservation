<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Miranda - Awards & News</title>
    <link rel="stylesheet" href="css/awards-news.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="awards-news__container">
    <!-- Navigation Bar -->
    <nav class="navbar">
        <h1 class="logo">Hotel Miranda</h1>
        <ul class="nav__links">
            <%
                if (session != null && session.getAttribute("userEmail") != null) {
            %>
            <li><a href="profile.jsp" class="profile__btn">User Profile</a></li>
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
            <li><a href="admin/admin-dashboard.jsp">Admin Dashboard</a></li>
        </ul>
    </nav>

    <!-- Awards Section -->
    <section class="awards__section">
        <h2 class="section__header">Our Awards</h2>
        <p class="section__subheader">Celebrating Excellence in Hospitality</p>
        <div class="awards__grid">
            <div class="award__card">
                <img src="/images/o1.jpeg" alt="Best Hotel Award">
                <h3>Best Hotel 2023</h3>
                <p>Awarded by the Global Hospitality Association for outstanding service and guest satisfaction.</p>
            </div>
            <div class="award__card">
                <img src="/images/o2.jpeg" alt="Luxury Stay Award">
                <h3>Luxury Stay 2024</h3>
                <p>Recognized by Luxury Travel Magazine for providing an exceptional luxury experience.</p>
            </div>
            <div class="award__card">
                <img src="/images/o3.jpeg" alt="Eco-Friendly Award">
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
                <div class="news__item active">
                    <h3>New Spa Opening - April 2025</h3>
                    <p class="news__date">April 01, 2025</p>
                    <p>We are excited to announce the opening of our new luxury spa, offering a range of wellness treatments.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
                <div class="news__item">
                    <h3>Chef's Special Menu Launch</h3>
                    <p class="news__date">March 15, 2025</p>
                    <p>Join us for the launch of our new seasonal menu, crafted by our award-winning chef.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
                <div class="news__item">
                    <h3>Charity Event Success</h3>
                    <p class="news__date">February 20, 2025</p>
                    <p>Our recent charity event raised $10,000 for local communities. Thank you to all who participated!</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <button class="carousel__btn prev">❮</button>
            <button class="carousel__btn next">❯</button>
        </div>
    </section>
</div>
<script src="js/awards-news.js"></script>
</body>
</html>