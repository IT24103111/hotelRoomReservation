package lk.sliit.hotelroomreservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "AdminNewsServlet", urlPatterns = "/admin-news")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AdminNewsServlet extends HttpServlet {

    private String uploadPath;

    @Override
    public void init() throws ServletException {
        super.init();
        // Set the upload path for images
        uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("newsItems", lk.sliit.hotelroomreservation.NewsFileHandler.readNewsItems());
        request.getRequestDispatcher("/admin/admin-news.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String date = request.getParameter("date");
            String description = request.getParameter("description");
            Part imagePart = request.getPart("imageFile");
            String imagePath = "";

            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = extractFileName(imagePart);
                imagePath = "images" + File.separator + fileName;
                imagePart.write(uploadPath + File.separator + fileName);
            }

            NewsItem newsItem = new NewsItem(title, date, description, imagePath);
            NewsFileHandler.saveNewsItem(newsItem);
            request.setAttribute("message", "News item added successfully!");
            request.setAttribute("messageType", "success");
        }
        else if ("delete".equals(action)) {
            String title = request.getParameter("title");
            NewsFileHandler.removeNewsItem(title);
            request.setAttribute("message", "News item deleted successfully!");
            request.setAttribute("messageType", "success");
        }

        doGet(request, response);
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}