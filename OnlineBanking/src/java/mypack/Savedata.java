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

public class Savedata extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            int min = 1000; // Minimum value of range
            int max = 9999;
            int pin = (int)Math.floor(Math.random() * (max - min + 1) + min);
            int min1=10000;
            int max1=99999;
            int account=(int)Math.floor(Math.random() * (max1 - min1 +1) + min1);
            String acc = "18092"+account;
            int acc1=Integer.parseInt(acc);
            
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
            String acctype=request.getParameter("account");
            String date = new java.util.Date().toString();
            int bal=0;
            
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/practice","root","root");
                PreparedStatement stm=con.prepareStatement("insert into USERACCOUNT values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                stm.setInt(1, acc1);
                stm.setString(2, name);
                stm.setString(3, father);
                stm.setString(4, mother);
                stm.setString(5, gender);
                stm.setString(6, dob);
                stm.setString(7, marry);
                stm.setString(8, email);
                stm.setString(9, contact);
                stm.setString(10, state);
                stm.setString(11, city);
                stm.setString(12, address);
                stm.setString(13, zip);
                stm.setString(14, religion);
                stm.setString(15, category);
                stm.setString(16, education);
                stm.setString(17, occupation);
                stm.setString(18, adhaar);
                stm.setString(19, pan);
                stm.setString(20, acctype);
                stm.setInt(21, pin);
                stm.setInt(22,bal);
                stm.setString(23, date);
                stm.setInt(24,0);
                
                int a=stm.executeUpdate();
                if(a==1)
                {
                    try{
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                            Statement stm1 = con1.createStatement();
                            String s1 = "insert into otp(account_no,otp) values('"+acc1+"','"+10000+"')";
                            int res1 = stm1.executeUpdate(s1);
                            if(res1 == 1)
                            {
                                String subject="Account created";
                                String msg="Congrats "+name+" for creating an account on our Happy Bank..\n Your account number: "+acc1+" and Your Pin: "+pin+"\nNow You can successfully login to your account...You can also change your password!!!";
                                out.print("<h1>Created!! Your Account number and Pin has been sent to your email id.....<br> <a href='login.html'>Click here to login</h1>");
                                mail.sendMail(email, subject, msg);
                            }
                            else
                            {
                                out.print("Try Again");
                            }
                        }catch(Exception e)
                        {
                            out.print("Try Again..");
                        }
                    
                }

            }catch(Exception e)
            {
                out.print("<script>alert('"+e.getMessage()+"')</script>");
            }
//            String done=request.getParameter("check");
            
//            out.print("Account number new is "+acc1+" -> and Pin is "+pin+"/n");
//            out.print(name+"<br>");
//            out.print(father+"\n");
//            out.print(mother+"\n");
//            out.print(gender+"\n");
//            out.print(dob+"\n");
//            out.print(marry+"\n");
//            out.print(email+"\n");
//            out.print(contact+"\n");
//            out.print(state+"\n");
//            out.print(city+"\n");
//            out.print(address+"\n");
//            out.print(zip+"\n");
//            out.print(religion+"\n");
//            out.print(category+"\n");
//            out.print(education+"\n");
//            out.print(occupation+"\n");
//            out.print(adhaar+"\n");
//            out.print(pan+"\n");
//            out.print(acctype+"\n");
            
            
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
