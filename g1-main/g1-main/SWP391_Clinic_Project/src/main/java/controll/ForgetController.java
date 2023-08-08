///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controll;
//
//import com.dao.AccDAO;
//
//import entity.Account;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.xml.bind.DatatypeConverter;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
///**
// *
// * @author vusyl
// */
//public class ForgetController extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String Account = request.getParameter("Account");
//        String Password = request.getParameter("Password");
//        String c_pass = request.getParameter("cpass");
//        try {
//            Password = encrypt(Password);
//        } catch (NoSuchAlgorithmException ex) {
//            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        try {
//            c_pass = encrypt(c_pass);
//        } catch (NoSuchAlgorithmException ex) {
//            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        if (!Password.equals(c_pass)) {
//            request.setAttribute("mess", "Passwords are not the same");
//            request.getRequestDispatcher("forget.jsp").forward(request, response);
//
//        } else {
//            AccDAO dao = new AccDAO();
//            Account a = dao.checkAccount(Account);
//            if (a == null) { // chua co
////                response.sendRedirect("home.jsp");
//                request.setAttribute("mess", "Account not exist");
//                request.getRequestDispatcher("forget.jsp").forward(request, response);
//            } else {
//                dao.forgetpass(Account, Password);
//                request.setAttribute("mess", "Account change succesfully");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            }
//
//        }
//    }
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("forget.jsp").forward(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//    public String encrypt(String s) throws NoSuchAlgorithmException {
//        MessageDigest md = MessageDigest.getInstance("MD5");
//        md.update(s.getBytes());
//        byte[] digest = md.digest();
//        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
//        return myHash;
//    }
//}
