package Customers.service;

import Customers.model.Customer;
import Customers.model.TypeCus;
import Customers.repo.CustomerRepo;

import java.util.List;

public class CustomerService  implements ICustomerService{
private CustomerRepo customerRepo=new CustomerRepo()    ;
    @Override
    public void addNew(Customer customer) {
        customerRepo.addNew(customer);
    }

    @Override
    public List<Customer> findAll() {
        return customerRepo.findAll();
    }

    @Override
    public void delete(int id) {
        customerRepo.delete(id);
    }

    @Override
    public void update(Customer customer) {
        customerRepo.update(customer);
    }

    @Override
    public Customer findOne(int id) {
        return customerRepo.findOne(id);
    }

    @Override
    public List<Customer> search(String search) {
        return customerRepo.search(search);
    }

    public List<TypeCus> getType(){
        return customerRepo.getType();
    }
}
