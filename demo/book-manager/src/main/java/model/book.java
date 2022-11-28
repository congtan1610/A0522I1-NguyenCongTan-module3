package model;

public class book {
   private String id;
   private String name;
   private String author;
   private String category;

    public book() {
    }

    public book(String id, String name, String author, String category) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.category = category;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
