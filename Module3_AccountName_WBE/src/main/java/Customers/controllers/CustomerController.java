package Customers.controllers;

import Customers.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/cus")
public class CustomerController extends HttpServlet {
    private CustomerService customerService=new CustomerService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "add":
                showAdd(req, resp);
                break;
            case "home":
                home(req,resp);break;
            case "list":
                showAll(req,resp);break;
            default:showAll(req,resp);
        }
    }

    private void home(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list",customerService.findAll());
        req.getRequestDispatcher("customer/list.jsp").forward(req,resp);
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("typeCus",customerService.getType());
        req.getRequestDispatcher("customer/create.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "home":
                home(req,resp);break;
            case "list":
                showAll(req,resp);break;
            default:showAll(req,resp);
        }
    }
}
