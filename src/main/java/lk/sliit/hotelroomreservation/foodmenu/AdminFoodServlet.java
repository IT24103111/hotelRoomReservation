package lk.sliit.hotelroomreservation.foodmenu;

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

@WebServlet("/admin-food-menu")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminFoodServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/admin-food-menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            Part filePart = request.getPart("imageFile");
            String imagePath = "";
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFileName(filePart);
                String applicationPath = request.getServletContext().getRealPath("");
                String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                imagePath = UPLOAD_DIR + "/" + fileName;
            }

            List<foodItem> foodItems = foodFileHandler.readFoodItems();
            foodItems.add(new foodItem(name, price, imagePath));
            foodFileHandler.writeFoodItems(foodItems);

            response.sendRedirect("admin-food-menu.jsp");

        } else if ("update".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            Part filePart = request.getPart("imageFile");
            List<foodItem> foodItems = foodFileHandler.readFoodItems();
            for (foodItem item : foodItems) {
                if (item.getName().equals(name)) {
                    item.setPrice(price);
                    if (filePart != null && filePart.getSize() > 0) {
                        String fileName = extractFileName(filePart);
                        String applicationPath = request.getServletContext().getRealPath("");
                        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdir();
                        }
                        String filePath = uploadPath + File.separator + fileName;
                        filePart.write(filePath);
                        item.setImagePath(UPLOAD_DIR + "/" + fileName);
                    }
                    break;
                }
            }
            foodFileHandler.writeFoodItems(foodItems);
            response.sendRedirect("admin-food-menu.jsp");

        } else if ("delete".equals(action)) {
            String name = request.getParameter("name");
            List<foodItem> foodItems = foodFileHandler.readFoodItems();
            foodItems.removeIf(item -> item.getName().equals(name));
            foodFileHandler.writeFoodItems(foodItems);
            response.sendRedirect("admin-food-menu.jsp");
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