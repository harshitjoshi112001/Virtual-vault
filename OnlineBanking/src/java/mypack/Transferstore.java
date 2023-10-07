package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(name = "Transferstore", urlPatterns = {"/Transferstore"})
public class Transferstore extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String acc = request.getParameter("account");
        String acc1 = request.getParameter("account1");
        String acc2 = request.getParameter("account2");
        String name = request.getParameter("name");
        String money = request.getParameter("money");
        String pin = request.getParameter("pin");
        String date =new java.util.Date().toString();
//        out.print("account="+acc+" acc1="+acc1+" acc2="+acc2+" name="+name+" money="+money+" pin="+pin+" date="+date);
        if(acc1.equals("") || acc2.equals("") || name.equals("") || money.equals("") || pin.equals(""))
        {
            out.print("Please enter all details!!!!");
        }
        else
        {
            if (acc.equals(acc1) == false && acc.equals(acc2) == false) 
            {
                if (acc1.equals(acc2) == true) 
                {
                    
                    int bal=0;
                    String nameuser="";
                    String email ="";    //user email-id
                    String email2 ="";    //reciever email id
                    try
                    {
                        int pin1 = Integer.parseInt(pin);
                        int acc11 = Integer.parseInt(acc1); //transfering account number
                        int accc = Integer.parseInt(acc);  //user account number
                        int money1 = Integer.parseInt(money);
                        int pin2=0;
                        try{
                            Class.forName("org.apache.derby.jdbc.ClientDriver");          //here user account is check and store balance here 
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                            Statement stm = con.createStatement();
                            String s = "select * from useraccount where account_no=" + accc + "";
                            ResultSet r = stm.executeQuery(s);
                            if(r.next())
                            {
                                bal = r.getInt(22);
                                email = r.getString(8);
                                nameuser =r.getString(2);
                                pin2 = r.getInt(21);
                            }
                            if(pin2 == pin1)
                            {
                                    if(money1 <= bal)
                                    {
                                        try 
                                        {
                                            Class.forName("org.apache.derby.jdbc.ClientDriver");         //here check that transfering account is present in our bank or not    
                                            Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                            Statement stm1 = con1.createStatement();
                                            String s1 = "select * from useraccount where account_no=" + acc11 + "";
                                            ResultSet r1 = stm1.executeQuery(s1);
                                            if (r1.next()) 
                                            {
                                                email2 = r1.getString(8);
                                                int bal2 =r1.getInt(22);
                                                String msg= "Transfer money to- "+acc1;
                                                String msg2="Recieved money from- "+accc;
                                                try{                  //insert sender statement
                                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                    Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                                    Statement stm11 = con11.createStatement();
                                                    String s11 = "insert into statement(account_no,type,money,date_time,balance,name) values("+accc+",'"+msg+"',"+money1+",'"+date+"',"+(bal-money1)+",'"+name+"')";
                                                    int r11 = stm11.executeUpdate(s11);
                                                    if(r11 == 1)
                                                    {
                                                        mail.sendMail(email, "Transfer amount", "Rs."+money1+" debited from your account and Successfully transfer money to "+acc1+"-Account number and Name -"+name+"...\nNow current balance amount is Rs."+(bal-money1));
                //                                        response.sendRedirect("Login.jsp?account1="+accc);
                                                    }

                                                }catch(Exception e){out.print("<script>alert('" + e.getMessage() + "')</script>");}

                                                try{                               //insert receiever statement
                                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                    Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                                    Statement stm11 = con11.createStatement();
                                                    String s11 = "insert into statement(account_no,type,money,date_time,balance,name) values("+acc1+",'"+msg2+"',"+money1+",'"+date+"',"+(bal2+money1)+",'"+nameuser+"')";
                                                    int r11 = stm11.executeUpdate(s11);
                                                    if(r11 == 1)
                                                    {
                                                        mail.sendMail(email2, "Recieved amount", "Rs."+money1+" Credited to your account and Receieved money from "+accc+"-Account number and Name -"+nameuser+"...\nNow current balance amount is Rs."+(bal2+money1));
                //                                        response.sendRedirect("Login.jsp?account1="+accc);
                                                    }

                                                }catch(Exception e){out.print("<script>alert('" + e.getMessage() + "')</script>");}

                                                try{          //update sender useraccount
                                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                    Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                                    Statement stm11 = con11.createStatement();
                                                    String s11 = "update useraccount set balance="+(bal-money1)+" where account_no="+accc+"";
                                                    int r11 = stm11.executeUpdate(s11);
                                                    if(r11 == 1)
                                                    {

                                                    }
                                                }catch(Exception e){out.print("<script>alert('"+e.getMessage()+"')</script>");}

                                                try{                    //update receiever useraccount
                                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                    Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                                    Statement stm11 = con11.createStatement();
                                                    String s11 = "update useraccount set balance="+(bal2+money1)+" where account_no="+acc1+"";
                                                    int r11 = stm11.executeUpdate(s11);
                                                    if(r11 == 1)
                                                    {

                                                    }
                                                }catch(Exception e){out.print("<script>alert('"+e.getMessage()+"')</script>");}
    //                                            response.sendRedirect("Login.jsp?account1="+accc);
                                                out.print("Done..");
                                            } 
                                            else       //this is for if receiever account is not in our bank
                                            {
                                                String msg= "Transfer money to- "+acc1;
                                                try{
                                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                    Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                                    Statement stm11 = con11.createStatement();
                                                    String s11 = "insert into statement(account_no,type,money,date_time,balance,name) values("+accc+",'"+msg+"',"+money1+",'"+date+"',"+(bal-money1)+",'"+name+"')";
                                                    int r11 = stm11.executeUpdate(s11);
                                                    if(r11 == 1)
                                                    {
                                                        mail.sendMail(email, "Transfer amount", "Rs."+money1+" debited from your account and Successfully transfer money to "+acc1+"-Account number and Name -"+name+"...<br/>Now current balance amount is Rs."+(bal-money1));
    //                                                    response.sendRedirect("Login.jsp?account1="+accc);
                                                        out.print("Done..");
                                                    }

                                                }catch(Exception e){out.print("<script>alert('" + e.getMessage() + "')</script>");}
                                                try{
                                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                    Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                                                    Statement stm11 = con11.createStatement();
                                                    String s11 = "update useraccount set balance="+(bal-money1)+" where account_no="+accc+"";
                                                    int r11 = stm11.executeUpdate(s11);
                                                    if(r11 == 1)
                                                    {

                                                    }
                                                }catch(Exception e){out.print(e.getMessage());}

                                            }
                                        } catch (Exception e) {
                                            out.print("<script>alert('" + e.getMessage() + "')</script>");
                                        }
                                    }
                                else
                                {
                                    out.print("Insfficient Balance to transfer money...");
                                }
                            }
                            else
                            {
                                out.print("Oopss..Pin is Wrong,.");
                            }


                        }catch(Exception e)
                        {
                            out.print("Try again");
                        }
                    }catch(Exception e)
                    {out.print("Please enter Number only..");}
                } 
                else 
                {
//                    out.print("Both account number are different ..you should enter same account number..");
                    out.print("wrnongdfdfdf");
                }
            } else {
                out.print("User account and transfering account can't be same..Transfer money to different user account!!!");
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
