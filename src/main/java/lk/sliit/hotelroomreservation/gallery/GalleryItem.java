package lk.sliit.hotelroomreservation.gallery;
public class GalleryItem {
private String imagePath;
    private String caption;

    public GalleryItem(String imagePath, String caption) {
        this.imagePath = imagePath;
        this.caption = caption;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    @Override
    public String toString() {
        return imagePath + "," + caption;
    }
}