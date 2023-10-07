
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Transfer Amount</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script type="text/javascript">
            function check(f1)
            {
//                alert("hello");
                var acc = f1.acc.value;
                var acc2 = f1.acc1.value;
                var name = f1.name.value;
                var money = f1.money.value;
                var pin = f1.pin.value;
                var account = document.getElementById('hide').innerHTML;
                var msg = "Login.jsp?account1="+account;
//                var store="";
                var result="";
//                alert('account '+acc+' account2 '+acc2+' name '+name+' money'+money+' pin'+pin+' myaccount'+account);
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
                
                xhttp.open("GET", "Transferstore?account=" + account +"&account1= "+ acc+ "&account2=" + acc2 + "&name=" + name + "&money="+ money +"&pin="+pin, true);
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
                 background-color: rgb(152, 222, 241);
                font-family: 'Varela Round', sans-serif;
            }

            header {
                width: 100%;
                height: 50px;
                background-color: rgb(89, 192, 175);
                display: flex;
                justify-content: center;
                align-items: center;
                box-shadow: 0cap 3px 3px rgb(0, 171, 228);
            }

            .head {
                font-size: 20px;
            }

            .box {
                margin-top: 10px;
                width: 100%;
                height: auto;
                /* background-color: coral; */
                display: flex;
                justify-content: center;
            }

            .inner {
                width: 400px;
                height: auto;
                box-shadow: 2px 3px 4px rgb(67, 131, 156),-2px -3px 4px rgb(67, 131, 156);
                /* background-color: crimson; */
            }

            .img {
                width: 100%;
                height: 210px;
                /* background-color: cornsilk; */
                /* background-size: cover;
                background-image: url('https://static.vecteezy.com/system/resources/previews/002/090/680/non_2x/online-money-transfer-concept-hands-holding-smartphone-to-transfer-money-via-internet-with-shield-dollar-and-arrow-symbol-can-be-used-for-banner-landing-page-flyer-social-media-app-vector.jpg'); */
            }

            .img img {
                width: 100%;
                height: 100%;
            }

            form {
                width: 100%;
                height: auto;
                display: flex;
                justify-content: center;
            }
            table{
                border-collapse: separate;
                border-spacing: 15px 26px;
            }
            table td{
                font-size: 17px;
            }
            table input{
                width: 150px;
                height: 23px;
                font-size: 15px;
                cursor: pointer;
            }
            #but{
                background-color: brown;
                color: white;
                font-weight: bold;
                height: 28px;
            }
            #but:hover{
                transform: scale(1.1);
                cursor: pointer;
            }
            #hide{
                opacity: 0;
            }
            
        </style>
    </head>
    <body>
        <%
            String acc = request.getParameter("account");
            if (acc != null) {
                int acc1=Integer.parseInt(acc);
        %>
        <div class="container">
            <header>
                <div class="head">
                    <h1>Transfer Money</h1>
                </div>
            </header>
            <div class="box">
                <div class="inner">
                    <div class="img">
                        <img src="https://static.vecteezy.com/system/resources/previews/002/090/680/non_2x/online-money-transfer-concept-hands-holding-smartphone-to-transfer-money-via-internet-with-shield-dollar-and-arrow-symbol-can-be-used-for-banner-landing-page-flyer-social-media-app-vector.jpg"
                             alt="" loading="eager">
                    </div>
                    <!--<form action="Transferstore?account=<%= acc1%>" method="post">-->
                    <p id="hide"><%= acc1%></p>
                    <p id="demo" style="color:red;text-align: center"></p>
                    <form>
                        <table>
                            <tr>
                                <td>Account No.</td>
                                <td><input type="text" maxlength="10" name="acc" id="acc" required></td>
                            </tr>
                            <tr>
                                <td>Re-Enter Account No.</td>
                                <td><input type="text" maxlength="10" name="acc1" id="acc1" required>
                                </td>
                            </tr>
                            <tr>
                                <td>Account Holder Name</td>
                                <td><input type="text" placeholder="name" name="name" id="name" required></td>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td><input type="text" maxlength="10" name="money" placeholder="Rs.0000" required></td>
                            </tr>
                            <tr>
                                <td>Pin</td>
                                <td><input type="password" id="pin" name="pin" required></td>
                            </tr>
                            <tr>
                                <td><input type="button" id="but" value="Transfer" onclick="check(this.form)"></td>
                                <td><a href="Login.jsp?account1=<%= acc1%>"><input type="button" id="but" value="Cancel"></a></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <%
            } else {
                out.print("<h1>Sorry can't open this pagee</h1><br><a href='front.html'>Click here</a>");
            }
        %>
    </body>
</html>
