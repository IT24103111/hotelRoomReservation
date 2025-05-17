<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/14/2025
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - LuxStay</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .gradient-overlay {
            background: linear-gradient(45deg, rgba(79, 70, 229, 0.9), rgba(99, 102, 241, 0.9));
        }
    </style>
</head>
<body class="bg-gray-50">
<!-- Navigation -->
<nav class="bg-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center">
                <a href="index.html" class="text-2xl font-bold text-indigo-600">LuxStay</a>
            </div>
            <div class="flex items-center space-x-4">
                <a href="index.html" class="text-gray-700 hover:text-indigo-600">Home</a>
                <a href="#" class="text-gray-700 hover:text-indigo-600">Rooms</a>
                <a href="#" class="text-gray-700 hover:text-indigo-600">About</a>
                <a href="#" class="text-gray-700 hover:text-indigo-600">Contact</a>
                <a href="profile.html" class="text-indigo-600 font-medium">My Profile</a>
            </div>
        </div>
    </div>
</nav>

<!-- Profile Section -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="bg-white shadow-xl rounded-lg overflow-hidden">
        <!-- Profile Header -->
        <div class="bg-indigo-600 h-48 relative">
            <div class="absolute bottom-0 left-0 w-full transform translate-y-1/2 flex justify-center">
                <div class="h-32 w-32 rounded-full border-4 border-white overflow-hidden bg-white">
                    <img src="https://th.bing.com/th/id/OIP.lcdOc6CAIpbvYx3XHfoJ0gHaF3?cb=iwc2&rs=1&pid=ImgDetMain" alt="Profile" class="h-full w-full object-cover">
                </div>
            </div>
        </div>

        <!-- Profile Info -->
        <div class="pt-20 pb-8 px-8">
            <div class="text-center mb-8">
                <h1 class="text-2xl font-bold text-gray-900">John Doe</h1>
                <p class="text-gray-600">Premium Member since 2023</p>
            </div>

            <!-- Profile Tabs -->
            <div class="border-b border-gray-200 mb-8">
                <div class="flex justify-center space-x-8">
                    <button class="border-b-2 border-indigo-600 text-indigo-600 pb-4 px-2 font-medium">Personal Info</button>
                    <button class="text-gray-500 pb-4 px-2 font-medium hover:text-gray-700">Bookings</button>
                    <button class="text-gray-500 pb-4 px-2 font-medium hover:text-gray-700">Preferences</button>
                    <button class="text-gray-500 pb-4 px-2 font-medium hover:text-gray-700">Payment Methods</button>
                </div>
            </div>

            <!-- Personal Info Form -->
            <div class="max-w-2xl mx-auto">
                <form class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700">First Name</label>
                            <input type="text" value="John" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Last Name</label>
                            <input type="text" value="Doe" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                        </div>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700">Email Address</label>
                        <input type="email" value="john.doe@example.com" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700">Phone Number</label>
                        <input type="tel" value="+1 (555) 123-4567" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700">Address</label>
                        <input type="text" value="123 Main Street" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700">City</label>
                            <input type="text" value="New York" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">State</label>
                            <input type="text" value="NY" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Zip Code</label>
                            <input type="text" value="10001" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 py-2 px-3">
                        </div>
                    </div>

                    <div>
                        <button type="submit" class="w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-150 ease-in-out transform hover:scale-105">
                            Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-gray-900 text-white mt-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <h3 class="text-xl font-bold mb-4">LuxStay</h3>
                <p class="text-gray-400">Experience luxury living at its finest.</p>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="index.html" class="text-gray-400 hover:text-white">Home</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white">Rooms</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white">About</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white">Contact</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Contact</h4>
                <ul class="space-y-2 text-gray-400">
                    <li>123 Hotel Street</li>
                    <li>City, Country</li>
                    <li>Phone: +1 234 567 890</li>
                    <li>Email: info@luxstay.com</li>
                </ul>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Newsletter</h4>
                <form class="space-y-4">
                    <input type="email" placeholder="Enter your email" class="w-full px-4 py-2 rounded-md bg-gray-800 text-white">
                    <button class="w-full bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700">
                        Subscribe
                    </button>
                </form>
            </div>
        </div>
        <div class="mt-8 pt-8 border-t border-gray-800 text-center text-gray-400">
            <p>&copy; 2024 LuxStay. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>