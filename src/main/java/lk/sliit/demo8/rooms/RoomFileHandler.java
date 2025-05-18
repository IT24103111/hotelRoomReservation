package lk.sliit.demo8.rooms;


import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class RoomFileHandler {
    private static final String ROOMS_FILE = "rooms.txt";

    public static void writeRooms(List<Room> rooms) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(ROOMS_FILE))) {
            for (Room room : rooms) {
                writer.write(room.toString());
                writer.newLine();
            }
        }
    }

    public static List<Room> readRooms() throws IOException {
        List<Room> rooms = new ArrayList<>();
        File file = new File(ROOMS_FILE);
        if (!file.exists()) {
            
            rooms.add(new Room("Standard Room", 99.0, "A cozy room with essential amenities for a comfortable stay.", "images/R2.jpg"));
            rooms.add(new Room("Deluxe Room", 149.0, "Spacious and elegant with upgraded amenities and a scenic view.", "images/m3.jpg"));
            rooms.add(new Room("Suite Room", 249.0, "Luxurious suite with premium facilities and extra space.", "images/m4.jpg"));
            writeRooms(rooms);
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length == 4) {
                    String name = parts[0];
                    double price = Double.parseDouble(parts[1]);
                    String description = parts[2];
                    String imagePath = parts[3];
                    rooms.add(new Room(name, price, description, imagePath));
                }
            }
        }
        return rooms;
    }
}
