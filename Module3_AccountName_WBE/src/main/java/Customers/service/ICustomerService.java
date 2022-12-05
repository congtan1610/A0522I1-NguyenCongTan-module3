package Customers.service;

import Customers.model.Customer;

import java.util.List;

public interface ICustomerService {
    void addNew(Customer customer);
    List<Customer> findAll();
    void delete(int id);
    void  update(Customer customer);
    Customer findOne(int id);
}
