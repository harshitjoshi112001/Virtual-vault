<%-- 
    Document   : Editdetails
    Created on : 16 Aug, 2023, 6:04:30 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Signup</title>
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
                height: 1100px;
                background-color: lightblue;
                border: 2px solid blue;
                overflow: hidden;
            }

            h1 {
                text-align: center;
                color: rgba(38, 38, 224, 0.806);
                text-shadow: 2px 3px 4px rgb(0, 213, 255);
                text-transform: uppercase;

            }

            .box {
                width: 100%;
                /* background-color: violet; */
                height: 1000px;
                display: flex;
                justify-content: center;
                padding: 20px;
            }

            .inner {
                width: 100%;
                height: 100%;
                /* background-color: aqua; */
                display: flex;
                align-items: center;
                flex-direction: column;
                margin-top: 20px;
                /* flex-wrap: wrap; */
                /* flex-direction: column; */
            }

            .table2 {
                border-collapse: separate;
                border-spacing: 67px 18px;
                font-size: 23px;
            }
            .table3 {
                border-collapse: separate;
                border-spacing: 67px 18px;
                font-size: 23px;
                margin-left: 140px;
                margin-top: 30px;
            }

            .table1 {
                border-collapse: separate;
                border-spacing: 35px 18px;
                font-size: 23px;
            }

            .table1 input {
                height: 30px;
                width: 200px;
                font-size: 15px;
            }

            .table2 input {
                height: 30px;
                width: 200px;
                font-size: 15px;
            }
            .table3 input {
                height: 35px;
                width: 150px;
                font-size: 15px;
            }

            #male,
            #female,
            #other,
            #married,
            #unmarried,
            #saving,
            #current,
            #fixed,
            #recurring {
                width: 25px;
                height: 13px;
            }

            .personal {
                background-color: rgb(206, 226, 243);
                width: 100%;
                text-align: center;
                font-size: 30px;
                box-shadow: 2px 3px 4px rgb(22, 115, 229), -2px -3px 4px rgb(22, 115, 229);
            }

            .personal img,
            .additional img {
                width: 30px;
                border-radius: 100px;
            }

            .additional {
                background-color: rgb(206, 226, 243);
                width: 100%;
                text-align: center;
                font-size: 30px;
                box-shadow: 2px 3px 4px rgb(22, 115, 229), -2px -3px 4px rgb(22, 115, 229);
                margin-top: 40px;
            }

            .fill {
                text-align: center;
                color: red;
                /* font-size: 15px; */
                margin-top: 10px;
            }
            .declares{
                margin-top: 40px;
                font-size: 20px;
                margin-left: 50px;
            }
            .declares #check{
                width: 30px;
                height: 20px;
            }
            #male:hover,
            #female:hover,
            #other:hover,
            #married:hover,
            #unmarried:hover,
            #saving:hover,
            #current:hover,
            #fixed:hover,
            #recurring:hover {
                cursor: pointer;
            }
            #but{
                background-color: black;
                color: white;
                font-size: 19px;
            }
            #but:hover{
                transform: scale(1.2);
                cursor: pointer;
                box-shadow: 2px 3px 4px white;
            }
        </style>
    </head>

    <body>
        <%
            String acc = request.getParameter("account");
            String name = "";
            String names[];
            String contact = "";
            String email = "";
            String state = "";
            String add = "";
            String city = "";
            String zip = "";
            String adhaar = "";
            String pan = "";
            String fat = "";
            String mot = "";
            if (acc != null) {
                int acc1 = Integer.parseInt(acc);
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/practice", "root", "root");
                    Statement stm = con.createStatement();
                    String s = "select * from useraccount where account_no=" + acc1 + "";
                    ResultSet rs = stm.executeQuery(s);
                    if (rs.next()) {
                        name = rs.getString(2);
//                        names = name.split(" ");
                        contact = rs.getString(9);
                        fat = rs.getString(3);
                        mot = rs.getString(4);
                        email = rs.getString(8);
                        state = rs.getString(10);
                        add = rs.getString(12);
                        city = rs.getString(11);
                        zip = rs.getString(13);
                        adhaar = rs.getString(18);
                        pan = rs.getString(19);
                    }

                } catch (Exception e) {
                    out.print("<script>alert('" + e.getMessage() + "')</script>");
                }
                names = name.split(" ");
        %>
        <div class="container">
            <h1>Update Details</h1>
            <div class="box">
                <div class="inner">
                    <form action="Updatedata?account=<%= acc1%>" method="post">
                        <div class="personal"><img
                                src="https://www.shutterstock.com/shutterstock/photos/478640791/display_1500/stock-vector-personal-badge-rounded-icon-vector-illustration-style-is-flat-iconic-symbol-cobalt-color-white-478640791.jpg"
                                alt="">&nbsp;&nbsp;Personal Details</div>
                        <div class="fill">(All details to be filled is necessary)</div>
                        <table class="table1">
                            <tr>
                                <td><label for="name">First Name</label></td>
                                <td><input type="text" placeholder="enter first name" value="<%= names[0]%>" name="first" id="name" required></td>
                                <td><label for="last">Last Name</label></td>
                                <td><input type="text" placeholder="enter last name" name="last" id="last" value="<%= names[1]%>" required></td>
                            </tr>
                            <tr>
                                <td><label for="father">Father's Name</label></td>
                                <td><input type="text" placeholder="" name="father" id="father" value="<%= fat%>"required></td>
                                <td><label for="mother">Mother's Name</label></td>
                                <td><input type="text" placeholder="" name="mother" id="mother" value="<%= mot%>"required></td>
                            </tr>
                            <tr>
                                <td><label for="gender1">Gender</label></td>
                                <td><input type="radio" value="Male" name="gender" id="male" required><label for="male" id="male">Male</label>
                                    <input type="radio" value="Female" name="gender" id="female"required>
                                    <label for="female" id="female">Female</label><input type="radio" value="Other" name="gender" id="other"required><label for="other" id="other">Other</label>
                                </td>
                                <!-- <td><label for="mother">Mother's Name</label><input type="text" placeholder="" name="mother"
                                        id="mother"></td> -->
                            </tr>
                            <tr>
                                <td><label for="dob">Date Of Birth</label></td>
                                <td><input type="date" name="dob" id="dob"required></td>
                                <td><label for="marriage">Marital Status</label></td>
                                <td><input type="radio" name="marriage" value="Married" id="married"required><label for="married" id="married">Married</label>
                                    <input type="radio" name="marriage" value="Unmarried" id="unmarried"required><label
                                        for="unmarried" id="unmarried">Unmarried</label>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="email">Email ID</label></td>
                                <td><input type="email" name="email" id="email" placeholder="abc@gmail.com" value="<%= email%>"required></td>
                                <td><label for="contact">Contact</label></td>
                                <td><input type="tel" placeholder="1234-567-890" id="contact" name="contact" value="<%= contact%>"required></td>
                            </tr>
                            <tr>
                                <td><label for="state">State</label></td>
                                <td><input type="text" id="state" name="state" value="<%= state%>"required></td>
                                <td><label for="city">City</label></td>
                                <td><input type="text" id="city" name="city" value="<%= city%>"required></td>
                            </tr>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><textarea name="address" id="address" cols="25" rows="3"
                                              placeholder="your address"required><%= add%></textarea></td>
                                <td><label for="zip">Zip-Code</label></td>
                                <td><input type="text" name="zip" id="zip" placeholder="123456" value="<%= zip%>"required></td>
                            </tr>
                        </table>

                        <div class="additional"><img
                                src="https://cdn.vectorstock.com/i/preview-1x/23/53/add-document-line-outline-icon-vector-46652353.jpg"
                                alt="">&nbsp;&nbsp;Additional Details</div>
                        <table class="table2">
                            <tr>
                                <td><label for="religion">Religion</label></td>
                                <td>
                                    <select name="religion" id="religion"
                                            style="width: 225px; text-align: center;height: 25px;"required>
                                        <option value="">---Select Religion---</option>
                                        <option value="Hindu">Hindu</option>
                                        <option value="Sikh">Sikh</option>
                                        <option value="Christian">Christian</option>
                                        <option value="Buddhist">Buddhist</option>
                                        <option value="Jain">Jain</option>
                                        <option value="Muslim">Muslim</option>
                                    </select>
                                </td>
                                <td><label for="category">Category</label></td>
                                <td>
                                    <select name="category" id="category"
                                            style="width: 225px; text-align: center; height: 25px;"required>
                                        <option value="">---Select Category---</option>
                                        <option value="General">General</option>
                                        <option value="Sc/St">Sc/St</option>
                                        <option value="OBC">OBC</option>
                                        <option value="Others">Others</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Education</td>
                                <td>
                                    <select name="education" id="" style="width: 225px; text-align: center;height: 25px;"required>
                                        <option value="">--Select Education--</option>
                                        <option value="8th">8th</option>
                                        <option value="10th">10th</option>
                                        <option value="12th">12th</option>
                                        <option value="Graduation">Graduation</option>
                                        <option value="Post-graduation">Post-graduation</option>
                                        <option value="P.H.D">P.H.D</option>
                                        <option value="Below 8th">Below 8th</option>
                                    </select>
                                </td>
                                <td>Occupation</td>
                                <td>
                                    <select name="occupation" id="" style="width: 225px; text-align: center;height: 25px;"required>
                                        <option value="">--Select Occupation--</option>
                                        <option value="Self-Employed">Self-Employed</option>
                                        <option value="Business">Business</option>
                                        <option value="Student">Student</option>
                                        <option value="Retired">Retired</option>
                                        <option value="Salaried">Salaried</option>
                                        <option value="Others">Others</option>

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="adhaar">Addhar No</label></td>
                                <td><input type="text" id="adhaar" name="adhaar" value="<%= adhaar%>"required></td>
                                <td><label for="pan">Pan No</label></td>
                                <td><input type="text" id="pan" name="pan" value="<%= pan%>"required></td>
                            </tr>
                            <tr>
                                <td>Account type:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="account2" value="Saving" id="saving"required><label for="saving"
                                                                                                                 id="saving">Saving</label></td>
                                <td><input type="radio" name="account2" value="Current" id="current"required><label for="current"
                                                                                                                   id="current">Current</label></td>
                                <td><input type="radio" name="account2" value="Fixed deposit" id="fixed"required><label for="fixed"
                                                                                                                       id="fixed">Fixed deposit</label></td>
                                <td><input type="radio" name="account2" value="Recurring deposit" id="recurring"required><label
                                        for="recurring" id="recurring">Recurring deposit</label></td>
                            </tr>
                        </table>
                        <div class="declares">
                            <input type="checkbox" id="check" name="check" value="done"required>“All the details mentioned above are true and correct to the best of my knowledge and beliefs.”
                        </div>
                        <!-- <div class="fill"><p id="notice">all</p></div> -->
                        <table class="table3">
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Update" id="but"></td>
                                <td><input type="reset" value="Clear Details" id="but"></td>
                                <td><a href="Accountdetail.jsp?account=<%= acc1%>"><input type="button" id="but" value="Cancel"></a></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <%
                } else {
                    out.print("<h1>Sorry can't open this pagee</h1><br><a href='front.html'>Click here</a>");
                }
            %>

    </body>

</html>
