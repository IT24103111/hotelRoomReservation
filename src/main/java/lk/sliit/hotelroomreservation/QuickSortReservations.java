package lk.sliit.demo8;

import java.time.LocalDate;
import java.util.List;

public class QuickSortReservations {

    public static void sortByCheckInDate(List<Reservation> reservations) {
        if (reservations == null || reservations.size() <= 1) {
            return;
        }
        quickSort(reservations, 0, reservations.size() - 1);
    }

    private static void quickSort(List<Reservation> reservations, int low, int high) {
        if (low < high) {
            int pi = partition(reservations, low, high);
            quickSort(reservations, low, pi - 1);
            quickSort(reservations, pi + 1, high);
        }
    }

    private static int partition(List<Reservation> reservations, int low, int high) {
        LocalDate pivot = reservations.get(high).getCheckInDate();
        int i = low - 1;

        for (int j = low; j < high; j++) {
            if (reservations.get(j).getCheckInDate().isBefore(pivot) ||
                    (reservations.get(j).getCheckInDate().isEqual(pivot) && j < high)) {
                i++;
                swap(reservations, i, j);
            }
        }
        swap(reservations, i + 1, high);
        return i + 1;
    }

    private static void swap(List<Reservation> reservations, int i, int j) {
        Reservation temp = reservations.get(i);
        reservations.set(i, reservations.get(j));
        reservations.set(j, temp);
    }
}