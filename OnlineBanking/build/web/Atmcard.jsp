<%-- 
    Document   : Atmcard
    Created on : 19 Aug, 2023, 10:53:10 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Atm Card</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <script>
            var flag = 1;
                    function check(f1)
                    {
//                            alert("heelloo");
                            var acc = document.getElementById("account").textContent;
                            var pin = document.getElementById('pin').value;
                            var store = "";
                            var result = "";
                            var msg="Login.jsp?account1="+acc;
                            var xhttp = new XMLHttpRequest();
                            xhttp.onreadystatechange = function ()
                            {
                                if (xhttp.readyState == 4 && xhttp.status == 200)
                                {
                                    store = this.responseText;
                                    result = store.includes("Booked..");
                                    if (result === true)
                                    {
                                        window.open(msg, "_self");
                                    }
                                        document.getElementById('demo').innerHTML = store;
                                }
                                else
                                {
                                    document.getElementById('demo').innerHTML = "Processing..";
                                }
                            };
                            xhttp.open("GET", "Bookatm?account=" + acc + "&pin=" + pin, true);
//            xhttp.open("GET" , "check.jsp?account="+acc,true);
                            xhttp.send();
                    }
            function fill()
            {
            // alert("hello");
            if (flag == 1)
            {
            const acc = document.getElementById('show');
                    var but = document.getElementById('buton');
                    but.value = 'Hide';
                    acc.classList.toggle('clicked');
                    flag = 0;
            }
            else
            {
            const acc = document.getElementById('show');
                    var but = document.getElementById('buton');
                    but.value = 'See Cvv';
                    acc.classList.toggle('clicked');
                    flag = 1;
            }

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
                background-color: rgb(164, 120, 231);
                padding: 10px;
                position: relative;
            }

            h1 {
                text-align: center;
                text-decoration: underline;
            }

            .box {
                width: 100%;
                height: auto;
                /*background-color: aqua;*/
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 25px;
            }

            .inner {
                width: 460px;
                height: 270px;
                /* background-color: cornsilk; */
                background-image: url('https://coolbackgrounds.io/images/backgrounds/index/disco-dba865f1.png');
                background-size: cover;
                color: white;
                position: relative;
            }

            .but {
                width: 460px;
                display: flex;
                justify-content: flex-end;
                margin-top: 10px;
            }

            .box2 {
                width: 100%;
                height: 240px;
                /*background-color: chocolate;*/
                display: flex;
                justify-content: center;
                align-items: center;
            }

            table {
                border-collapse: separate;
                border-spacing: 75px 20px;
            }

            table td {
                font-size: 25px;
            }
            #book{
                width: 100px;
                font-size: 20px;
                background-color: cornsilk;
            }
            table input{
                cursor: pointer;
                height: 30px;
            }
            #book:hover{
                transform: scale(1.1);
                box-shadow: 2px 3px 4px blueviolet;
            }
            header{
                width: 100%;
                height: 50px;
                /* background-color: brown; */
                display: flex;
                color: white;
            }
            .left{
                width: 60%;
                height: 100%;
                /* background-color: rgb(171, 89, 105); */
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
            }
            .right{
                width: 40%;
                height: 100%;
                /* background-color: yellow; */
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 17px;
            }
            .right1{
                display: flex;
                justify-content: center;
                align-items: center;
                /* flex-direction: column; */
            }
            .left1{
                box-shadow: 3px 0cap 0cap black;
            }
            .set img{
                width: 35px;
                height: 35px;
                border-radius: 100px;
            }
            .chip{
                margin-top: 25px;
                width: 100px;
                margin-left: 55px;
                height: auto;
                /* background-color: blueviolet; */
            }
            .chip img{
                width: 45px;
                height: 35px;
            }
            .number{
                width: 380px;
                margin-top: 10px;
                margin-left: 55px;
                height: 35px;
                /* background-color: tomato; */
            }
            .number p{
                font-weight: bold;
                font-size: 28px;
                letter-spacing: 6px;
            }
            .month{
                width: 150px;
                height: 40px;
                /* background-color: yellow; */
                display: flex;
                justify-content: center;
                gap: 15px;
                align-items: center;
                margin-left: 200px;
                margin-top: 10px;
            }
            .valid{
                display: flex;
                flex-direction: column;
            }
            .last{
                width: 100%;
                height: 55px;
                margin-top: 5px;
                /* background-color: palevioletred; */
                display: flex;
            }
            .leftlast{
                width: 70%;
                /* background-color: orangered; */
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                letter-spacing: 3px;
            }
            .rightlast{
                width: 30%;
                /* background-color:olivedrab; */
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .rightlast h1{
                text-decoration: none;
            }
            #buton{
                width: 70px;
                font-size: 15px;
                height: 27px;
                background-color: white;
            }
            #buton:hover{
                cursor: pointer;
                transform: scale(1.1);
            }
            iframe{
                width: 460px;
                height: 270px;
                position: absolute;
                /* opacity: 0; */
                /* margin-bottom: 20px; */
                bottom: 0px;
                opacity: 0;
            }
            .move{
                margin-bottom: 100px;
                position: absolute;
                bottom: 196px;
                left: 401px;
                opacity: 0;
            }
            .clicked{
                opacity: 1;
            }
        </style>
    </head>

    <body>
        <%
            String acc = request.getParameter("account");
            if (acc != null) {
                String s1 = acc.substring(1, 5) + " " + acc.substring(3, 7);
                String account = "3453 2500 " + s1;
                String name = "";
                int acc1 = Integer.parseInt(acc);
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet r = stm.executeQuery(s);
                    if (r.next()) {
                        name = r.getString(2);
                        name = name.toUpperCase();
        %>
        <div class="container">
            <h1>Atm Card</h1>
            <div class="box">
                <div class="inner" id="inner">
                    <header>
                        <div class="left">
                            <div class="left1">
                                <h2>111</h2>
                            </div>
                            <div class="right1">
                                <div class="set">
                                    <img src="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png" alt="">
                                </div>
                                <div class="set2">
                                    <p style="font-size: 20px;">Happy Bank</p>
                                </div>

                            </div>
                        </div>
                        <div class="right">
                            <p><strong>#DREAM</strong>Different</p>
                        </div>
                    </header>
                    <div class="chip">
                        <img src="https://www.pngimages.in/uploads/png-webp/2023/May-2023/credit_card_chip_Png_Editor.webp" alt="">
                    </div>
                    <div class="number">
                        <p><%= account%></p>
                    </div>
                    <div class="month">
                        <div class="valid">
                            <p style="font-size: 13px;">VALID</p>
                            <p style="font-size: 13px;">THRU</p>
                        </div>
                        <p>10/26</p>
                    </div>
                    <div class="last">
                        <div class="leftlast">
                            <p style="margin-left: 65px; font-size: 20px;"><%=name%></p>
                            <p style="margin-left:20px"><small>CRN</small> <b><%= acc1%> HAPPY 111</b></p>
                        </div>
                        <div class="rightlast">
                            <h1>VISA</h1>
                            <p>Classic</p>
                        </div>
                    </div>
                    <iframe src="Backside.jsp" id="show" frameborder=0></iframe>
                </div>
                    <form>
                <div class="but">
                        <input type="button" id="buton" value="See Cvv" onclick="fill()">
                    </form>
                </div>
            </div>
            <p id="demo" style="text-align: center; color: red;font-size: 20px;"></p>
            <div class="box2">
                <form>
                    <table>
                        <tr>
                            <td>Account No</td>
                            <td><label for="account" id="account"><%= acc1%></label></td>
                        </tr>
                        <tr>
                            <td>Pin</td>
                            <td><input type="password" id="pin" name="pin" maxlength="6"></td>
                        </tr>
                        <tr>
                            <td><input type="button" id="book" value="Book" onclick="check(this.form);"></td>
                            <td><a href="Login.jsp?account1=<%=acc1%>"><input type="button" id="book" value="Back"></a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="move" id="move">
                <!--                <iframe src="Backside.jsp" frameborder=0></iframe>-->
            </div>
        </div>
        <%
                    }
                } catch (Exception e) {
                    out.print(e.getMessage());
                }
            } else {
                out.print("<h2>Sorry ...First You have to login<br><a href='front.html'>Click here</h2>");
            }
        %>

    </body>

</html>
