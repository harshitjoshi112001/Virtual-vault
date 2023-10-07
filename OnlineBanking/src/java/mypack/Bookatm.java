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

public class Bookatm extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acc=request.getParameter("account");
        String pin =request.getParameter("pin");
//        out.print("hello--your acccount "+acc+" and pin "+pin);
        if(pin.equals(""))
        {
            out.print("Please enter Pin..");
        }
        else
        {
            try{
                int acc1 = Integer.parseInt(acc);
                int pin1 =Integer.parseInt(pin);
                String email="";
                int book=0;
                try{
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                        Statement stm = con.createStatement();
                        String s = "select * from useraccount where account_no=" + acc1 + " and pin="+pin1+"";
                        ResultSet r = stm.executeQuery(s);
                        if(r.next())
                        {
                            book =r.getInt(24);
                            email= r.getString(8);
                            if(book == 0)
                            {
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                Statement stm1 = con1.createStatement();
                                String s1 = "update useraccount set cardbook="+1+" where account_no="+acc1+"";
                                int r1 = stm.executeUpdate(s1);
                                if(r1 == 1)
                                {
                                    String sub="Atm Card Booked";
                                    String msg="You have successfully booked your Atm Card..\nDeliever in 15 days to your given address..\nStay happy & Stay Safe";
                                    mail.sendMail(email, sub, msg);
                                    out.print("Booked..");
                                }
                                else
                                {
                                    out.print("Try Again some time..");
                                }
                            }
                            else
                            {
                                out.print("You Have already Booked your Atm Card!!");

                            }
                        }
                        else
                        {
                            out.print("Wrong Pin..Enter carefully..");
                        }
                }catch(Exception e)
                {
                    out.print(e.getMessage());
                }
            }catch(Exception e)
            {
                out.print("Wrong Pin..Enter carefully..");
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
