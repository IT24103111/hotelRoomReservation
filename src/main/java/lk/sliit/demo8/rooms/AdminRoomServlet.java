package lk.sliit.demo8.rooms;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-rooms")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AdminRoomServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/admin-rooms.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            Part filePart = request.getPart("imageFile");
            String fileName = extractFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            List<Room> rooms = RoomFileHandler.readRooms();
            rooms.add(new Room(name, price, description, UPLOAD_DIR + "/" + fileName));
            RoomFileHandler.writeRooms(rooms);

            response.sendRedirect("admin-rooms.jsp");

        } else if ("update".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            List<Room> rooms = RoomFileHandler.readRooms();
            for (Room room : rooms) {
                if (room.getName().equals(name)) {
                    room.setPrice(price);
                    room.setDescription(description);
                    break;
                }
            }
            RoomFileHandler.writeRooms(rooms);
            response.sendRedirect("admin-rooms.jsp");

        } else if ("delete".equals(action)) {
            String name = request.getParameter("name");
            List<Room> rooms = RoomFileHandler.readRooms();
            rooms.removeIf(room -> room.getName().equals(name));
            RoomFileHandler.writeRooms(rooms);
            response.sendRedirect("admin-rooms.jsp");
        }
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return System.currentTimeMillis() + "_" + item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}