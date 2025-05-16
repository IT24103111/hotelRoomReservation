package lk.sliit.hotelroomreservation.foodmenu;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class foodFileHandler {
    private static final String FOOD_FILE = "C:\\Users\\LENOVO\\IdeaProjects\\hotelRoomReservation\\src\\main\\webapp\\food-items.txt";


    public static void writeFoodItems(List<foodItem> foodItems) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FOOD_FILE))) {
            for (foodItem item : foodItems) {
                writer.write(item.toString());
                writer.newLine();
            }
        }
    }

    public static List<foodItem> readFoodItems() throws IOException {
        List<foodItem> foodItems = new ArrayList<>();
        File file = new File(FOOD_FILE);
        if (!file.exists()) {
            // Initialize with default food items if the file doesn't exist
            foodItems.add(new foodItem("Continental Breakfast", 12.0, "images/S1.jpg"));
            foodItems.add(new foodItem("Grilled Chicken Salad", 15.0, "images/S2.jpg"));
            foodItems.add(new foodItem("Pasta Primavera", 18.0, ""));
            foodItems.add(new foodItem("Seafood Platter", 25.0, "images/S3.jpg"));
            foodItems.add(new foodItem("Chocolate Lava Cake", 8.0, ""));
            writeFoodItems(foodItems);
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 3);
                if (parts.length == 3) {
                    String name = parts[0];
                    double price = Double.parseDouble(parts[1]);
                    String imagePath = parts[2];
                    foodItems.add(new foodItem(name, price, imagePath));
                }
            }
        }
        return foodItems;
    }
}
