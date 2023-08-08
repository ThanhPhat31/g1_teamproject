/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;

import com.dao.designateDAO;
import com.daoo.profileDAO;
import entity.Account;
import entity.Designate;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author vusyl
 */
public class EditDesignateController extends HttpServlet {

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
            if (account != null && account.getRole().equals("2")) {
                int id = Integer.parseInt(request.getParameter("cid"));
                int patientid = Integer.parseInt(request.getParameter("pid"));
                designateDAO dgf = new designateDAO();
                List<Designate> d = dgf.getListDesignateByCaseIDandPatient(id, patientid);
                request.setAttribute("st", d);
                request.getRequestDispatcher("editDesignate.jsp").forward(request, response);

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
        int CaseID = Integer.parseInt(request.getParameter("CaseID"));
        int DesignateID = Integer.parseInt(request.getParameter("DesignateID"));
        String description = request.getParameter("description");
        String result = request.getParameter("result");

        designateDAO dgf = new designateDAO();
//         dgf.upadteDesignate(description, result, CaseID, DesignateID);
        if (!description.isEmpty() && !result.isEmpty()) {
            dgf.upadteDesignate(description, result, CaseID, DesignateID);
        }
        response.sendRedirect("/designate");
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
