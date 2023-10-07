<%-- 
    Document   : Forgotpinotp
    Created on : 13 Aug, 2023, 7:20:49 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Page</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <script>
        function check(f1)
        {
            var acc = document.getElementById("account").textContent;
            var otp=f1.answer.value;
//            alert(acc+" & "+otp);
            var store="";
            var msg="Changepass.jsp?account="+acc;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function()
            {
              if(xhttp.readyState == 4 && xhttp.status == 200)
              {
                  store = this.responseText;
                  result = store.includes("Done");
                  if(result === true)
                  {
                      window.open(msg, "_self");
                  }
                  else
                      document.getElementById('demo').innerHTML = store;
                  
              }
              else
              {
                  document.getElementById('demo').innerHTML = "Processing....";
              }
            };
            
            xhttp.open("GET", "Checkotp?account=" + acc + "&answer=" + otp, true);
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
                background: rgb(171, 61, 252);
                background: radial-gradient(circle, rgba(171, 61, 252, 1) 0%, rgba(200, 148, 233, 1) 100%);
                border: 5px solid rgb(153, 78, 250);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .box
            {
                width: 400px;
                height: 540px;
                background-color: white;
                border-radius: 30px;
                padding: 20px;
                box-shadow: 3px 4px 5px purple,-3px -4px 5px purple;

                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            .box1{
                width: 80%;
                height: 220px;
                /* background-color: aquamarine; */
                background-image: url('https://img.freepik.com/premium-vector/forgot-password-concept-isolated-white_263070-194.jpg?w=2000');
                background-size: cover;
                border-radius: 30px;
                box-shadow: 3px 4px 4px rgb(245, 150, 166);
            }
            h2{
                text-decoration: underline;
                margin-bottom: 20px;
            }
            p{
                font-size: 18px;
                margin-bottom: 15px;
            }
            #answer{
                height: 25px;
                box-shadow: 2px 3px 4px plum;
                cursor: pointer;
            }
            #but{
                display: flex;
                justify-content: center;
                align-items: center;
                /* width: 50px; */
            }
            #but input{
                border-radius: 20px;
                color: white;
                background-color: rgb(164, 42, 164);
                font-size: 18px;
                width: 100px;
                height: 30px;
            }
            #but input:hover{
                cursor: pointer;
                transform: scale(1.2);
                box-shadow: 3px 3px 4px rgb(97, 1, 97);
            }
            form{
                font-size: 25px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <%
            String acc = request.getParameter("account");

            if (acc != null) {
                
                int acc1= Integer.parseInt(acc);
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet result = stm.executeQuery(s);
                    if (result.next()) {
                        String name=result.getString(2);
        %>
        <div class="container">
            <div class="box">
                <div class="box1">
                </div>
                <h2>Enter OTP</h2>
                
                <form>
                    <p>Your Name : <label style="width: 150px;font-size: 22px; margin-left: 20px;"><%= name%></label></p>
                    <p>Account No: <label style="width: 150px;font-size: 22px; margin-left: 20px;" id="account"><%= acc1%></label></p>
                    <label for="answer">OTP:</label>
                    <input type="text" id="answer" name="answer" maxlength="4" placeholder="Enter here" required/>
                    <br><br>
                    <p id="demo" style="color: red;text-align: center"></p>
                    <div id="but"><input type="button" value="Check" onclick="check(this.form)"></div>
                </form>
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
