/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import databaseConnectivity.DbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GHANSHYAM
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    static HttpSession session = null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            session = request.getSession();
            String registerFailJQueryCode = "jQuery(function(){\n" +
                                                "    jQuery('#toRegister').click();\n" +
                                                "});";
            try {
                String msg;
                if (request.getParameter("login") != null) { // For Login
                    
                    if (DbConnect.verifyUser(request.getParameter("lUser"), request.getParameter("lPass"))) {
                        if (null != session.getAttribute("status")) 
                            session.removeAttribute("status");
                        if (null != session.getAttribute("moveToRegisterPage")) 
                            session.removeAttribute("moveToRegisterPage");
                        session.setAttribute("user", request.getParameter("lUser"));
                        response.sendRedirect("homescreen.jsp");
                        return;
                    } else {
                        msg = "<div class=\"alert alert-danger role=\"alert\">\n" +
                                "<strong>Login Failed !</strong> Invalid username/password.\n" +
                                "</div>";
                        session.setAttribute("status", msg);
                        response.sendRedirect("Login.jsp");
                        //out.println("Invalid username or password...");
                    }
                } else if (request.getParameter("register") != null) { // For Registration
                    
                    if (registerUser(request, response)) {
                        msg = "<div class=\"alert alert-success\" role=\"alert\">\n" + "<strong>Registration "
                                    + "Successful ! </strong>" +
                                            "  <a href=\"Login.jsp\" class=\"alert-link\">Click here</a> to login.\n" +
                                            "</div>";
                    } else {
                        msg = "<div class=\"alert alert-danger role=\"alert\">\n" +
                                    "<strong>Registration Failed !</strong> Please try again.\n" +
                                    "</div>";
                    }
                    session.setAttribute("moveToRegisterPage", registerFailJQueryCode);
                    session.setAttribute("status", msg);
                    response.sendRedirect("Login.jsp");
                }
            } catch (Exception e) {
                String msg = "<div class=\"alert alert-danger role=\"alert\">\n" +
                                    "<strong>Failed ! </strong>" + e.getMessage()+ "\n" +
                                    "</div>";
                if (e instanceof RegistrationException)
                    session.setAttribute("moveToRegisterPage", registerFailJQueryCode);
                session.setAttribute("status", msg);
                response.sendRedirect("Login.jsp");
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

    private boolean registerUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            if (!request.getParameter("rPass").equals(request.getParameter("rRPass"))) {
                throw new RegistrationException("Input Error. Password doesn\'t match.");
            }
            List<String> userDetails = new ArrayList<>(3);
            userDetails.add(request.getParameter("rUser"));
            userDetails.add(request.getParameter("rEmail"));
            userDetails.add(request.getParameter("rPass"));
            for (String data: userDetails) {
                if (data.equals("")) {
                    throw new RegistrationException("Fields can\'t be blank.");
                }
            }
            // userDetails.add(request.getParameter("password_conf"));
            return (DbConnect.registerUser(userDetails));
        }
        catch (Exception ex){
            throw ex;
        }
    }

}

class RegistrationException extends Exception {
    public RegistrationException (String excMessage) {
        super(excMessage);
    }
}