<%-- 
    Document   : WithdrawDeposit
    Created on : 14 Aug, 2023, 11:30:11 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Deposit/Withraw</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <script type="text/javascript">
            function display_c() {
                var refresh = 1000; // Refresh rate in milli seconds
                mytime = setTimeout("display_ct()", refresh);
            }

            function display_ct() {
                var x = new Date();
                document.getElementById('date').innerHTML = x;
                display_c();
            }

            function withdraw(f1)
            {
                var accc = f1.yoo.value;

                var pinn = f1.pin.value;
                var moneyy = f1.money.value;
                var dep = f1.withdep.value;
                var msg = "Login.jsp?account1="+accc;
                var result="";
//                alert("account"+accc+" pin"+pinn+" money"+moneyy+" type"+dep);
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (xhttp.readyState == 4 && xhttp.status == 200)
                    {
                        store = this.responseText;
//                        store1 = store;
                        result = store.includes("Done..");
                        if (result === true)
                        {
                            window.open(msg, "_self");
                            
//                            alert(msg);
                        }
                        document.getElementById('demo').innerHTML = store;
                    }
                    else
                    {
                        document.getElementById('demo').innerHTML = "Processing....";
                    }
                };

                xhttp.open("GET", "Submitdepowith?account=" + accc + "&withdep=" + dep + "&money=" + moneyy+"&pin="+pinn, true);
//            xhttp.open("GET" , "check.jsp?account="+acc,true);
                xhttp.send();
            }
        </script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .container {
                width: 100%;
                height: 100vh;
                background-color: rgba(125, 140, 242, 0.578);
            }

            .head {
                width: 100%;
                height: 50px;
                background-color: rgb(228, 221, 142);
                display: flex;
                justify-content: space-around;
                align-items: center;
                font-size: 22px;

            }

            .box {
                margin-top: 20px;
                width: 100%;
                height: auto;
                /* background-color: coral; */
                display: flex;
                justify-content: center;
            }

            .inner {
                width: 400px;
                height: 100%;
                /* background-color: blueviolet; */
                display: flex;
                flex-direction: column;
                align-items: center;
                box-shadow: 2px 3px 4px white,-2px -3px 4px white;
            }

            #heading {
                font-size: 30px;
                color: rgb(25, 52, 134);
                text-shadow: 1px 3px 4px white;
            }

            span {
                color: brown;
                font-weight: bold;
                text-shadow: 1px 2px 3px white;
            }

            .img {
                width: 100%;
                height: 180px;
                background-color: rgb(107, 231, 231);
            }
            .img img{
                width: 100%;
                height: 100%;
            }
            table{
                margin-top: 7px;
                border-collapse: separate;
                border-spacing: 25px 22px;
            }
            table td{
                font-size: 20px;
            }
            td input{
                width: 110px;
                height: 25px;
            }
            td input:hover{
                cursor: pointer;
            }
            #but{
                background-color: black;
                color: white;
                font-size: 19px;
                border: 0cap;
                box-shadow: 1px 2px 3px skyblue,-1px -2px 3px skyblue;
            }
            #but:hover{
                transform: scale(1.1);
                cursor: pointer;
            }
            @media (max-width:700px)
            {
                #date{
                    font-size: 16px;
                }
            }
            #demo{
                color:red;
            }
        </style>
    </head>
    <body onload="display_ct()">
        <%
            String acc = request.getParameter("account");
//            if (acc != null) {
            int acc1 = Integer.parseInt(acc);
            String name = "";

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                Statement stm = con.createStatement();
                String s = "select * from useraccount where account_no=" + acc1 + "";
                ResultSet r = stm.executeQuery(s);
                if (r.next()) {
                    name = r.getString(2);
        %>
        <div class="container">
            <div class="head">
                <p>Time:- <span id="date" name="date"></span></p>
                <p id="heading">Deposit/Withdraw</p>
            </div>
            <div class="box">
                <div class="inner">
                    <div class="img">
                        <img src="https://www.interactivebrokers.com/images/common/highlights/hdi_004_bankinstructions.png"
                             alt="" loading="eager">
                    </div>
                    <p id="demo"></p>
                    <!--<form action="Submitdepowith?account=<%= acc1%>" method="post">-->
                    <form>
                        <table>
                            <tr>
                                <td>Acc No.</td>
                                <td style="font-weight: bold;" id="acco"><input type="text" id="yoo" readonly value="<%=acc1%>"></td>
                            </tr>
                            <tr>
                                <td>Acc Holder Name</td>
                                <td style="font-weight: bold;"><%=name%></td>
                            </tr>
                            <tr>
                                <td>Enter ATM Pin</td>
                                <td><input type="password" id="pin" name="pin" maxlength="6" required></td>
                            </tr>
                            <tr>
                                <td>What do you want</td>
                                <td>
                                    <select name="withdep" id="withdep" required>
                                        <option value="">--Select Type--</option>
                                        <option value="Withdraw">Withdraw</option>
                                        <option value="Deposit">Deposit</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Money</td>
                                <td><input type="text" placeholder="Rs.00000" id="money" name="money" maxlength="10" required></td>
                            </tr>
                            <tr>
                                <td><input type="button" id="but" value="Submit" onclick="withdraw(this.form);"></td>
                                <td><input type="reset" id="but" value="Clear"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <%
                }

            } catch (Exception e) {
                out.print("<script>alert('" + e.getMessage() + "')</script>");
            }
//            } else {
//                out.print("<h1>Sorry can't open this pagee</h1><br><a href='front.html'>Click here</a>");
//            }
%>
    </body>
</html>
