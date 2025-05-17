
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.hotelroomreservation.foodmenu.foodItem" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.hotelroomreservation.foodmenu.foodFileHandler" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Food Menu</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/foodmenu/css/adminfoodmenu.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="admin__container">
    <header class="admin__header">
        <h1 class="logo">Hotel Miranda—Manage Food Menu</h1>
        <a href="admin-dashboard.jsp" class="back__btn">Back to Admin Dashboard</a>
    </header>

    <section class="admin__content">
        <h2 class="section__header">Manage Food Menu</h2>
        <p class="section__subheader">Add, edit, or delete food items</p>

        <!-- Add New Food Item Form -->
        <form class="add__form" action="../admin-food-menu" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">
            <div class="form__group">
                <label for="name">Food Name</label>
                <input type="text" id="name" name="name" placeholder="Enter food name" required>
            </div>
            <div class="form__group">
                <label for="price">Price ($)</label>
                <input type="number" id="price" name="price" step="0.01" placeholder="Enter price" required>
            </div>
            <div class="form__group">
                <label for="imageFile">Upload Image (Optional)</label>
                <input type="file" id="imageFile" name="imageFile" accept="image/*">
            </div>
            <button type="submit" class="add__btn">Add Food Item</button>
        </form>

        <!-- Food Items Table -->
        <table>
            <thead>
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                String error = null;
                List<foodItem> foodItems = null;
                try {
                    Object FoodItems = foodFileHandler.readFoodItems();
                    if (foodItems.isEmpty()) {
            %>
            <tr>
                <td colspan="4" class="no-data">No food items were found.</td>
            </tr>
            <%
            } else {
                for (foodItem item : foodItems) {
            %>
            <tr>
                <td>
                    <% if (!item.getImagePath().isEmpty()) { %>
                    <img src="../<%= item.getImagePath() %>" alt="<%= item.getName() %>" class="thumbnail">
                    <% } else { %>
                    No Image
                    <% } %>
                </td>
                <td><%= item.getName() %></td>
                <td>$<%= item.getPrice() %></td>
                <td>
                    <a href="admin-food-menu.jsp?editName=<%= item.getName() %>" class="edit__btn">Edit</a>
                    <form action="../admin-food-menu" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="name" value="<%= item.getName() %>">
                        <button type="submit" class="delete__btn" onclick="return confirm('Are you sure you want to delete this food item?');">Delete</button>
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

        <!-- Edit Food Item Form (Hidden by Default) -->
        <%
            String editName = request.getParameter("editName");
            foodItem editItem = null;
            if (editName != null) {
                try {
                    List<foodItem> items = foodFileHandler.readFoodItems();

                    for (foodItem item : items) {
                        if (item.getName().equals(editName)) {
                            editItem = item;
                            break;
                        }
                    }
                } catch (Exception e) {
                    error = "Error loading food item: " + e.getMessage();
                }
            }
        %>
        <% if (editItem != null) { %>
        <form class="edit__form" action="../admin-food-menu" method="post" enctype="multipart/form-data">
            <h3>Edit Food Item</h3>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="name" value="<%= editItem.getName() %>">
            <div class="form__group">
                <label for="editPrice">Price ($)</label>
                <input type="number" id="editPrice" name="price" step="0.01" value="<%= editItem.getPrice() %>" required>
            </div>
            <div class="form__group">
                <label for="editImageFile">Upload New Image (Optional)</label>
                <input type="file" id="editImageFile" name="imageFile" accept="image/*">
            </div>
            <button type="submit" class="update__btn">Update Food Item</button>
        </form>
        <% } %>
    </section>
</div>
</body>
</html>