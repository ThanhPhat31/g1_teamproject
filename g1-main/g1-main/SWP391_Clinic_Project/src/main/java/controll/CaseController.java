/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controll;

import com.dao.CaseDAO;
import com.dao.designateDAO;
import com.dao.medicineDAO;
import entity.*;
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
 * @author ThangDT
 */
public class CaseController extends HttpServlet {

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
            out.println("<title>Servlet CaseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CaseController at " + request.getContextPath() + "</h1>");
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
            Account acc = (Account) session.getAttribute("acc");
            boolean role = !acc.getRole().equals("1");
            if (acc != null && acc.getRole().equals("1") || acc.getRole().equals("3")) {
                designateDAO deDAO = new designateDAO();
                medicineDAO meDAO = new medicineDAO();
                CaseDAO cdao = new CaseDAO();
                Case c = (Case) session.getAttribute("caseID");
                //ktra status cua case
                cdao.checkStatusCase(c.getCaseID());
                //lay lai du lieu
                c = cdao.getCaseByID(c.getCaseID());

                Doctor doctor = c.getDoctor();
                Patient patient = c.getPatient();
                boolean isCaseFinish = cdao.isCaseFinish(c.getCaseID());
                List<Designate> listD = deDAO.getListDesignateByCaseID(c.getCaseID());
                List<Medicine> listM = meDAO.getListMedicineByCaseID(c.getCaseID());
                List<DesignateList> listDL = deDAO.getDesignateList();
                List<MedicineList> listML = meDAO.getListMedicines();

                request.setAttribute("acc", acc);
                request.setAttribute("checkRole", role);
                request.setAttribute("isCF", isCaseFinish);
                request.setAttribute("doctor", doctor);
                request.setAttribute("patient", patient);
                request.setAttribute("listDe", listD);
                request.setAttribute("listMe", listM);
                request.setAttribute("listDl", listDL);
                request.setAttribute("listMl", listML);
                request.setAttribute("ck", c);

                request.getRequestDispatcher("case.jsp").forward(request, response);
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
        CaseDAO cdao = new CaseDAO();
        String action = request.getParameter("action");
        int caseID = Integer.parseInt(request.getParameter("caseID"));
        String description = request.getParameter("description");
        String result = request.getParameter("result");
        Case c = cdao.getCaseByID(caseID);
        HttpSession session = request.getSession();
        try {
            if (action.equals("save")) {
                cdao.saveCase(caseID, description, result);
                response.sendRedirect("/case");
            } else if (action.equals("finish")) {
                cdao.finishCase(caseID, description, result);
                response.sendRedirect("/doctor");
            } else if (action.equals("edit")) {
                //session.setAttribute("caseID", c);
                cdao.reopenCase(caseID);
                response.sendRedirect("/case");
            } else {
                response.sendRedirect("/doctor");
            }
        } catch (Exception e) {
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
