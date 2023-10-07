<%-- 
    Document   : Changepass
    Created on : 14 Aug, 2023, 8:53:56 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <script>
            function check(f1)
            {
                var acc = f1.account.value;
                var pass1 = f1.pass1.value;
                var pass2 = f1.pass2.value;
                var msg = "login.html";
                var store="";
                var result="";
//                alert('account '+acc+' pass1 '+pass1+' pass2 '+pass2);
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
                
                xhttp.open("GET", "Checkpass?account=" + acc + "&pass1=" + pass1 + "&pass2=" + pass2, true);
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
                height: auto;
                background: rgb(171, 61, 252);
                background: radial-gradient(circle, rgba(171, 61, 252, 1) 0%, rgba(200, 148, 233, 1) 100%);
                border: 5px solid rgb(153, 78, 250);
                display: flex;
                justify-content: center;
                align-items: center;
                padding:10px;
            }

            .box {
                width: 400px;
                height: 540px;
                background-color: white;
                border-radius: 30px;
                padding: 20px;
                box-shadow: 3px 4px 5px purple, -3px -4px 5px purple;

                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                margin-top: 26px;
            }

            .box1 {
                width: 80%;
                height: 220px;
                /* background-color: aquamarine; */
                background-image: url('https://img.freepik.com/premium-vector/forgot-password-concept-isolated-white_263070-194.jpg?w=2000');
                background-size: cover;
                border-radius: 30px;
                box-shadow: 3px 4px 4px rgb(245, 150, 166);
            }

            h2 {
                text-decoration: underline;

            }

            p {
                font-size: 18px;
                margin-bottom: 10px;
            }

            #answer {
                height: 25px;
                box-shadow: 2px 3px 4px plum;
                cursor: pointer;
            }

            #but {
                display: flex;
                justify-content: center;
                align-items: center;
                /* width: 50px; */
            }

            #but input {
                border-radius: 20px;
                color: white;
                background-color: rgb(164, 42, 164);
                font-size: 18px;
                width: 200px;
                height: 30px;
                margin-bottom: 10px;
            }

            #but input:hover {
                cursor: pointer;
                transform: scale(1.2);
                box-shadow: 3px 3px 4px rgb(97, 1, 97);
            }

            form {
                font-size: 25px;
                /* padding: 10px; */
                /* margin-top: 20px; */
            }
            .pass{
                display: flex;
                height: 99px;
            }
            .max{
                font-size: 15px;
                color: blue;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            String acc = request.getParameter("account");
            if (acc != null) {
                int acc1 = Integer.parseInt(acc);
                try {

                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet result = stm.executeQuery(s);
                    if (result.next()) {
        %>
        <div class="container">
            <div class="box">
                <div class="box1">
                </div>
                <h2>Reset Your Password?</h2>
                <!--<form action="Checkpass" method="post">-->
                <form>
                    <p>Your Account-No  <input type="text" name="account" id="account" value="<%=acc1%>" style="width: 150px;font-size: 17px; margin-left: 20px;" readonly></p>
                    <p>New Password<input type="password" maxlength="6" name="pass1" id="pass1" value="" style="width: 150px;font-size: 18px; margin-left: 46px;" required></p>
                    <p>Confirm Password<input type="password" maxlength="6" name="pass2" id="pass2" value="" style="width: 150px;font-size: 18px; margin-left: 20px;" required></p>
                    <br>
                    <p id="demo" style="color: red;text-align: center"></p>
                    <p class="max">Maximum 6 digit pin is allow</p>
                    <div id="but"><input type="button" value="Reset Password" onclick="check(this.form)"></div>
                </form>
            </div>
        </div>
        <%
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
