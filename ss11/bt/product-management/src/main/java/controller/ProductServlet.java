package controller;

import model.Product;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {
    private ProductServiceImpl productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "update":
                showUpdate(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "detail":
                showDetail(request, response);
                break;
            case "search":
                searchByName(request, response);
                break;
            case "list":
                findAll(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product n = productService.showDetail(id);
        request.setAttribute("id", n.getId());
        request.setAttribute("name", n.getName());
        request.setAttribute("price", n.getPrice());
        request.getRequestDispatcher("out/delete.jsp").forward(request, response);
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product n = productService.showDetail(id);
        request.setAttribute("id", n.getId());
        request.setAttribute("name", n.getName());
        request.setAttribute("price", n.getPrice());
        request.getRequestDispatcher("out/update.jsp").forward(request, response);
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product n = productService.showDetail(id);
        request.setAttribute("id", n.getId());
        request.setAttribute("name", n.getName());
        request.setAttribute("price", n.getPrice());
        request.getRequestDispatcher("out/detail.jsp").forward(request, response);
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = String.valueOf(request.getParameter("nameProduct"));
        if (name.isEmpty()) {
            response.sendRedirect("/Product?action=list");
        } else {
            request.setAttribute("list", productService.search(name));
            request.getRequestDispatcher("/out/list.jsp").forward(request, response);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/out/create.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("/Product?action=list");
            return;
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                response.sendRedirect("/Product?action=list");
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        boolean flag = true;
        for (Product p : productService.findAll()) {
            if (id.equals(p.getId())) {
                flag = false;
            }
        }
        if (id.isEmpty() || flag) {
            request.setAttribute("notifi", "Error(Not found by id product or missing data input)");
        } else {
            productService.delete(id);
            request.setAttribute("notifi", "Delete successful");
        }
        request.getRequestDispatcher("out/delete.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        boolean flag = true;
        for (Product p : productService.findAll()) {
            if (id.equals(p.getId())) {
                flag = false;
            }
        }
        if (id.isEmpty() || name.isEmpty() || price.isEmpty() || flag) {
            request.setAttribute("notifi", "Error(Not found by product id or missing data input)");
        } else {
            productService.update(new Product(id, name, price));
            Product n = productService.showDetail(id);
            request.setAttribute("id", n.getId());
            request.setAttribute("name", n.getName());
            request.setAttribute("price", n.getPrice());
            request.setAttribute("notifi", "Update successful");
        }


        request.getRequestDispatcher("out/update.jsp").forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        boolean flag = true;
        for (Product p : productService.findAll()) {
            if (id.equals(p.getId())) {
                flag = false;
            }
        }
        if (id.isEmpty() || name.isEmpty() || price.isEmpty() || !flag) {
            request.setAttribute("notifi", "Error(product id already exists or input data is missing)");
        } else {
            request.setAttribute("notifi", "Create successful");
            productService.create(new Product(id, name, price));
            request.setAttribute("list", productService.findAll());
        }
        request.getRequestDispatcher("/out/create.jsp").forward(request, response);
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", productService.findAll());
        request.getRequestDispatcher("/out/list.jsp").forward(request, response);
    }
}
