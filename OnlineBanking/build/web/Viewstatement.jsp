<%-- 
    Document   : Viewstatement
    Created on : 15 Aug, 2023, 10:09:04 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Statement</title>
    <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
        type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body{
            /* background-color: rgba(126, 202, 231, 0.644); */
        }
        .container {
            width: 100%;
            height: 100vh;
            padding: 10px;

            /* background: rgb(163, 79, 235);
            background: linear-gradient(90deg, rgba(163, 79, 235, 0.918440703918286) 1%, rgba(214, 120, 223, 0.9044351016773897) 100%); */
        }

        .head {
            width: 100%;
            height: 60px;
            padding: 25px;
            background-color: aqua;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid blue;
        }

        .head p {
            font-size: 30px;
            /* padding: 5px; */
        }

        .left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .head img {
            width: 50px;
            height: 50px;
        }

        .box {
            width: 100%;
            height: 230px;
            /* background-color: bisque; */
            margin-top: 5px;
            display: flex;
            justify-content: center;
            /* gap: 10px; */
        }

        .left1 {
            width: 40%;
            height: 100%;
            /* background-color: coral; */
            flex-wrap: wrap;
            box-shadow: 1px 0cap 0cap black;
        }

        .right {
            width: 60%;
            height: 100%;
            /* background-color: chocolate; */
            box-shadow: -1px 0cap 0cap black;
        }

        #left {
            border-collapse: separate;
            border-spacing: 20px 25px;
        }

        #right {
            border-collapse: separate;
            border-spacing: 40px 25px;
        }

        table td {
            font-size: 20px;
        }

        .box2 {
            width: 100%;
            height: auto;
            margin-top: 20px;
            /* background-color: chartreuse; */
        }

        #data {
            width: 100%;

        }

        .print {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }
        .print p{
            margin-right: 20px;
        }
        .print img:hover{
            cursor: pointer;
        }
        .print img{
            width: 30px;
        }
    </style>
</head>
    <body>
        <%
            String acc = request.getParameter("account");
            if (acc != null) {
                int acc1 = Integer.parseInt(acc);
                String type = "";
                String date = "";
                String money = "";
                String balance = "Rs.";
                String address = "";
                String name = "";
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet r = stm.executeQuery(s);
                    if (r.next()) {
                        type = r.getString(20);
                        name = r.getString(2);
                        address = r.getString(12) + " " + r.getString(11) + " " + r.getString(10) + " -" + r.getString(13);
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                            Statement stm1 = con1.createStatement();
                            String s1 = "select * from statement where account_no=" + acc1 + "";
                            ResultSet rs = stm1.executeQuery(s1);
                            if (rs.next()) {
        %>
                    <div class="container">
        <div class="head">
            <div class="left">
                <p><img src="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png" alt=""
                        loading="eager"></p>
                <p>Happy Bank<sup>&reg;</sup></p>
            </div>
            <p>Happy Bank of India</p>
        </div>
        <div class="print">
            <p><button onclick="window.print();return false;"><img
                        src="https://i.pinimg.com/474x/c9/10/83/c91083a62b0a92c0df41ce11e16e0359.jpg" alt="" loading="eager"></button>
            </p>
        </div>
        <div class="box">
            <div class="left1">
                <table id="left">
                    <tr>
                        <td style="font-weight: bold;">Name</td>
                        <td>: <%=name%></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Address</td>
                        <td>: <%=address%> </td>
                    </tr>
                </table>
            </div>
            <div class="right">
                <table id="right">
                    <tr>
                        <td style="font-weight: bold;">Account No</td>
                        <td>: <%=acc1%></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Currency</td>
                        <td>: INR</td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Branch</td>
                        <td>: Haldwani</td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Type</td>
                        <td>: <%=type%></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="box2">
            <!-- <hr> -->
            <table id="data" border="1">
                <tr>
                    <td style="font-weight: bold;">Account No</td>
                    <td style="font-weight: bold;">Narration</td>
                    <td style="font-weight: bold;">Transaction</td>
                    <td style="font-weight: bold;">Date/Time</td>
                    <td style="font-weight: bold;">Balance</td>
                </tr>
                <%
                    try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con11 = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                            Statement stm11 = con11.createStatement();
                            String s11 = "select * from statement where account_no=" + acc1 + "";
                            ResultSet rs1 = stm1.executeQuery(s11);
                            while(rs1.next())
                            {
                               %>
                               <tr>
                                   <td><%=rs1.getInt(1)%></td>
                                   <td><%=rs1.getString(2)%></td>
                                   <td>Rs.<%=rs1.getInt(3)%></td>
                                   <td><%=rs1.getString(4)%></td>
                                   <td>Rs.<%=rs1.getInt(6)%></td>
                               </tr>
                               <%
                            }
                    }catch(Exception e)
                    {
                        out.print("<script>alert('"+e.getMessage()+"')</script>");
                    }
                %>
                
            </table>
        </div>
        <!-- <input type="button" value="click" onclick="window.print();return false;" /> -->

    </div>
        <%
                            } else {
                                out.print("<h1> No transaction Available..</h1>");
                            }

                        } catch (Exception e) {
                            out.print("NOt available");
                        }
                    } else {
                        out.print("<h1>Try again</h1>");
                    }
                } catch (Exception e) {
                    out.print("<script>alert('" + e.getMessage() + "')</script>");
                }
            } else {
                out.print("<h1>Sorry can't open this pagee</h1><br><a href='front.html'>Click here</a>");
            }
        %>
    </body>
</html>
