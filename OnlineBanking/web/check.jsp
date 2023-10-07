<%-- 
    Document   : check
    Created on : 17 Aug, 2023, 3:47:31 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String acc=request.getParameter("account");
            String pin = request.getParameter("pin");
            String email = request.getParameter("email");
            if(acc.equals(""))
            {
                out.print("Please enter acccount no.");
            }
            else if(email.equals(""))
            {
                out.print("Please enter email");
            }
            else if(pin.equals(""))
            {
                out.print("Please enter Pin..");
            }
            else
            {
                if (acc.length() <= 10)
                {
                    int acc1 = Integer.parseInt(acc);
                    int pin2 = Integer.parseInt(pin);
                    int f=0;
                    String name = "";
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                        Statement stm = con.createStatement();
                        //                        out.print("noooo");
                        String s = "select * from useraccount where account_no=" + acc1 + " and email='" + email + "' and pin=" + pin2 + "";
                        ResultSet result = stm.executeQuery(s);
                        if (result.next()) 
                        {
//                            response.sendRedirect("Login.jsp?account="+acc1);
                            out.print("Login Successfull..");
                        } else {
//                            out.print("<h2>Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login</h2>");
                            out.print("Sorry ...Invalid data please input carefully!!!!");
                        }
                        
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                } else {
//                    out.print("<h2>Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login</h2>");
                    out.print("Sorry ...Invalid data please input carefully!!!!!");
                }
            }
        %>
        
    </body>
</html>
