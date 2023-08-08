/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.profile;

import com.dao.productDAO;
import com.daoo.profileDAO;
import entity.Account;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author vusyl
 */
public class EditProfile extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");

            if (account != null) {
                String id = request.getParameter("sid");
                profileDAO pfD = new profileDAO();
                Account a = pfD.getProfileById(id);
                request.setAttribute("st", a);
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("page403.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
            request.getRequestDispatcher("page404.jsp").forward(request, response);
        }

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
        String sid = request.getParameter("profileid");
        String s_firstname = request.getParameter("firstname");
        String s_middlename = request.getParameter("middlename");
        String s_lastname = request.getParameter("lastname");
        String s_doB = request.getParameter("doB");
        String s_gender = request.getParameter("gender");
        String s_address = request.getParameter("Address");
        String s_mail = request.getParameter("Mail");
        String s_phone = request.getParameter("Phone");
        String s_image = request.getParameter("avatar");
        profileDAO pfD = new profileDAO();

        System.out.println("what is gender: " + s_gender);
        pfD.updateprofile(sid, s_firstname, s_middlename, s_lastname, s_gender, s_doB, s_address, s_mail, s_phone, s_image);

        HttpSession session = request.getSession();
        boolean confirmed = "true".equals(request.getParameter("submit"));
        session.setAttribute("updateConfirmed", confirmed);

        // Redirect to the appropriate page based on the confirmation status
        String redirectPage = confirmed ? "/profile" : "/editprofile";
        response.sendRedirect(redirectPage);
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
