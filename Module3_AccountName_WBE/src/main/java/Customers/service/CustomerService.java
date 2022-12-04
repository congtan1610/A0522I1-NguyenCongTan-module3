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

    public List<TypeCus> getType(){
        return customerRepo.getType();
    }
}
