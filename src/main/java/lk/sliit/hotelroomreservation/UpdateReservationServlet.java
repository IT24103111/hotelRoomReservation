package lk.sliit.hotelroomreservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sliit.demo8.BST.Room;
import lk.sliit.demo8.BST.RoomBST;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/update-reservation")
public class UpdateReservationServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(UpdateReservationServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String newEmail = request.getParameter("newEmail");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        int guests = Integer.parseInt(request.getParameter("guests"));

        if (email == null || fullName == null || newEmail == null || roomType == null ||
                checkIn == null || checkOut == null) {
            response.sendRedirect("/admin/index.jsp?error=Missing required fields");
            return;
        }

        try {
            // Get the original reservation to check if room type changed
            List<Reservation> reservations = FileHandler.readReservations();
            Reservation originalReservation = null;

            for (Reservation res : reservations) {
                if (res.getEmail().equals(email)) {
                    originalReservation = res;
                    break;
                }
            }

            if (originalReservation == null) {
                response.sendRedirect("/admin/index.jsp?error=Original reservation not found");
                return;
            }

            String originalRoomType = originalReservation.getRoomType();
            boolean roomTypeChanged = !originalRoomType.equals(roomType);

            logger.info(String.format("Updating reservation for %s, original room type: %s, new room type: %s",
                email, originalRoomType, roomType));

            // Create updated reservation
            RoomReservation updatedReservation = new RoomReservation(
                    fullName, newEmail, roomType,
                    LocalDate.parse(checkIn), LocalDate.parse(checkOut), guests
            );

            // Update the reservation in the file
            FileHandler.updateReservation(email, updatedReservation);

            // If room type changed, update room availability
            if (roomTypeChanged) {
                RoomBST roomBST = (RoomBST) getServletContext().getAttribute("roomBST");
                if (roomBST != null) {
                    List<Room> allRooms = roomBST.getAllRooms();

                    // First, make an original room type available
                    boolean originalRoomMarkedAvailable = false;
                    for (Room room : allRooms) {
                        if (room.getRoomType().equalsIgnoreCase(originalRoomType) && !room.isAvailable()) {
                            room.setAvailable(true);
                            originalRoomMarkedAvailable = true;
                            logger.info(String.format("Marked original room type %s (room %d) as available",
                                originalRoomType, room.getRoomNumber()));
                            break;
                        }
                    }

                    if (!originalRoomMarkedAvailable) {
                        logger.warning(String.format("Could not find an unavailable room of original type %s to mark as available", originalRoomType));
                    }

                    // Then, make a new room type unavailable
                    boolean newRoomMarkedUnavailable = false;
                    for (Room room : allRooms) {
                        if (room.getRoomType().equalsIgnoreCase(roomType) && room.isAvailable()) {
                            room.setAvailable(false);
                            newRoomMarkedUnavailable = true;
                            logger.info(String.format("Marked new room type %s (room %d) as unavailable",
                                roomType, room.getRoomNumber()));
                            break;
                        }
                    }

                    if (!newRoomMarkedUnavailable) {
                        logger.warning(String.format("Could not find an available room of new type %s to mark as unavailable", roomType));
                    }
                } else {
                    logger.warning("RoomBST not found in servlet context");
                }
            }

            String message = "Reservation updated successfully.";

            // If room type changed, add additional message and set session attributes
            if (roomTypeChanged) {
                message += " Room type has been changed and room availability has been updated.";
                request.getSession().setAttribute("roomJustMadeAvailable", true);
                request.getSession().setAttribute("viewAvailableRoomsLink", "/reservation");
            }

            response.sendRedirect("/admin/index.jsp?message=" + message);
        } catch (Exception e) {
            logger.severe("Error updating reservation: " + e.getMessage());
            response.sendRedirect("/admin/index.jsp?error=Error updating reservation: " + e.getMessage());
        }
    }
}
