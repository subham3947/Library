package Controllers;
import connection.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

/**
 * Created by nakul on 4/27/17.
 */
@WebServlet(name = "login")
public class login extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession ses=req.getSession();
            String errorMessage=" ";
            String  uid=req.getParameter("uid");
            String pass=req.getParameter("pass");

            if(uid.equals("librarian")&&pass.equals("iamadmin"))
            {
                ses.setAttribute("uid", req.getParameter("uid"));
                RequestDispatcher rd=req.getRequestDispatcher("admindata.jsp");
                rd.forward(req, resp);
            }
            else{
                req.setAttribute("errorMessage", "Invalid user id or password");
                RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
                rd.forward(req, resp);

            }


        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
