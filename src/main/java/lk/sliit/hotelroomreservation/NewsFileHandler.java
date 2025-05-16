package lk.sliit.hotelroomreservation;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class NewsFileHandler {
    private static final String NEWS_FILE_PATH;

    static {
        // Initialize the file path once when class loads
        String basePath = "/C:/Users/Acer/Desktop/project_data";
        NEWS_FILE_PATH = basePath + "/news.txt";
        ensureFileExists();
    }

    private static void ensureFileExists() {
        File file = new File(NEWS_FILE_PATH);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static List<NewsItem> readNewsItems() {
        List<NewsItem> newsItems = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(NEWS_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length >= 3) {
                    newsItems.add(new NewsItem(
                            parts[0].trim(),
                            parts[1].trim(),
                            parts[2].trim(),
                            parts.length == 4 ? parts[3].trim() : ""
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsItems;
    }

    public static synchronized void saveNewsItem(NewsItem newItem) {
        List<NewsItem> newsItems = readNewsItems();
        newsItems.add(newItem);
        writeNewsItems(newsItems);
    }

    public static synchronized void removeNewsItem(String title) {
        List<NewsItem> newsItems = readNewsItems();
        newsItems.removeIf(item -> item.getTitle().equals(title));
        writeNewsItems(newsItems);
    }

    private static void writeNewsItems(List<NewsItem> newsItems) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(NEWS_FILE_PATH))) {
            System.out.println(NEWS_FILE_PATH);
            for (NewsItem item : newsItems) {
                writer.write(item.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class NewsFileHandler {
    private static final String NEWS_FILE_PATH;

    static {
        // Initialize the file path once when class loads
        String basePath = "/C:/Users/Acer/Desktop/project_data";
        NEWS_FILE_PATH = basePath + "/news.txt";
        ensureFileExists();
    }

    private static void ensureFileExists() {
        File file = new File(NEWS_FILE_PATH);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static List<NewsItem> readNewsItems() {
        List<NewsItem> newsItems = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(NEWS_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length >= 3) {
                    newsItems.add(new NewsItem(
                            parts[0].trim(),
                            parts[1].trim(),
                            parts[2].trim(),
                            parts.length == 4 ? parts[3].trim() : ""
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsItems;
    }

    public static synchronized void saveNewsItem(NewsItem newItem) {
        List<NewsItem> newsItems = readNewsItems();
        newsItems.add(newItem);
        writeNewsItems(newsItems);
    }

    public static synchronized void removeNewsItem(String title) {
        List<NewsItem> newsItems = readNewsItems();
        newsItems.removeIf(item -> item.getTitle().equals(title));
        writeNewsItems(newsItems);
    }

    private static void writeNewsItems(List<NewsItem> newsItems) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(NEWS_FILE_PATH))) {
            System.out.println(NEWS_FILE_PATH);
            for (NewsItem item : newsItems) {
                writer.write(item.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}