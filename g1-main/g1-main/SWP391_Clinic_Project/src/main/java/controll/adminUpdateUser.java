/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controll;

import com.daoo.profileDAO;
import com.nimbusds.jose.crypto.impl.AAD;
import com.profile.LoginController;
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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phat3
 */
public class adminUpdateUser extends HttpServlet {

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
            out.println("<title>Servlet adminUpdateUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminUpdateUser at " + request.getContextPath() + "</h1>");
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

        String id = request.getParameter("id");
        profileDAO dao = new profileDAO();
        Account a = dao.getProfileById(id);

        request.setAttribute("accounts", a);

        request.getRequestDispatcher("admin-update-user.jsp").forward(request, response);

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
        String uid = request.getParameter("profileid");
        String u_firstname = request.getParameter("firstname");
        String u_middlename = request.getParameter("middlename");
        String u_lastname = request.getParameter("lastname");
        String u_doB = request.getParameter("doB");
        String u_gender = request.getParameter("gender");
        String u_address = request.getParameter("Address");
        String u_mail = request.getParameter("Mail");
        String u_phone = request.getParameter("Phone");
        String u_account = request.getParameter("Account");
        String u_pass = request.getParameter("Password");
        String u_role = request.getParameter("Role");
        String u_image = request.getParameter("Image");
        profileDAO pfD = new profileDAO();
        if (u_pass != null && !u_pass.trim().isEmpty()) {
            try {
                u_pass = encrypt(u_pass);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // Nếu u_pass là null hoặc chuỗi rỗng, không cập nhật password vào database
            u_pass = null;
        }

        System.out.println("what is gender: " + u_gender);

        pfD.updateAcc(uid, u_firstname, u_middlename, u_lastname, u_gender, u_doB, u_address, u_mail, u_phone, u_account, u_pass, u_role, u_image);
        response.sendRedirect("listUser");
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
