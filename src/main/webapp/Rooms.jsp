<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.demo8.rooms.RoomFileHandler" %>
<%@ page import="lk.sliit.demo8.rooms.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Miranda - Rooms</title>
    <link rel="stylesheet" href="css/rooms.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="home__container">
    <nav class="navbar">
        <h1 class="logo">Hotel Miranda</h1>
        <ul class="nav__links">
            <%
                
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

    <section class="rooms__container">
        <h2 class="section__header">Our Rooms</h2>
        <p class="section__subheader">Explore our luxurious accommodations</p>
        <div class="rooms__grid">
            <%
                List<Room> rooms = RoomFileHandler.readRooms();
                for (Room room : rooms) {
            %>
            <div class="room__card">
                <img src="<%= room.getImagePath() %>" alt="<%= room.getName() %>">
                <div class="room__content">
                    <h3><%= room.getName() %></h3>
                    <p class="room__price">$<%= room.getPrice() %> / night</p>
                    <p class="room__description"><%= room.getDescription() %></p>
                    <button class="room__btn">Book Now</button>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </section>
</div>
<script src="js/rooms.js"></script>
</body>
</html>
