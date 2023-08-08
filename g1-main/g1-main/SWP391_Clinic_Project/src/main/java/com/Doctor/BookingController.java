/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Doctor;

import com.dao.AccDAO;
import com.dao.BookManageDAO;
import com.dao.CaseDAO;
import com.daoo.profileDAO;
import com.profile.ProfileController;
import entity.Account;
import entity.BookingDoctor;
import entity.Case;
import entity.Doctor;
import entity.Patient;
import entity.normalBook;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vusyl
 */
public class BookingController extends HttpServlet {

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
            out.println("<title>Servlet BookingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingController at " + request.getContextPath() + "</h1>");
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
//        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            if (account != null && account.getRole().equals("3")) {
                CaseDAO csD = new CaseDAO();
                BookManageDAO dao = new BookManageDAO();

                Patient patient = csD.getPatientByProfileID(Integer.valueOf(account.getProfileID())); // get ID profile

                List<BookingDoctor> listBook = dao.getListBookDoctorID(patient.getPatientID()); // lay danh sach book bang patientID

                request.setAttribute("listC", listBook);
                Patient listPatient = csD.getPatientByProfileID(Integer.valueOf(account.getProfileID()));
                request.setAttribute("listPatient", listPatient);
                List<Doctor> listdoctor = dao.getDoctorID();
                request.setAttribute("doctor", listdoctor);

                if (listBook.isEmpty()) {
                    request.setAttribute("mess", "You have no booking history");                    
                }
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("page403.jsp").forward(request, response);
            }

//        } catch (Exception e) {
//            System.out.println(e);
//            request.getRequestDispatcher("page404.jsp").forward(request, response);
//        }

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
        HttpSession session = request.getSession();
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String doctor = null;
        if(request.getParameter("doctor").equals("-1")){
            doctor = null;
        }else{
            doctor = request.getParameter("doctor");
        }        
        String PatientID = request.getParameter("PatientID");
        BookManageDAO bm = new BookManageDAO();
        bm.AddBooking(date, time, doctor, PatientID); // add booking
        response.sendRedirect("booking");
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
