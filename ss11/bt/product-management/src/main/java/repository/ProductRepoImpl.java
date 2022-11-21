package repository;

import model.Product;

import java.util.*;

public class ProductRepoImpl implements IProductRepo {
    private static List<Product> list = new ArrayList<>();

    static {
        list.add(new Product("1", "ga", "23000"));
        list.add(new Product("2", "vit", "23000"));
        list.add(new Product("6", "heo", "23000"));
        list.add(new Product("4", "cho", "23000"));
    }

    @Override
    public List<Product> findAll() {
        Collections.sort(list, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return o1.getId().compareTo(o2.getId());
            }
        });
        return list;
    }

    @Override
    public void create(Product product) {
        list.add(product);
    }

    @Override
    public void update(Product newProduct) {
        for (Product p : list) {
            if (p.getId().equals(newProduct.getId())) {
                list.set(list.indexOf(p), newProduct);
            }
        }
    }

    @Override
    public void delete(String id) {
        list.remove(list.indexOf(new Product(id)));
    }

    @Override
    public Product showDetail(String id) {
       return list.get(list.indexOf(new Product(id)));
    }

    @Override
    public List<Product> search(String name) {
       name= name.toLowerCase();
        List<Product> newList = new ArrayList<>();
        for (Product p : list) {
            String flag=p.getName().toLowerCase();
            for (int i = 0; i <= flag.length()-name.length(); i++) {
                if (name.equals(flag.substring(i, (i + name.length())))) {
                    newList.add(p);
                }
            }
        }
        return newList;
    }
}
