/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ForgetPass;

import com.dao.AccDAO;
import entity.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author vusyl
 */
public class ForgotPassword extends HttpServlet {

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
            out.println("<title>Servlet ForgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Forgot.jsp").forward(request, response);
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
        String email = request.getParameter("email").trim();

        AccDAO dao = new AccDAO();
        Account a = dao.checkEmail(email);
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (a == null) {
            request.setAttribute("mess", "Email not exist");
            request.getRequestDispatcher("Forgot.jsp").forward(request, response);
        } else {
            if (email != null || !email.equals("")) {
                // sending otp
                Random rand = new Random();
                otpvalue = rand.nextInt(123456);
                //Dòng thứ hai sử dụng phương thức nextInt(int bound) của lớp Random để sinh một số nguyên ngẫu nhiên trong khoảng từ 0 đến giá trị bound truyền vào (ở đây là 123456), và sau đó lưu giá trị này trong biến otpvalue.
                //Vì vậy, biến otpvalue sẽ chứa giá trị OTP ngẫu nhiên được tạo ra.

                String to = email;// change accordingly
                // Get the session object
                //Dòng đầu tiên khởi tạo một đối tượng Properties để cấu hình các thuộc tính cho kết nối.
                Properties props = new Properties();
// Dòng tiếp theo sử dụng phương thức put() của đối tượng Properties để thiết lập thông tin máy chủ SMTP của Gmail là "smtp.gmail.com".
                props.put("mail.smtp.host", "smtp.gmail.com");
                //Dòng đầu tiên khởi tạo một đối tượng Properties để cấu hình các thuộc tính cho kết nối.
                props.put("mail.smtp.socketFactory.port", "465");
                //Dòng đầu tiên khởi tạo một đối tượng Properties để cấu hình các thuộc tính cho kết nối.
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                //Dòng thứ năm đánh dấu yêu cầu xác thực (authentication) của người dùng khi gửi email.
                props.put("mail.smtp.auth", "true");
                //Và dòng cuối cùng thiết lập cổng SMTP là 465 để sử dụng kết nối SSL an toàn.
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("luanvsce160860@fpt.edu.vn", "yvrljcexhuwjyjnq");// Put your email
                        // id and
                        // password here
                    }
                });//Vì vậy, đoạn mã này thiết lập phiên gửi email để xác thực người dùng và thiết lập thông tin tài khoản Gmail cho việc gửi email.
                String subject = "Your One-Time Password (OTP)";
                String greeting = "<h2>Dear User,</h2>";
                String body = "<p>Your OTP is: <strong>" + otpvalue + "</strong></p>";
                String action = "<p>Please use this OTP to complete your action on our website.</p>";
                String closing = "<br><p>Best regards,</p><p>The Clinic Team</p>";

// Build the email content using HTML tags
                StringBuilder sb = new StringBuilder();
                sb.append("<div style='background-color:#f7f7f7;padding:20px;font-family:Arial,sans-serif;'>");
                sb.append("<div style='background-color:#fff;padding:20px;border-radius: 10px;'>");
                  sb.append("<div style='background-image:url(assets1/images/login.jpg); width=200px;font-family:Arial,sans-serif;'>");
                sb.append(greeting);
                sb.append("<p>Thank you for choosing our clinic. We're here to help you and provide the best care possible.</p>");
                sb.append(body);
                sb.append(action);
                sb.append("<br>");
                sb.append("<p>If you did not request this OTP, please contact us immediately.</p>");
                sb.append(closing);
                sb.append("</div></div>");

                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));
                    message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject(subject);

                    // Set the email content type to HTML
                    message.setContent(sb.toString(), "text/html");

                    // Send message
                    Transport.send(message);
                    System.out.println("Your OTP has been sent successfully!");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("message", "OTP is sent to your email id");
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
                response.sendRedirect("/otp");

            }
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
