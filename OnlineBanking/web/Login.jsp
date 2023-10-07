<%-- 
    Document   : Login
    Created on : 12 Aug, 2023, 11:06:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Userpage</title>
        <link rel="shortcut icon" href="https://i.pinimg.com/originals/38/61/87/386187bbb3db15493f3e9f1a3997a83e.png"
              type="image/x-icon">
        <script type="text/javascript">
            var images = new Array("https://img.freepik.com/premium-vector/banking-service-background-bank-building-icon-made-with-currency-symbols-dollar-euro-yen-pound-icons_127544-803.jpg", "https://www.it-daily.net/images/Aufmacher-2019/Online_Banking-489620569-700.jpg", "https://media.istockphoto.com/id/962095876/photo/man-using-online-banking-with-credit-card-on-touch-screen-device-mobile-banking-digital-and.jpg?s=612x612&w=0&k=20&c=xL2-ScQFzZeuKQfilk11vpJ3VeelkItGyJ613ZnfgQY=", "https://d32ijn7u0aqfv4.cloudfront.net/wp/wp-content/uploads/raw/SOBK0422040_780x440_mobile.jpeg", "https://bankofindia.co.in/documents/20121/19789893/KISAN+%281%29.jpg/4448e97e-fdc8-6c45-10e6-cd0a4789f864?t=1689836179099", "https://i.pinimg.com/736x/d8/34/66/d83466c6da8813f4af0c842fa64d9b32.jpg");
            var c = 0;
            var k = 0;
            function display_c() {
                var refresh = 1000; // Refresh rate in milli seconds
                mytime = setTimeout("display_ct()", refresh);
            }

            function display_ct() {

                if (k == 0) {
                    slide();
                    k = 1;
                }
                var x = new Date();
                document.getElementById('date').innerHTML = x;
                display_c();
                // var x = new Date()
                // var x1 = x.toUTCString();// changing the display to UTC string
                // document.getElementById("date").innerHTML = x1;
                // tt = display_c();
            }
            function slide() {
                if (c == images.length) {
                    c = 0;
                }
                document.getElementById("img11").src = images[c];
                // document.getElementById("img12").src = images1[c];
                c++;
                setTimeout("slide()", 3000);
            }
            function handleSelect(f1) {
                var acc=f1.account.value;
            window.location = f1.value + ".jsp?account="+acc;
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
                /* height: 400vh; */
                height: auto;
                background: rgb(79, 181, 235);
                background: linear-gradient(90deg, rgba(79, 181, 235, 1) 1%, rgba(120, 223, 150, 0.9156395834701068) 100%);
                overflow: hidden;
                /* position: absolute; */
            }

            #date {
                /* display: block; */
                font-size: 18px;
                color: black;
                text-shadow: 2px 3px 4px white;
                font-weight: bold;
                text-align: center;
                /* margin-top: 5px; */
            }

            .box {
                width: 100%;
                height: auto;
                /* background-color: rgb(247, 174, 174); */
                margin-top: 14px;
                display: flex;
                /* justify-content: center; */
                align-items: center;
                flex-direction: column;
            }

            .inner {
                width: 85%;
                height: auto;
                /* background-color: aqua; */
            }

            #time {
                width: 25px;
                /* border-radius: 10px; */
            }

            .img {
                width: 100%;
                height: 300px;
                background-color: burlywood;
                /* background-image: url('https://media.istockphoto.com/id/962095876/photo/man-using-online-banking-with-credit-card-on-touch-screen-device-mobile-banking-digital-and.jpg?s=612x612&w=0&k=20&c=xL2-ScQFzZeuKQfilk11vpJ3VeelkItGyJ613ZnfgQY='); */
                /* background-image: url('https://www.it-daily.net/images/Aufmacher-2019/Online_Banking-489620569-700.jpg'); */
                /* background-image: url('https://img.freepik.com/premium-vector/banking-service-background-bank-building-icon-made-with-currency-symbols-dollar-euro-yen-pound-icons_127544-803.jpg');
                background-size: cover; */
            }

            .img img {
                width: 100%;
                height: 100%;
            }

            #bank {
                width: 80px;
                margin-left: 55px;
            }

            .upper {
                display: flex;
                width: 100%;
                justify-content: space-around;
                background-color: rgb(148, 215, 201);
                align-items: center;
                box-shadow: 0 3px 4px rgb(100, 100, 200);
                /* height: 200px; */
                /* position: fixed; */
            }

            #img11 {
                box-shadow: 0px 3px 4px black;
            }

            .head {
                width: 100%;
                height: 50px;
                border: 2px solid purple;
                /* background-color: blueviolet; */
            }

            #list {
                display: flex;
                justify-content: space-evenly;
                /* flex-direction: row; */
                align-items: center;
                height: 100%;
                font-size: 18px;
                list-style: none;
            }

            #list a {
                text-decoration: none;
                color: purple;
            }

            #list a p:hover {
                transform: scale(1.2);
                text-shadow: 2px 3px 4px white;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
            }

            h3 {
                text-align: center;
                color: rgb(255, 255, 255);
                margin-top: 5px;
            }

            .category {
                width: 100%;
                height: auto;
                background-color: rgb(79, 180, 79);
                display: flex;
                justify-content: space-evenly;
                padding: 20px;
            }

            .box1 {
                width: 370px;
                height: 450px;
                background-color: white;
                box-shadow: 2px 3px 4px beige, -2px -3px 4px beige;
                border-radius: 20px;
            }

            .imgbox {
                width: 100%;
                height: 200px;
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
                background-color: brown;
            }

            .imgbox img {
                width: 100%;
                height: 100%;
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
            }

            .category .box1:hover{
                transform: scale(1.1);
                cursor: pointer;
            }
            .box1 h2,
            .box1 p {
                text-align: center;
                gap: 20px;
            }

            .box1 p {
                font-size: 18px;
                margin-top: 10px;
            }

            .box1 h2 {
                margin-top: 10px;
            }

            .category2 {
                width: 100%;
                height: auto;
                /* background-color: violet; */
                padding: 20px;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .category2 .dept {
                width: 100%;
                height: 300px;
                background-color: white;
                display: flex;
                border-radius: 20px;
            }

            .dept .left {
                width: 50%;
                height: 100%;
                /* background-color: aquamarine; */
            }

            .left img {
                width: 100%;
                /* border-radius: 20px; */
                height: 100%;
            }

            .dept .right {
                width: 50%;
                height: 100%;
                /* background-color: orange; */
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 30px;
            }
            .right h2{
                font-size: 2.1rem;
            }
            .right p{
                font-size: 20px;
                margin-top: 20px;
                text-align: center;
            }
            footer{
                background-color: black;
                color: white;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .foot{

                font-size: 20px;
            }

            #book {
                background-color: transparent;
                color: purple;
                border: 0cap;
                font-size: 18px;
                font-weight: 10;
            }

            #book:hover {
                transform: scale(1.1);
                cursor: pointer;
            }

            @media (max-width:700px)
            {
                .category{
                    flex-direction: column;
                    align-items: center;
                    gap: 30px;
                }
                .box1{
                    width: 300px;
                }
                .right p{
                    font-size: 0.8rem;
                }
                .right h2{
                    font-size: 1.7rem;
                }
                #list{
                    /* padding: 10px; */
                    overflow: scroll;
                    font-size: 0.9rem;
                    gap: 10px;
                    /* height: 100px; */
                }
                #list li{
                    margin-left: 10px;
                }
                .box1 h2{
                    font-size: 1.3rem;
                }
                .box1 p{
                    font-size: 1rem;
                }
                .upper{
                    gap: 20px;
                    font-size: 10px;
                }
            }
        </style>
    </head>

    <%
        int f = 0;
//        out.print("hello whatsapp "+request.getParameter("account"));
        String accc = request.getParameter("account1");
        if (accc != null) {
            f = 1;

            if (accc.length() <= 10) {
                int account = Integer.parseInt(accc);
                try {

                    String name1 = "";
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + account + "";
                    ResultSet result = stm.executeQuery(s);
                    if (result.next()) {
                        name1 = result.getString(2);
    %>
    <body onload="display_ct()">
        <div class="container">
            <div class="upper">
                <div class="part">
                    <img id="bank"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiGxPlYKtnzxZVvneUEX4UfqbHH5q0X8W8yw&usqp=CAU"
                         alt="">
                    <h1 style="color: white; text-shadow: 2px 3px 4px black;">Happy Bank</h1>
                </div>
                <div class="part">
                    <img id="time"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4FQTgcCTnaYZh4yLIde6b09Rl6-sMeFazVGyrdULvOWrk-nv02YKvC-nYK3XTF8DWk8o&usqp=CAU"
                         alt=""><span id="date"></span>
                </div>
                <div class="part">
                    <img id="time"
                         src="https://www.pngitem.com/pimgs/m/156-1568222_red-png-contact-icon-png-download-phone-red.png"
                         alt="">
                    <span id="date">+091 4523010</span>
                </div>
                <div class="part">
                    <img id="time" src="https://cdn.pixabay.com/photo/2019/10/19/17/24/gmail-4561841_960_720.png" alt="">
                    <span id="date">happybank202@gmail.com</span>
                </div>
            </div>
            <marquee behavior="linear" direction="left" scrollamount="5">
                <h2 style="color: brown;">Welcome to our Bank <%= name1%></h2>
            </marquee>
            <div class="box">
                <div class="inner">
                    <div class="head">
                        <ul id="list">
                            <li><a href="#">
                                    <p>Home</p>
                                </a></li>
                            <li><a href="Accountdetail.jsp?account=<%= account%>">
                                    <p>Account Details</p>
                                </a></li>
                                <li><a href="WithdrawDeposit.jsp?account=<%= account%>">
                                    <p>Deposit/Withdraw</p>
                                </a></li>
                            <li><select name="book" id="book" onchange="location=this.value;">
                                <option value="#">View/Books</option>
                                <option value="Atmcard.jsp?account=<%=account%>">ATM cards</option>
                                <option value="checkbalance">Cheque Book</option>

                            </select></li>
                            <li><a href="Checkbalance.jsp?account=<%= account%>">
                                    <p>Check Balance</p>
                                </a></li>
                                <li><a href="Transferamount.jsp?account=<%=account%>">
                                    <p>Transfer Amount</p>
                                </a></li>
                                <li><a href="Viewstatement.jsp?account=<%=account%>">
                                    <p>View Statement</p>
                                </a></li>
                            <li><a href="Changepass.jsp?account=<%= account%>">
                                    <p>Change Pin</p>
                                </a></li>
                            <li><a href="./login.html">
                                    <p>Logout</p>
                                </a></li>

                        </ul>
                    </div>
                    <div class="img">
                        <img id="img11" src="" alt="">
                    </div>
                    <h1>Our Bank Category</h1>
                    <h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, non.</h3>
                </div>
                <div class="category">
                    <div class="box1">
                        <div class="imgbox">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfusZQBmc78lVx20cDYONYPXmE8SigW9Nt6w&usqp=CAU"
                                 alt="">
                        </div>
                        <h2>BANK SECURITY</h2>
                        <p> Security is the protection of people, hardware, software, network information and data from
                            physical actions, intrusions and other events that could damage an organization and its assets.
                            Safeguarding the physical security of a business means protecting it from threat actors, such as
                            fires, floods, earthquakes and severe weather.</p>
                    </div>
                    <div class="box1">
                        <div class="imgbox">
                            <img src="https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/08/money-transfer-1598622593.jpg"
                                 alt="">
                        </div>
                        <h2>MONEY TRANSFER</h2>
                        <p> Transfer Money enables the user to initiate payment from his bank account to any other bank
                            account without visiting the bank enjoying from the ease of his home through digital banking.
                            Payments are categorized on the basis transfer to account within the bank, outside the bank and
                            beyond geographical boundaries. </p>
                    </div>
                    <div class="box1">
                        <div class="imgbox">
                            <img src="https://i0.wp.com/hindisutra.com/wp-content/uploads/2020/07/types-of-bank-loan-in-hindi-bank-loan-types-in-hindi.jpg?fit=640%2C350&ssl=1"
                                 alt="">
                        </div>
                        <h2>BANK LOAN</h2>
                        <p> They are generally a quick and straightforward way to secure the funding needed, and are usually
                            provided over a fixed period of time.Bank loans can be capital/principal repayment or
                            interest-only and can be structured to meet the
                            business’s needs.</p>
                    </div>
                </div>
                <h1>Bank Department</h1>
                <h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore, eligendi.</h3>
                <div class="category2">
                    <div class="dept">
                        <div class="left">
                            <img src="https://paytmblogcdn.paytm.com/wp-content/uploads/2022/01/5_UPI-is-your-New-Mobile-Banking-Heres-Why-800x500.jpg"
                                 alt="">
                        </div>
                        <div class="right">
                            <h2>TRANSFER MONEY</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.</p>
                        </div>
                    </div>
                    <div class="dept">
                        <div class="left">
                            <img src="https://cdnblog.etmoney.com/wp-content/uploads/2021/12/best-practices-for-home-loans.jpg"
                                 alt="">
                        </div>
                        <div class="right">
                            <h2>LOANS</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.Lorem ipsum
                                dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.</p>
                        </div>
                    </div>
                    <div class="dept">
                        <div class="left">
                            <img src="https://media.istockphoto.com/id/1203763961/photo/stacked-credit-cards.jpg?s=612x612&w=0&k=20&c=bEEGZwG120WKDClhmltyAtP0kPMzNir49P4JO3pcies="
                                 alt="">
                        </div>
                        <div class="right">
                            <h2>CARDS</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi Lorem ipsum
                                dolor, sit amet consectetur adipisicing elit. Voluptate possimus eius atque sint nihil.
                                Sapiente maiores asperiores perspiciatis dicta ex.</p>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
                <div class="foot">
                    &copy; All Terms Reserved (Happy Bank) Harshit Joshi
                </div>
            </footer>
        </div>
    </body>
    <%
                    } else {
                        out.print("<h2>Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login</h2>");
                    }

                } catch (Exception e) {
                    out.print("<script>alert('" + e.getMessage() + "')</script>");
                }

            } else {
                out.print("<h2>Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login</h2>");
            }
        }
        if (f == 0) {
//            out.print("hello");
            String acc = request.getParameter("account");
            if (acc == null) {
                out.print("<h2>Sorry ...First You have to login<br><a href='front.html'>Click here</h2>");
            } else {
                if (acc.length() <= 10) {
                    String email = request.getParameter("email");
                    String pin = request.getParameter("pin");
                    int acc1 = Integer.parseInt(acc);
                    int pin2 = Integer.parseInt(pin);

                    String name = "";
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                        Statement stm = con.createStatement();
                        //                        out.print("noooo");
                        String s = "select * from useraccount where account_no=" + acc1 + " and email='" + email + "' and pin=" + pin2 + "";
                        ResultSet result = stm.executeQuery(s);
                        if (result.next()) {
                            name = result.getString(2);
    %>
    <body onload="display_ct()">
        <div class="container">
            <div class="upper">
                <div class="part">
                    <img id="bank"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiGxPlYKtnzxZVvneUEX4UfqbHH5q0X8W8yw&usqp=CAU"
                         alt="">
                    <h1 style="color: white; text-shadow: 2px 3px 4px black;">Happy Bank</h1>
                </div>
                <div class="part">
                    <img id="time"
                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4FQTgcCTnaYZh4yLIde6b09Rl6-sMeFazVGyrdULvOWrk-nv02YKvC-nYK3XTF8DWk8o&usqp=CAU"
                         alt=""><span id="date"></span>
                </div>
                <div class="part">
                    <img id="time"
                         src="https://www.pngitem.com/pimgs/m/156-1568222_red-png-contact-icon-png-download-phone-red.png"
                         alt="">
                    <span id="date">+091 4523010</span>
                </div>
                <div class="part">
                    <img id="time" src="https://cdn.pixabay.com/photo/2019/10/19/17/24/gmail-4561841_960_720.png" alt="">
                    <span id="date">happybank202@gmail.com</span>
                </div>
            </div>
            <marquee behavior="linear" direction="left" scrollamount="5">
                <h2 style="color: brown;">Welcome to our Bank <%= name%></h2>
            </marquee>
            <div class="box">
                <div class="inner">
                    <div class="head">
                        <ul id="list">
                            <li><a href="#">
                                    <p>Home</p>
                                </a></li>
                            <li><a href="Accountdetail.jsp?account=<%= acc%>">
                                    <p>Account Details</p>
                                </a></li>
                                <li><a href="WithdrawDeposit.jsp?account=<%=acc%>">
                                    <p>Deposit/Withdraw</p>
                                </a></li>
                            <li><select name="book" id="book" onchange="location = this.value;">
                                <option value="#">View/Books</option>
                                <option value="Atmcard.jsp?account=<%=acc%>">ATM cards</option>
                                <option value="checkbalance">Cheque Book</option>

                            </select></li>
                            <li><a href="Checkbalance.jsp?account=<%= acc%>">
                                    <p>Check Balance</p>
                                </a></li>
                                <li><a href="Transferamount.jsp?account=<%=acc%>">
                                    <p>Transfer Amount</p>
                                </a></li>
                            <li><a href="Viewstatement.jsp?account=<%=acc%>">
                                    <p>View Statement</p>
                                </a></li>
                            <li><a href="Changepass.jsp?account=<%= acc%>">
                                    <p>Change Pin</p>
                                </a></li>
                            <li><a href="./login.html">
                                    <p>Logout</p>
                                </a></li>

                        </ul>
                    </div>
                    <div class="img">
                        <img id="img11" src="" alt="">
                    </div>
                    <h1>Our Bank Category</h1>
                    <h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, non.</h3>
                </div>
                <div class="category">
                    <div class="box1">
                        <div class="imgbox">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfusZQBmc78lVx20cDYONYPXmE8SigW9Nt6w&usqp=CAU"
                                 alt="">
                        </div>
                        <h2>BANK SECURITY</h2>
                        <p> Security is the protection of people, hardware, software, network information and data from
                            physical actions, intrusions and other events that could damage an organization and its assets.
                            Safeguarding the physical security of a business means protecting it from threat actors, such as
                            fires, floods, earthquakes and severe weather.</p>
                    </div>
                    <div class="box1">
                        <div class="imgbox">
                            <img src="https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/08/money-transfer-1598622593.jpg"
                                 alt="">
                        </div>
                        <h2>MONEY TRANSFER</h2>
                        <p> Transfer Money enables the user to initiate payment from his bank account to any other bank
                            account without visiting the bank enjoying from the ease of his home through digital banking.
                            Payments are categorized on the basis transfer to account within the bank, outside the bank and
                            beyond geographical boundaries. </p>
                    </div>
                    <div class="box1">
                        <div class="imgbox">
                            <img src="https://i0.wp.com/hindisutra.com/wp-content/uploads/2020/07/types-of-bank-loan-in-hindi-bank-loan-types-in-hindi.jpg?fit=640%2C350&ssl=1"
                                 alt="">
                        </div>
                        <h2>BANK LOAN</h2>
                        <p> They are generally a quick and straightforward way to secure the funding needed, and are usually
                            provided over a fixed period of time.Bank loans can be capital/principal repayment or
                            interest-only and can be structured to meet the
                            business’s needs.</p>
                    </div>
                </div>
                <h1>Bank Department</h1>
                <h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore, eligendi.</h3>
                <div class="category2">
                    <div class="dept">
                        <div class="left">
                            <img src="https://paytmblogcdn.paytm.com/wp-content/uploads/2022/01/5_UPI-is-your-New-Mobile-Banking-Heres-Why-800x500.jpg"
                                 alt="">
                        </div>
                        <div class="right">
                            <h2>TRANSFER MONEY</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.</p>
                        </div>
                    </div>
                    <div class="dept">
                        <div class="left">
                            <img src="https://cdnblog.etmoney.com/wp-content/uploads/2021/12/best-practices-for-home-loans.jpg"
                                 alt="">
                        </div>
                        <div class="right">
                            <h2>LOANS</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.Lorem ipsum
                                dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi.</p>
                        </div>
                    </div>
                    <div class="dept">
                        <div class="left">
                            <img src="https://media.istockphoto.com/id/1203763961/photo/stacked-credit-cards.jpg?s=612x612&w=0&k=20&c=bEEGZwG120WKDClhmltyAtP0kPMzNir49P4JO3pcies="
                                 alt="">
                        </div>
                        <div class="right">
                            <h2>CARDS</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, deserunt necessitatibus
                                architecto adipisci facilis voluptatum eum praesentium nulla repellat excepturi Lorem ipsum
                                dolor, sit amet consectetur adipisicing elit. Voluptate possimus eius atque sint nihil.
                                Sapiente maiores asperiores perspiciatis dicta ex.</p>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
                <div class="foot">
                    &copy; All Rights Reserved (Happy Bank) Harshit Joshi
                </div>
            </footer>
        </div>
    </body>
    <%
                        } else {
//                            out.print("<h2>Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login</h2>");
                            out.print("Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login");
                        }
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                } else {
//                    out.print("<h2>Sorry ...Invalid data please input carefully!!!!!<br><a href='login.html'>Again login</h2>");
                    out.print("Sorry ...Invalid data please input carefully!!!!!");
                }
            }

        }
    %>

</html>
