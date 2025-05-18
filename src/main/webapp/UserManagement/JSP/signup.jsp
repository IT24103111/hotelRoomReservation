<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/14/2025
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - LuxStay</title>
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
<div class="min-h-screen flex">
    <!-- Left Side - Image Section -->
    <div class="hidden lg:flex lg:w-1/2 relative">
        <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"
             class="w-full h-full object-cover" alt="Hotel">
        <div class="absolute inset-0 gradient-overlay"></div>
        <div class="absolute inset-0 flex flex-col justify-center px-12 text-white">
            <h1 class="text-4xl font-bold mb-4">Join LuxStay</h1>
            <p class="text-lg mb-8">Create your account and start your luxury journey with us.</p>
            <div class="space-y-4">
                <div class="flex items-center">
                    <svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    <span>Exclusive member benefits</span>
                </div>
                <div class="flex items-center">
                    <svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    <span>Special rates and offers</span>
                </div>
                <div class="flex items-center">
                    <svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    <span>Easy booking management</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Right Side - Sign Up Form -->
    <div class="w-full lg:w-1/2 flex items-center justify-center px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8">
            <div class="text-center">
                <h2 class="text-3xl font-extrabold text-gray-900">
                    Create your account
                </h2>
                <p class="mt-2 text-sm text-gray-600">
                    Join us and start your luxury journey
                </p>
            </div>

            <form class="mt-8 space-y-6" action="#" method="POST">
                <div class="space-y-4">
                    <div>
                        <label for="full-name" class="block text-sm font-medium text-gray-700">Full Name</label>
                        <div class="mt-1">
                            <input id="full-name" name="full-name" type="text" required
                                   class="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition duration-150 ease-in-out"
                                   placeholder="Enter your full name">
                        </div>
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
                        <div class="mt-1">
                            <input id="email" name="email" type="email" autocomplete="email" required
                                   class="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition duration-150 ease-in-out"
                                   placeholder="Enter your email">
                        </div>
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <div class="mt-1">
                            <input id="password" name="password" type="password" required
                                   class="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition duration-150 ease-in-out"
                                   placeholder="Create a password">
                        </div>
                    </div>

                    <div>
                        <label for="confirm-password" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                        <div class="mt-1">
                            <input id="confirm-password" name="confirm-password" type="password" required
                                   class="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition duration-150 ease-in-out"
                                   placeholder="Confirm your password">
                        </div>
                    </div>
                </div>

                <div class="flex items-center">
                    <input id="terms" name="terms" type="checkbox" required
                           class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                    <label for="terms" class="ml-2 block text-sm text-gray-900">
                        I agree to the <a href="#" class="text-indigo-600 hover:text-indigo-500">Terms and Conditions</a>
                    </label>
                </div>

                <div>
                    <button type="submit"
                            class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-150 ease-in-out transform hover:scale-105">
                        Create Account
                    </button>
                </div>
            </form>

            <div class="mt-6">
                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-300"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                            <span class="px-2 bg-white text-gray-500">
                                Or continue with
                            </span>
                    </div>
                </div>

                
            </div>

            <div class="text-center">
                <p class="text-sm text-gray-600">
                    Already have an account?
                    <a href="login.html" class="font-medium text-indigo-600 hover:text-indigo-500">
                        Sign in
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>