package service;

import model.Product;
import repository.ProductRepoImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    private ProductRepoImpl productRepo = new ProductRepoImpl();

    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public void create(Product product) {
        productRepo.create(product);
    }

    @Override
    public void update(Product product) {
        productRepo.update(product);
    }

    @Override
    public void delete(String id) {
        productRepo.delete(id);
    }

    @Override
    public Product showDetail(String id) {
        return productRepo.showDetail(id);
    }

    @Override
    public List<Product> search(String name) {
        return productRepo.search(name);
    }
}
