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
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GHANSHYAM
 */
@WebServlet(name = "Predictor", urlPatterns = {"/Predictor"})
public class Predictor extends HttpServlet {

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
            try {
                if (null == LoginController.session.getAttribute("user")) {
                    throw new NullPointerException("Session Expired, Login again to continue.");
                } else {
                    if (null != request.getParameter("getData")) {
                        String query = "select EnteredSymptom, PredictedDisease from diagnosehistory where Username = '" + (String) LoginController.session.getAttribute("user") + "'";
                        ResultSet rs = DbConnect.selectQuery(query);
                        int count = 1;
                        if (rs.next()) {
                            StringBuilder value = new StringBuilder();
                            do {
                                value.append("<tr>\n" + "<th scope=\"row\">")
                                        .append(count++).append("</th>\n" + "<td>")
                                        .append(rs.getString("EnteredSymptom")).append("</td>\n" + "<td>")
                                        .append(rs.getString("PredictedDisease")).append("</td>\n"
                                                + "</tr>");
                            } while (rs.next());
                            DbConnect.closeConnection(rs);
                            out.println(value.toString());
                        }
                    } else {
                        String symptom = request.getParameter("symptom1");
                        if (symptom.length() == 0) {
                            throw new Exception("Please select a symptom to continue");
                        }
                        String predictedDisease = HealthPrediction.getPredictedDisease(symptom);
                        out.println("Predicted Disease: " + predictedDisease);
                        List<String> diagnoseResult = new ArrayList<>();

                        diagnoseResult.add((String) LoginController.session.getAttribute("user"));
                        diagnoseResult.add(symptom);
                        diagnoseResult.add(predictedDisease);
                        String query = "insert into diagnosehistory values (?, ?, ?)";
                        DbConnect.insertViaPreparedStatement(query, diagnoseResult, false);
                        DbConnect.closeConnection(null);
                    }
                }
            } catch (Exception ex) {
                out.println(ex.toString());
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
