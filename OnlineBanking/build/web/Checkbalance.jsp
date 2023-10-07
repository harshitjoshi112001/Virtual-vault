<%-- 
    Document   : Checkbalance
    Created on : 14 Aug, 2023, 11:04:10 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Check Balance</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .container {
                width: 100%;
                height: 100vh;
                background-color: rgba(115, 233, 233, 0.63);
            }

            .head {
                width: 100%;
                height: 50px;
                box-shadow: 0 3px 4px blue;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            h1 {
                text-shadow: 2px 3px 4px white;
            }

            .box {
                width: 100%;
                height: auto;
                /* background-color: violet; */
                margin-top: 20px;
                display: flex;
                justify-content: center;
            }

            .inner {
                width: 400px;
                height: 100%;
                background-color: rgba(130, 174, 224, 0.632);
                display: flex;
                flex-direction: column;
                align-items: center;
                box-shadow: 2px 3px 4px rgb(101, 101, 198),-2px -3px 4px rgb(101, 101, 198);
            }
            .upper{
                width: 100%;
                height: 200px;
                /* background-color: chartreuse; */
                /* box-shadow: 2px 3px 4px rgb(101, 101, 198),-2px -3px 4px rgb(101, 101, 198); */
            }
            table{
                margin-top: 15px;
                border-collapse: separate;
                border-spacing: 0px 30px;
            }
            table td{
                font-size: 19px;
            }
        </style>
    </head>
    <body>
        <%
            String acc = request.getParameter("account");
            if (acc != null) {
                String name = "";
                int balance=0;
                
                int acc1 = Integer.parseInt(acc);
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet r = stm.executeQuery(s);
                    if (r.next()) {
                        name = r.getString(2);
                        balance =r.getInt(22);
        %>
        <div class="container">
            <div class="head">
                <h1>Check Balance</h1>
            </div>
            <div class="box">
                <div class="inner">
                    <div class="upper">
                        <img src="https://cdn-scripbox-wordpress.scripbox.com/wp-content/uploads/2020/12/my-account-balance-vector.png"
                             alt="" loading="eager"> 
                    </div>
                    <table >
                        <tr>
                            <td>Acc. No</td>
                            <td style="font-weight: bold;"><%= acc1%></td>
                        </tr>
                        <tr>
                            <td>Acc. Holder Name</td>
                            <td style="font-weight: bold;"><%=name%></td>
                        </tr>
                        <tr>
                            <td>Current Balance</td>
                            <td style="color: brown; font-weight: bold;">Rs. <%=balance%></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;">To Withdraw/Deposit money..<br/><a href="WithdrawDeposit.jsp?account=<%=acc1%>">Click here</a></td>
                            <!--<td style="font-weight: bold;">To Deposit money..<br/><a href="">Click here</a></td>-->
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%
                    } else {
                        out.print("<script>alert('Try Again')</script>");
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
