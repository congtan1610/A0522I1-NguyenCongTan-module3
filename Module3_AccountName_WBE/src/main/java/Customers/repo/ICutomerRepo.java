package Customers.repo;

import Customers.model.Customer;

import java.util.List;

public interface ICutomerRepo {
    void addNew(Customer customer);
    List<Customer> findAll();
    void delete(int id);
    void  update(Customer customer);
    Customer findOne(int id);
    List<Customer> search(String search);
}

