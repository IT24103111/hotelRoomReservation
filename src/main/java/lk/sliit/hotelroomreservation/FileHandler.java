package lk.sliit.demo8;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static String FILE_PATH = "C:\\Users\\Acer\\Desktop\\Data\\reservations.txt";

    public static void setRealPath(String realPath) {
        // No-op since we're using the hardcoded path
    }

    private static void ensureFileExists() throws IOException {
        File file = new File(FILE_PATH);
        System.out.println("File path: " + file.getAbsolutePath());
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.createNewFile();
        }
    }

    public static void createReservation(Reservation reservation) throws IOException {
        ensureFileExists();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(reservation.toString());
            writer.newLine();
        }
    }

    public static List<Reservation> readReservations() throws IOException {
        ensureFileExists();
        List<Reservation> reservations = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                    String fullName = parts[0];
                    String email = parts[1];
                    String roomType = parts[2];
                    LocalDate checkInDate = LocalDate.parse(parts[3]);
                    LocalDate checkOutDate = LocalDate.parse(parts[4]);
                    int guests = Integer.parseInt(parts[5]);
                    reservations.add(new RoomReservation(fullName, email, roomType, checkInDate, checkOutDate, guests));
                }
            }
        }
        return reservations;
    }

    public static void updateReservation(String email, Reservation updatedReservation) throws IOException {
        List<Reservation> reservations = readReservations();
        ensureFileExists();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Reservation reservation : reservations) {
                if (reservation.getEmail().equals(email)) {
                    writer.write(updatedReservation.toString());
                } else {
                    writer.write(reservation.toString());
                }
                writer.newLine();
            }
        }
    }

    public static void deleteReservation(String email) throws IOException {
        List<Reservation> reservations = readReservations();
        ensureFileExists();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Reservation reservation : reservations) {
                if (!reservation.getEmail().equals(email)) {
                    writer.write(reservation.toString());
                    writer.newLine();
                }
            }
        }
    }
}