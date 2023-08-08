/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;

import com.dao.medicineDAO;
import com.daoo.profileDAO;
import entity.Account;
import entity.MedicineList;
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
public class MedicineController extends HttpServlet {

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
            out.println("<title>Servlet MedicineController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MedicineController at " + request.getContextPath() + "</h1>");
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

            if (account != null && account.getRole().equals("0")) {
                medicineDAO md = new medicineDAO();
                String id = (request.getParameter("sid"));
                md.deleteMedicine(id);

                String uid = request.getParameter("uid");

                MedicineList m = md.getMedicineByID(uid);
                request.setAttribute("stUpdate", m);

                List<MedicineList> list = md.getMedicineList();
                request.setAttribute("listmedicine", list);
                request.getRequestDispatcher("Medicine.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("page403.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
            request.getRequestDispatcher("page404.jsp").forward(request, response);
        }
        medicineDAO md = new medicineDAO();
        String id = (request.getParameter("sid"));
        md.deleteMedicine(id);

        String uid = request.getParameter("uid");

        MedicineList m = md.getMedicineByID(uid);
        request.setAttribute("stUpdate", m);

        List<MedicineList> list = md.getMedicineList();
        request.setAttribute("listmedicine", list);
        request.getRequestDispatcher("Medicine.jsp").forward(request, response);
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
        medicineDAO md = new medicineDAO();
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        md.addMedicineList(name, description);
        response.sendRedirect("/medicine");

        String uid = request.getParameter("uid");
        String nameU = request.getParameter("nameUpdate");
        String descriptionU = request.getParameter("descriptionUpdate");
        md.upadteMedicine(nameU, descriptionU, uid);

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
