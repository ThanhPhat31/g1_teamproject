/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.profile;

import com.profile.LoginController;
import com.dao.AccDAO;

import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vusyl
 */
public class SignupController extends HttpServlet {

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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        String Account = request.getParameter("Account");
        String Password = request.getParameter("Password");
        try {
            Password = encrypt(Password);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String re_pass = request.getParameter("repass");
        try {
            re_pass = encrypt(re_pass);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }

        String FirstName = request.getParameter("FirstName");
        String MiddleName = request.getParameter("MiddleName");
        String LastName = request.getParameter("LastName");
        String DoB = request.getParameter("Date");
        String Gender = request.getParameter("gender");
        String Address = request.getParameter("Address");
        String Mail = request.getParameter("Mail");
        String Phone = request.getParameter("Phone");
        String PatientID = request.getParameter("PatientID");

        if (!Password.equals(re_pass)) {
            request.setAttribute("mess", "Passwords are not the same");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            AccDAO dao = new AccDAO();
            Account a = dao.checkAccount(Account);
            if (a == null) { // chua co     
                dao.signup(Account, Password, FirstName, MiddleName, LastName, Gender, DoB, Address, Mail, Phone);
                dao.insertPatientByProfile(dao.getNewestProfile());
                if (account == null) {
                    request.setAttribute("mess", "Sign Up Accout Successfully");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/searchPatient");
                }
            } else {
                request.setAttribute("mess", "Accoutn exist");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }

        }
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

    public String encrypt(String s) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(s.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
        return myHash;
    }
}
