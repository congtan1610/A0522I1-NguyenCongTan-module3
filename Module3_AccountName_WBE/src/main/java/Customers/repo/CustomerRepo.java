package Customers.repo;

import Customers.model.Customer;
import Customers.model.TypeCus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICutomerRepo {
    public static final String INSERT_CUSTOMER = "insert into khach_hang(ma_khach_hang,ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) value (?,?,?,?,?,?,?,?,?)";
    public static final String SELECT_FROM_LOAI_KHACH = "select * from loai_khach";
    private BaseRepo baseRepo = new BaseRepo();


    public List<TypeCus> getType() {
        List<TypeCus> typeCuses = new ArrayList<>();

        try (Connection connection = this.baseRepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_LOAI_KHACH);
             ResultSet resultSet = preparedStatement.executeQuery();) {

            TypeCus typeCus;
            while (resultSet.next()) {
                typeCus = new TypeCus();
                typeCus.setType_id(resultSet.getInt("ma_loai_khach"));
                typeCus.setName(resultSet.getString("ten_loai_khach"));
                typeCuses.add(typeCus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeCuses;
    }

    @Override
    public void addNew(Customer customer) {
        try (Connection connection = this.baseRepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER)) {
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, customer.getType_id());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getDateOfBirth());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6, customer.getCmnd());
            preparedStatement.setString(7, customer.getSdt());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> findAll() {
        List<Customer> list = new ArrayList<>();

        try (Connection connection = this.baseRepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from khach_hang");
             ResultSet resultSet = preparedStatement.executeQuery();) {

            Customer customer;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setId(resultSet.getInt("ma_khach_hang"));
                customer.setType_id(resultSet.getInt("ma_loai_khach"));
                customer.setName(resultSet.getString("ho_ten"));
                customer.setDateOfBirth(resultSet.getString("ngay_sinh"));
                customer.setGender(resultSet.getString("gioi_tinh"));
                customer.setCmnd(resultSet.getString("so_cmnd"));
                customer.setSdt(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("dia_chi"));
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
