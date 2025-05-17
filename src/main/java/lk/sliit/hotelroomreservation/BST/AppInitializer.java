package lk.sliit.demo8.BST;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lk.sliit.demo8.BST.Room;
import lk.sliit.demo8.BST.RoomBST;

@WebListener
public class AppInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialize the room BST
        RoomBST roomBST = new RoomBST();

        // Add some rooms
        roomBST.insert(new Room(101, "standard", 99.0));
        roomBST.insert(new Room(102, "standard", 99.0));
        roomBST.insert(new Room(201, "deluxe", 149.0));
        roomBST.insert(new Room(202, "deluxe", 149.0));
        roomBST.insert(new Room(301, "suite", 249.0));
        roomBST.insert(new Room(302, "suite", 249.0));

        // Store in servlet context
        sce.getServletContext().setAttribute("roomBST", roomBST);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }
}