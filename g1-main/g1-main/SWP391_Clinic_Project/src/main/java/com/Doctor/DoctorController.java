/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Doctor;

import com.dao.BookManageDAO;
import com.dao.CaseDAO;
import entity.Account;
import entity.BookingDoctor;
import entity.Case;
import entity.Doctor;
import entity.normalBook;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ThangDT
 */
public class DoctorController extends HttpServlet {

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
            out.println("<title>Servlet DoctorController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoctorController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        try {
            CaseDAO cDao = new CaseDAO();
            BookManageDAO bdao = new BookManageDAO();

            HttpSession session = request.getSession();

            Account account = (Account) session.getAttribute("acc");
            request.setAttribute("acc", account);
            Doctor doctor = cDao.getDoctorByProfileID(Integer.valueOf(account.getProfileID()));

            List<BookingDoctor> listBooking = bdao.page(doctor.getDoctorID());
            List<normalBook> listNormal = bdao.getListNowDay();

            request.setAttribute("listN", listNormal);
            request.setAttribute("listB", listBooking);

            List<Case> listCase = cDao.getListCaseByDoctorID(doctor.getDoctorID());
            request.setAttribute("listC", listCase);
            request.getRequestDispatcher("managerDoctor.jsp").forward(request, response);
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
        try{
            String PatientID = request.getParameter("patientID");
            String CaseID = request.getParameter("caseID");
            CaseDAO dao = new CaseDAO();
            //Patient p = dao.getPatientInfo(Integer.valueOf(PatientID));
            Case c = dao.getCaseByID(Integer.valueOf(CaseID));

            HttpSession session = request.getSession();
            session.setAttribute("caseID", c);
            //session.setAttribute("patientID", p);
            response.sendRedirect("case");
        }catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("page404.jsp");
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

}
