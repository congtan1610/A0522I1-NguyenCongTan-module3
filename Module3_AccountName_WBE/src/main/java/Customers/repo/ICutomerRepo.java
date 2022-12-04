package Customers.repo;

import Customers.model.Customer;

import java.util.List;

public interface ICutomerRepo {
    void addNew(Customer customer);
    List<Customer> findAll();
}
