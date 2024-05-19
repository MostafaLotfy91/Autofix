package Controllers;

import Entities.Customer;
import Entities.Reservation;
import Repos.CustomerRepo;
import Repos.ReservationRepo;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mostafa Lotfy
 */
public class OperationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String page = request.getParameter("page");
        String operation = request.getParameter("operation");


        if (page
                == null || page.equals(
                        "") || operation == null || operation.equals("")) {
            response.sendRedirect("index.html");

        } else {
            if (operation.equals("login")) {
                String email = request.getParameter("loginEmail");
                String password = request.getParameter("loginPassword");
                CustomerRepo repo = new CustomerRepo();
                Customer user = repo.login(email, password);

                if (user == null) {
                    String errorMessage = "Invalid username or password. Please try again.";
                    request.setAttribute("errorMessage", errorMessage);
                    // Forward the request back to the login page with error message
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    response.sendRedirect("login.jsp");
                } else {
                    if (email.equals("admin@gmail.com") && password.equals("admin")) {
                        // User is an admin, set session attribute and redirect to admin page
                        HttpSession session = request.getSession();
                        session.setAttribute("userdata", user);
                        response.sendRedirect("admin.jsp");
                    } else {
                        // Regular user, set session attribute and redirect to main page
                        HttpSession session = request.getSession();
                        session.setAttribute("userdata", user);
                        request.getRequestDispatcher("menueAppController?page=" + page).forward(request, response);
                    }
                }
            } else if (operation.equals("register")) {
                // get data from html form 
                String firstName = request.getParameter("registerFirstName");
                String lastName = request.getParameter("registerLastName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confPassword = request.getParameter("confirm_password");
                String carModel = request.getParameter("car_model");
                // create repo opject which containregister method
                CustomerRepo repo = new CustomerRepo();
                // prepare data to user opject 
                Customer user = new Customer();
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                if (password.equals(confPassword)) {
                    user.setPassword(password);
                }
                user.setCarModel(carModel);

                // register method 
                int r = repo.register(user);
                if (r == 1) {
                    request.getRequestDispatcher("menueAppController?page=" + page).forward(request, response);
                } else {
                    response.sendRedirect("signup.jsp");
                }

            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
