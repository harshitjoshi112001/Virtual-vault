<%-- 
    Document   : Accountdetail
    Created on : 13 Aug, 2023, 1:22:05 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Details</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .container {
                font-family: 'Varela Round', sans-serif;
                width: 100%;
                height: auto;
                background: rgb(79, 181, 235);
                background: linear-gradient(90deg, rgba(79, 181, 235, 1) 1%, rgba(120, 223, 150, 0.9156395834701068) 100%);
            }

            .head {
                width: 100%;
                background-color: rgba(85, 144, 254, 0.5);
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                position: relative;
            }

            .head a {
                font-size: 13px;
                padding: 2px;
                text-decoration: none;
                color: black;
                border-radius: 10px;
                box-shadow: 1px 2px 3px white, -1px -2px 3px white;
            }

            a:hover {
                transform: scale(1.1);
                text-shadow: 2px 3px 4px white;
            }

            .box {
                width: 100%;
                height: auto;
                /* background-color: violet; */
                /* padding: 20px; */
                display: flex;
                justify-content: center;
            }

            .inner {
                width: 700px;
                height: auto;
                /* background-color: darkgreen; */
                box-shadow: 2px 3px 4px white,-2px -3px 4px white;
                display: flex;
                justify-content: center;
                padding: 10px;
            }

            .data {
                border-collapse: separate;
                border-spacing: 90px 20px;
                font-size: 20px;
            }

            .data h2 {
                color: white;
                /* background-color: black; */
                border-radius: 20px;
                font-size: 1.2rem;
                text-align: center;

            }

            .data a {
                text-decoration: none;
            }

            .data .but:hover {
                transform: scale(1.1);
            }

            .but {
                display: flex;
                justify-content: center;
                background-color: black;
                height: 37px;
                align-items: center;
                border-radius: 20px;
            }
            footer{
                background-color: black;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                height: 30px;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <%
            String acc = request.getParameter("account");
            if (acc == null) {
                out.print("<h2>Sorry ...First You have to login<br><a href='front.html'>Click here</h2>");
            } else {
                int acc1 = Integer.parseInt(acc);
                String name = "";
                int pin;
                String father = "";
                String mother = "";
                String gender = "";
                String dob = "";
                String contact = "";
                String add = "";
                String email = "";
                String religion = "";
                String category = "";
                String pan = "";
                String edu = "";
                String acctype = "";
                String balance = "";
                String adhaar = "";
                
                try {

                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet r = stm.executeQuery(s);
                    if (r.next()) {
                        pin = r.getInt(21);
                        name = r.getString(2);
                        father = r.getString(3);
                        mother = r.getString(4);
                        gender = r.getString(5);
                        dob = r.getString(6);
                        add = r.getString(10) + " " + r.getString(11) + " " + r.getString(12);
                        email = r.getString(8);
                        religion = r.getString(14);
                        category = r.getString(15);
                        pan = r.getString(19);
                        contact= r.getString(9);
                        edu = r.getString(16);
                        acctype = r.getString(20);
                        balance = "Rs. "+r.getString(22);
                        adhaar = r.getString(18);
        %>
        <div class="container">
            <div class="head">
                <h1>Account Details</h1>
                <a href="Login.jsp?account1=<%= acc1%>">
                    <h2>Back to login</h2>
                </a>
            </div>
            <div class="box">
                <div class="inner">
                    <table class="data">
                        <tr>
                            <td>Account Number</td>
                            <td>:</td>
                            <td><%= acc1%></td>
                        </tr>
                        <tr>
                            <td>Pin</td>
                            <td>:</td>
                            <td><%= pin%></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>:</td>
                            <td><%= name%></td>
                        </tr>
                        <tr>
                            <td>Father's Name</td>
                            <td>:</td>
                            <td><%= father%></td>
                        </tr>
                        <tr>
                            <td>Mother's Name</td>
                            <td>:</td>
                            <td><%= mother%></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>:</td>
                            <td><%= gender%></td>
                        </tr>
                        <tr>
                            <td>DOB</td>
                            <td>:</td>
                            <td><%= dob%></td>
                        </tr>
                        <tr>
                            <td>Contact</td>
                            <td>:</td>
                            <td><%= contact%></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>:</td>
                            <td><%= add%></td>
                        </tr>
                        <tr>
                            <td>E-mail</td>
                            <td>:</td>
                            <td><%= email%></td>
                        </tr>
                        <tr>
                            <td>Religion</td>
                            <td>:</td>
                            <td><%= religion%></td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td>:</td>
                            <td><%= category%></td>
                        </tr>
                        <tr>
                            <td>Pan Number</td>
                            <td>:</td>
                            <td><%= pan%></td>
                        </tr>
                        <tr>
                            <td>Education</td>
                            <td>:</td>
                            <td><%= edu%></td>
                        </tr>
                        <tr>
                            <td>Account Type</td>
                            <td>:</td>
                            <td><%= acctype%></td>
                        </tr>
                        <tr>
                            <td>Total Balance</td>
                            <td>:</td>
                            <td><%= balance%></td>
                        </tr>
                        <tr>
                            <td>Adhaar Number</td>
                            <td>:</td>
                            <td><%= adhaar%></td>
                        </tr>
                        <tr>
                            <td><a href="Editdetails.jsp?account=<%= acc1%>">
                                    <div class="but">
                                        <h2>Edit Details</h2>
                                    </div>
                                </a></td>
                            <td></td>
                            <td><a href="Changepass.jsp?account=<%= acc1%>">
                                    <div class="but">
                                        <h2>Change Pin</h2>
                                    </div>
                                </a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <footer>
                <div class="foot">
                    &copy; All terms reserved(Happy Bank)
                </div>
            </footer>
        </div>
        <%                    }
                } catch (Exception e) {
                    out.print("<h2>Again try.....back</h2>");
                }
            }
        %>
    </body>
</html>
