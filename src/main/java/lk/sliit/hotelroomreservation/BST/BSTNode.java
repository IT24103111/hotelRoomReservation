package lk.sliit.demo8.BST;

class BSTNode {
    Room room;
    BSTNode left, right;

    public BSTNode(Room room) {
        this.room = room;
        this.left = this.right = null;
    }
}