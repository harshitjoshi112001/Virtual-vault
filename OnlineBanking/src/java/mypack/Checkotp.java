/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class Checkotp extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acc=request.getParameter("account");
        String otp = request.getParameter("answer");
            if(acc != null)
            {
                if(otp.equals(""))
                {
                    out.print("Please enter otp..");
                }
                else
                {
                    try{
                        Class.forName("org.apache.derby.jdbc.ClientDriver");          //here user account is check and store balance here 
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from otp where account_no='"+acc+"' and otp='"+otp+"'";
                    ResultSet r = stm.executeQuery(s);
                    if(r.next())
                    {
//                        out.print("Done..");
                        try{
                            Class.forName("org.apache.derby.jdbc.ClientDriver");          //here user account is check and store balance here 
                            Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                            Statement stm1 = con1.createStatement();
                            String s1 = "update otp set otp='"+10000+"' where account_no='"+acc+"'";
                            int r1 = stm1.executeUpdate(s1);
                            if(r1 == 1)
                            {
                                out.print("Done..");
                            }
                            else
                            {
                                out.print("Try again..");
                            }
                        }catch(Exception e)
                        {
                           out.print("Try Again.."+e.getMessage()); 
                        }
                    }
                    else
                    {
                        out.print("Wrong otp..");
                    }
                    }catch(Exception e)
                    {
                        out.print("Try Again..");
                    }
                    
                }
            }
            else
            {
                out.print("<h1>Sorry can't open this pagee</h1><br><a href='front.html'>Click here</a>");
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
