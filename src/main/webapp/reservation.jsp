<%@ page import="lk.sliit.hotelroomreservation" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Miranda - Room Reservation</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#0F172A',    // 60% - Navy Blue (dominant)
                        secondary: '#1E40AF',  // 30% - Royal Blue (secondary)
                        accent: '#3B82F6',     // 10% - Sky Blue (accent)
                    },
                    fontFamily: {
                        sans: ['Poppins', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style>
        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .room-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(30, 64, 175, 0.1), 0 10px 10px -5px rgba(30, 64, 175, 0.04);
        }
    </style>
</head>
<body class="font-sans bg-gray-50 min-h-screen">
<!-- Main Container -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <!-- Header Section -->
    <div class="text-center mb-16">
        <h2 class="text-4xl font-bold text-primary mb-4">Room Reservation</h2>
        <p class="text-xl text-gray-600 max-w-2xl mx-auto">Book your stay with us in our futuristic accommodations</p>
    </div>

    <!-- Content Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <!-- Reservation Form (60% width on large screens) -->
        <div class="bg-white rounded-2xl shadow-xl p-8 lg:p-10">
            <h3 class="text-2xl font-bold text-primary mb-6 flex items-center">
                <i class="ri-calendar-check-line text-accent mr-3"></i>
                Booking Details
            </h3>

            <form id="reservationForm" action="reserve" method="post" class="space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="fullName" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                        <input type="text" id="fullName" name="fullName"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200"
                               placeholder="Enter your full name" required>
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                        <input type="email" id="email" name="email"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200"
                               placeholder="Enter your email" required>
                    </div>
                </div>

                <div>
                    <label for="roomType" class="block text-sm font-medium text-gray-700 mb-1">Room Type</label>
                    <select id="roomType" name="roomType"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                        <option value="" disabled selected>Select a room</option>
                        <option value="standard">Standard Room - $99/night</option>
                        <option value="deluxe">Deluxe Room - $149/night</option>
                        <option value="suite">Suite Room - $249/night</option>
                    </select>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="checkIn" class="block text-sm font-medium text-gray-700 mb-1">Check-In Date</label>
                        <input type="date" id="checkIn" name="checkIn"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                    </div>
                    <div>
                        <label for="checkOut" class="block text-sm font-medium text-gray-700 mb-1">Check-Out Date</label>
                        <input type="date" id="checkOut" name="checkOut"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200" required>
                    </div>
                </div>

                <div>
                    <label for="guests" class="block text-sm font-medium text-gray-700 mb-1">Number of Guests</label>
                    <input type="number" id="guests" name="guests" min="1" max="10"
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-accent focus:border-accent transition duration-200"
                           placeholder="Enter number of guests" required>
                </div>

                <button type="submit"
                        class="w-full bg-accent hover:bg-secondary text-white font-bold py-3 px-6 rounded-lg transition duration-300 transform hover:scale-[1.02] shadow-lg flex items-center justify-center">
                    <i class="ri-flashlight-line mr-2"></i> Reserve Now
                </button>
            </form>

            <!-- Status Message -->
            <% if (request.getAttribute("message") != null) { %>
            <div id="errorMessage" class="mt-6 p-4 rounded-lg <%= request.getAttribute("messageType") != null && request.getAttribute("messageType").equals("error") ? "bg-red-50 text-red-700" : "bg-green-50 text-green-700" %>">
                <div class="flex items-center">
                    <i class="ri-<%= request.getAttribute("messageType") != null && request.getAttribute("messageType").equals("error") ? "close-circle" : "checkbox-circle" %>-line mr-2"></i>
                    <%= request.getAttribute("message") %>
                </div>
            </div>
            <% } %>
        </div>

        <!-- Available Rooms Section (40% width on large screens) -->
        <div>
            <div class="bg-primary text-white rounded-2xl shadow-xl p-8 lg:p-10">
                <h3 class="text-2xl font-bold mb-6 flex items-center">
                    <i class="ri-hotel-bed-line text-accent mr-3"></i>
                    Available Rooms
                </h3>

                <div class="space-y-4">
                    <%
                        List<Room> availableRooms = (List<Room>) request.getAttribute("availableRooms");
                        if (availableRooms != null && !availableRooms.isEmpty()) {
                            for (Room room : availableRooms) {
                    %>
                    <div class="room-card bg-white bg-opacity-10 glass-card rounded-xl p-6 transition duration-300 hover:bg-opacity-20">
                        <div class="flex justify-between items-start">
                            <div>
                                <h4 class="font-bold text-lg"><%= room.getRoomType() %></h4>
                                <p class="text-gray-200">Room #<%= room.getRoomNumber() %></p>
                            </div>
                            <div class="text-right">
                                <p class="text-accent font-bold text-xl">$<%= room.getPricePerNight() %>/night</p>
                                <p class="text-sm text-gray-300 mt-1">Available now</p>
                            </div>
                        </div>
                        <div class="flex items-center mt-4 text-yellow-400">
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-fill"></i>
                            <i class="ri-star-half-fill"></i>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="bg-white bg-opacity-10 glass-card rounded-xl p-6 text-center">
                        <i class="ri-hotel-line text-4xl text-gray-300 mb-2"></i>
                        <p class="text-gray-300">No available rooms at the moment</p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- Additional Info Card -->
            <div class="mt-6 bg-secondary text-white rounded-2xl shadow-xl p-6">
                <h4 class="font-bold mb-3 flex items-center">
                    <i class="ri-information-line text-accent mr-2"></i>
                    Why Book With Us?
                </h4>
                <ul class="space-y-2 text-sm">
                    <li class="flex items-start">
                        <i class="ri-checkbox-circle-line text-accent mt-0.5 mr-2"></i>
                        <span>Instant booking confirmation</span>
                    </li>
                    <li class="flex items-start">
                        <i class="ri-checkbox-circle-line text-accent mt-0.5 mr-2"></i>
                        <span>Best price guarantee</span>
                    </li>
                    <li class="flex items-start">
                        <i class="ri-checkbox-circle-line text-accent mt-0.5 mr-2"></i>
                        <span>Free cancellation up to 24 hours</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    // Form validation and dynamic interactions
    document.getElementById('reservationForm').addEventListener('submit', function(e) {
        const checkIn = new Date(document.getElementById('checkIn').value);
        const checkOut = new Date(document.getElementById('checkOut').value);

        if (checkIn >= checkOut) {
            e.preventDefault();
            alert('Check-out date must be after check-in date');
        }
    });

    // Dynamic date restrictions
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('checkIn').min = today;
    document.getElementById('checkOut').min = today;
</script>
</body>
</html>