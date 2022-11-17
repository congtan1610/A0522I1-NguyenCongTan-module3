package Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;

@WebServlet(name = "CalculatorServlet",value = "/cal")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float fo = Float.parseFloat(String.valueOf(req.getParameter("fo")));
        float so = Float.parseFloat(String.valueOf(req.getParameter("so")));
        String o = String.valueOf(req.getParameter("o"));
        Calculator cal = new Calculator();
        Double result = cal.calculator(fo, so, o);
        req.setAttribute("result",Math.floor(result*100)/100 );
        req.setAttribute("fo", fo);
        req.setAttribute("so", so);
        req.setAttribute("o", o);
        req.getRequestDispatcher("result.jsp").forward(req, resp);
    }
}
