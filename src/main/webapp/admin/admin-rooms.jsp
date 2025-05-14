<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Admin Room Management</title></head>
<body>
<h2>Manage Rooms</h2>
<form action="admin-rooms" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="add">
    Name: <input type="text" name="name"><br>
    Price: <input type="number" step="0.01" name="price"><br>
    Description: <input type="text" name="description"><br>
    Image: <input type="file" name="imageFile"><br>
    <input type="submit" value="Add Room">
</form>
<!-- Add update/delete forms or list rooms here -->
</body>
</html>