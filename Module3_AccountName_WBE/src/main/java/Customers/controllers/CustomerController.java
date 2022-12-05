package Customers.controllers;

import Customers.model.Customer;
import Customers.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/cus")
public class CustomerController extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "add":
                showAdd(req, resp);
                break;
            case "home":
                home(req, resp);
                break;
            case "list":
                showAll(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            case "update":
                showUpdate(req, resp);
                break;
            default:
                showAll(req, resp);
        }
    }

    private void showUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("cus", customerService.findOne(id));
        String gender;
        if (customerService.findOne(id).getGender() == 1) {
            gender = "Nam";
        } else {
            gender = "Nữ";
        }
        req.setAttribute("gender", gender);
        req.setAttribute("typeCus", customerService.getType());
        req.setAttribute("type", customerService.findOne(id).getType_id());
        req.getRequestDispatcher("/customer/update.jsp").forward(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        customerService.delete(id);
        req.getRequestDispatcher("/cus?action=list").forward(req, resp);
    }

    private void home(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("typeCus", customerService.getType());
        req.setAttribute("list", customerService.findAll());
        req.getRequestDispatcher("customer/list.jsp").forward(req, resp);
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("typeCus", customerService.getType());
        req.getRequestDispatcher("customer/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "home":
                home(req, resp);
                break;
            case "list":
                showAll(req, resp);
                break;
            case "add":
                addNew(req, resp);
                break;
            case "update":
                update(req, resp);
                break;
            default:
                showAll(req, resp);
        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int type_id = Integer.parseInt(req.getParameter("type_id"));
        String name = req.getParameter("name");
        String dateOfBirth = req.getParameter("dateOfBirth");
        String e = req.getParameter("gender");
        int gender = 0;
        if (e.toLowerCase().equals("nam")) {
            gender = 1;
        }
        String cmnd = req.getParameter("cmnd");
        String sdt = req.getParameter("sdt");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        Customer customer = new Customer(id, type_id, name, dateOfBirth, gender, cmnd, sdt, email, address);
        customerService.update(customer);
        req.getRequestDispatcher("/cus?action=list").forward(req, resp);
    }


    private void addNew(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int type_id = Integer.parseInt(req.getParameter("type_id"));
        String name = req.getParameter("name");
        String dateOfBirth = req.getParameter("dateOfBirth");
        String e = req.getParameter("gender");
        int gender = 0;
        if (e.toLowerCase().equals("nam")) {
            gender = 1;
        }
        String cmnd = req.getParameter("cmnd");
        String sdt = req.getParameter("sdt");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        Customer customer = new Customer(id, type_id, name, dateOfBirth, gender, cmnd, sdt, email, address);
        customerService.addNew(customer);
        req.getRequestDispatcher("/cus?action=list").forward(req, resp);
    }
}
