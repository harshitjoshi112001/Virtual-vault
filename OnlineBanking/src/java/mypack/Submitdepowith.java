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
import java.sql.*;
import java.util.*;


@WebServlet(name = "Submitdepowith", urlPatterns = {"/Submitdepowith"})
public class Submitdepowith extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String acc=request.getParameter("account");
        String pin = request.getParameter("pin");
        String type = request.getParameter("withdep");
        String money=request.getParameter("money");
//      String time=request.getParameter("date");
        String date=new java.util.Date().toString();
        if(pin.equals(""))
        {
            out.print("Please enter Pin..");
        }
        else if(type.equals(""))
        {
            out.print("Please choose Type..");
        }
        else if(money.equals(""))
        {
            out.print("Please enter amount..");
        }
        else
        {
            try{
            int pin1 = Integer.parseInt(pin);
            int acc1=Integer.parseInt(acc);
            int bal=0;
            String name="";
            int money1=Integer.parseInt(money);
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                Statement stm = con.createStatement();
                String s = "select * from useraccount where account_no=" + acc1 + " and pin="+pin1+"";
                ResultSet r = stm.executeQuery(s);
                if(r.next())
                {
                    String email= r.getString(8);
                    name = r.getString(2);
                    bal = r.getInt(22);
                    if(type.equals("Withdraw"))
                    {
                        if(bal >= money1)
                        {
                            try{
//                            out.print("Yooooo");
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                Statement stm1 = con1.createStatement();
                                String s1 = "insert into statement(Account_no,Type,money,date_time,balance,name) values("+acc1+",'"+type+"',"+money1+",'"+date+"',"+(bal-money1)+",'"+name+"')";
                                int r1 = stm1.executeUpdate(s1);
                                if(r1 == 1)
                                {
                                    mail.sendMail(email, "Debited amount", "Rs."+money1+" debited from your account...Now current balance amount is Rs."+(bal-money1));
//                                    response.sendRedirect("Login.jsp?account1="+acc1);
                                    out.print("Done..");
                                }
                            }catch(Exception e){out.print(e.getMessage());}
                            try{
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                Statement stm1 = con1.createStatement();
                                String s1 = "update useraccount set balance="+(bal-money1)+" where account_no="+acc1+"";
                                int r1 = stm1.executeUpdate(s1);
                                if(r1 == 1)
                                {
                                    
                                }
                            }catch(Exception e){out.print(e.getMessage());}
                        }
                        else
                        {
                            out.print("Sorry..Insufficient balance!!!!");
                        }
                    }
                    else
                    {
                        try{
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                Statement stm1 = con1.createStatement();
                                String s1 = "insert into statement(Account_no,Type,money,date_time,balance,name) values("+acc1+",'"+type+"',"+money1+",'"+date+"',"+(bal+money1)+",'"+name+"')";
                                int r1 = stm1.executeUpdate(s1);
                                if(r1 == 1)
                                {
                                    mail.sendMail(email, "Credited amount", "Rs."+money1+" Credited to your account...Now current balance amount is Rs."+(bal+money1));
//                                    response.sendRedirect("Login.jsp?account1="+acc1);
                                    out.print("Done..");
                                }
                            }catch(Exception e){out.print(e.getMessage());}
                        try{
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                Statement stm1 = con1.createStatement();
                                String s1 = "update useraccount set balance="+(bal+money1)+" where account_no="+acc1+"";
                                int r1 = stm1.executeUpdate(s1);
                                if(r1 == 1)
                                {
                                    
                                }
                            }catch(Exception e){out.print(e.getMessage());}
                    }
                }
                else
                {
                    out.print("Incorrect Pin..Please Enter carefully");
                }
                
            }catch(Exception e)
            {
                out.print(e.getMessage());
            }
            
            
        }catch(Exception e)
        {
            out.print("Incorrect Pin...");
        }
        }
//        out.print("account->"+acc+"<br>pin->"+pin+"<br/>type->"+type+"<br/>money->"+money+"<br>time->"+date);
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
