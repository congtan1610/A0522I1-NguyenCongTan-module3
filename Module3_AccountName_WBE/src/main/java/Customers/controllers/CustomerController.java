package Customers.controllers;

import Customers.model.Customer;
import Customers.repo.REGEX;
import Customers.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Pattern;


@WebServlet(urlPatterns = "/cus")
public class CustomerController extends HttpServlet {
    private CustomerService customerService = new CustomerService();
    private REGEX regex=new REGEX();

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
            case "search":
                searchCus(req,resp);break;
            default:
                showAll(req, resp);
        }
    }

    private void searchCus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search=req.getParameter("search");
        req.setAttribute("list", customerService.search(search));
        req.setAttribute("typeCus", customerService.getType());
        req.setAttribute("search",search);
        req.getRequestDispatcher("customer/list.jsp").forward(req,resp);
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
        boolean d=true,e=true,s=true,c=true;
        int id = Integer.parseInt(req.getParameter("id"));
        int type_id = Integer.parseInt(req.getParameter("type_id"));
        String name = req.getParameter("name");
        String dateOfBirth = req.getParameter("dateOfBirth");
        int gender = 0;
        if (req.getParameter("gender").toLowerCase().equals("nam")) {
            gender = 1;
        }
        String cmnd = req.getParameter("cmnd");
        String sdt = req.getParameter("sdt");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        if (!Pattern.matches(regex.email,email)){
            e=false;
        }
        if (!Pattern.matches(regex.day,dateOfBirth)){
            d=false;
        }
        if (!Pattern.matches(regex.chinOrMuoiHai,sdt)){
            s=false;
        }
        if (!Pattern.matches(regex.chinOrMuoiHai,cmnd)){
            c=false;
        }
        if (e&&d&&s&&c){
            Customer customer = new Customer(id, type_id, name, dateOfBirth, gender, cmnd, sdt, email, address);
            customerService.addNew(customer);
            req.getRequestDispatcher("/cus?action=list").forward(req, resp);
        }else{
            req.setAttribute("id",id);
            req.setAttribute("type_ids",type_id);
            req.setAttribute("name",name);
            req.setAttribute("dateOfBirth",dateOfBirth);
            req.setAttribute("gender",req.getParameter("gender"));
            req.setAttribute("cmnd",cmnd);
            req.setAttribute("sdt",sdt);
            req.setAttribute("email",email);
            req.setAttribute("address",address);
            req.setAttribute("e",e);
            req.setAttribute("d",d);
            req.setAttribute("s",s);
            req.setAttribute("c",c);
            req.setAttribute("typeCus", customerService.getType());
            req.getRequestDispatcher("/customer/create.jsp").forward(req,resp);
        }

    }
}
