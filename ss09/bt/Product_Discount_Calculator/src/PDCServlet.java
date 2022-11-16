import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PDCServlet", value = "/display-discount")
public class PDCServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float List_Price = Float.parseFloat(request.getParameter("lp"));
        float Discount_Percent = Float.parseFloat(request.getParameter("dp"));
        double Discount_Amount = List_Price * Discount_Percent * 0.01;
        double Discount_Price = List_Price + Discount_Amount;
        request.setAttribute("Discount_Amount", Discount_Amount);
        request.setAttribute("List_Price", List_Price);
        request.setAttribute("Discount_Price", Discount_Price);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
