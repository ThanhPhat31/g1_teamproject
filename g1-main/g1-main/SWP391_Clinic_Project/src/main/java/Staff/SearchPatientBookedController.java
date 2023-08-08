    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Staff;

import com.dao.BookManageDAO;
import entity.Account;
import entity.BookingDoctor;
import entity.Patient;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author vusyl
 */
public class SearchPatientBookedController extends HttpServlet {

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
            out.println("<title>Servlet SearchPatientBookedController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchPatientBookedController at " + request.getContextPath() + "</h1>");
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
            BookManageDAO bk = new BookManageDAO();
            List<BookingDoctor> listBooked = bk.ListBooking();
            request.setAttribute("listbooked", listBooked);
            if (account != null && account.getRole().equals("2")) {
                request.getRequestDispatcher("SearchPatientBooked.jsp").forward(request, response);
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

        List<BookingDoctor> listBooked = bm.getSearchPatientBooking(txt);
        if (listBooked.size() < 1) {
            request.setAttribute("messPatient", "Not found Patient\n");
            request.getRequestDispatcher("SearchPatientBooked.jsp").forward(request, response);
        } else {
            request.setAttribute("listbooked", listBooked);
            request.setAttribute("endPageSearch", endPageSearch);
            request.getRequestDispatcher("SearchPatientBooked.jsp").forward(request, response);
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
