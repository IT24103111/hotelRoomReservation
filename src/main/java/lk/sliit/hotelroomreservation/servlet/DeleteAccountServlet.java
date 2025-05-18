package com.tourism.servlet;

import com.tourism.model.User;
import com.tourism.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;


public class DeleteAccountServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current user from session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Delete the user
        boolean success = userService.deleteUser(currentUser.getEmail());

        // Invalidate the session
        session.invalidate();

        if (success) {
            // Add success message
            request.setAttribute("successMessage", "Account deleted successfully");
        } else {
            // Add error message
            request.setAttribute("errorMessage", "Failed to delete account");
        }

        // Redirect to login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}