package service;

import model.book;
import repository.BookRepoImpl;

import java.awt.print.Book;
import java.util.List;

public class BookServiceImpl implements IBookService{
    private BookRepoImpl bookRepo=new BookRepoImpl();
    @Override
    public List<book> findAll() {
        return bookRepo.findAll();
    }

    @Override
    public void save(book book) {

    }

    @Override
    public void update(book book) {

    }

    @Override
    public void delete(String id) {

    }
}
