package lk.sliit.hotelroomreservation.gallery;
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

@WebServlet("/admin-gallery")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminGalleryServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/admin-gallery.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Handle photo upload
            Part filePart = request.getPart("imageFile");
            String caption = request.getParameter("caption");
            String fileName = extractFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Add to gallery
            List<GalleryItem> items = GalleryFileHandler.readGalleryItems();
            items.add(new GalleryItem(UPLOAD_DIR + "/" + fileName, caption));
            GalleryFileHandler.writeGalleryItems(items);

            response.sendRedirect("admin-gallery.jsp");

        } else if ("update".equals(action)) {
            String imagePath = request.getParameter("imagePath");
            String newCaption = request.getParameter("caption");
            List<GalleryItem> items = GalleryFileHandler.readGalleryItems();
            for (GalleryItem item : items) {
                if (item.getImagePath().equals(imagePath)) {
                    item.setCaption(newCaption);
                    break;
                }
            }
            GalleryFileHandler.writeGalleryItems(items);
            response.sendRedirect("admin-gallery.jsp");

        } else if ("delete".equals(action)) {
            String imagePath = request.getParameter("imagePath");
            List<GalleryItem> items = GalleryFileHandler.readGalleryItems();
            items.removeIf(item -> item.getImagePath().equals(imagePath));
            GalleryFileHandler.writeGalleryItems(items);

            // Delete the file from the server
            String applicationPath = request.getServletContext().getRealPath("");
            String filePath = applicationPath + File.separator + imagePath;
            File file = new File(filePath);
            if (file.exists()) {
                file.delete();
            }

            response.sendRedirect("admin-gallery.jsp");
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