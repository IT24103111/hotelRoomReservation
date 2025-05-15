<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.demo8.gallery.GalleryFileHandler" %>
<%@ page import="lk.sliit.demo8.gallery.GalleryItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hotel Miranda - Gallery</title>
  <link rel="stylesheet" href="css/gallery.css">
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

  <section class="gallery__container">
    <h2 class="section__header">Hotel Gallery</h2>
    <p class="section__subheader">Explore the beauty of our hotel</p>
    <div class="gallery__grid" id="galleryGrid">
      <%
        List<GalleryItem> galleryItems = GalleryFileHandler.readGalleryItems();
        for (GalleryItem item : galleryItems) {
      %>
      <div class="gallery__item">
        <img src="<%= item.getImagePath() %>" alt="<%= item.getCaption() %>">
        <div class="gallery__caption"><%= item.getCaption() %></div>
      </div>
      <%
        }
      %>
    </div>

    <!-- Lightbox -->
    <div class="lightbox" id="lightbox">
      <span class="lightbox__close" id="lightboxClose">×</span>
      <img class="lightbox__image" id="lightboxImage" src="" alt="Lightbox Image">
      <div class="lightbox__caption" id="lightboxCaption"></div>
    </div>
  </section>
</div>
<script src="js/gallery.js"></script>
</body>
</html>
