<%@ page import="connection.connector" %><%--
  Created by IntelliJ IDEA.
  User: nakul
  Date: 4/27/17
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Online Library System</title>
    <style>
      form{
      }
      .left{
        border:none;
        float: left;
        margin-left: 20%;
        width: 29%;

      }
      table{
        padding: 10px;
      }
      .right{
        border-left: 1px solid green;
        float: right;
        margin-right:20%;
        width: 30%;

      }
      .lright{
        padding-left: 10%;
      }
      .header{
        background-image: url("bg.jpg");
        font-family: Verdana;
        color: #6f5c71;
        font-size: 40px;
        background-repeat: no repeat;
        border-radius: 15px;
        align: center;
      }
      img{
        width: 100px;
        height: 80px;
        border-radius: 20px;
        float: left;
        padding-bottom: 15px;
        padding-left: 5px;
        padding-top: 10px;
      }

      body{
        background-image: url("bg2.jpg");
      }
      h4{
        margin-left: 35%;
      }

      #butt{
        background-color:#667292;
        font-size: 25px;
        border: none;
        color: #fff;
        border-radius: 5px;
        text-align: center;
        cursor: pointer;
        width: 250px;
      }
      #butt1{
        background-color: #77a8a8;
        font-size: 20px;
        border: none;

        border-radius: 5px;
        text-align: center;
        cursor: pointer;

      }
      #butt2{
        background-color: #588c7e;
        font-size: 20px;
        border: none;

        border-radius: 5px;
        text-align: center;
        cursor: pointer;

      }
      <%
         String msg=" ";
         try{
             msg=request.getAttribute("errorMessage").toString();
             if(msg==null) {
                 msg="";
             }
         }catch(Exception e){
             out.print(e.getMessage());
         }
     %>
    </style>
    <script type="text/javascript">
        function validate()
        {
            if(document.loginleft.card.value===''||isNaN(document.loginleft.card.value))
            {
                alert("Please provide a valid card no.");
                document.loginleft.card.focus();
                return false;
            }
            if( document.loginleft.year.value==="-1")
            {
                alert("Please provide the year");
                document.loginleft.year.focus();
                return false;
            }

            var y=document.detail.year.value;
            window.location.replace("studata.jsp?year="+y);
        }
        function valid()
        {
            if(document.books.dept.value==="-1")
            {
                alert("Please provide the stream");
                document.books.dept.focus();
                return false;
            }
        }
    </script>
  </head>
  <body>
  <div class="header">
    <div class="logo">
      <img src="clogo.jpg">
    </div>
    <center>Government College of Engineering & Textile Technology,Berhampore</center>
  </div><br>
  <center><h2><u>Welcome to the College Library</u></h2></center>
  <div class="left">
    <center><h2><u>Student's Login</u></h2>
      <form name="loginleft" action="studata.jsp" method="POST" onsubmit="return(validate());">

        <table border="0">

          <tbody>
          <tr>
            <td>Card  No.:</td>
            <td><input type="text" name="card" value="" size="20"></td>
          </tr>
          <tr>
            <td>Year:</td>
            <td> <select name="year">
              <option value="-1">--Please select year--</option>
              <option value="1">1styear</option>
              <option value="2">2ndyear</option>
              <option value="3">3rdyear</option>
              <option value="4">4thyear</option>
            </select>  </td>
          </tr>

          </tbody>
        </table>
        <br/>
        <input type="submit" value="Log In" name="login" id="butt1"  />
        <input type="reset" value="Clear" name="clear" id="butt2" />
      </form></center>

  </div>
  <div class="right">
    <h2><center><u>Administrator's Login</u></center></h2>
    <form class=lright name="loginright" action="login" method="POST">
      <table border="0">

        <tbody>
        <tr>
          <td>User Id:</td>
          <td><input type="text" name="uid" value="" size="40" /> </td>
        </tr>
        <tr>
          <td>Password:</td>
          <td> <input type="password" name="pass" value="" size="40" /> </td>
        </tr>
        </tbody>
      </table>
      <br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      <input type="submit" value="Log In" name="login" id="butt1" />
      <input type="reset" value="Clear" name="clear" id="butt2" />
    </form>

    <h4><%=msg %></h4>
  </div>
  <br><br><br><br><br><br><br><br><br><br><br><br>
  <div>
    <center>
      <h2 style="color: #b0aac0 "><u>Find Books:</u></h2>
      <form name="books" action="books.jsp" method="post" onsubmit="return(valid());">
        <select name="dept">
          <option value="-1">--Please select a Stream--</option>
          <option value="1">Mechanical Engineering</option>
          <option value="2">Computer Science & Engineering</option>
          <option value="3">Textile Technology</option>
          <option value="4">Electrical Engineering</option>
          <option value="5">Physics</option>
          <option value="6">Chemistry</option>
          <option value="7">Humanities</option>
          <option value="8">Mathematics</option>
        </select><br><br>
        <input id="butt" type="submit" value="Get Books">
      </form>
    </center>
  </div>
  </body>

</html>
