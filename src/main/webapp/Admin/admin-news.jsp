<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage News</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="admin__container">
    <header class="admin__header">
        <h1 class="logo">Hotel Miranda - Manage News</h1>
        <a href="${pageContext.request.contextPath}/admin/admin-dashboard.jsp" class="back__btn">Back to Dashboard</a>
    </header>

    <section class="admin__content">
        <h2 class="section__header">Manage News</h2>
        <p class="section__subheader">Add or delete news items</p>

        <c:if test="${not empty message}">
            <div class="alert alert-${messageType} alert-dismissible fade show" role="alert">
                    ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Add News Form -->
        <form method="post" action="${pageContext.request.contextPath}/admin-news" enctype="multipart/form-data" class="mb-4">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" class="form-control" name="title" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Date (e.g., April 01, 2025)</label>
                <input type="text" class="form-control" name="date" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" name="description" rows="4" required></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Image (Optional)</label>
                <input type="file" class="form-control" name="imageFile" accept="image/*">
            </div>
            <button type="submit" class="admin__btn">Add News</button>
        </form>

        <!-- News List -->
        <h3>Current News Items</h3>
        <c:if test="${empty newsItems}">
            <p>No news items available.</p>
        </c:if>
        <c:if test="${not empty newsItems}">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${newsItems}">
                    <tr>
                        <td>${item.title}</td>
                        <td>${item.date}</td>
                        <td>${item.description}</td>
                        <td>
                            <c:if test="${not empty item.imagePath}">
                                <img src="${pageContext.request.contextPath}/${item.imagePath}" alt="${item.title}" style="max-width: 100px;">
                            </c:if>
                        </td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/admin-news" onsubmit="return confirm('Are you sure you want to delete this news item?')">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="title" value="${item.title}">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </section>
</div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>