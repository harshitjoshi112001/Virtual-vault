/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;

public class Sendforgototp extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acc=request.getParameter("account");
//        out.print(acc);
        String email=request.getParameter("email");
        if(acc.equals(""))
        {
//            out.print("Sorry got to <br><a href='./login.html'>Click here</a>");
            out.print("Please enter account number..");
        }
        else if(email.equals(""))
        {
//            out.print("Sorry got to <br><a href='./login.html'>Click here</a>");
            out.print("Please enter email..");
        }
        else
        {
            try{
                int acc1=Integer.parseInt(acc);
                try{
                    int min = 1000; // Minimum value of range
                    int max = 9999;
                    int otp = (int)Math.floor(Math.random() * (max - min + 1) + min);
                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1+ " and email='"+email+"'";
                    ResultSet res = stm.executeQuery(s);
                    if(res.next())
                    {
                        String sub="One time Password";
                        String msg="To confirm you are valid user ..Your otp is : "+otp;
//                        mail.sendMail(email, sub, msg);
//                        response.sendRedirect("Forgotpinotp.jsp?account="+acc+"."+otp+"");
                        try{
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                            Statement stm1 = con1.createStatement();
                            String s1 = "update otp set otp='"+otp+"' where account_no='"+acc1+"'";
                            int res1 = stm1.executeUpdate(s1);
                            if(res1 == 1)
                            {
                                mail.sendMail(email, sub, msg);
                                out.print("Forgotpinotp.jsp?account="+acc1);
                            }
                            else
                            {
                                out.print("No account.available");
                            }
                        }catch(Exception e)
                        {
                            out.print("Try Again..");
                        }
                        
                    }
                    else
                    {
                        out.print("Oops..You have enter invalid account no. or email ...please enter carefully!!");
                    }

                }catch(Exception e)
                {
                    out.print(e.getMessage());
                }
            }catch(Exception e)
            {
                out.print("Oops..You have enter invalid account no. or email ...please enter carefully!");
            }
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
