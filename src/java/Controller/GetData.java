/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import databaseConnectivity.DbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GHANSHYAM
 */
@WebServlet(name = "GetData", urlPatterns = {"/GetData"})
public class GetData extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ResultSet rs;
            try {
                if (null != request.getParameter("allusers")) { // All user data
                    StringBuilder userData = new StringBuilder();
                    String query = "select Username, Email from userdetails where Username != 'Admin'";
                    rs = DbConnect.selectQuery(query);
                    
                    if (rs.next()) {
                        int count = 1;
                        do {
                            userData.append("<tr>\n").append("<td>\n")
                                        .append(count++).append("</td>\n" + "<td>")
                                        .append(rs.getString("Username")).append("</td>\n" + "<td>")
                                        .append(rs.getString("Email")).append("</td>\n"
                                                + "</tr>");
                        } while (rs.next());
                        DbConnect.closeConnection(rs);
                        out.println(userData.toString());
                    }
                } else if (null != request.getParameter("feedback")) { // All feedback data
                    StringBuilder feedbackData = new StringBuilder();
                    String query = "select Username, Email, Feedback from feedbackdetails";
                    rs = DbConnect.selectQuery(query);
                    if (rs.next()) {
                        int count = 1;
                        do {
                            feedbackData.append("<tr>\n").append("<td>\n")
                                        .append(count++).append("</td>\n" + "<td>")
                                        .append(rs.getString("Username")).append("</td>\n" + "<td>")
                                        .append(rs.getString("Email")).append("</td>\n" + "<td>")
                                        .append(rs.getString("Feedback")).append("</td>\n" + "</tr>");
                        } while (rs.next());
                        DbConnect.closeConnection(rs);
                        out.println(feedbackData.toString());
                    }
                }
            } catch (Exception e) {
                out.println("Error Occurred: " + e.toString());
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
