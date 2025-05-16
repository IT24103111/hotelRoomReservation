package lk.sliit.hotelroomreservation.gallery;

import java.io.*;
import java.util.ArrayList;
import java.util.List;


public class GalleryFileHandler {
    private static final String GALLERY_FILE = "gallery.txt";

    public static void writeGalleryItems(List<GalleryItem> items) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(GALLERY_FILE))) {
            for (GalleryItem item : items) {
                writer.write(item.toString());
                writer.newLine();

            }
        }
    }

    public  static List<GalleryItem> readGalleryItems() throws IOException {
        List<GalleryItem> items = new ArrayList<>();
        File file = new File(GALLERY_FILE);
        if (!file.exists()) {
            // Initialize with default items if the file doesn't exist
            items.add(new GalleryItem("images/m2.jpg", "Hotel Exterior"));
            items.add(new GalleryItem("images/R4.jpg", "Luxury Room"));
            items.add(new GalleryItem("images/m1.jpg", "Lobby"));
            items.add(new GalleryItem("images/R7.jpg", "Swimming Pool"));
            items.add(new GalleryItem("images/R5.jpg", "Dining Area"));
            writeGalleryItems(items);
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 2);
                if (parts.length == 2) {
                    String imagePath = parts[0];
                    String caption = parts[1];
                    items.add(new GalleryItem(imagePath, caption));
                }
            }
        }
        return items;
    }
}

