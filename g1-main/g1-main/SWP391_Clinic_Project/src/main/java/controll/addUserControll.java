/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controll;

import com.dao.AccDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 *
 * @author thang
 */
public class addUserControll extends HttpServlet {

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
            out.println("<title>Servlet addUserControll</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addUserControll at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String FirstName = request.getParameter("FirstName");
        String MiddleName = request.getParameter("MiddleName");
        String LastName = request.getParameter("LastName");
        String DoB = request.getParameter("Date");
        String Gender = request.getParameter("gender");
        String Address = request.getParameter("Address");
        String Mail = request.getParameter("Mail");
        String Phone = request.getParameter("Phone");
        String Account = request.getParameter("Account");
        String Password = request.getParameter("Password");
        String Role = request.getParameter("Rolea");
        String Image = request.getParameter("Image");
        try {
            Password = encrypt(Password);
        } catch (NoSuchAlgorithmException ex) {
        }
        System.out.println("Password: " + Password);


            AccDAO dao = new AccDAO();
            Account a = dao.checkAccount(Account);
            if (a == null && !Account.isEmpty()) { // chua co      
                
                
                dao.insert(FirstName, MiddleName, LastName, Gender, DoB, Address, Mail, Phone, Account, Password, Role, Image);
                response.sendRedirect("/listUser");
            } 
            else {
                request.setAttribute("mess", "Accoutn exist");
//                request.getRequestDispatcher("addUser.jsp").forward(request, response);
                response.sendRedirect("listUser");
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