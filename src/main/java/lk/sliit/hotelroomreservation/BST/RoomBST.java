package lk.sliit.demo8.BST;

import java.util.ArrayList;
import java.util.List;

public class    RoomBST {
    private lk.sliit.demo8.BST.BSTNode root;

    // Insert a new room into the BST
    public void insert(lk.sliit.demo8.BST.Room room) {
        root = insertRec(root, room);
    }

    private lk.sliit.demo8.BST.BSTNode insertRec(lk.sliit.demo8.BST.BSTNode root, lk.sliit.demo8.BST.Room room) {
        if (root == null) {
            root = new lk.sliit.demo8.BST.BSTNode(room);
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
    public lk.sliit.demo8.BST.Room search(int roomNumber) {
        return searchRec(root, roomNumber);
    }

    private lk.sliit.demo8.BST.Room searchRec(lk.sliit.demo8.BST.BSTNode root, int roomNumber) {
        if (root == null || root.room.getRoomNumber() == roomNumber) {
            return root == null ? null : root.room;
        }

        if (roomNumber < root.room.getRoomNumber()) {
            return searchRec(root.left, roomNumber);
        }

        return searchRec(root.right, roomNumber);
    }

    // Find all available rooms of a specific type
    public List<lk.sliit.demo8.BST.Room> findAvailableRooms(String roomType) {
        List<lk.sliit.demo8.BST.Room> availableRooms = new ArrayList<>();
        findAvailableRoomsRec(root, roomType, availableRooms);
        return availableRooms;
    }

    private void findAvailableRoomsRec(lk.sliit.demo8.BST.BSTNode root, String roomType, List<lk.sliit.demo8.BST.Room> result) {
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
        lk.sliit.demo8.BST.Room room = search(roomNumber);
        if (room != null && room.isAvailable()) {
            room.setAvailable(false);
            return true;
        }
        return false;
    }

    // Mark a room as available
    public boolean checkOutRoom(int roomNumber) {
        lk.sliit.demo8.BST.Room room = search(roomNumber);
        if (room != null && !room.isAvailable()) {
            room.setAvailable(true);
            return true;
        }
        return false;
    }

    // In-order traversal to get all rooms sorted by room number
    public List<lk.sliit.demo8.BST.Room> getAllRooms() {
        List<lk.sliit.demo8.BST.Room> rooms = new ArrayList<>();
        inOrderTraversal(root, rooms);
        return rooms;
    }

    private void inOrderTraversal(lk.sliit.demo8.BST.BSTNode root, List<lk.sliit.demo8.BST.Room> result) {
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

    private lk.sliit.demo8.BST.BSTNode deleteRec(lk.sliit.demo8.BST.BSTNode root, int roomNumber) {
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

    private lk.sliit.demo8.BST.Room minValue(lk.sliit.demo8.BST.BSTNode root) {
        lk.sliit.demo8.BST.Room min = root.room;
        while (root.left != null) {
            min = root.left.room;
            root = root.left;
        }
        return min;
    }
}