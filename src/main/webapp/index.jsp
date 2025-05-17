<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lk.sliit.demo8.FileHandler" %>
<%@ page import="lk.sliit.demo8.Reservation" %>
<%@ page import="lk.sliit.demo8.RoomReservation" %>
<%@ page import="lk.sliit.demo8.QuickSortReservations" %>
<%@ page import="lk.sliit.demo8.BST.RoomBST" %>
<%@ page import="lk.sliit.demo8.BST.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Reservations</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#0F172A',    // 60% - Navy Blue
                        secondary: '#1E40AF',  // 30% - Royal Blue
                        accent: '#3B82F6',     // 10% - Sky Blue
                    },
                    fontFamily: {
                        sans: ['Poppins', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style>
        .glass-panel {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .reservation-row:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(30, 64, 175, 0.1);
        }
    </style>
</head>
<body class="font-sans bg-gray-50 min-h-screen">
<!-- Admin Container -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <!-- Header -->
    <header class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8">
        <div class="mb-4 md:mb-0">
            <h1 class="text-3xl font-bold text-primary flex items-center">
                <i class="ri-hotel-line text-accent mr-3"></i>
                Hotel Rio - Admin
            </h1>
            <p class="text-gray-600">Manage reservations and room bookings</p>
        </div>
        <a href="admin-dashboard.jsp" class="flex items-center text-secondary hover:text-accent transition-colors duration-200">
            <i class="ri-arrow-left-line mr-2"></i> Back to Dashboard
        </a>
    </header>

    <!-- Main Content -->
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <!-- Section Header -->
        <div class="bg-primary text-white px-6 py-4">
            <h2 class="text-2xl font-bold flex items-center">
                <i class="ri-calendar-todo-line mr-3"></i>
                Manage Reservations
            </h2>
            <p class="text-gray-300">View, edit, or delete guest reservations</p>
        </div>

        <!-- Edit Form Section -->
        <%
            String editEmail = request.getParameter("editEmail");
            Reservation editReservation = null;
            String editError = null;
            if (editEmail != null) {
                try {
                    List<Reservation> reservations = FileHandler.readReservations();
                    for (Reservation res : reservations) {
                        if (res.getEmail().equals(editEmail)) {
                            editReservation = res;
                            break;
                        }
                    }
                } catch (Exception e) {
                    editError = "Error loading reservation: " + e.getMessage();
                }
            }
        %>
        <% if (editError != null) { %>
        <div class="bg-red-50 text-red-700 p-4 mx-6 mt-4 rounded-lg">
            <i class="ri-error-warning-line mr-2"></i> <%= editError %>
        </div>
        <% } %>

        <% if (editReservation != null) { %>
        <div class="p-6 border-b border-gray-200

">
            <form class="grid grid-cols-1 md:grid-cols-2 gap-6" action="/admin/index.jsp" method="post">
                <h3 class="text-xl font-bold text-primary md:col-span-2 flex items-center">
                    <i class="ri-edit-2-line text-accent mr-2"></i>
                    Edit Reservation
                </h3>

                <input type="hidden" name="action" value="update">
                <input type="hidden" name="email" value="<%= editReservation.getEmail() %>">

                <div>
                    <label for="editFullName" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <input type="text" id="editFullName" name="fullName" value="<%= editReservation.getFullName() %>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                </div>

                <div>
                    <label for="editEmail" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" id="editEmail" name="newEmail" value="<%= editReservation.getEmail() %>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                </div>

                <div>
                    <label for="editRoomType" class="block text-sm font-medium text-gray-700 mb-1">Room Type</label>
                    <select id="editRoomType" name="roomType"
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                        <option value="standard" <%= editReservation.getRoomType().equals("standard") ? "selected" : "" %>>Standard Room - $99/night</option>
                        <option value="deluxe" <%= editReservation.getRoomType().equals("deluxe") ? "selected" : "" %>>Deluxe Room - $149/night</option>
                        <option value="suite" <%= editReservation.getRoomType().equals("suite") ? "selected" : "" %>>Suite Room - $249/night</option>
                    </select>
                </div>

                <div>
                    <label for="editGuests" class="block text-sm font-medium text-gray-700 mb-1">Guests</label>
                    <input type="number" id="editGuests" name="guests" min="1" max="10" value="<%= editReservation.getGuests() %>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                </div>

                <div>
                    <label for="editCheckIn" class="block text-sm font-medium text-gray-700 mb-1">Check-In</label>
                    <input type="date" id="editCheckIn" name="checkIn" value="<%= editReservation.getCheckInDate() %>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                </div>

                <div>
                    <label for="editCheckOut" class="block text-sm font-medium text-gray-700 mb-1">Check-Out</label>
                    <input type="date" id="editCheckOut" name="checkOut" value="<%= editReservation.getCheckOutDate() %>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                </div>

                <div class="md:col-span-2 flex justify-end space-x-4">
                    <a href="/admin/index.jsp" class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-200">
                        Cancel
                    </a>
                    <button type="submit" class="px-4 py-2 bg-accent hover:bg-secondary text-white rounded-lg transition duration-200">
                        Update Reservation
                    </button>
                </div>
            </form>
        </div>
        <% } %>

        <!-- Reservations Table -->
        <div class="overflow-x-auto">
            <%
                String tableError = null;
                List<Reservation> reservations = null;
                try {
                    reservations = FileHandler.readReservations();
                    QuickSortReservations.sortByCheckInDate(reservations);
            %>
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Guest</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Room</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Dates</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Guests</th>
                    <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <% if (reservations.isEmpty()) { %>
                <tr>
                    <td colspan="6" class="px-6 py-4 text-center text-gray-500">
                        No reservations found
                    </td>
                </tr>
                <% } else {
                    for (Reservation res : reservations) {
                        String roomBadgeColor = "";
                        if (res.getRoomType().equals("standard")) {
                            roomBadgeColor = "bg-blue-100 text-blue-800";
                        } else if (res.getRoomType().equals("deluxe")) {
                            roomBadgeColor = "bg-purple-100 text-purple-800";
                        } else {
                            roomBadgeColor = "bg-yellow-100 text-yellow-800";
                        }
                %>
                <tr class="reservation-row transition duration-200 hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="font-medium text-gray-900"><%= res.getFullName() %></div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-gray-500">
                        <%= res.getEmail() %>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 py-1 text-xs rounded-full <%= roomBadgeColor %>">
                                    <%= res.getRoomType().substring(0, 1).toUpperCase() + res.getRoomType().substring(1) %>
                                </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900"><%= res.getCheckInDate() %></div>
                        <div class="text-sm text-gray-500">to <%= res.getCheckOutDate() %></div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-gray-500">
                        <%= res.getGuests() %>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div class="flex justify-end space-x-2">
                            <a href="/admin/index.jsp?editEmail=<%= res.getEmail() %>"
                               class="text-secondary hover:text-accent transition-colors duration-200">
                                <i class="ri-edit-line"></i>
                            </a>
                            <form action="/admin/index.jsp" method="post" class="inline">
                                <input type="hidden" name="email" value="<%= res.getEmail() %>">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="roomType" value="<%= res.getRoomType() %>">
                                <button type="submit"
                                        class="text-red-600 hover:text-red-900 transition-colors duration-200">
                                    <i class="ri-delete-bin-line"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% }
                } %>
                </tbody>
            </table>
            <% } catch (Exception e) {
                tableError = "Error loading reservations: " + e.getMessage();
            } %>

            <% if (tableError != null) { %>
            <div class="bg-red-50 text-red-700 p-4 mx-6 mt-4 rounded-lg">
                <i class="ri-error-warning-line mr-2"></i> <%= tableError %>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Handle Update Action -->
    <%
        String updateError = null;
        if ("POST".equalsIgnoreCase(request.getMethod()) && "update".equals(request.getParameter("action"))) {
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String newEmail = request.getParameter("newEmail");
            String roomType = request.getParameter("roomType");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");
            int guests = Integer.parseInt(request.getParameter("guests"));

            try {
                RoomReservation updatedReservation = new RoomReservation(
                        fullName, newEmail, roomType,
                        LocalDate.parse(checkIn), LocalDate.parse(checkOut), guests
                );
                FileHandler.updateReservation(email, updatedReservation);
                response.sendRedirect("/admin/index.jsp");
            } catch (Exception e) {
                updateError = "Error updating: " + e.getMessage();
            }
        }
    %>
    <% if (updateError != null) { %>
    <div class="mt-4 bg-red-50 text-red-700 p-4 rounded-lg">
        <i class="ri-error-warning-line mr-2"></i> <%= updateError %>
    </div>
    <% } %>

    <!-- Handle Delete Action -->
    <%
        String deleteError = null;
        if ("POST".equalsIgnoreCase(request.getMethod()) && "delete".equals(request.getParameter("action"))) {
            String email = request.getParameter("email");
            String roomType = request.getParameter("roomType");
            try {
                FileHandler.deleteReservation(email);
                // Mark one room of the specified type as available
                RoomBST roomBST = (RoomBST) application.getAttribute("roomBST");
                List<Room> allRooms = roomBST.getAllRooms();
                for (Room room : allRooms) {
                    if (room.getRoomType().equalsIgnoreCase(roomType) && !room.isAvailable()) {
                        room.setAvailable(true);
                        break; // Mark only one room as available
                    }
                }
                response.sendRedirect("/admin/index.jsp");
            } catch (Exception e) {
                deleteError = "Error deleting: " + e.getMessage();
            }
        }
    %>
    <% if (deleteError != null) { %>
    <div class="mt-4 bg-red-50 text-red-700 p-4 rounded-lg">
        <i class="ri-error-warning-line mr-2"></i> <%= deleteError %>
    </div>
    <% } %>
</div>

<script>
    // Add confirmation for delete actions
    document.querySelectorAll('form[action="/admin/index.jsp"]').forEach(form => {
        if (form.querySelector('input[name="action"][value="delete"]')) {
            form.addEventListener('submit', function(e) {
                if (!confirm('Are you sure you want to delete this reservation?')) {
                    e.preventDefault();
                }
            });
        }
    });
</script>
</body>
</html>