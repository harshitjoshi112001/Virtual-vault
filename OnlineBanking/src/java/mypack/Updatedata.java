/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.sql.*;

@WebServlet(name = "Updatedata", urlPatterns = {"/Updatedata"})
public class Updatedata extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acc=request.getParameter("account");
        
            String name=request.getParameter("first")+" "+request.getParameter("last");
            String father=request.getParameter("father");
            String mother=request.getParameter("mother");
            String gender=request.getParameter("gender");
            String dob=request.getParameter("dob");
            String marry=request.getParameter("marriage");
            String email=request.getParameter("email");
            String contact=request.getParameter("contact");
            String state=request.getParameter("state");
            String city=request.getParameter("city");
            String address=request.getParameter("address");
            String zip=request.getParameter("zip");
            String religion=request.getParameter("religion");
            String category=request.getParameter("category");
            String education=request.getParameter("education");
            String occupation=request.getParameter("occupation");
            String adhaar=request.getParameter("adhaar");
            String pan=request.getParameter("pan");
            String acctype=request.getParameter("account2");
            int acc1=Integer.parseInt(acc);
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/practice","root","root");
                PreparedStatement stm=con.prepareStatement("update USERACCOUNT set firstname='"+name+"', fathers ='"+father+"',mothers='"+mother+"',gender='"+gender+"',dob='"+dob+"',marital='"+marry+"',"
                        + "email='"+email+"',contact='"+contact+"',state='"+state+"',city='"+city+"',address='"+address+"',zip='"+zip+"',religion='"+religion+"',category='"+category+"',education='"+education+"',occupation='"+occupation+"',"
                        + "adhaar='"+adhaar+"',pan='"+pan+"',accounttype='"+acctype+"' where account_no="+acc1+"");
                int r=stm.executeUpdate();
                if(r==1)
                {
                    mail.sendMail(email, "Update Account details", "You have successfully updated your account....");
                    response.sendRedirect("Login.jsp?account1="+acc1);
                }
                else
                {
                    out.print("Try again");
                }
                
            }catch(Exception e)
            {
                out.print("<script>alert('"+e.getMessage()+"')</script>");
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
        processRequest(request, response);
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
