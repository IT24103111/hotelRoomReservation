package lk.sliit.demo8.news;

public class NewsItem {
    private String title;
    private String date;
    private String description;
    private String imagePath;

    public NewsItem(String title, String date, String description, String imagePath) {
        this.title = title != null ? title : "";
        this.date = date != null ? date : "";
        this.description = description != null ? description : "";
        this.imagePath = imagePath != null ? imagePath : "";
    }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title != null ? title : ""; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date != null ? date : ""; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description != null ? description : ""; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath != null ? imagePath : ""; }

    @Override
    public String toString() {
        return title + "," + date + "," + description + "," + imagePath;
    }
}