package lk.sliit.demo8.BST;

public class Room {
    private int roomNumber;
    private String roomType;
    private boolean isAvailable;
    private double pricePerNight;

    public Room(int roomNumber, String roomType, double pricePerNight) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.isAvailable = true;
    }

    // Getters and Setters
    public int getRoomNumber() { return roomNumber; }
    public String getRoomType() { return roomType; }
    public boolean isAvailable() { return isAvailable; }
    public double getPricePerNight() { return pricePerNight; }

    public void setAvailable(boolean available) { isAvailable = available; }

    @Override
    public String toString() {
        return "Room " + roomNumber + " (" + roomType + ") - $" + pricePerNight + "/night - " +
                (isAvailable ? "Available" : "Occupied");
    }
}