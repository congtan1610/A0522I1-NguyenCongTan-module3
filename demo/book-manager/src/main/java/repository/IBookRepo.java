package repository;

import model.book;

import java.awt.print.Book;
import java.util.List;

public interface IBookRepo {
    List<book> findAll();
    void save(book book);
    void update(book book);
    void delete(String id);
}
