package lk.sliit.demo8;

import java.time.LocalDate;

public abstract class Reservation {
    private String fullName;
    private String email;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private int guests;

    public Reservation(String fullName, String email, LocalDate checkInDate, LocalDate checkOutDate, int guests) {
        this.fullName = fullName;
        this.email = email;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.guests = guests;
    }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public LocalDate getCheckInDate() { return checkInDate; }
    public void setCheckInDate(LocalDate checkInDate) { this.checkInDate = checkInDate; }

    public LocalDate getCheckOutDate() { return checkOutDate; }
    public void setCheckOutDate(LocalDate checkOutDate) { this.checkOutDate = checkOutDate; }

    public int getGuests() { return guests; }
    public void setGuests(int guests) { this.guests = guests; }

    public abstract String getRoomType();

    @Override
    public String toString() {
        return fullName + "," + email + "," + getRoomType() + "," + checkInDate + "," + checkOutDate + "," + guests;
    }
}