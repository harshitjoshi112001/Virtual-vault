<%-- 
    Document   : Backside
    Created on : 19 Aug, 2023, 11:38:24 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Back</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .box{
            width: 460px;
            height: 270px;
            /* background-color: cornsilk; */
            background-image: url('https://coolbackgrounds.io/images/backgrounds/index/disco-dba865f1.png');
            background-size: cover;
            color: white;
        }
        header{
            width: 100%;
            height: 25px;
            /* background-color: tomato; */
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header .left,header .right{
            padding: 10px;
        }
        .black{
            margin-top: 8px;
            width: 100%;
            height: 50px;
            background-color: black;
        }
        .line{
            margin-left: 15px;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .code{
            width: 100%;
            height: 50px;
            /* background-color: aqua; */
            display: flex;
        }
        .code .left{
            width: 60%;
            height: 100%;
            /* background-color: yellow; */
            background-image: url('https://i.pinimg.com/736x/fe/10/02/fe100276805d4f2c149921769c5dc404.jpg');
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }
        .code .right{
            width: 40%;
            height: 100%;
            /* background-color: seagreen; */
            display: flex;
            flex-direction: column;
            /* justify-content: flex-end; */
            align-items: flex-end;
        }
        
        .code .right img{
            width: 40px;
            margin-right: 17px;
        }
        .bottom{
            width: 100%;
            height: 110px;
            /* background-color: yellow; */
            display: flex;
            margin-top: 5px;
        }
        .bottom .left{
            width: 20%;
            height: 100%;
            /* background-color: slateblue; */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .bottom .left img{
            width: 80px;
            height: 50px;
            border-radius: 10px;
        }
        .bottom .right{
            width: 80%;
            height: 100%;
            /* background-color: orangered; */
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="box">
        <header>
            <div class="left">
                www.happybank.com
            </div>
            <div class="right">
                International Debit Card
            </div>
        </header>
        <div class="black"></div>
        <span class="line">
            AUTHORIZED SIGNATURE - NOT VALID UNLESS SIGNED
        </span>
        <div class="code">
            <div class="left">
                <p style="font-size: 22px; letter-spacing: 5px; font-style: italic; color: black;">356</p>
            </div>
            <div class="right">
                <img src="https://media.istockphoto.com/id/828088276/vector/qr-code-illustration.jpg?s=612x612&w=0&k=20&c=FnA7agr57XpFi081ZT5sEmxhLytMBlK4vzdQxt8A70M=" alt="">
                <p style="font-size: 10px; margin-right: 7px;">Scan for Offers</p>
            </div>
        </div>
        <div class="bottom">
            <div class="left">
                <img src="https://www.shutterstock.com/shutterstock/videos/28844401/thumb/12.jpg?ip=x480" alt="">
                <p style="font-size: 12px;">dzTH153403045</p>
            </div>
            <div class="right">
                <h3 style="font-size: 13px;">Not valid for payment in foreign exchange in Nepal and Bhutan</h3>
                <p style="font-size: 12px;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam fugiat libero voluptate cumque blanditiis aperiam est doloremque laudantium quidem sint doloribus labore dolore amet corrupti, ab ducimus aut nostrum repellat.</p>
                <h3 style="font-size: 13px;">24 Hour Customer Contact Center:</h3>
                <ul style="font-size: 14px;">
                    <li>India: 1890 344 3442</li>
                    <li>International: +91 66578 3490 <sub>(ISD charges apply)</sub></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>