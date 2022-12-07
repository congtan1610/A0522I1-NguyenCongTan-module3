package Customers.repo;

import Customers.model.Customer;
import Customers.model.TypeCus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class CustomerRepo implements ICutomerRepo {
    public static final String INSERT_CUSTOMER = "insert into khach_hang(ma_khach_hang,ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) value (?,?,?,?,?,?,?,?,?)";
    public static final String SELECT_FROM_LOAI_KHACH = "select * from loai_khach";
    public static final String UPDATE_KHACH_HANG = "update khach_hang set ma_loai_khach=?,ho_ten=?,ngay_sinh=?,gioi_tinh=?,so_cmnd=?,so_dien_thoai=?,email=?,dia_chi=? where ma_khach_hang=?";
    public static final String SEARCH = "select * from khach_hang join loai_khach on khach_hang.ma_loai_khach=loai_khach.ma_loai_khach where ho_ten like ? or ten_loai_khach like ? or so_cmnd like ?";
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
            preparedStatement.setInt(5, customer.getGender());
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
                customer.setGender(resultSet.getInt("gioi_tinh"));
                customer.setCmnd(resultSet.getString("so_cmnd"));
                customer.setSdt(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("dia_chi"));
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sort(list);
    }

    @Override
    public void delete(int id) {
        try (Connection connection = this.baseRepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement("delete from khach_hang where ma_khach_hang=?")) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Customer customer) {
        try (Connection connection = this.baseRepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_KHACH_HANG)) {
            preparedStatement.setInt(1, customer.getType_id());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setInt(4, customer.getGender());
            preparedStatement.setString(5, customer.getCmnd());
            preparedStatement.setString(6, customer.getSdt());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Customer findOne(int id) {
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
                customer.setGender(resultSet.getInt("gioi_tinh"));
                customer.setCmnd(resultSet.getString("so_cmnd"));
                customer.setSdt(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("dia_chi"));
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list.get(list.indexOf(new Customer(id)));
    }

    @Override
    public List<Customer> search(String search) {

        List<Customer> list = new ArrayList<>();
        if (search.isEmpty()) {
            return list;
        }
        try (Connection connection = this.baseRepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
        ) {
            preparedStatement.setString(1, "%" + search.toLowerCase() + "%");
            preparedStatement.setString(2, "%" + search.toLowerCase() + "%");
            preparedStatement.setString(3, "%" + search.toLowerCase() + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setId(resultSet.getInt("ma_khach_hang"));
                customer.setType_id(resultSet.getInt("ma_loai_khach"));
                customer.setName(resultSet.getString("ho_ten"));
                customer.setDateOfBirth(resultSet.getString("ngay_sinh"));
                customer.setGender(resultSet.getInt("gioi_tinh"));
                customer.setCmnd(resultSet.getString("so_cmnd"));
                customer.setSdt(resultSet.getString("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("dia_chi"));
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sort(list);
    }

    public List<Customer> sort(List<Customer> list) {
        Collections.sort(list, new Comparator<Customer>() {
            @Override
            public int compare(Customer o1, Customer o2) {
                return o1.getId() > (o2.getId()) ? 1 : -1;
            }
        });
        return list;
    }
}
