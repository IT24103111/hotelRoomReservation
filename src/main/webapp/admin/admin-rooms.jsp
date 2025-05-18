<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.demo8.rooms.RoomFileHandler" %>
<%@ page import="lk.sliit.demo8.rooms.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Rooms</title>
    <link rel="stylesheet" href="../css/admin-rooms.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="admin__container">
    <header class="admin__header">
        <h1 class="logo">Hotel Miranda - Manage Rooms</h1>
        <a href="admin-dashboard.jsp" class="back__btn">Back to Admin Dashboard</a>
    </header>

    <section class="admin__content">
        <h2 class="section__header">Manage Rooms</h2>
        <p class="section__subheader">Add, edit, or delete rooms</p>

        <!-- Add New Room Form -->
        <form class="add__form" action="../admin-rooms" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">
            <div class="form__group">
                <label for="name">Room Name</label>
                <input type="text" id="name" name="name" placeholder="Enter room name" required>
            </div>
            <div class="form__group">
                <label for="price">Price per Night ($)</label>
                <input type="number" id="price" name="price" step="0.01" placeholder="Enter price" required>
            </div>
            <div class="form__group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Enter description" required></textarea>
            </div>
            <div class="form__group">
                <label for="imageFile">Upload Image</label>
                <input type="file" id="imageFile" name="imageFile" accept="image/*" required>
            </div>
            <button type="submit" class="add__btn">Add Room</button>
        </form>

       
        <table>
            <thead>
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                String error = null;
                List<Room> rooms = null;
                try {
                    rooms = RoomFileHandler.readRooms();
                    if (rooms.isEmpty()) {
            %>
            <tr>
                <td colspan="5" class="no-data">No rooms found.</td>
            </tr>
            <%
            } else {
                for (Room room : rooms) {
            %>
            <tr>
                <td><img src="../<%= room.getImagePath() %>" alt="<%= room.getName() %>" class="thumbnail"></td>
                <td><%= room.getName() %></td>
                <td>$<%= room.getPrice() %> / night</td>
                <td><%= room.getDescription() %></td>
                <td>
                    <a href="admin-rooms.jsp?editName=<%= room.getName() %>" class="edit__btn">Edit</a>
                    <form action="../admin-rooms" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="name" value="<%= room.getName() %>">
                        <button type="submit" class="delete__btn" onclick="return confirm('Are you sure you want to delete this room?');">Delete</button>
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

  
        <%
            String editName = request.getParameter("editName");
            Room editRoom = null;
            if (editName != null) {
                try {
                    List<Room> items = RoomFileHandler.readRooms();
                    for (Room room : items) {
                        if (room.getName().equals(editName)) {
                            editRoom = room;
                            break;
                        }
                    }
                } catch (Exception e) {
                    error = "Error loading room: " + e.getMessage();
                }
            }
        %>
        <% if (editRoom != null) { %>
        <form class="edit__form" action="../admin-rooms" method="post">
            <h3>Edit Room</h3>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="name" value="<%= editRoom.getName() %>">
            <div class="form__group">
                <label for="editPrice">Price per Night ($)</label>
                <input type="number" id="editPrice" name="price" step="0.01" value="<%= editRoom.getPrice() %>" required>
            </div>
            <div class="form__group">
                <label for="editDescription">Description</label>
                <textarea id="editDescription" name="description" required><%= editRoom.getDescription() %></textarea>
            </div>
            <button type="submit" class="update__btn">Update Room</button>
        </form>
        <% } %>
    </section>
</div>
</body>
</html>
