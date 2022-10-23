/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.SkillCategory;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author MSI KATANA
 */
public class Mentee_update extends HttpServlet {

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
            out.println("<title>Servlet Mentee_update</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Mentee_update at " + request.getContextPath() + "</h1>");
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
//        int userID = Integer.parseInt(request.getParameter("kid"));
//        int role = Integer.parseInt(request.getParameter("role"));
        int userID = 4;
        int role =3;
        User user = new DAO().getUserByID(userID);
        request.setAttribute("user", user);
        request.getRequestDispatcher("Mentee_update.jsp").forward(request, response);
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
        DAO dao = new DAO();
        int id = Integer.parseInt(request.getParameter("kid"));
        int role = Integer.parseInt(request.getParameter("role"));
        String UserName = request.getParameter("UserName");
        String Password = request.getParameter("Password");
        String Fullname = request.getParameter("Fullname");
        boolean Gender = request.getParameter("Gender").equals("1");
        String Phone = request.getParameter("Phone");
        String Email = request.getParameter("Email");
        String date_raw = request.getParameter("Dob");
        Date date = Date.valueOf(date_raw);
        String Address = request.getParameter("Address");
        boolean Status = request.getParameter("Status").equals("1");
        dao.updateUser(id, UserName, Password, Fullname, Gender, Phone, Email, date, Address, Status, role);
       
        request.getRequestDispatcher("SkillCategoryControl").forward(request, response);
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