package lk.sliit.demo8;

import java.time.LocalDate;

public class RoomReservation extends lk.sliit.demo8.Reservation {
    private String roomType;

    public RoomReservation(String fullName, String email, String roomType, LocalDate checkInDate, LocalDate checkOutDate, int guests) {
        super(fullName, email, checkInDate, checkOutDate, guests);
        this.roomType = roomType;
    }

    @Override
    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
}