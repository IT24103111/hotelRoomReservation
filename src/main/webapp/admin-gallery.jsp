<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.hotelroomreservation" %>
<%@ page import="lk.sliit.hotelroomreservation" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Gallery</title>
    <link rel="stylesheet" href="../css/admin-gallery.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="admin__container">
    <header class="admin__header">
        <h1 class="logo">Hotel Miranda - Manage Gallery</h1>
        <a href="admin-dashboard.jsp" class="back__btn">Back to Admin Dashboard</a>
    </header>

    <section class="admin__content">
        <h2 class="section__header">Manage Gallery</h2>
        <p class="section__subheader">Add, edit, or delete gallery items</p>

        <!-- Add New Photo Form -->
        <form class="add__form" action="../admin-gallery" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">
            <div class="form__group">
                <label for="imageFile">Upload Image</label>
                <input type="file" id="imageFile" name="imageFile" accept="image/*" required>
            </div>
            <div class="form__group">
                <label for="caption">Caption</label>
                <input type="text" id="caption" name="caption" placeholder="Enter caption" required>
            </div>
            <button type="submit" class="add__btn">Add Photo</button>
        </form>

        <!-- Gallery Items Table -->
        <table>
            <thead>
            <tr>
                <th>Image</th>
                <th>Caption</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                String error = null;
                List<GalleryItem> galleryItems = null;
                try {
                    galleryItems = GalleryFileHandler.readGalleryItems();
                    if (galleryItems.isEmpty()) {
            %>
            <tr>
                <td colspan="3" class="no-data">No gallery items found.</td>
            </tr>
            <%
            } else {
                for (GalleryItem item : galleryItems) {
            %>
            <tr>
                <td><img src="../<%= item.getImagePath() %>" alt="<%= item.getCaption() %>" class="thumbnail"></td>
                <td><%= item.getCaption() %></td>
                <td>
                    <a href="admin-gallery.jsp?editImagePath=<%= item.getImagePath() %>" class="edit__btn">Edit</a>
                    <form action="../admin-gallery" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="imagePath" value="<%= item.getImagePath() %>">
                        <button type="submit" class="delete__btn" onclick="return confirm('Are you sure you want to delete this photo?');">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                        }
                    }
                } catch (Exception e) {
                    error = "Error: " + e.getMessage();
                }
            %>
            </tbody>
        </table>
        <% if (error != null) { %>
        <p class="error"><%= error %></p>
        <% } %>

        <!-- Edit Caption Form (Hidden by Default) -->
        <%
            String editImagePath = request.getParameter("editImagePath");
            GalleryItem editItem = null;
            if (editImagePath != null) {
                try {
                    List<GalleryItem> items = GalleryFileHandler.readGalleryItems();
                    for (GalleryItem item : items) {
                        if (item.getImagePath().equals(editImagePath)) {
                            editItem = item;
                            break;
                        }
                    }
                } catch (Exception e) {
                    error = "Error loading item: " + e.getMessage();
                }
            }
        %>
        <% if (editItem != null) { %>
        <form class="edit__form" action="../admin-gallery" method="post">
            <h3>Edit Caption</h3>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="imagePath" value="<%= editItem.getImagePath() %>">
            <div class="form__group">
                <label for="editCaption">Caption</label>
                <input type="text" id="editCaption" name="caption" value="<%= editItem.getCaption() %>" required>
            </div>
            <button type="submit" class="update__btn">Update Caption</button>
        </form>
        <% } %>
    </section>
</div>
</body>
</html>