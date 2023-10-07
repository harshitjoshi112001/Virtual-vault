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

@WebServlet(name = "Checkpass", urlPatterns = {"/Checkpass"})
public class Checkpass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acc = request.getParameter("account");

//        out.print(acc+"-"+pass1+"-"+pass2);
        if (acc != null) {
            String pass1 = request.getParameter("pass1");
            String pass2 = request.getParameter("pass2");
            int acc1 = Integer.parseInt(acc);

            if(pass1.equals("") || pass2.equals(""))
            {
                out.print("Please enter password..");
            }
            else
            {
               if (pass1.equals(pass2)) {
                String email = "";
                int f = 0;
                try {
                    int pin1 = Integer.parseInt(pass1);
                    int pin2 = Integer.parseInt(pass2);
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                        Statement stm = con.createStatement();
                        String ss = "select * from useraccount where account_no=" + acc1 + "";
                        ResultSet rst = stm.executeQuery(ss);
                        if (rst.next()) {
                            email = rst.getString(8);
                        }
                    }catch(Exception e)
                    {
                        out.print("Error");
                    }
                    try{
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                        Statement stm = con.createStatement();
                        String s = "update useraccount set pin=" + pin1 + " where account_no=" + acc1 + "";
                        int rs = stm.executeUpdate(s);
                        if (rs == 1) {
                            mail.sendMail(email, "Pin updated", "You have successfully Updated your password");
                            out.print("Done..");
//                            f = 1;
//                            if (f == 1) {
//                                response.sendRedirect("./login.html");
//                            }
                        } else {
                            out.print("Try again.!!");
                        }

                    } catch (Exception e) {
                        out.print("<script>alert('" + e.getMessage() + "')</script>");
                    }
                } catch (Exception e) {
                    out.print("Please Enter Number only");
                }
            } else {
                out.print("Both Password does not match..Please Enter carefullly!!");
            }
            }
        } else {
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
