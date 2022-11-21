package repository;

import model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> findAll();
    void create(Product product);
    void update(Product product);
    void  delete(String id);
    Product showDetail(String id);
    List<Product> search(String name);
}
