package lk.sliit.demo8;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sliit.demo8.BST.Room;
import lk.sliit.demo8.BST.RoomBST;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@WebServlet("/reserve")
public class ReservationServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ReservationServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.info("Handling GET request for /reserve");

        // Get RoomBST from servlet context
        RoomBST roomBST = (RoomBST) getServletContext().getAttribute("roomBST");
        if (roomBST == null) {
            LOGGER.severe("RoomBST is null in servlet context");
            request.setAttribute("message", "Internal server error: Room data not initialized");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("/reservation.jsp").forward(request, response);
            return;
        }

        // Get available rooms
        List<Room> availableRooms = roomBST.findAvailableRooms(null);
        LOGGER.info("Found " + availableRooms.size() + " available rooms");

        // Calculate available room counts by type
        Map<String, Integer> roomTypeCounts = new HashMap<>();
        roomTypeCounts.put("standard", 0);
        roomTypeCounts.put("deluxe", 0);
        roomTypeCounts.put("suite", 0);

        for (Room room : availableRooms) {
            String roomType = room.getRoomType().toLowerCase();
            roomTypeCounts.put(roomType, roomTypeCounts.getOrDefault(roomType, 0) + 1);
        }

        request.setAttribute("availableRooms", availableRooms);
        request.setAttribute("roomTypeCounts", roomTypeCounts);
        request.getRequestDispatcher("/reservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.info("Handling POST request for /reserve");

        // Handle form submission
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String guestsParam = request.getParameter("guests");

        if (fullName == null || email == null || roomType == null ||
                checkIn == null || checkOut == null || guestsParam == null) {
            LOGGER.warning("Missing required form parameters");
            request.setAttribute("message", "All fields are required.");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        int guests;
        try {
            guests = Integer.parseInt(guestsParam);
            if (guests < 1) {
                throw new NumberFormatException("Guests must be at least 1");
            }
        } catch (NumberFormatException e) {
            LOGGER.warning("Invalid guests parameter: " + guestsParam);
            request.setAttribute("message", "Invalid number of guests.");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        LocalDate checkInDate;
        LocalDate checkOutDate;
        try {
            checkInDate = LocalDate.parse(checkIn);
            checkOutDate = LocalDate.parse(checkOut);
        } catch (Exception e) {
            LOGGER.warning("Invalid date format: checkIn=" + checkIn + ", checkOut=" + checkOut);
            request.setAttribute("message", "Invalid date format.");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        // Check for existing reservation with the same email
        try {
            List<lk.sliit.demo8.Reservation> existingReservations = lk.sliit.demo8.FileHandler.readReservations();
            for (lk.sliit.demo8.Reservation res : existingReservations) {
                if (res.getEmail().equalsIgnoreCase(email)) {
                    LOGGER.warning("Duplicate reservation attempt for email: " + email);
                    request.setAttribute("message", "A reservation with this email already exists.");
                    request.setAttribute("messageType", "error");
                    doGet(request, response);
                    return;
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Failed to read reservations for duplicate check: " + e.getMessage());
            request.setAttribute("message", "Failed to check existing reservations.");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        RoomBST roomBST = (RoomBST) getServletContext().getAttribute("roomBST");
        if (roomBST == null) {
            LOGGER.severe("RoomBST is null in servlet context during POST");
            request.setAttribute("message", "Internal server error: Room data not initialized");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        List<Room> availableRooms = roomBST.findAvailableRooms(roomType);
        if (availableRooms.isEmpty()) {
            LOGGER.info("No available rooms for type: " + roomType);
            request.setAttribute("message", "No available rooms of type " + roomType);
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        Room selectedRoom = availableRooms.get(0);
        selectedRoom.setAvailable(false);
        LOGGER.info("Booked room: " + selectedRoom.getRoomNumber());

        RoomReservation reservation = new RoomReservation(
                fullName, email, roomType, checkInDate, checkOutDate, guests);
        try {
            lk.sliit.demo8.FileHandler.createReservation(reservation);
            LOGGER.info("Reservation created for email: " + email);
        } catch (IOException e) {
            LOGGER.severe("Failed to create reservation: " + e.getMessage());
            request.setAttribute("message", "Failed to save reservation.");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }

        request.setAttribute("message", "Reservation successful for Room " +
                selectedRoom.getRoomNumber() + "!");
        request.setAttribute("messageType", "success");
        doGet(request, response);
    }
}