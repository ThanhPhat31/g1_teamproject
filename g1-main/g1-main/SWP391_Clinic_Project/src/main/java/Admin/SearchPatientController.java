/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;

import com.dao.BookManageDAO;
import com.dao.CaseDAO;
import entity.Account;
import entity.Patient;
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
public class SearchPatientController extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            if (account != null && account.getRole().equals("2")) {
                CaseDAO bm = new CaseDAO();

                String indexpage = request.getParameter("index");
                if (indexpage == null) {
                    indexpage = "1";
                }
                int index = Integer.parseInt(indexpage);
                BookManageDAO bk = new BookManageDAO();
                int count = bk.totalProfile();
                int endPage = count / 5;
                if (count % 3 != 0) {
                    endPage++;
                }
                List<Patient> listPatient = bm.getListPatientByAccount(index);
                request.setAttribute("listPatient", listPatient);
                request.setAttribute("endP", endPage);
                request.getRequestDispatcher("SearchNormalBook.jsp").forward(request, response);

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String indexpage = request.getParameter("index");
        String txt = request.getParameter("txtSearch").trim();
        if (indexpage == null) {
            indexpage = "1";
        }
        int indexS;
        try {
            indexS = Integer.parseInt(request.getParameter("indexS"));
        } catch (NumberFormatException e) {
            indexS = 1;
        }

        BookManageDAO bm = new BookManageDAO();

        int countSearch = bm.totalSearchProfile(txt);
        int endPageSearch = countSearch / 5;
        if (countSearch % 5 != 0) {
            endPageSearch++;
        }

        List<Patient> listPatient = bm.getSearchByLastName(txt);
        if (listPatient.size() < 1) {
            request.setAttribute("messPatient", "Not found Patient\n");
            request.getRequestDispatcher("SearchNormalBook.jsp").forward(request, response);
        } else {
            request.setAttribute("listPatient", listPatient);
            request.setAttribute("endPageSearch", endPageSearch);
            request.getRequestDispatcher("SearchNormalBook.jsp").forward(request, response);
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
