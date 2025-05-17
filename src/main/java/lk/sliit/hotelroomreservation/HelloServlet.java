package lk.sliit.demo8;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "helloServlet", urlPatterns = "/room")
public class HelloServlet extends HttpServlet {

    private static class RoomDisplay {
        String name;
        String description;
        String imagePath;

        RoomDisplay(String name, String description, String imagePath) {
            this.name = name;
            this.description = description;
            this.imagePath = imagePath;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Convert to display format for JSP
        List<RoomDisplay> roomsToDisplay = Arrays.asList(
                new RoomDisplay("Deluxe Suite", "Spacious suite with ocean view", "images/deluxe.jpg"),
                new RoomDisplay("Standard Room", "Cozy room with city view", "images/standard.jpg"),
                new RoomDisplay("Family Room", "Perfect for families with extra space", "images/family.jpg")
        );

        request.setAttribute("rooms", roomsToDisplay);
        // Forward to ReservationServlet instead of directly to JSP
        request.getRequestDispatcher("/reserve").forward(request, response);
    }
}