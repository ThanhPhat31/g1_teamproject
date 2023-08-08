/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;

import com.dao.productDAO;
import com.daoo.profileDAO;
import entity.Account;
import entity.Doctor;
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
public class AdminHomeController extends HttpServlet {

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
            out.println("<title>Servlet AdminHomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminHomeController at " + request.getContextPath() + "</h1>");
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
                profileDAO adb = new profileDAO();
                int totalAcc = adb.countCustomer();
                int totalDoc = adb.countDoctor();
                request.setAttribute("totalAcc", totalAcc);
                request.setAttribute("totalDoc", totalDoc);

                productDAO pdb = new productDAO();
                int totalPro = pdb.countProduct();

                request.setAttribute("totalPro", totalPro);

                String indexpage = request.getParameter("index");
                if (indexpage == null) {
                    indexpage = "1";
                }
                int index = Integer.parseInt(indexpage);
                profileDAO dao = new profileDAO();
                int count = dao.totalAccount();
                int endpage = count / 10;
                if (count % 10 != 0) {
                    endpage++;
                }
                request.setAttribute("endP", endpage);
                List<Account> list = dao.pageAdmin(index);
                System.out.println(list);
                request.setAttribute("listP", list);
                request.setAttribute("tag", index);
                request.getRequestDispatcher("adminView.jsp").forward(request, response);
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
        processRequest(request, response);
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
