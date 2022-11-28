package repository;

import model.book;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepoImpl implements  IBookRepo{
    private BaseRepo baseRepo=new BaseRepo();

    @Override
    public List<book> findAll() {
        List<book> list = new ArrayList<>();
        try {
            Connection connection = this.baseRepo.getConnectionJavaToDB();
            PreparedStatement preparedStatement=connection.prepareStatement("select * from book");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id=resultSet.getString("id");
                String name=resultSet.getString("name");
                String author=resultSet.getString("author");
                String category=resultSet.getString("category");
                list.add(new book(id,name,author,category));
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
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
