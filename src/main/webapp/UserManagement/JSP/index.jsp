<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/14/2025
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Hotel Reservations</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50">
<!-- Navigation -->
<nav class="bg-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center">
                <span class="text-2xl font-bold text-indigo-600">LuxStay</span>
            </div>
            <div class="flex items-center space-x-4">
                <a href="#" class="text-gray-700 hover:text-indigo-600">Home</a>
                <a href="#" class="text-gray-700 hover:text-indigo-600">Rooms</a>
                <a href="#" class="text-gray-700 hover:text-indigo-600">About</a>
                <a href="#" class="text-gray-700 hover:text-indigo-600">Contact</a>
                <a href="login.html" class="text-gray-700 hover:text-indigo-600">Login</a>
                <button class="bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700 transition duration-150 ease-in-out transform hover:scale-105">Book Now</button>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="relative bg-indigo-900 h-[600px]">
    <div class="absolute inset-0">
        <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"
             class="w-full h-full object-cover opacity-50" alt="Hotel">
    </div>
    <div class="relative max-w-7xl mx-auto py-24 px-4 sm:py-32 sm:px-6 lg:px-8">
        <h1 class="text-4xl font-extrabold tracking-tight text-white sm:text-5xl lg:text-6xl">
            Experience Luxury Living
        </h1>
        <p class="mt-6 text-xl text-indigo-100 max-w-3xl">
            Book your perfect stay with us and enjoy world-class amenities, stunning views, and exceptional service.
        </p>
        <div class="mt-10">
            <a href="#rooms" class="inline-block bg-white px-8 py-3 border border-transparent text-base font-medium rounded-md text-indigo-600 hover:bg-indigo-50">
                View Available Rooms
            </a>
        </div>
    </div>
</div>

<!-- Search Section -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-16">
    <div class="bg-white rounded-lg shadow-xl p-6">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700">Check-in</label>
                <input type="date" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Check-out</label>
                <input type="date" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Guests</label>
                <select class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option>1 Guest</option>
                    <option>2 Guests</option>
                    <option>3 Guests</option>
                    <option>4 Guests</option>
                </select>
            </div>
            <div class="flex items-end">
                <button class="w-full bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700">
                    Search Rooms
                </button>
            </div>
        </div>
        <div class="mt-4 grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700">Room Type</label>
                <select class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option>All Rooms</option>
                    <option>Deluxe Room</option>
                    <option>Executive Suite</option>
                    <option>Presidential Suite</option>
                </select>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Price Range</label>
                <select class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option>Any Price</option>
                    <option>$0 - $200</option>
                    <option>$200 - $400</option>
                    <option>$400+</option>
                </select>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Amenities</label>
                <select class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option>All Amenities</option>
                    <option>Free WiFi</option>
                    <option>Swimming Pool</option>
                    <option>Spa Access</option>
                    <option>Breakfast Included</option>
                </select>
            </div>
        </div>
    </div>
</div>

<!-- Rooms Section -->
<div id="rooms" class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
    <h2 class="text-3xl font-bold text-gray-900 mb-8">Available Rooms</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Room Card 1 -->
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <div class="relative">
                <img src="https://images.unsplash.com/photo-1590490360182-c33d57733427?ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80"
                     class="w-full h-48 object-cover" alt="Deluxe Room">
                <div class="absolute top-4 right-4">
                    <span class="bg-green-500 text-white px-2 py-1 rounded-full text-xs">Available</span>
                </div>
            </div>
            <div class="p-6">
                <div class="flex justify-between items-start">
                    <h3 class="text-xl font-semibold text-gray-900">Deluxe Room</h3>
                    <div class="flex items-center">
                        <svg class="w-5 h-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                        </svg>
                        <span class="ml-1 text-gray-600">4.8</span>
                    </div>
                </div>
                <p class="mt-2 text-gray-600">Spacious room with city view, king-size bed, and modern amenities.</p>
                <div class="mt-4">
                    <div class="flex items-center space-x-2 text-sm text-gray-500">
                        <span>✓ Free WiFi</span>
                        <span>✓ Breakfast</span>
                        <span>✓ Pool Access</span>
                    </div>
                </div>
                <div class="mt-4 flex items-center justify-between">
                    <div>
                        <span class="text-2xl font-bold text-indigo-600">$199</span>
                        <span class="text-gray-500">/night</span>
                    </div>
                    <button class="bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700">
                        Book Now
                    </button>
                </div>
            </div>
        </div>

        <!-- Room Card 2 -->
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"
                 class="w-full h-48 object-cover" alt="Suite">
            <div class="p-6">
                <h3 class="text-xl font-semibold text-gray-900">Executive Suite</h3>
                <p class="mt-2 text-gray-600">Luxurious suite with separate living area and premium amenities.</p>
                <div class="mt-4 flex items-center justify-between">
                    <span class="text-2xl font-bold text-indigo-600">$299</span>
                    <span class="text-gray-500">/night</span>
                </div>
                <button class="mt-4 w-full bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700">
                    Book Now
                </button>
            </div>
        </div>

        <!-- Room Card 3 -->
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <img src="https://images.unsplash.com/photo-1591088398332-8a7791972843?ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80"
                 class="w-full h-48 object-cover" alt="Presidential Suite">
            <div class="p-6">
                <h3 class="text-xl font-semibold text-gray-900">Presidential Suite</h3>
                <p class="mt-2 text-gray-600">Ultimate luxury with panoramic views and exclusive services.</p>
                <div class="mt-4 flex items-center justify-between">
                    <span class="text-2xl font-bold text-indigo-600">$499</span>
                    <span class="text-gray-500">/night</span>
                </div>
                <button class="mt-4 w-full bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700">
                    Book Now
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="bg-gray-100 py-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="text-center">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <svg class="w-12 h-12 text-indigo-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    <h3 class="mt-4 text-lg font-medium text-gray-900">Best Rate Guarantee</h3>
                    <p class="mt-2 text-gray-600">We guarantee the best rates for your stay</p>
                </div>
            </div>
            <div class="text-center">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <svg class="w-12 h-12 text-indigo-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <h3 class="mt-4 text-lg font-medium text-gray-900">24/7 Support</h3>
                    <p class="mt-2 text-gray-600">Round the clock customer service</p>
                </div>
            </div>
            <div class="text-center">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <svg class="w-12 h-12 text-indigo-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path>
                    </svg>
                    <h3 class="mt-4 text-lg font-medium text-gray-900">Secure Booking</h3>
                    <p class="mt-2 text-gray-600">Safe and secure payment process</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-gray-900 text-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <h3 class="text-xl font-bold mb-4">LuxStay</h3>
                <p class="text-gray-400">Experience luxury living at its finest.</p>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white">Home</a></li>
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
