package lk.sliit.demo8.BST;

import java.util.ArrayList;
import java.util.List;

public class RoomBST {
    private BSTNode root;

    // Insert a new room into the BST
    public void insert(Room room) {
        root = insertRec(root, room);
    }

    private BSTNode insertRec(BSTNode root, Room room) {
        if (root == null) {
            root = new BSTNode(room);
            return root;
        }

        if (room.getRoomNumber() < root.room.getRoomNumber()) {
            root.left = insertRec(root.left, room);
        } else if (room.getRoomNumber() > root.room.getRoomNumber()) {
            root.right = insertRec(root.right, room);
        }

        return root;
    }

    // Search for a room by room number
    public Room search(int roomNumber) {
        return searchRec(root, roomNumber);
    }

    private Room searchRec(BSTNode root, int roomNumber) {
        if (root == null || root.room.getRoomNumber() == roomNumber) {
            return root == null ? null : root.room;
        }

        if (roomNumber < root.room.getRoomNumber()) {
            return searchRec(root.left, roomNumber);
        }

        return searchRec(root.right, roomNumber);
    }

    // Find all available rooms of a specific type
    public List<Room> findAvailableRooms(String roomType) {
        List<Room> availableRooms = new ArrayList<>();
        findAvailableRoomsRec(root, roomType, availableRooms);
        return availableRooms;
    }

    private void findAvailableRoomsRec(BSTNode root, String roomType, List<Room> result) {
        if (root != null) {
            findAvailableRoomsRec(root.left, roomType, result);
            if (root.room.isAvailable() &&
                    (roomType == null || root.room.getRoomType().equalsIgnoreCase(roomType))) {
                result.add(root.room);
            }
            findAvailableRoomsRec(root.right, roomType, result);
        }
    }

    // Mark a room as occupied
    public boolean bookRoom(int roomNumber) {
        Room room = search(roomNumber);
        if (room != null && room.isAvailable()) {
            room.setAvailable(false);
            return true;
        }
        return false;
    }

    // Mark a room as available
    public boolean checkOutRoom(int roomNumber) {
        Room room = search(roomNumber);
        if (room != null && !room.isAvailable()) {
            room.setAvailable(true);
            return true;
        }
        return false;
    }

    // In-order traversal to get all rooms sorted by room number
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        inOrderTraversal(root, rooms);
        return rooms;
    }

    private void inOrderTraversal(BSTNode root, List<Room> result) {
        if (root != null) {
            inOrderTraversal(root.left, result);
            result.add(root.room);
            inOrderTraversal(root.right, result);
        }
    }

    // Delete a room from the BST
    public void deleteRoom(int roomNumber) {
        root = deleteRec(root, roomNumber);
    }

    private BSTNode deleteRec(BSTNode root, int roomNumber) {
        if (root == null) return null;

        if (roomNumber < root.room.getRoomNumber()) {
            root.left = deleteRec(root.left, roomNumber);
        } else if (roomNumber > root.room.getRoomNumber()) {
            root.right = deleteRec(root.right, roomNumber);
        } else {
            // Node with only one child or no child
            if (root.left == null) {
                return root.right;
            } else if (root.right == null) {
                return root.left;
            }

            // Node with two children: Get the inorder successor (smallest in the right subtree)
            root.room = minValue(root.right);

            // Delete the inorder successor
            root.right = deleteRec(root.right, root.room.getRoomNumber());
        }

        return root;
    }

    private Room minValue(BSTNode root) {
        Room min = root.room;
        while (root.left != null) {
            min = root.left.room;
            root = root.left;
        }
        return min;
    }
}